include: "ad_metrics_period_comparison_base.view"
include: "google_ad_metrics_base.view"
include: "customer.view"
include: "date_base.view"
include: "period_base.view"

explore: account_date_fact {
  hidden: yes
  from: account_date_fact
  view_name: fact
  join: last_fact {
    from: account_date_fact
    view_label: "Last Period Account Fact"
    sql_on: ${fact.external_customer_id} = ${last_fact.external_customer_id} AND
      ${fact.date_last_period} = ${last_fact.date_period} AND
      ${fact.date_day_of_period} = ${last_fact.date_day_of_period} ;;
    relationship: one_to_one
    fields: [last_fact.google_ad_metrics_set*]
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${fact.external_customer_id} = ${customer.external_customer_id} AND
      ${fact.date_date} = ${customer.date_date} ;;
    relationship: many_to_one
  }
}

view: account_date_fact {
  extends: [date_base, period_base, google_ad_metrics_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
#     partition_keys: ["_date"]
    explore_source: ad_impressions {
      column: _date { field: fact.date_date }
      column: external_customer_id { field: fact.external_customer_id }
      column: averageposition {field: fact.weighted_average_position}
      column: clicks {field: fact.total_clicks }
      column: conversions {field: fact.total_conversions}
      column: conversionvalue {field: fact.total_conversionvalue}
      column: cost {field: fact.total_cost}
      column: impressions { field: fact.total_impressions}
      column: interactions {field: fact.total_interactions}
    }
  }
  dimension: external_customer_id {
    hidden: yes
  }
  dimension: key_base {
    sql: CAST(${external_customer_id} as STRING) ;;
  }
  dimension: _date {
    hidden: yes
    type: date_raw
  }
  dimension: primary_key {
    primary_key: yes
    sql: concat(CAST(${_date} as STRING), ${key_base}) ;;
  }
}
