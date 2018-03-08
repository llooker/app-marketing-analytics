include: "ad_metrics_base.view.lkml"
include: "campaign.view"
include: "customer.view"
include: "date_base.view.lkml"

explore: campaign_date_fact {
  persist_with: etl_datagroup
  label: "Campaign Date Fact"
  view_label: "Campaign Date Fact"
  join: customer {
    view_label: "Customer"
    sql_on: ${campaign_date_fact.external_customer_id} = ${customer.external_customer_id} AND
      ${campaign_date_fact.date_date} = ${customer.date_date} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${campaign_date_fact.campaign_id} = ${campaign.campaign_id} AND
      ${campaign_date_fact.date_date} = ${campaign.date_date} ;;
    relationship: many_to_one
  }
}

view: campaign_date_fact {
  extends: [ad_metrics_base, date_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    partition_keys: ["_date"]
    explore_source: ad_impressions {
      column: _date { field: ad_impressions.date_date }
      column: external_customer_id {}
      column: campaign_id {}
      column: average_position { field: ad_impressions.weighted_average_position }
      column: clicks { field: ad_impressions.total_clicks }
      column: conversions { field: ad_impressions.total_conversions }
      column: conversion_value { field: ad_impressions.total_conversion_value }
      column: cost { field: ad_impressions.total_cost }
      column: impressions { field: ad_impressions.total_impressions }
      column: interactions { field: ad_impressions.total_interactions }
    }
  }
  dimension: _date {
    hidden: yes
    sql: TIMESTAMP(${TABLE}._date) ;;
  }
  dimension: external_customer_id {
    type: number
    hidden: yes
  }
  dimension: campaign_id {
    type: number
    hidden: yes
  }
}

explore: campaign_week_fact {
  hidden: yes
  persist_with: etl_datagroup
  label: "Campaign Week Fact"
  view_label: "Campaign Week Fact"

  join: last_campaign_week_fact {
    from: campaign_week_fact
    view_label: "Last Week Campaign Fact"
    sql_on: ${campaign_week_fact.external_customer_id} = ${last_campaign_week_fact.external_customer_id} AND
      ${campaign_week_fact.campaign_id} = ${last_campaign_week_fact.campaign_id} AND
      ${campaign_week_fact.date_last_week} = ${last_campaign_week_fact.date_week} AND
      ${campaign_week_fact.less_than_current_day_of_week} = ${last_campaign_week_fact.less_than_current_day_of_week} AND
      ${last_campaign_week_fact.less_than_current_day_of_week} ;;
    relationship: one_to_one
    type: inner
  }
  join:  customer {
    view_label: "Customer"
    sql_on: ${campaign_week_fact.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${campaign_week_fact.campaign_id} = ${campaign.campaign_id} AND
      ${campaign.latest} ;;
    relationship: many_to_one
  }
}

view: campaign_week_fact {
  extends: [ad_metrics_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: campaign_date_fact {
      column: date_week {}
      column: external_customer_id {}
      column: campaign_id {}
      column: less_than_current_day_of_week {}
      column: average_position { field: campaign_date_fact.weighted_average_position }
      column: clicks { field: campaign_date_fact.total_clicks }
      column: conversions { field: campaign_date_fact.total_conversions }
      column: conversion_value { field: campaign_date_fact.total_conversion_value }
      column: cost { field: campaign_date_fact.total_cost }
      column: impressions { field: campaign_date_fact.total_impressions }
      column: interactions { field: campaign_date_fact.total_interactions }
    }
  }
  dimension: date_week {
    type: date
    sql: TIMESTAMP(${TABLE}.date_week) ;;
  }
  dimension: date_last_week {
    type: date
    sql: DATE_ADD(${date_week}), INTERVAL -1 WEEK) ;;
  }
  dimension: external_customer_id {
    type: number
    hidden: yes
  }
  dimension: campaign_id {
    type: number
    hidden: yes
  }
  dimension: less_than_current_day_of_week {}
}

explore: campaign_month_fact {
  hidden: yes
  persist_with: etl_datagroup
  label: "Campaign Month Fact"
  view_label: "Campaign Month Fact"

  join: last_campaign_month_fact {
    from: campaign_month_fact
    view_label: "Last Month Campaign Fact"
    sql_on: ${campaign_month_fact.external_customer_id} = ${last_campaign_month_fact.external_customer_id} AND
      ${campaign_month_fact.campaign_id} = ${last_campaign_month_fact.campaign_id} AND
      ${campaign_month_fact.date_last_month} = ${last_campaign_month_fact.date_month} AND
      ${campaign_month_fact.less_than_current_day_of_month} = ${last_campaign_month_fact.less_than_current_day_of_month} AND
      ${last_campaign_month_fact.less_than_current_day_of_month} ;;
    relationship: one_to_one
    type: inner
  }
  join:  customer {
    view_label: "Customer"
    sql_on: ${campaign_month_fact.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${campaign_month_fact.campaign_id} = ${campaign.campaign_id} AND
      ${campaign.latest} ;;
    relationship: many_to_one
  }
}

view: campaign_month_fact {
  extends: [ad_metrics_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: campaign_date_fact {
      column: date_month {}
      column: external_customer_id {}
      column: campaign_id {}
      column: less_than_current_day_of_month {}
      column: average_position { field: campaign_date_fact.weighted_average_position }
      column: clicks { field: campaign_date_fact.total_clicks }
      column: conversions { field: campaign_date_fact.total_conversions }
      column: conversion_value { field: campaign_date_fact.total_conversion_value }
      column: cost { field: campaign_date_fact.total_cost }
      column: impressions { field: campaign_date_fact.total_impressions }
      column: interactions { field: campaign_date_fact.total_interactions }
    }
  }
  dimension: date_month {
    type: date
    sql: TIMESTAMP(${TABLE}.date_month) ;;
  }
  dimension: date_last_month {
    type: date
    sql: DATE_ADD(${date_month}), INTERVAL -1 MONTH) ;;
  }
  dimension: external_customer_id {
    type: number
    hidden: yes
  }
  dimension: campaign_id {
    type: number
    hidden: yes
  }
  dimension: less_than_current_day_of_month {}
}

explore: campaign_quarter_fact {
  hidden: yes
  persist_with: etl_datagroup
  label: "Campaign Quarter Fact"
  view_label: "Campaign Quarter Fact"

  join: last_campaign_quarter_fact {
    from: campaign_quarter_fact
    view_label: "Last Quarter Campaign Fact"
    sql_on: ${campaign_quarter_fact.external_customer_id} = ${last_campaign_quarter_fact.external_customer_id} AND
      ${campaign_quarter_fact.campaign_id} = ${last_campaign_quarter_fact.campaign_id} AND
      ${campaign_quarter_fact.date_last_quarter} = ${last_campaign_quarter_fact.date_quarter} AND
      ${campaign_quarter_fact.less_than_current_day_of_quarter} = ${last_campaign_quarter_fact.less_than_current_day_of_quarter} AND
      ${last_campaign_quarter_fact.less_than_current_day_of_quarter} ;;
    relationship: one_to_one
    type: inner
  }
  join:  customer {
    view_label: "Customer"
    sql_on: ${campaign_quarter_fact.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${campaign_quarter_fact.campaign_id} = ${campaign.campaign_id} AND
      ${campaign.latest} ;;
    relationship: many_to_one
  }
}

view: campaign_quarter_fact {
  extends: [ad_metrics_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: campaign_date_fact {
      column: date_quarter {}
      column: external_customer_id {}
      column: campaign_id {}
      column: less_than_current_day_of_quarter {}
      column: average_position { field: campaign_date_fact.weighted_average_position }
      column: clicks { field: campaign_date_fact.total_clicks }
      column: conversions { field: campaign_date_fact.total_conversions }
      column: conversion_value { field: campaign_date_fact.total_conversion_value }
      column: cost { field: campaign_date_fact.total_cost }
      column: impressions { field: campaign_date_fact.total_impressions }
      column: interactions { field: campaign_date_fact.total_interactions }
    }
  }
  dimension: date_quarter {
    type: date
    sql: TIMESTAMP(${TABLE}.date_quarter) ;;
  }
  dimension: date_last_quarter {
    type: date
    sql: DATE_ADD(${date_quarter}), INTERVAL -1 QUARTER) ;;
  }
  dimension: external_customer_id {
    type: number
    hidden: yes
  }
  dimension: campaign_id {
    type: number
    hidden: yes
  }
  dimension: less_than_current_day_of_quarter {}
}
