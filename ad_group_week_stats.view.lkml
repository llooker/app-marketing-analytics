include: "stats.view.lkml"

view: ad_group_week_stats {
  extends: [stats]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: ad_group_date_stats {
      column: date_week {}
      column: external_customer_id {}
      column: campaign_id {}
      column: ad_group_id {}
      column: less_than_current_day_of_quarter {}
      column: average_position { field: ad_group_date_stats.weighted_average_position }
      column: clicks { field: ad_group_date_stats.total_clicks }
      column: conversions { field: ad_group_date_stats.total_conversions }
      column: conversion_value { field: ad_group_date_stats.total_conversion_value }
      column: cost { field: ad_group_date_stats.total_cost }
      column: impressions { field: ad_group_date_stats.total_impressions }
      column: interactions { field: ad_group_date_stats.total_interactions }
    }
  }
  dimension: date_week {
    type: date
  }
  dimension: date_last_week {
    type: date
    sql: DATE_ADD(${date_week}), INTERVAL -1 WEEK) ;;
  }
  dimension: external_customer_id {
    type: number
  }
  dimension: campaign_id {
    type: number
  }
  dimension: ad_group_id {
    type: number
  }
}
