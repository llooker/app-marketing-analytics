include: "ad_metrics_period_comparison_base.view"
include: "google_ad_metrics_base.view"
include: "customer.view"
include: "date_base.view"

explore: account_fact_base {
  hidden: yes
  extension: required
  view_name: fact
  join: customer {
    view_label: "Customer"
    sql_on: ${fact.external_customer_id} = ${customer.external_customer_id} AND
      ${fact.date_date} = ${customer.date_date} ;;
    relationship: many_to_one
  }
}

view: account_fact_base {
  extends: [google_ad_metrics_base]
  extension: required

  dimension: external_customer_id {}
  dimension: key_base {
    sql: CAST(${external_customer_id} as STRING) ;;
  }
  dimension: primary_key {
    primary_key: yes
    sql: ${key_base} ;;
  }
}

explore: account_fact_this_timeframe {
  from: account_fact_this_timeframe
  view_name: fact
  always_filter: {
    filters: {
      field: fact.this_timeframe
    }
    filters: {
      field: last_fact.last_timeframe
    }
  }
  join: last_fact {
    from: account_fact_last_timeframe
    sql_on: ${fact.external_customer_id} = ${last_fact.external_customer_id} ;;
    relationship: one_to_one
    fields: [last_fact.last_timeframe, last_fact.google_ad_metrics_set*]
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${fact.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} ;;
    relationship: many_to_one
  }
}

view: account_fact_this_timeframe {
  extends: [ad_metrics_period_comparison_base, account_fact_base]

  derived_table: {
    explore_source: ad_impressions {
      column: external_customer_id {}
      column: averageposition {field: ad_impressions.weighted_average_position}
      column: clicks {field: ad_impressions.total_clicks }
      column: conversions {field: ad_impressions.total_conversions}
      column: conversionvalue {field: ad_impressions.total_conversionvalue}
      column: cost {field: ad_impressions.total_cost}
      column: impressions { field: ad_impressions.total_impressions}
      column: interactions {field: ad_impressions.total_interactions}
      bind_filters: {
        to_field: ad_impressions.date_date
        from_field: fact.this_timeframe
      }
    }
  }

  parameter: this_timeframe {
    type: string
    allowed_value: {
      value: "this quarter"
      label: "Quarter"
    }
    allowed_value: {
      value: "this week"
      label: "Week"
    }
    allowed_value: {
      value: "this month"
      label: "Month"
    }
    default_value: "this quarter"
  }

  measure: total_conversions {
    link: {
      label: "By Campaign"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=campaign.campaign_name,ad_impressions.total_conversions&f[ad_impressions.date_date]=this quarter"
    }
  }

  measure: total_cost {
    link: {
      label: "By Campaign"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=campaign.campaign_name,ad_impressions.total_cost&f[ad_impressions.date_date]=this quarter"
    }
  }

  measure: average_conversion_rate {
    link: {
      label: "By Campaign"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=campaign.campaign_name,ad_impressions.average_conversion_rate&f[ad_impressions.date_date]=this quarter"
    }
  }

  measure: average_click_rate {
    link: {
      label: "By Keyword"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=keyword.criteria,ad_impressions.average_click_rate&f[ad_impressions.date_date]=this quarter"
    }
  }

  measure: average_cost_per_click {
    link: {
      label: "By Keyword"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=keyword.criteria,ad_impressions.average_click_rate&f[ad_impressions.date_date]=this quarter"
    }
  }

  measure: average_cost_per_conversion {
    link: {
      label: "By Campaign"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=campaign.campaign_name,ad_impressions.average_cost_per_conversion&f[ad_impressions.date_date]=this quarter"
    }
  }
}

view: account_fact_last_timeframe {
  extends: [account_fact_base]

  derived_table: {
    explore_source: ad_impressions {
      column: external_customer_id {}
      column: averageposition {field: ad_impressions.weighted_average_position}
      column: clicks {field: ad_impressions.total_clicks }
      column: conversions {field: ad_impressions.total_conversions}
      column: conversionvalue {field: ad_impressions.total_conversionvalue}
      column: cost {field: ad_impressions.total_cost}
      column: impressions { field: ad_impressions.total_impressions}
      column: interactions {field: ad_impressions.total_interactions}
      bind_filters: {
        to_field: ad_impressions.period
        from_field: last_fact.last_timeframe
      }
      bind_filters: {
        to_field: ad_impressions.date_date
        from_field: last_fact.last_timeframe
      }
      filters: {
        field: ad_impressions.less_than_current_day_of_period
        value: "Yes"
      }
    }
  }

  parameter: last_timeframe {
    type: string
    allowed_value: {
      value: "1 quarter ago"
      label: "Quarter"
    }
    allowed_value: {
      value: "1 week ago"
      label: "Week"
    }
    allowed_value: {
      value: "1 month ago"
      label: "Month"
    }
    default_value: "1 quarter ago"
  }
}

explore: account_date_fact {
  extends: [account_fact_base]
  from: account_date_fact
}

view: account_date_fact {
  extends: [account_fact_base, date_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
#     partition_keys: ["_date"]
    explore_source: ad_impressions {
      column: _date { field: ad_impressions.date_date }
      column: external_customer_id {}
      column: averageposition {field: ad_impressions.weighted_average_position}
      column: clicks {field: ad_impressions.total_clicks }
      column: conversions {field: ad_impressions.total_conversions}
      column: conversionvalue {field: ad_impressions.total_conversionvalue}
      column: cost {field: ad_impressions.total_cost}
      column: impressions { field: ad_impressions.total_impressions}
      column: interactions {field: ad_impressions.total_interactions}
    }
  }

  dimension: _date {
    hidden: yes
    sql: TIMESTAMP(${TABLE}._date) ;;
  }
  dimension: primary_key {
    primary_key: yes
    sql: concat(${_date}, ${key_base}) ;;
  }
}

explore: account_date_this_fact {
  extends: [account_fact_base]
  from: account_date_this_fact
  label: "Account Fact"
  view_label: "Account Fact"
  always_filter: {
    filters: {
      field: fact.this_timeframe
    }
    filters: {
      field: last_fact.last_timeframe
    }
  }
  join: last_fact {
    from: account_fact_last_timeframe
    sql_on: ${fact.external_customer_id} = ${last_fact.external_customer_id} ;;
    relationship: one_to_one
    fields: [last_fact.last_timeframe, last_fact.google_ad_metrics_set*]
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${fact.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} ;;
    relationship: many_to_one
  }
}

view: account_date_this_fact {
  extends: [account_fact_base]

  derived_table: {
    explore_source: account_date_fact {
      column: external_customer_id {field: fact.external_customer_id}
      column: averageposition {field: fact.weighted_average_position}
      column: clicks {field: fact.total_clicks }
      column: conversions {field: fact.total_conversions}
      column: conversionvalue {field: fact.total_conversionvalue}
      column: cost {field: fact.total_cost}
      column: impressions { field: fact.total_impressions}
      column: interactions {field: fact.total_interactions}
      bind_filters: {
        to_field: fact.date_date
        from_field: fact.this_timeframe
      }
    }
  }

  parameter: this_timeframe {
    type: string
    allowed_value: {
      value: "this quarter"
      label: "Quarter"
    }
    allowed_value: {
      value: "this week"
      label: "Week"
    }
    allowed_value: {
      value: "this month"
      label: "Month"
    }
    default_value: "this quarter"
  }
}

view: account_date_last_fact {
  extends: [account_fact_base]

  derived_table: {
    explore_source: account_date_fact {
      column: external_customer_id {field: fact.external_customer_id}
      column: averageposition {field: fact.weighted_average_position}
      column: clicks {field: fact.total_clicks }
      column: conversions {field: fact.total_conversions}
      column: conversionvalue {field: fact.total_conversionvalue}
      column: cost {field: fact.total_cost}
      column: impressions { field: fact.total_impressions}
      column: interactions {field: fact.total_interactions}
      bind_filters: {
        to_field: fact.period
        from_field: last_fact.last_timeframe
      }
      bind_filters: {
        to_field: fact.date_date
        from_field: last_fact.last_timeframe
      }
      filters: {
        field: fact.less_than_current_day_of_period
        value: "Yes"
      }
    }
  }

  parameter: last_timeframe {
    type: string
    allowed_value: {
      value: "1 quarter ago"
      label: "Quarter"
    }
    allowed_value: {
      value: "1 week ago"
      label: "Week"
    }
    allowed_value: {
      value: "1 month ago"
      label: "Month"
    }
    default_value: "1 quarter ago"
  }

}



explore: account_week_fact {
  extends: [account_fact_base]
  from: account_week_fact
  label: "Account Week Fact"
  view_label: "Account Week Fact"

  join: last_fact {
    from: account_week_fact
    view_label: "Last Week Account Fact"
    sql_on: ${fact.external_customer_id} = ${last_fact.external_customer_id} AND
      ${fact.date_last_week} = ${last_fact.date_week} AND
      ${fact.less_than_current_day_of_week} = ${last_fact.less_than_current_day_of_week} AND
      ${last_fact.less_than_current_day_of_week} = "Yes" ;;
    relationship: one_to_one
    fields: [last_fact.google_ad_metrics_set*]
  }
}

# add last 7 days?
view: account_week_fact {
  extends: [account_fact_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: ad_impressions {
      column: date_week { field: ad_impressions.date_week }
      column: less_than_current_day_of_week { field: ad_impressions.less_than_current_day_of_week }
      column: external_customer_id {}
      column: averageposition {field: ad_impressions.weighted_average_position}
      column: clicks {field: ad_impressions.total_clicks }
      column: conversions {field: ad_impressions.total_conversions}
      column: conversionvalue {field: ad_impressions.total_conversionvalue}
      column: cost {field: ad_impressions.total_cost}
      column: impressions { field: ad_impressions.total_impressions}
      column: interactions {field: ad_impressions.total_interactions}
    }
  }
  dimension: date_week {
    type: date
    allow_fill: no
    sql: TIMESTAMP(${TABLE}.date_week) ;;
  }
  dimension: date_last_week {
    type: date
    sql: DATE_ADD(${date_week}, INTERVAL -1 WEEK) ;;
    allow_fill: no
  }
  dimension: date_date {
    sql: ${date_week} ;;
  }
  dimension: less_than_current_day_of_week {}
  dimension: week_base {
    sql: concat(${date_week}, ${less_than_current_day_of_week}) ;;
  }
  dimension: primary_key {
    primary_key: yes
    sql: concat(${week_base}, ${key_base}) ;;
  }
}

explore: account_month_fact {
  extends: [account_fact_base]
  from: account_month_fact
  label: "Account Month Fact"
  view_label: "Account Month Fact"

  join: last_fact {
    from: account_month_fact
    view_label: "Last Month Account Fact"
    sql_on: ${fact.external_customer_id} = ${last_fact.external_customer_id} AND
      ${fact.date_last_month} = ${last_fact.date_month} AND
      ${fact.less_than_current_day_of_month} = ${last_fact.less_than_current_day_of_month} AND
      ${last_fact.less_than_current_day_of_month} = "Yes" ;;
    relationship: one_to_one
    fields: [last_fact.google_ad_metrics_set*]
  }
}

view: account_month_fact {
  extends: [account_fact_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: ad_impressions {
      column: date_month { field: ad_impressions.date_month_date }
      column: less_than_current_day_of_month { field: ad_impressions.less_than_current_day_of_month }
      column: external_customer_id {}
      column: averageposition {field: ad_impressions.weighted_average_position}
      column: clicks {field: ad_impressions.total_clicks }
      column: conversions {field: ad_impressions.total_conversions}
      column: conversionvalue {field: ad_impressions.total_conversionvalue}
      column: cost {field: ad_impressions.total_cost}
      column: impressions { field: ad_impressions.total_impressions}
      column: interactions {field: ad_impressions.total_interactions}
    }
  }
  dimension: date_month {
    type: date
    allow_fill: no
    sql: TIMESTAMP(${TABLE}.date_month) ;;
  }
  dimension: date_last_month {
    type: date
    sql: DATE_ADD(${date_month}, INTERVAL -1 MONTH) ;;
    allow_fill: no
  }
  dimension: date_date {
    sql: ${date_month} ;;
  }
  dimension: less_than_current_day_of_month {}
  dimension: month_base {
    sql: concat(${date_month}, ${less_than_current_day_of_month}) ;;
  }
  dimension: primary_key {
    primary_key: yes
    sql: concat(${month_base}, ${key_base}) ;;
  }
}

explore: account_quarter_fact {
  extends: [account_fact_base]
  from: account_quarter_fact
  label: "Account Quarter Fact"
  view_label: "Account Quarter Fact"

  join: last_fact {
    from: account_quarter_fact
    view_label: "Last Quarter Account Fact"
    sql_on: ${fact.external_customer_id} = ${last_fact.external_customer_id} AND
      ${fact.date_last_quarter} = ${last_fact.date_quarter} AND
      ${fact.less_than_current_day_of_quarter} = ${last_fact.less_than_current_day_of_quarter} AND
      ${last_fact.less_than_current_day_of_quarter} ;;
    relationship: one_to_one
    fields: [last_fact.google_ad_metrics_set*]
  }
}

view: account_quarter_fact {
  extends: [account_fact_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: ad_impressions {
      column: date_quarter { field: ad_impressions.date_quarter_date }
      column: less_than_current_day_of_quarter { field: ad_impressions.less_than_current_day_of_quarter }
      column: external_customer_id {}
      column: averageposition {field: ad_impressions.weighted_average_position}
      column: clicks {field: ad_impressions.total_clicks }
      column: conversions {field: ad_impressions.total_conversions}
      column: conversionvalue {field: ad_impressions.total_conversionvalue}
      column: cost {field: ad_impressions.total_cost}
      column: impressions { field: ad_impressions.total_impressions}
      column: interactions {field: ad_impressions.total_interactions}
    }
  }
  dimension: date_quarter {
    type: date
    allow_fill: no
    sql: TIMESTAMP(${TABLE}.date_quarter) ;;
  }
  dimension: date_last_quarter {
    type: date
    sql: DATE_ADD(${date_quarter}, INTERVAL -1 QUARTER) ;;
    allow_fill: no
  }
  dimension: date_date {
    sql: ${date_quarter} ;;
  }
  dimension: less_than_current_day_of_quarter {}
  dimension: quarter_base {
    sql: concat(${date_quarter}, ${less_than_current_day_of_quarter}) ;;
  }
  dimension: primary_key {
    primary_key: yes
    sql: concat(${quarter_base}, ${key_base}) ;;
  }
}

explore: account_period_fact {
  extends: [account_fact_base]
  from: account_period_fact
  view_name: fact
  label: "Account Period Fact"
  view_label: "Account Period Fact"

  always_filter: {
    filters: {
      field: fact.period
    }
    filters: {
      field: fact.less_than_current_day_of_period
      value: "Yes"
    }
  }

  join: last_fact {
    from: account_period_fact
    view_label: "Last Quarter Account Fact"
    sql_on: ${fact.external_customer_id} = ${last_fact.external_customer_id} AND
      ${fact.date_last_period} = ${last_fact.date_period} AND
      ${fact.less_than_current_day_of_period} = ${last_fact.less_than_current_day_of_period} ;;
    relationship: one_to_one
    fields: [last_fact.google_ad_metrics_set*]
  }
}

view: account_period_fact {
  extends: [account_fact_base, ad_metrics_period_comparison_base]

  sql_table_name: {% if fact.period_passthrough._sql == "week" %}${account_week_fact.SQL_TABLE_NAME}
    {% elsif fact.period_passthrough._sql == "month" %}${account_month_fact.SQL_TABLE_NAME}
    {% elsif fact.period_passthrough._sql == "quarter" %}${account_quarter_fact.SQL_TABLE_NAME}
    {% endif %} ;;

  parameter: period {
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

  dimension: period_passthrough {
    hidden: yes
    sql: {% parameter period %};;
  }

  dimension: date_period {
    type: date
    allow_fill: no
    sql: TIMESTAMP(${TABLE}.date_{% if fact.period_passthrough._sql == "week" %}week{% elsif fact.period_passthrough._sql == "month" %}month{% elsif fact.period_passthrough._sql == "quarter" %}quarter{% endif %}) ;;
  }
  dimension: date_date {
    sql: ${date_period} ;;
  }
  dimension: less_than_current_day_of_period {
    sql: ${TABLE}.less_than_current_day_of_{% if fact.period_passthrough._sql == "week" %}week{% elsif fact.period_passthrough._sql == "month" %}month{% elsif fact.period_passthrough._sql == "quarter" %}quarter{% endif %} ;;
  }
  dimension: date_last_period {
    type: date
    allow_fill: no
    sql: DATE_ADD(${date_period}, INTERVAL -1 {% if fact.period_passthrough._sql == "week" %}week{% elsif fact.period_passthrough._sql == "month" %}month{% elsif fact.period_passthrough._sql == "quarter" %}quarter{% endif %}) ;;
  }
  dimension: primary_key {
    primary_key: yes
    sql: concat(${date_period}, ${less_than_current_day_of_period}, ${key_base}) ;;
  }
}
