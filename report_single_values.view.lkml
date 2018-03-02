view: report_single_values {
  derived_table: {
    sql:
      select 'ad-alerts' as key, 13 as currentValue, 12 as previousValue
      UNION ALL
      select 'keyword-alerts' as key, 12.21 as currentValue, 82.23 as previousValue
      UNION ALL
      select 'dead-ads-keywords' as key, 8932 as currentValue, 8329 as previousValue
    ;;
  }
  dimension: key {
    type:  string
    primary_key:  yes
    sql: ${TABLE}.key ;;
  }
  dimension: currentValue {
    label: "Current Value"
    type:  number
    sql: ${TABLE}.currentValue ;;
  }
  dimension: previousValue {
    label: "Previous Value"
    type:  number
    sql: ${TABLE}.previousValue ;;
  }
}
