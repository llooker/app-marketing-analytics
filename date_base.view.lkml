view: date_base {
  extension: required

  dimension_group: date {
    group_label: "Event"
    label: ""
    type: time
    datatype: timestamp
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      day_of_month,
      day_of_year
    ]
    convert_tz: no
    sql: ${_date} ;;
  }

  dimension: date_month_date {
    group_label: "Event"
    label: "Month Date"
    hidden: yes
    type: date
    sql: DATE_TRUNC(${date_date}, MONTH) ;;
  }

  dimension: date_quarter_date {
    group_label: "Event"
    label: "Quarter Date"
    hidden: yes
    type: date
    sql: DATE_TRUNC(${date_date}, QUARTER) ;;
  }

  dimension: date_day_of_quarter {
    group_label: "Event"
    label: "Day of Quarter"
    hidden: yes
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
    hidden: yes
    type: yesno
    sql: ${date_day_of_quarter} <= ${current_day_of_quarter} ;;
  }

  dimension: less_than_current_day_of_month {
    hidden:  yes
    type: yesno
    sql: ${date_day_of_month} <= ${current_day_of_month} ;;
  }

  dimension: less_than_current_day_of_week {
    hidden:  yes
    type: yesno
    sql: ${date_day_of_week_index} <= ${current_day_of_week} ;;
  }

  dimension: less_than_current_day_of_period {
    hidden:  yes
    type: yesno
    sql: {% if period_passthrough._sql == "'1 week ago'" %} ${less_than_current_day_of_week}
    {% elsif period_passthrough._sql == "'1 month ago'" %} ${less_than_current_day_of_month}
    {% elsif period_passthrough._sql == "'1 quarter ago'" %} ${less_than_current_day_of_quarter}
    {% endif %} ;;
  }

  parameter: period {
    hidden: yes
  }

  dimension: period_passthrough {
    hidden: yes
    sql: {% parameter period %};;
  }

  dimension: date_last_week {
    group_label: "Event"
    label: "Last Week"
    hidden: yes
    type: date
    sql: DATE_ADD(${date_date}), INTERVAL -1 WEEK) ;;
  }

  dimension: date_last_month {
    group_label: "Event"
    label: "Last Month"
    hidden: yes
    type: date
    sql: DATE_ADD(${date_date}), INTERVAL -1 MONTH) ;;
  }

  dimension: date_last_quarter {
    group_label: "Event"
    label: "Last Quarter"
    hidden: yes
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
}
