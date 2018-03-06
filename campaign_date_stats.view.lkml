include: "stats.view.lkml"
include: "dated_table.view.lkml"

view: campaign_date_stats {
  extends: [stats, dated_table]

  derived_table: {
    datagroup_trigger: etl_datagroup
    partition_keys: ["_date"]
    explore_source: master_stats {
      column: _date { field: master_stats.date_date }
      column: external_customer_id {}
      column: campaign_id {}
      column: average_position { field: master_stats.weighted_average_position }
      column: clicks { field: master_stats.total_clicks }
      column: conversions { field: master_stats.total_conversions }
      column: conversion_value { field: master_stats.total_conversion_value }
      column: cost { field: master_stats.total_cost }
      column: impressions { field: master_stats.total_impressions }
      column: interactions { field: master_stats.total_interactions }
    }
  }
  dimension: _date {
    hidden: yes
    sql: TIMESTAMP(${TABLE}._date) ;;
  }
  dimension: external_customer_id {
    type: number
  }
  dimension: campaign_id {
    type: number
  }
}
