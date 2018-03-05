include: "customer.view"
include: "stats.view"

explore: account_month_stats {
  hidden: yes
  persist_with: etl_datagroup
  label: "Account Month Stats"
  view_label: "Account Month Stats"

  join: last_account_month_stats {
    from: account_month_stats
    view_label: "Last Month Account Stats"
    sql_on: ${account_month_stats.external_customer_id} = ${last_account_month_stats.external_customer_id} AND
      ${account_month_stats.date_last_month} = ${last_account_month_stats.date_month} ;;
    relationship: one_to_one
  }
  join:  customer {
    view_label: "Customer"
    sql_on: ${account_month_stats.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} = "Yes" ;;
    relationship: many_to_one
  }
}

view: account_month_stats {
  extends: [stats]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: account_date_stats {
      column: date_month { field: account_date_stats.date_month_date }
      column: external_customer_id {}
      column: less_than_current_day_of_month {}
      column: clicks { field: account_date_stats.total_clicks }
      column: conversions { field: account_date_stats.total_conversions }
      column: conversionvalue { field: account_date_stats.total_conversion_value }
      column: cost { field: account_date_stats.total_cost }
      column: impressions { field: account_date_stats.total_impressions }
      column: interactions { field: account_date_stats.total_interactions }
    }
  }
  dimension: date_month {
    type: date
    allow_fill: no
  }
  dimension: date_last_month {
    type: date
    sql: DATE_ADD(${date_month}, INTERVAL -1 MONTH) ;;
    allow_fill: no
  }
  dimension: less_than_current_day_of_month {
    type: yesno
  }
  dimension: external_customer_id {
    type: number
  }
}
