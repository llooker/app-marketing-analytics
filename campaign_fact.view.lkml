include: "ad_metrics_parent_comparison_base.view"
include: "ad_metrics_period_comparison_base.view"
include: "account_fact.view"
include: "campaign.view"


explore: campaign_date_fact {
  hidden: yes
  from: campaign_date_fact
  view_name: fact
  label: "Campaign Date Fact"
  view_label: "Campaign Date Fact"
  join: last_fact {
    from: campaign_date_fact
    view_label: "Last Period Campaign Fact"
    sql_on: ${fact.external_customer_id} = ${last_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_fact.campaign_id} AND
      ${fact.date_last_period} = ${last_fact.date_period} AND
      ${fact.date_day_of_period} = ${last_fact.date_day_of_period} ;;
    relationship: one_to_one
    fields: [last_fact.google_ad_metrics_set*]
  }
  join: parent_fact {
    view_label: "Customer This Period"
    from: account_date_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.date_date} = ${parent_fact.date_date};;
    relationship: many_to_one
    fields: [parent_fact.google_ad_metrics_set*]
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${fact.external_customer_id} = ${customer.external_customer_id} AND
      ${fact.date_date} = ${customer.date_date} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${fact.campaign_id} = ${campaign.campaign_id} AND
      ${fact.external_customer_id} = ${campaign.external_customer_id} AND
      ${fact.date_date} = ${campaign.date_date} ;;
    relationship: many_to_one
  }
}

view: campaign_date_fact {
  extends: [ad_metrics_parent_comparison_base, date_base, period_base, google_ad_metrics_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: ad_impressions {
      column: _date { field: fact.date_date }
      column: campaign_id {field: fact.campaign_id}
      column: external_customer_id {field: fact.external_customer_id}
      column: averageposition {field: fact.weighted_average_position}
      column: clicks {field: fact.total_clicks }
      column: conversions {field: fact.total_conversions}
      column: conversionvalue {field: fact.total_conversionvalue}
      column: cost {field: fact.total_cost}
      column: impressions { field: fact.total_impressions}
      column: interactions {field: fact.total_interactions}
    }
  }
  dimension: _date {
    hidden: yes
    type: date_raw
  }
  dimension: external_customer_id {
    hidden: yes
  }
  dimension: campaign_id {
    hidden: yes
  }
  dimension: key_base {
    sql: CONCAT(
      CAST(${external_customer_id} AS STRING), "-",
      CAST(${campaign_id} AS STRING)) ;;
  }
  dimension: primary_key {
    primary_key: yes
    sql: ${key_base} ;;
  }
}
