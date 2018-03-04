view: dated_table {
  extension: required

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year
    ]
    convert_tz: no
    sql: ${_date} ;;
  }

  dimension: date_day_of_quarter {
    group_label: "Data Date"
    label: "Day of Quarter"
    type: number
    sql: DATE_DIFF(
           ${date_date},
          CAST(CONCAT(${date_quarter}, '-01') as DATE),
          day) + 1
       ;;
  }

  dimension: current_day_of_quarter {
    hidden: yes
    type:  number
    sql: DATE_DIFF(CURRENT_DATE(), DATE_TRUNC(CURRENT_DATE(), QUARTER), DAY) ;;
  }

  dimension: current_day_of_month {
    hidden: yes
    type:  number
    sql: EXTRACT(DAY FROM TIMESTAMP(CURRENT_DATE())) ;;
  }

  dimension: current_day_of_week {
    hidden: yes
    type:  number
    sql: EXTRACT(DAYOFWEEK FROM TIMESTAMP(CURRENT_DATE()))  ;;
  }

  dimension: less_than_current_day_of_quarter {
    type: yesno
    sql: ${date_day_of_quarter} < ${current_day_of_quarter} ;;
  }

  dimension: less_than_current_day_of_month {
    type: yesno
    sql: ${date_day_of_month} < ${current_day_of_month} ;;
  }

  dimension: less_than_current_day_of_week {
    type: yesno
    sql: ${date_day_of_week_index} < ${current_day_of_week} ;;
  }

  dimension: less_than_current_day_of_period {
    type: yesno
    sql: CASE WHEN {% parameter period %} = "week" THEN ${less_than_current_day_of_week}
        WHEN {% parameter period %} = "quarter" THEN ${less_than_current_day_of_quarter}
        WHEN {% parameter period %} = "month" THEN ${less_than_current_day_of_month}
        ELSE NULL
        END;;
  }

  parameter: period {}

  dimension: date_last_week {
    type: date
    sql: DATE_ADD(${date_date}), INTERVAL -1 WEEK) ;;
  }

  dimension: date_last_month {
    type: date
    sql: DATE_ADD(${date_date}), INTERVAL -1 MONTH) ;;
  }

  dimension: date_last_quarter {
    type: date
    sql: DATE_ADD(${date_date}), INTERVAL -1 QUARTER) ;;
  }

  dimension: date_next_quarter {
    hidden: yes
    type: date
    sql: DATE_ADD(${date_date}), INTERVAL 1 QUARTER) ;;
  }

  dimension:  date_days_in_quarter {
    hidden: yes
    type: number
    sql: DATE_DIFF(${date_next_quarter},
           CAST(CONCAT(${date_quarter}, '-01') as DATE),
           day) ;;
  }

  measure: date_max_day_of_week_index {
    hidden: yes
    type: max
    sql: ${date_day_of_week_index} ;;
  }

  measure: date_max_day_of_month {
    hidden: yes
    type: max
    sql: ${date_day_of_month} ;;
  }

  measure: date_max_day_of_quarter {
    hidden: yes
    type: max
    sql: ${date_day_of_quarter} ;;
  }

  measure: date_max_day_of_year {
    hidden: yes
    type: max
    sql: ${date_day_of_year} ;;
  }

  dimension: latest {
    hidden: yes
    type: yesno
    sql: ${TABLE}._DATA_DATE = ${TABLE}._LATEST_DATE ;;
  }
}
