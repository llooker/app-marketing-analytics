include: "ad_metrics_base.view"
include: "ad_metrics_parent_comparison_base.view"
include: "account_fact.view"
include: "campaign.view"
include: "customer.view"
include: "date_base.view"

explore: campaign_fact_base {
  hidden: yes
  extension: required
  view_name: fact
  persist_with: etl_datagroup

  join:  customer {
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
}

view: campaign_fact_base {
  extension: required
  extends: [ad_metrics_base]

  dimension: external_customer_id {
  }
  dimension: campaign_id {
  }
}

explore: campaign_date_fact {
  extends: [campaign_fact_base]
  from: campaign_date_fact
  label: "Campaign Date Fact"
  view_label: "Campaign Date Fact"
}

view: campaign_date_fact {
  extends: [campaign_fact_base, date_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
#     partition_keys: ["_date"]
    explore_source: ad_impressions {
      column: _date { field: ad_impressions.date_date }
      column: external_customer_id {}
      column: campaign_id {}
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

explore: campaign_week_fact {
  extends: [campaign_fact_base]
  from: campaign_week_fact
  label: "Campaign Week Fact"
  view_label: "Campaign Week Fact"

  join: last_campaign_week_fact {
    from: campaign_week_fact
    view_label: "Last Week Campaign Fact"
    sql_on: ${fact.external_customer_id} = ${last_campaign_week_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_campaign_week_fact.campaign_id} AND
      ${fact.date_last_week} = ${last_campaign_week_fact.date_week} AND
      ${fact.less_than_current_day_of_week} = ${last_campaign_week_fact.less_than_current_day_of_week} AND
      ${last_campaign_week_fact.less_than_current_day_of_week} ;;
    relationship: one_to_one
    type: inner
  }
  join: parent_fact {
    from: account_week_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.date_week} = ${parent_fact.date_week} AND
      ${fact.less_than_current_day_of_week} = ${parent_fact.less_than_current_day_of_week} ;;
    relationship: one_to_one
    type: inner
  }
}

view: campaign_week_fact {
  extends: [campaign_fact_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: campaign_date_fact {
      column: date_week { field: fact.date_week }
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
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

explore: campaign_month_fact {
  extends: [campaign_fact_base]
  from: campaign_month_fact
  label: "Campaign Month Fact"
  view_label: "Campaign Month Fact"

  join: last_campaign_month_fact {
    from: campaign_month_fact
    view_label: "Last Month Campaign Fact"
    sql_on: ${fact.external_customer_id} = ${last_campaign_month_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_campaign_month_fact.campaign_id} AND
      ${fact.date_last_month} = ${last_campaign_month_fact.date_month} AND
      ${fact.less_than_current_day_of_month} = ${last_campaign_month_fact.less_than_current_day_of_month} AND
      ${fact.less_than_current_day_of_month} ;;
    relationship: one_to_one
    type: inner
  }
  join: parent_fact {
    from: account_month_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.date_month} = ${parent_fact.date_month} AND
      ${fact.less_than_current_day_of_month} = ${parent_fact.less_than_current_day_of_month} ;;
    relationship: one_to_one
    type: inner
  }
}

view: campaign_month_fact {
  extends: [campaign_fact_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: campaign_date_fact {
      column: date_month { field: fact.date_month_date }
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
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
    allow_fill: no
    sql: DATE_ADD(${date_month}, INTERVAL -1 MONTH) ;;
  }
  dimension: date_date {
    sql: ${date_month} ;;
  }
  dimension: less_than_current_day_of_month {}
}

explore: campaign_quarter_fact {
  extends: [campaign_fact_base]
  from: campaign_quarter_fact
  label: "Campaign Quarter Fact"
  view_label: "Campaign Quarter Fact"

  join: last_campaign_quarter_fact {
    from: campaign_quarter_fact
    view_label: "Last Quarter Campaign Fact"
    sql_on: ${fact.external_customer_id} = ${last_campaign_quarter_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_campaign_quarter_fact.campaign_id} AND
      ${fact.date_last_quarter} = ${last_campaign_quarter_fact.date_quarter} AND
      ${fact.less_than_current_day_of_quarter} = ${last_campaign_quarter_fact.less_than_current_day_of_quarter} AND
      ${last_campaign_quarter_fact.less_than_current_day_of_quarter} ;;
    relationship: one_to_one
    type: inner
  }
  join: parent_fact {
    from: account_quarter_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.date_quarter} = ${parent_fact.date_quarter} AND
      ${fact.less_than_current_day_of_quarter} = ${parent_fact.less_than_current_day_of_quarter} ;;
    relationship: one_to_one
    type: inner
  }
}

view: campaign_quarter_fact {
  extends: [campaign_fact_base, ad_metrics_parent_comparison_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: campaign_date_fact {
      column: date_quarter { field: fact.date_quarter_date }
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
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
    allow_fill: no
    sql: DATE_ADD(${date_quarter}, INTERVAL -1 QUARTER) ;;
  }
  dimension: date_date {
    sql: ${date_quarter} ;;
  }
  dimension: less_than_current_day_of_quarter {}
}
