view: report_single_values {
  derived_table: {
    sql:
      select 'ads' as report, 13 as nowValue, 12 as pastValue
      UNION ALL
      select 'keywords' as report, 12.21 as nowValue, 82.23 as pastValue
      UNION ALL
      select 'ad_groups' as report, 8932 as nowValue, 8329 as pastValue
    ;;
  }
  dimension: name {
    type:  string
    primary_key:  yes
    sql: ${TABLE}.report ;;
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
