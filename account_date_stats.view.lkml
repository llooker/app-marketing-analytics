include: "customer.view"
include: "dated_table.view"
include: "stats.view"

explore: account_date_stats {
  persist_with: etl_datagroup
  label: "Account Date Stats"
  view_label: "Account Date Stats"
  join: customer {
    view_label: "Customer"
    sql_on: ${account_date_stats.external_customer_id} = ${customer.external_customer_id} AND
      ${account_date_stats.date_raw} = ${customer.date_raw} ;;
    relationship: many_to_one
  }
}

view: account_date_stats {
  extends: [stats, dated_table]

  derived_table: {
    datagroup_trigger: etl_datagroup
    partition_keys: ["_date"]
    explore_source: master_stats {
      column: _date { field: master_stats.date_date }
      column: external_customer_id {}
      column: clicks { field: master_stats.total_clicks }
      column: conversions { field: master_stats.total_conversions }
      column: conversionvalue { field: master_stats.total_conversion_value }
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
}
