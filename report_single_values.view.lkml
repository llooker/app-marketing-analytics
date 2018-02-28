view: report_single_values {
  derived_table: {
    sql:
      select 'ad-alerts' as key, 13 as nowValue, 12 as pastValue
      UNION ALL
      select 'keyword-alerts' as key, 12.21 as nowValue, 82.23 as pastValue
      UNION ALL
      select 'dead-ads-keywords' as key, 8932 as nowValue, 8329 as pastValue
    ;;
  }
  dimension: key {
    type:  string
    primary_key:  yes
    sql: ${TABLE}.key ;;
  }
  dimension: nowValue {
    label: "Now Value"
    type:  number
    sql: ${TABLE}.nowValue ;;
  }
  dimension: pastValue {
    label: "Past Value"
    type:  number
    sql: ${TABLE}.pastValue ;;
  }
}
