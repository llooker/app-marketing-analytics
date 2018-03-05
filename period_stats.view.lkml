include: "dated_table.view"
include: "stats.view"
include: "account_date_stats.view"
include: "account_week_stats.view"
include: "account_month_stats.view"
include: "account_quarter_stats.view"

explore: period_stats {
  persist_with: etl_datagroup
  label: "Account Period Stats"
  view_label: "Account Period Stats"

  join: last_period_stats {
    from: period_stats
    view_label: "Last Period Account Stats"
    sql_on: ${period_stats.external_customer_id} = ${last_period_stats.external_customer_id} AND
      ${period_stats.date_last_period} = ${last_period_stats.date_period} AND
      ${period_stats.less_than_current_day_of_period} = ${period_stats.less_than_current_day_of_period} AND
      ${period_stats.less_than_current_day_of_period} = "Yes" ;;
    relationship: one_to_one
  }
  join:  customer {
    view_label: "Customer"
    sql_on: ${period_stats.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} = "Yes" ;;
    relationship: many_to_one
  }
}

view: period_stats {
  extends: [stats]

  parameter: period {
    description: "Aggregation Period"
    type: unquoted
    allowed_value: {
      value: "quarter"
      label: "Quarter"
    }
    allowed_value: {
      value: "week"
      label: "Week"
    }
    allowed_value: {
      value: "month"
      label: "Month"
    }
    default_value: "quarter"
  }

  sql_table_name:
    {% if period._parameter_value == "week" %}${account_week_stats.SQL_TABLE_NAME}
    {% elsif period._parameter_value == "month" %}${account_month_stats.SQL_TABLE_NAME}
    {% elsif period._parameter_value == "quarter" %}${account_quarter_stats.SQL_TABLE_NAME}
    {% endif %} ;;

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
  dimension: date_quarter {
    type: date
    allow_fill: no
  }
  dimension: date_last_quarter {
    type: date
    sql: DATE_ADD(${date_quarter}, INTERVAL -1 QUARTER) ;;
    allow_fill: no
  }
  dimension: less_than_current_day_of_quarter {
    type: yesno
  }
  dimension: date_period {
    type: date
    sql:
      {% if period._parameter_value == "week" %}${date_week}
      {% elsif period._parameter_value == "month" %}${date_month}
      {% elsif period._parameter_value == "quarter" %}${date_quarter}
      {% endif %} ;;
    allow_fill: no
  }
  dimension: date_last_period {
    type: date
    sql:
      {% if period._parameter_value == "week" %}${date_last_week}
      {% elsif period._parameter_value == "month" %}${date_last_month}
      {% elsif period._parameter_value == "quarter" %}${date_last_quarter}
      {% endif %} ;;
    allow_fill: no
  }
  dimension: less_than_current_day_of_period {
    type: yesno
    sql:
      {% if period._parameter_value == "week" %}${less_than_current_day_of_week}
      {% elsif period._parameter_value == "month" %}${less_than_current_day_of_month}
      {% elsif period._parameter_value == "quarter" %}${less_than_current_day_of_quarter}
      {% endif %};;
  }
}
