include: "ad_metrics_base.view"
include: "ad_metrics_parent_comparison_base.view"
include: "ad_group.view"
include: "ad_group_fact.view"
include: "campaign.view"
include: "campaign_fact.view"
include: "customer.view"
include: "date_base.view"
include: "keyword.view"
include: "timeframe_base.view"

explore: keyword_fact_base {
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
      ${fact.external_customer_id} = ${campaign.external_customer_id} AND
      ${fact.date_date} = ${campaign.date_date} ;;
    relationship: many_to_one
  }
  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${fact.ad_group_id} = ${ad_group.ad_group_id} AND
      ${fact.campaign_id} = ${ad_group.campaign_id} AND
      ${fact.external_customer_id} = ${ad_group.external_customer_id} AND
      ${fact.date_date} = ${ad_group.date_date}  ;;
    relationship: many_to_one
  }
  join: keyword {
    view_label: "Keyword"
    sql_on: ${fact.criterion_id} = ${keyword.criterion_id} AND
      ${fact.ad_group_id} = ${keyword.ad_group_id} AND
      ${fact.campaign_id} = ${keyword.campaign_id} AND
      ${fact.external_customer_id} = ${keyword.external_customer_id} AND
      ${fact.date_date} = ${keyword.date_date}  ;;
    relationship: many_to_one
  }
}

view: keyword_fact_base {
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
  dimension: criterion_id {
    hidden: yes
  }
}

explore: keyword_fact_this_timeframe {
  from: keyword_fact_this_timeframe
  view_name: fact
  persist_with: etl_datagroup
  always_filter: {
    filters: {
      field: fact.this_timeframe
    }
    filters: {
      field: last_fact.last_timeframe
    }
    filters: {
      field: parent_fact.this_timeframe
    }
  }
  join: last_fact {
    from: keyword_fact_last_timeframe
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
      ${fact.external_customer_id} = ${campaign.external_customer_id} AND
      ${campaign.latest} ;;
    relationship: many_to_one
  }
  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${fact.ad_group_id} = ${ad_group.ad_group_id} AND
      ${fact.campaign_id} = ${ad_group.campaign_id} AND
      ${fact.external_customer_id} = ${ad_group.external_customer_id} AND
      ${ad_group.latest}  ;;
    relationship: many_to_one
  }
  join: keyword {
    view_label: "Keyword"
    sql_on: ${fact.criterion_id} = ${keyword.criterion_id} AND
      ${fact.ad_group_id} = ${keyword.ad_group_id} AND
      ${fact.campaign_id} = ${keyword.campaign_id} AND
      ${fact.external_customer_id} = ${keyword.external_customer_id} AND
      ${keyword.latest}  ;;
    relationship: many_to_one
  }
  join: parent_fact {
    view_label: "Ad Group This Period"
    from: ad_group_fact_this_timeframe
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.ad_group_id} = ${parent_fact.ad_group_id} ;;
    relationship: one_to_one
    type: inner
  }
}

view: keyword_fact {
  extends: [ad_metrics_base, keyword_fact_base]

  derived_table: {
    explore_source: ad_impressions {
      column: external_customer_id {}
      column: campaign_id {}
      column: ad_group_id {}
      column: criterion_id {}
      column: clicks {field: ad_impressions.total_clicks }
      column: conversions {field: ad_impressions.total_conversions}
      column: conversionvalue { field: ad_impressions.total_conversionvalue }
      column: impressions {field: ad_impressions.total_impressions}
      column: cost {field: ad_impressions.total_cost}
    }
  }
}

view: keyword_fact_this_timeframe {
  extends: [keyword_fact, ad_metrics_parent_comparison_base, this_timeframe_base]
}

view: keyword_fact_last_timeframe {
  extends: [keyword_fact, last_timeframe_base]
}

explore: keyword_date_fact {
  extends: [keyword_fact_base]
  from: keyword_date_fact
  label: "Ad Date Fact"
  view_label: "Ad Date Fact"
}

view: keyword_date_fact {
  extends: [keyword_fact_base, date_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
#     partition_keys: ["_date"]
    explore_source: ad_impressions {
      column: _date { field: ad_impressions.date_date }
      column: external_customer_id {}
      column: campaign_id {}
      column: ad_group_id {}
      column: criterion_id {}
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

explore: keyword_week_fact {
  extends: [keyword_fact_base]
  from: keyword_week_fact
  label: "Ad Week Fact"
  view_label: "Ad Week Fact"

  join: last_keyword_week_fact {
    from: keyword_week_fact
    view_label: "Last Week Ad Fact"
    sql_on: ${fact.external_customer_id} = ${last_keyword_week_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_keyword_week_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_keyword_week_fact.ad_group_id} AND
      ${fact.criterion_id} = ${last_keyword_week_fact.criterion_id} AND
      ${fact.date_last_week} = ${last_keyword_week_fact.date_week} AND
      ${fact.less_than_current_day_of_week} = ${last_keyword_week_fact.less_than_current_day_of_week} AND
      ${last_keyword_week_fact.less_than_current_day_of_week} ;;
    relationship: one_to_one
    type: inner
  }
  join: parent_fact {
    from: keyword_week_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.ad_group_id} = ${parent_fact.ad_group_id} AND
      ${fact.date_week} = ${parent_fact.date_week} AND
      ${fact.less_than_current_day_of_week} = ${parent_fact.less_than_current_day_of_week} ;;
    relationship: one_to_one
    type: inner
  }
}

view: keyword_week_fact {
  extends: [keyword_fact_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: keyword_date_fact {
      column: date_week { field: fact.date_week }
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: criterion_id { field: fact.criterion_id }
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

explore: keyword_month_fact {
  extends: [keyword_fact_base]
  from: keyword_month_fact
  label: "Keyword Month Fact"
  view_label: "Keyword Month Fact"

  join: last_keyword_month_fact {
    from: keyword_month_fact
    view_label: "Last Month Keyword Fact"
    sql_on: ${fact.external_customer_id} = ${last_keyword_month_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_keyword_month_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_keyword_month_fact.ad_group_id} AND
      ${fact.date_last_month} = ${last_keyword_month_fact.date_month} AND
      ${fact.less_than_current_day_of_month} = ${last_keyword_month_fact.less_than_current_day_of_month} AND
      ${last_keyword_month_fact.less_than_current_day_of_month} ;;
    relationship: one_to_one
    type: inner
  }
  join: parent_fact {
    from: ad_group_month_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.ad_group_id} = ${parent_fact.ad_group_id} AND
      ${fact.date_month} = ${parent_fact.date_month} AND
      ${fact.less_than_current_day_of_month} = ${parent_fact.less_than_current_day_of_month} ;;
    relationship: one_to_one
    type: inner
  }
}

view: keyword_month_fact {
  extends: [keyword_fact_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: keyword_date_fact {
      column: date_month { field: fact.date_month_date }
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: criterion_id { field: fact.criterion_id }
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

explore: keyword_quarter_fact {
  extends: [keyword_fact_base]
  from: keyword_quarter_fact
  label: "Keyword Quarter Fact"
  view_label: "Keyword Quarter Fact"

  join: last_keyword_quarter_fact {
    from: keyword_quarter_fact
    view_label: "Last Quarter Keyword Fact"
    sql_on: ${fact.external_customer_id} = ${last_keyword_quarter_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_keyword_quarter_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_keyword_quarter_fact.ad_group_id} AND
      ${fact.date_last_quarter} = ${last_keyword_quarter_fact.date_quarter} AND
      ${fact.less_than_current_day_of_quarter} = ${last_keyword_quarter_fact.less_than_current_day_of_quarter} AND
      ${last_keyword_quarter_fact.less_than_current_day_of_quarter} ;;
    relationship: one_to_one
    type: inner
  }
  join: parent_fact {
    from: ad_group_quarter_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.ad_group_id} = ${parent_fact.ad_group_id} AND
      ${fact.date_quarter} = ${parent_fact.date_quarter} AND
      ${fact.less_than_current_day_of_quarter} = ${parent_fact.less_than_current_day_of_quarter} ;;
    relationship: one_to_one
    type: inner
  }
}

view: keyword_quarter_fact {
  extends: [keyword_fact_base, ad_metrics_parent_comparison_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: keyword_date_fact {
      column: date_quarter { field: fact.date_quarter_date }
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: criterion_id { field: fact.criterion_id }
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
