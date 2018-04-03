view: period_base {
  extension: required

  filter: date_range {
    hidden: yes
    type: date
    convert_tz: no
    sql: ${in_date_range} ;;
  }

  dimension: date_start_date_range {
    type: date_raw
    sql: {% date_start date_range %} ;;
  }

  dimension: date_end_date_range {
    type: date_raw
    sql: {% date_end date_range %} ;;
  }

  dimension: date_range_difference {
    hidden: yes
    type: number
    sql:  ;;
#     expression: diff_days(${date_start_date_range}, ${date_end_date_range}) ;;
  }

  dimension: in_date_range {
    hidden: yes
    type: yesno
    sql: {% condition date_range %}CAST(${fact.date_raw} AS TIMESTAMP){% endcondition %} ;;
  }

  parameter: period {
    description: "Prior Period for Comparison"
    type: unquoted
    allowed_value: {
      value: "day"
      label: "Day"
    }
    allowed_value: {
      value: "week"
      label: "Week (Mon - Sun)"
    }
    allowed_value: {
      value: "month"
      label: "Month"
    }
    allowed_value: {
      value: "quarter"
      label: "Quarter"
    }
    allowed_value: {
      value: "year"
      label: "Year"
    }
    allowed_value: {
      value: "7_day"
      label: "Last 7 Days"
    }
    allowed_value: {
      value: "28_day"
      label: "Last 28 Days"
    }
    allowed_value: {
      value: "91_day"
      label: "Last 91 Days"
    }
    allowed_value: {
      value: "364_day"
      label: "Last 364 Days"
    }
    default_value: "28_day"
  }
  dimension: date_period {
    type: date
    label_from_parameter: period
    group_label: "Event"
    sql: {% if fact.period._parameter_value contains "day" %}
        {% if fact.period._parameter_value == "7_day" %}${date_date_7_days_prior}
        {% elsif fact.period._parameter_value == "28_day" %}${date_date_28_days_prior}
        {% elsif fact.period._parameter_value == "91_day" %}${date_date_91_days_prior}
        {% elsif fact.period._parameter_value == "364_day" %}${date_date_364_days_prior}
        {% else %}${date_date}
        {% endif %}
      {% elsif fact.period._parameter_value contains "week" %}${date_week}
      {% elsif fact.period._parameter_value contains "month" %}${date_month_date}
      {% elsif fact.period._parameter_value contains "quarter" %}${date_quarter_date}
      {% elsif fact.period._parameter_value contains "year" %}${date_year_date}
      {% endif %} ;;
    allow_fill: no
  }
  dimension: date_end_of_period {
    type: date
    label_from_parameter: period
    group_label: "Event"
    sql: {% if fact.period._parameter_value contains "day" %}
        {% if fact.period._parameter_value == "7_day" %}DATE_ADD(${date_date_7_days_prior}, INTERVAL 7 DAY)
        {% elsif fact.period._parameter_value == "28_day" %}DATE_ADD(${date_date_28_days_prior}, INTERVAL 28 DAY)
        {% elsif fact.period._parameter_value == "91_day" %}DATE_ADD(${date_date_91_days_prior}, INTERVAL 91 DAY)
        {% elsif fact.period._parameter_value == "364_day" %}DATE_ADD(${date_date_364_days_prior}, INTERVAL 364 DAY)
        {% else %}${date_date}
        {% endif %}
      {% elsif fact.period._parameter_value contains "week" %}DATE_ADD(${date_week_date}, INTERVAL 1 WEEK)
      {% elsif fact.period._parameter_value contains "month" %}DATE_ADD(${date_month_date}, INTERVAL 1 MONTH)
      {% elsif fact.period._parameter_value contains "quarter" %}DATE_ADD(${date_quarter_date}, INTERVAL 1 QUARTER)
      {% elsif fact.period._parameter_value contains "year" %}DATE_ADD(${date_year_date}, INTERVAL 1 YEAR)
      {% endif %} ;;
    allow_fill: no
  }
  dimension: date_period_dynamic_grain {
    hidden: yes
    type: date
    group_label: "Event"
    label: "{% if fact.period._parameter_value contains 'year' or
    fact.period._parameter_value contains 'quarter' %}Week{% elsif fact.period._parameter_value contains 'month'
    or fact.period._parameter_value contains 'week'
    or fact.period._parameter_value contains 'day' %}Date{% endif %}"
    sql: {% if fact.period._parameter_value contains "year"
        or fact.period._parameter_value contains "quarter"
        or fact.period._parameter_value == "364_day"
        or fact.period._parameter_value == "91_day"%}${date_week}
      {% else %}${date_date}
      {% endif %} ;;
    allow_fill: no
  }
  dimension: date_day_of_period {
    hidden: yes
    type: number
    label: "{% if fact.period._parameter_value contains 'day' %}Day of Period
    {% elsif fact.period._parameter_value contains 'week' %}Day of Week
    {% elsif fact.period._parameter_value contains 'month' %}Day of Month
    {% elsif fact.period._parameter_value contains 'quarter' %}Day of Quarter
    {% elsif fact.period._parameter_value contains 'year' %}Day of Year
    {% endif %}"
    group_label: "Event"
    sql: {% if fact.period._parameter_value contains "day" %}
        {% if fact.period._parameter_value == "7_day" %}${date_day_of_7_days_prior}
        {% elsif fact.period._parameter_value == "28_day" %}${date_day_of_28_days_prior}
        {% elsif fact.period._parameter_value == "91_day" %}${date_day_of_91_days_prior}
        {% elsif fact.period._parameter_value == "364_day" %}${date_day_of_364_days_prior}
        {% else %}0
        {% endif %}
      {% elsif fact.period._parameter_value contains "week" %}${date_day_of_week_index}
      {% elsif fact.period._parameter_value contains "month" %}${date_day_of_month}
      {% elsif fact.period._parameter_value contains "quarter" %}${date_day_of_quarter}
      {% elsif fact.period._parameter_value contains "year" %}${date_day_of_year}
      {% endif %} ;;
  }
  dimension: date_last_period {
    group_label: "Event"
    label: "Prior Period"
    type: date
    sql: DATE_ADD(${date_period}, INTERVAL -{% if fact.period._parameter_value == "7_day" %}7{% elsif fact.period._parameter_value == "28_day" %}28{% elsif fact.period._parameter_value == "91_day" %}91{% elsif fact.period._parameter_value == "364_day" %}364{% else %}1{% endif %} {% if fact.period._parameter_value contains "day" %}day{% elsif fact.period._parameter_value contains "week" %}week{% elsif fact.period._parameter_value contains "month" %}month{% elsif fact.period._parameter_value contains "quarter" %}quarter{% elsif fact.period._parameter_value contains "year" %}year{% endif %}) ;;
    allow_fill: no
  }
  dimension: less_than_current_day_of_period {
    sql: {% if fact.period._parameter_value contains "day" %}1=1 --always less than day current day of period
      {% elsif fact.period._parameter_value contains "week" %}${less_than_current_day_of_week}
      {% elsif fact.period._parameter_value contains "month" %}${less_than_current_day_of_month}
      {% elsif fact.period._parameter_value contains "quarter" %}${less_than_current_day_of_quarter}
      {% elsif fact.period._parameter_value contains "year" %}${less_than_current_day_of_year}
      {% endif %} ;;
  }
}
