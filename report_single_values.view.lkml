view: report_single_values {
  derived_table: {
    sql:
      select 'ad-alerts' as key, 13 as value, 12 as compare
      UNION ALL
      select 'keyword-alerts' as key, 12.21 as value, 82.23 as compare
      UNION ALL
      select 'dead-ads-keywords' as key, 8932 as value, 8329 as compare
    ;;
  }
  dimension: key {
    type:  string
    primary_key:  yes
    sql: ${TABLE}.key ;;
  }
  dimension: value {
    label: "Current Value"
    type:  number
    sql: ${TABLE}.value ;;
  }
  dimension: compare {
    label: "Previous Value"
    type:  number
    sql: ${TABLE}.compare ;;
  }
}
