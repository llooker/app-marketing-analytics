include: "ad_metrics_base.view"
include: "ad_metrics_parent_comparison_base.view"
include: "ad_group.view"
include: "campaign.view"
include: "campaign_fact.view"
include: "customer.view"
include: "date_base.view"
include: "timeframe_base.view"

explore: ad_group_fact_base {
  hidden: yes
  extension: required
  view_name: fact
  persist_with: etl_datagroup

  join: customer {
    view_label: "Customer"
    sql_on: ${fact.external_customer_id} = ${customer.external_customer_id} AND
      ${fact.date_date} = ${customer.date_date} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${fact.campaign_id} = ${campaign.campaign_id} AND
      ${fact.date_date} = ${campaign.date_date} ;;
    relationship: many_to_one
  }
  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${fact.ad_group_id} = ${ad_group.ad_group_id} AND
      ${fact.date_date} = ${ad_group.date_date}  ;;
    relationship: many_to_one
  }
}

view: ad_group_fact_base {
  extension: required
  extends: [ad_metrics_base]
  dimension: external_customer_id {
    hidden: yes
  }
  dimension: campaign_id {
    hidden: yes
  }
  dimension: ad_group_id {
    hidden: yes
  }
}

explore: ad_group_fact_this_timeframe {
  from: ad_group_fact_this_timeframe
  view_name: fact
  persist_with: etl_datagroup
  always_filter: {
    filters: {
      field: fact.this_timeframe
    }
    filters: {
      field: last_fact.last_timeframe
    }
  }
  join: last_fact {
    from: ad_group_fact_last_timeframe
    sql_on: ${fact.external_customer_id} = ${last_fact.external_customer_id} AND
          ${fact.campaign_id} = ${last_fact.campaign_id} AND
          ${fact.ad_group_id} = ${last_fact.ad_group_id} ;;
    relationship: one_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${fact.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${fact.campaign_id} = ${campaign.campaign_id} AND
      ${campaign.latest} ;;
    relationship: many_to_one
  }
  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${fact.ad_group_id} = ${ad_group.ad_group_id} AND
      ${ad_group.latest}  ;;
    relationship: many_to_one
  }
  join: parent_fact {
    view_label: "Campaign This Period"
    from: campaign_fact_this_timeframe
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} ;;
    relationship: one_to_one
    type: inner
  }
}

view: ad_group_fact {
  extends: [ad_metrics_base, ad_group_fact_base]

  derived_table: {
    explore_source: ad_impressions {
      column: external_customer_id {}
      column: campaign_id {}
      column: ad_group_id {}
      column: clicks {field: ad_impressions.total_clicks }
      column: conversions {field: ad_impressions.total_conversions}
      column: conversionvalue { field: ad_impressions.total_conversionvalue }
      column: impressions {field: ad_impressions.total_impressions}
      column: cost {field: ad_impressions.total_cost}
    }
  }
}

view: ad_group_fact_this_timeframe {
  extends: [ad_group_fact, ad_metrics_parent_comparison_base, this_timeframe_base]
}

view: ad_group_fact_last_timeframe {
  extends: [ad_group_fact, last_timeframe_base]
}

explore: ad_group_date_fact {
  extends: [ad_group_fact_base]
  from: ad_group_date_fact
  label: "Ad Group Date Fact"
  view_label: "Ad Group Date Fact"
}

view: ad_group_date_fact {
  extends: [ad_group_fact_base, date_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
#     partition_keys: ["_date"]
    explore_source: ad_impressions {
      column: _date { field: ad_impressions.date_date }
      column: external_customer_id {}
      column: campaign_id {}
      column: ad_group_id {}
      column: clicks { field: ad_impressions.total_clicks }
      column: conversions { field: ad_impressions.total_conversions }
      column: conversionvalue { field: ad_impressions.total_conversionvalue }
      column: cost { field: ad_impressions.total_cost }
      column: impressions { field: ad_impressions.total_impressions }
    }
  }
  dimension: _date {
    hidden: yes
    sql: TIMESTAMP(${TABLE}._date) ;;
  }
}

explore: ad_group_week_fact {
  extends: [ad_group_fact_base]
  from: ad_group_week_fact
  label: "Ad Group Week Fact"
  view_label: "Ad Group Week Fact"

  join: last_ad_group_week_fact {
    from: ad_group_week_fact
    view_label: "Last Week Ad Group Fact"
    sql_on: ${fact.external_customer_id} = ${last_ad_group_week_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_ad_group_week_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_ad_group_week_fact.ad_group_id} AND
      ${fact.date_last_week} = ${last_ad_group_week_fact.date_week} AND
      ${fact.less_than_current_day_of_week} = ${last_ad_group_week_fact.less_than_current_day_of_week} AND
      ${last_ad_group_week_fact.less_than_current_day_of_week} ;;
    relationship: one_to_one
    type: inner
  }
  join: parent_fact {
    from: campaign_week_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.date_week} = ${parent_fact.date_week} AND
      ${fact.less_than_current_day_of_week} = ${parent_fact.less_than_current_day_of_week} ;;
    relationship: one_to_one
    type: inner
  }
}

view: ad_group_week_fact {
  extends: [ad_group_fact_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: ad_group_date_fact {
      column: date_week { field: fact.date_week }
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: less_than_current_day_of_week { field: fact.less_than_current_day_of_week }
      column: clicks { field: fact.total_clicks }
      column: conversions { field: fact.total_conversions }
      column: conversionvalue { field: fact.total_conversionvalue }
      column: cost { field: fact.total_cost }
      column: impressions { field: fact.total_impressions }
    }
  }
  dimension: date_week {
    type: date
    allow_fill: no
    sql: TIMESTAMP(${TABLE}.date_week) ;;
  }
  dimension: date_last_week {
    type: date
    sql: DATE_ADD(${date_week}, INTERVAL -1 WEEK) ;;
  }
  dimension: date_date {
    sql: ${date_week} ;;
  }
  dimension: less_than_current_day_of_week {}
}

explore: ad_group_month_fact {
  extends: [ad_group_fact_base]
  from: ad_group_month_fact
  label: "Ad Group Month Fact"
  view_label: "Ad Group Month Fact"

  join: last_ad_group_month_fact {
    from: ad_group_month_fact
    view_label: "Last Month Ad Group Fact"
    sql_on: ${fact.external_customer_id} = ${last_ad_group_month_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_ad_group_month_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_ad_group_month_fact.ad_group_id} AND
      ${fact.date_last_month} = ${last_ad_group_month_fact.date_month} AND
      ${fact.less_than_current_day_of_month} = ${last_ad_group_month_fact.less_than_current_day_of_month} AND
      ${last_ad_group_month_fact.less_than_current_day_of_month} ;;
    relationship: one_to_one
    type: inner
  }
  join: parent_fact {
    from: campaign_month_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.date_month} = ${parent_fact.date_month} AND
      ${fact.less_than_current_day_of_month} = ${parent_fact.less_than_current_day_of_month} ;;
    relationship: one_to_one
    type: inner
  }
}

view: ad_group_month_fact {
  extends: [ad_group_fact_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: ad_group_date_fact {
      column: date_month { field: fact.date_month_date }
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: less_than_current_day_of_month { field: fact.less_than_current_day_of_month }
      column: clicks { field: fact.total_clicks }
      column: conversions { field: fact.total_conversions }
      column: conversionvalue { field: fact.total_conversionvalue }
      column: cost { field: fact.total_cost }
      column: impressions { field: fact.total_impressions }
    }
  }
  dimension: date_month {
    type: date
    allow_fill: no
    sql: TIMESTAMP(${TABLE}.date_month) ;;
  }
  dimension: date_last_month {
    type: date
    sql: DATE_ADD(${date_month}, INTERVAL -1 MONTH) ;;
  }
  dimension: date_date {
    sql: ${date_month} ;;
  }
  dimension: less_than_current_day_of_month {}
}

explore: ad_group_quarter_fact {
  extends: [ad_group_fact_base]
  from: ad_group_quarter_fact
  label: "Ad Group Quarter Fact"
  view_label: "Ad Group Quarter Fact"

  join: last_ad_group_quarter_fact {
    from: ad_group_quarter_fact
    view_label: "Last Quarter Ad Group Fact"
    sql_on: ${fact.external_customer_id} = ${last_ad_group_quarter_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_ad_group_quarter_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_ad_group_quarter_fact.ad_group_id} AND
      ${fact.date_last_quarter} = ${last_ad_group_quarter_fact.date_quarter} AND
      ${fact.less_than_current_day_of_quarter} = ${last_ad_group_quarter_fact.less_than_current_day_of_quarter} AND
      ${last_ad_group_quarter_fact.less_than_current_day_of_quarter} ;;
    relationship: one_to_one
    type: inner
  }
  join: parent_fact {
    from: campaign_quarter_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.date_quarter} = ${parent_fact.date_quarter} AND
      ${fact.less_than_current_day_of_quarter} = ${parent_fact.less_than_current_day_of_quarter} ;;
    relationship: one_to_one
    type: inner
  }
}

view: ad_group_quarter_fact {
  extends: [ad_group_fact_base, ad_metrics_parent_comparison_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: ad_group_date_fact {
      column: date_quarter { field: fact.date_quarter_date }
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: less_than_current_day_of_quarter { field: fact.less_than_current_day_of_quarter }
      column: clicks { field: fact.total_clicks }
      column: conversions { field: fact.total_conversions }
      column: conversionvalue { field: fact.total_conversionvalue }
      column: cost { field: fact.total_cost }
      column: impressions { field: fact.total_impressions }
    }
  }
  dimension: date_quarter {
    type: date
    allow_fill: no
    sql: TIMESTAMP(${TABLE}.date_quarter) ;;
  }
  dimension: date_last_quarter {
    type: date
    sql: DATE_ADD(${date_quarter}, INTERVAL -1 QUARTER) ;;
  }
  dimension: date_date {
    sql: ${date_quarter} ;;
  }
  dimension: less_than_current_day_of_quarter {}
}
