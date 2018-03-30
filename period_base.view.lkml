view: period_base {
  extension: required

  parameter: period {
    description: "Period for Comparison"
    type: unquoted
    allowed_value: {
      value: "day"
      label: "Day"
    }
    allowed_value: {
      value: "week"
      label: "Week"
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
    default_value: "quarter"
  }
  dimension: period_passthrough {
    hidden: yes
    sql: {% parameter period %};;
  }
  dimension: date_period {
    type: date
    group_label: "Event"
    sql: {% if fact.period_passthrough._sql contains "day" %}${date_date}
      {% elsif fact.period_passthrough._sql contains "week" %}${date_week}
      {% elsif fact.period_passthrough._sql contains "month" %}${date_month_date}
      {% elsif fact.period_passthrough._sql contains "quarter" %}${date_quarter_date}
      {% elsif fact.period_passthrough._sql contains "year" %}${date_year_date}
      {% endif %} ;;
    allow_fill: no
  }
  dimension: date_period_dynamic_grain {
    type: date
    group_label: "Event"
    label: "{% if fact.period_passthrough._sql contains 'year' or
    fact.period_passthrough._sql contains 'quarter' %}Week{% elsif fact.period_passthrough._sql contains 'month'
    or fact.period_passthrough._sql contains 'week'
    or fact.period_passthrough._sql contains 'day' %}Date{% endif %}"
    sql: {% if fact.period_passthrough._sql contains "year"
        or fact.period_passthrough._sql contains "quarter" %}${date_week}
      {% elsif fact.period_passthrough._sql contains "month"
        or fact.period_passthrough._sql contains "week"
        or fact.period_passthrough._sql contains "day" %}${date_date}
      {% endif %} ;;
    allow_fill: no
  }
  dimension: date_day_of_period {
    type: number
    group_label: "Event"
    sql: {% if fact.period_passthrough._sql contains "day" %}1
      {% elsif fact.period_passthrough._sql contains "week" %}${date_day_of_week_index}
      {% elsif fact.period_passthrough._sql contains "month" %}${date_day_of_month}
      {% elsif fact.period_passthrough._sql contains "quarter" %}${date_day_of_quarter}
      {% elsif fact.period_passthrough._sql contains "year" %}${date_day_of_year}
      {% endif %} ;;
  }
  dimension: date_last_period {
    type: date
    sql: DATE_ADD(${date_period}, INTERVAL -1 {% if fact.period_passthrough._sql contains "day" %}day{% elsif fact.period_passthrough._sql contains "week" %}week{% elsif fact.period_passthrough._sql contains "month" %}month{% elsif fact.period_passthrough._sql contains "quarter" %}quarter{% elsif fact.period_passthrough._sql contains "year" %}year{% endif %}) ;;
    allow_fill: no
  }
  dimension: less_than_current_day_of_period {
    sql: {% if fact.period_passthrough._sql contains "week" %}1
      {% elsif fact.period_passthrough._sql contains "week" %}${less_than_current_day_of_week}
      {% elsif fact.period_passthrough._sql contains "month" %}${less_than_current_day_of_month}
      {% elsif fact.period_passthrough._sql contains "quarter" %}${less_than_current_day_of_quarter}
      {% elsif fact.period_passthrough._sql contains "quarter" %}${less_than_current_day_of_year}
      {% endif %} ;;
  }
}
