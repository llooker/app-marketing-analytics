include: "customer.view"
include: "stats.view"

explore: account_quarter_stats {
  persist_with: etl_datagroup
  label: "Account Quarter Stats"
  view_label: "Account Quarter Stats"

  join: last_account_quarter_stats {
    from: account_quarter_stats
    view_label: "Last Quarter Account Stats"
    sql_on: ${account_quarter_stats.external_customer_id} = ${last_account_quarter_stats.external_customer_id} AND
      ${account_quarter_stats.date_last_quarter} = ${last_account_quarter_stats.date_quarter} AND
      ${account_quarter_stats.less_than_current_day_of_quarter} = ${last_account_quarter_stats.less_than_current_day_of_quarter} AND
      ${account_quarter_stats.less_than_current_day_of_quarter} = "Yes" ;;
    relationship: one_to_one
  }
  join:  customer {
    view_label: "Customer"
    sql_on: ${account_quarter_stats.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} = "Yes" ;;
    relationship: many_to_one
  }
}

view: account_quarter_stats {
  extends: [stats]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: account_date_stats {
      column: date_quarter { field: account_date_stats.date_quarter_date }
      column: external_customer_id {}
      column: less_than_current_day_of_quarter {}
      column: clicks { field: account_date_stats.total_clicks }
      column: conversions { field: account_date_stats.total_conversions }
      column: conversionvalue { field: account_date_stats.total_conversion_value }
      column: cost { field: account_date_stats.total_cost }
      column: impressions { field: account_date_stats.total_impressions }
      column: interactions { field: account_date_stats.total_interactions }
    }
  }
  dimension: date_quarter {
    type: date
  }
  dimension: date_last_quarter {
    type: date
    sql: DATE_ADD(${date_quarter}, INTERVAL -1 QUARTER) ;;
  }
  dimension: less_than_current_day_of_quarter {
    type: yesno
  }
  dimension: external_customer_id {
    type: number
  }
}
