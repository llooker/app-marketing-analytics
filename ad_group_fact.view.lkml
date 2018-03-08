include: "ad_metrics_base.view"
include: "ad_group.view"
include: "campaign.view"
include: "customer.view"
include: "date_base.view"

explore: ad_group_date_fact {
  persist_with: etl_datagroup
  label: "Campaign Date Fact"
  view_label: "Campaign Date Fact"
  join: customer {
    view_label: "Customer"
    sql_on: ${ad_group_date_fact.external_customer_id} = ${customer.external_customer_id} AND
      ${ad_group_date_fact.date_date} = ${customer.date_date} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${ad_group_date_fact.campaign_id} = ${campaign.campaign_id} AND
      ${ad_group_date_fact.date_date} = ${campaign.date_date} ;;
    relationship: many_to_one
  }
  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${ad_group_date_fact.campaign_id} = ${ad_group.ad_group_id} AND
      ${ad_group_date_fact.date_date} = ${ad_group.date_date}  ;;
    relationship: many_to_one
  }
}

view: ad_group_date_fact {
  extends: [ad_metrics_base, date_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    partition_keys: ["_date"]
    explore_source: ad_impressions {
      column: _date { field: ad_impressions.date_date }
      column: external_customer_id {}
      column: campaign_id {}
      column: ad_group_id {}
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
  dimension: ad_group_id {
    type: number
    hidden: yes
  }
}

explore: ad_group_week_fact {
  hidden: yes
  persist_with: etl_datagroup
  label: "Ad Group Week Fact"
  view_label: "Ad Group Week Fact"

  join: last_ad_group_week_fact {
    from: ad_group_week_fact
    view_label: "Last Week Ad Group Fact"
    sql_on: ${ad_group_week_fact.external_customer_id} = ${last_ad_group_week_fact.external_customer_id} AND
      ${ad_group_week_fact.campaign_id} = ${last_ad_group_week_fact.campaign_id} AND
      ${ad_group_week_fact.ad_group_id} = ${last_ad_group_week_fact.ad_group_id} AND
      ${ad_group_week_fact.date_last_week} = ${last_ad_group_week_fact.date_week} AND
      ${ad_group_week_fact.less_than_current_day_of_week} = ${last_ad_group_week_fact.less_than_current_day_of_week} AND
      ${last_ad_group_week_fact.less_than_current_day_of_week} ;;
    relationship: one_to_one
    type: inner
  }
  join:  customer {
    view_label: "Customer"
    sql_on: ${ad_group_week_fact.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${ad_group_week_fact.campaign_id} = ${campaign.campaign_id} AND
      ${campaign.latest} ;;
    relationship: many_to_one
  }
  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${ad_group_week_fact.campaign_id} = ${ad_group.ad_group_id} AND
      ${ad_group.latest} ;;
    relationship: many_to_one
  }
}

view: ad_group_week_fact {
  extends: [ad_metrics_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: ad_group_date_fact {
      column: date_week {}
      column: external_customer_id {}
      column: campaign_id {}
      column: ad_group_id {}
      column: less_than_current_day_of_week {}
      column: average_position { field: ad_group_date_fact.weighted_average_position }
      column: clicks { field: ad_group_date_fact.total_clicks }
      column: conversions { field: ad_group_date_fact.total_conversions }
      column: conversion_value { field: ad_group_date_fact.total_conversion_value }
      column: cost { field: ad_group_date_fact.total_cost }
      column: impressions { field: ad_group_date_fact.total_impressions }
      column: interactions { field: ad_group_date_fact.total_interactions }
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
  dimension: ad_group_id {
    type: number
    hidden: yes
  }
  dimension: less_than_current_day_of_week {}
}

explore: ad_group_month_fact {
  hidden: yes
  persist_with: etl_datagroup
  label: "Ad Group Month Fact"
  view_label: "Ad Group Month Fact"

  join: last_ad_group_month_fact {
    from: ad_group_month_fact
    view_label: "Last Month Ad Group Fact"
    sql_on: ${ad_group_month_fact.external_customer_id} = ${last_ad_group_month_fact.external_customer_id} AND
      ${ad_group_month_fact.campaign_id} = ${last_ad_group_month_fact.campaign_id} AND
      ${ad_group_month_fact.ad_group_id} = ${last_ad_group_month_fact.ad_group_id} AND
      ${ad_group_month_fact.date_last_month} = ${last_ad_group_month_fact.date_month} AND
      ${ad_group_month_fact.less_than_current_day_of_month} = ${last_ad_group_month_fact.less_than_current_day_of_month} AND
      ${last_ad_group_month_fact.less_than_current_day_of_month} ;;
    relationship: one_to_one
    type: inner
  }
  join:  customer {
    view_label: "Customer"
    sql_on: ${ad_group_month_fact.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${ad_group_month_fact.campaign_id} = ${campaign.campaign_id} AND
      ${campaign.latest} ;;
    relationship: many_to_one
  }
  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${ad_group_month_fact.campaign_id} = ${ad_group.ad_group_id} AND
      ${ad_group.latest} ;;
    relationship: many_to_one
  }
}

view: ad_group_month_fact {
  extends: [ad_metrics_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: ad_group_date_fact {
      column: date_month{}
      column: external_customer_id {}
      column: campaign_id {}
      column: ad_group_id {}
      column: less_than_current_day_of_month {}
      column: average_position { field: ad_group_date_fact.weighted_average_position }
      column: clicks { field: ad_group_date_fact.total_clicks }
      column: conversions { field: ad_group_date_fact.total_conversions }
      column: conversion_value { field: ad_group_date_fact.total_conversion_value }
      column: cost { field: ad_group_date_fact.total_cost }
      column: impressions { field: ad_group_date_fact.total_impressions }
      column: interactions { field: ad_group_date_fact.total_interactions }
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
  dimension: ad_group_id {
    type: number
    hidden: yes
  }
  dimension: less_than_current_day_of_month {}
}

explore: ad_group_quarter_fact {
  hidden: yes
  persist_with: etl_datagroup
  label: "Ad Group Quarter Fact"
  view_label: "Ad Group Quarter Fact"

  join: last_ad_group_quarter_fact {
    from: ad_group_quarter_fact
    view_label: "Last Quarter Ad Group Fact"
    sql_on: ${ad_group_quarter_fact.external_customer_id} = ${last_ad_group_quarter_fact.external_customer_id} AND
      ${ad_group_quarter_fact.campaign_id} = ${last_ad_group_quarter_fact.campaign_id} AND
      ${ad_group_quarter_fact.ad_group_id} = ${last_ad_group_quarter_fact.ad_group_id} AND
      ${ad_group_quarter_fact.date_last_quarter} = ${last_ad_group_quarter_fact.date_quarter} AND
      ${ad_group_quarter_fact.less_than_current_day_of_quarter} = ${last_ad_group_quarter_fact.less_than_current_day_of_quarter} AND
      ${last_ad_group_quarter_fact.less_than_current_day_of_quarter} ;;
    relationship: one_to_one
    type: inner
  }
  join:  customer {
    view_label: "Customer"
    sql_on: ${ad_group_quarter_fact.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${ad_group_quarter_fact.campaign_id} = ${campaign.campaign_id} AND
      ${campaign.latest} ;;
    relationship: many_to_one
  }
  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${ad_group_quarter_fact.campaign_id} = ${ad_group.ad_group_id} AND
      ${ad_group.latest} ;;
    relationship: many_to_one
  }
}

view: ad_group_quarter_fact {
  extends: [ad_metrics_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: ad_group_date_fact {
      column: date_quarter {}
      column: external_customer_id {}
      column: campaign_id {}
      column: ad_group_id {}
      column: less_than_current_day_of_quarter {}
      column: average_position { field: ad_group_date_fact.weighted_average_position }
      column: clicks { field: ad_group_date_fact.total_clicks }
      column: conversions { field: ad_group_date_fact.total_conversions }
      column: conversion_value { field: ad_group_date_fact.total_conversion_value }
      column: cost { field: ad_group_date_fact.total_cost }
      column: impressions { field: ad_group_date_fact.total_impressions }
      column: interactions { field: ad_group_date_fact.total_interactions }
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
  dimension: ad_group_id {
    type: number
    hidden: yes
  }
  dimension: less_than_current_day_of_quarter {}
}