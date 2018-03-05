include: "customer.view"
include: "stats.view"

explore: account_week_stats {
  hidden: yes
  persist_with: etl_datagroup
  label: "Account Week Stats"
  view_label: "Account Week Stats"

  join: last_account_week_stats {
    from: account_week_stats
    view_label: "Last Week Account Stats"
    sql_on: ${account_week_stats.external_customer_id} = ${last_account_week_stats.external_customer_id} AND
      ${account_week_stats.date_last_week} = ${last_account_week_stats.date_week} ;;
    relationship: one_to_one
  }
  join:  customer {
    view_label: "Customer"
    sql_on: ${account_week_stats.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} = "Yes" ;;
    relationship: many_to_one
  }
}

# move to last 7 days
view: account_week_stats {
  extends: [stats]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: account_date_stats {
      column: date_week {}
      column: external_customer_id {}
      column: less_than_current_day_of_week {}
      column: clicks { field: account_date_stats.total_clicks }
      column: conversions { field: account_date_stats.total_conversions }
      column: conversionvalue { field: account_date_stats.total_conversion_value }
      column: cost { field: account_date_stats.total_cost }
      column: impressions { field: account_date_stats.total_impressions }
      column: interactions { field: account_date_stats.total_interactions }
    }
  }
  dimension: date_week {
    type: date
    allow_fill: no
  }
  dimension: date_last_week {
    type: date
    sql: DATE_ADD(${date_week}, INTERVAL -1 WEEK) ;;
    allow_fill: no
  }
  dimension: less_than_current_day_of_week {
    type: yesno
  }
  dimension: external_customer_id {
    type: number
  }
}
