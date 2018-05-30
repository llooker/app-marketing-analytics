include: "/ama_adwords_adapter/customer.view"

include: "ad_metrics_period_comparison_base.view"
include: "google_ad_metrics_base.view"
include: "date_base.view"
include: "period_base.view"

explore: account_date_fact {
  persist_with: adwords_etl_datagroup
  hidden: yes
  from: account_date_fact
  view_name: fact
  label: "Account This Period"
  view_label: "Account This Period"
  join: last_fact {
    from: account_date_fact
    view_label: "Account Prior Period"
    sql_on: ${fact.external_customer_id} = ${last_fact.external_customer_id} AND
      ${fact.date_last_period} = ${last_fact.date_period} AND
      ${fact.date_day_of_period} = ${last_fact.date_day_of_period} ;;
    relationship: one_to_one
  }
  join: customer {
    from: customer_adapter
    view_label: "Customer"
    sql_on: ${fact.external_customer_id} = ${customer.external_customer_id} AND
      ${fact._date} = ${customer._date} ;;
    relationship: many_to_one
  }
}

view: account_key_base {
  extends: [date_primary_key_base]
  extension: required

  dimension: account_key_base {
    hidden: yes
    sql: CAST(${external_customer_id} AS STRING) ;;
  }
  dimension: key_base {
    hidden: yes
    sql: ${account_key_base} ;;
  }
}

view: account_date_fact {
  extends: [date_base, period_base, google_ad_metrics_base, ad_metrics_period_comparison_base, account_key_base]

  derived_table: {
    datagroup_trigger: adwords_etl_datagroup
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
  dimension: _date {
    hidden: yes
    type: date_raw
  }
  set: detail {
    fields: [external_customer_id]
  }
}
