include: "stats.view.lkml"

view: campaign_month_stats {
  extends: [stats]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: campaign_date_stats {
      column: date_month {}
      column: external_customer_id {}
      column: campaign_id {}
      column: less_than_current_day_of_quarter {}
      column: average_position { field: campaign_date_stats.weighted_average_position }
      column: clicks { field: campaign_date_stats.total_clicks }
      column: conversions { field: campaign_date_stats.total_conversions }
      column: conversion_value { field: campaign_date_stats.total_conversion_value }
      column: cost { field: campaign_date_stats.total_cost }
      column: impressions { field: campaign_date_stats.total_impressions }
      column: interactions { field: campaign_date_stats.total_interactions }
    }
  }
  dimension: date_month {
    type: date
  }
  dimension: date_last_month {
    type: date
    sql: DATE_ADD(${date_month}), INTERVAL -1 MONTH) ;;
  }
  dimension: external_customer_id {
    type: number
  }
  dimension: campaign_id {
    type: number
  }
}
