include: "ad_group_fact.view"
include: "keyword.view"
include: "recent_changes.view"
include: "period_fact.view"

explore: keyword_date_fact {
  hidden: yes
  from: keyword_date_fact
  view_name: fact
  label: "Keyword This Period"
  view_label: "Keyword This Period"
  join: last_fact {
    from: keyword_date_fact
    view_label: "Keyword Prior Period"
    sql_on: ${fact.external_customer_id} = ${last_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_fact.ad_group_id} AND
      ${fact.criterion_id} = ${last_fact.criterion_id} AND
      ${fact.date_last_period} = ${last_fact.date_period} AND
      ${fact.date_day_of_period} = ${last_fact.date_day_of_period} ;;
    relationship: one_to_one
    fields: [last_fact.google_ad_metrics_set*, last_fact.ad_metrics_parent_comparison_measures_set*]
  }
  join: parent_fact {
    from: ad_group_date_fact
    view_label: "Ad Group Prior Period"
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.ad_group_id} = ${parent_fact.ad_group_id} AND
      ${fact.date_date} = ${parent_fact.date_date} ;;
    relationship: one_to_one
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
  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${fact.ad_group_id} = ${ad_group.ad_group_id} AND
      ${fact.campaign_id} = ${ad_group.campaign_id} AND
      ${fact.external_customer_id} = ${ad_group.external_customer_id} AND
      ${fact.date_date} = ${ad_group.date_date}  ;;
    relationship: many_to_one
  }
  join: keyword {
    view_label: "Keyword"
    sql_on: ${fact.criterion_id} = ${keyword.criterion_id} AND
      ${fact.ad_group_id} = ${keyword.ad_group_id} AND
      ${fact.campaign_id} = ${keyword.campaign_id} AND
      ${fact.external_customer_id} = ${keyword.external_customer_id} AND
      ${fact.date_date} = ${keyword.date_date}  ;;
    relationship: many_to_one
  }
  join: status_changes {
    view_label: "Keywords"
    sql_on: ${status_changes.criterion_id} = ${keyword.criterion_id} AND
      ${status_changes.ad_group_id} = ${keyword.ad_group_id} AND
      ${status_changes.campaign_id} = ${keyword.campaign_id} AND
      ${status_changes.external_customer_id} = ${keyword.external_customer_id} AND
      ${status_changes.date_date} = ${keyword.date_date}  ;;
    relationship: one_to_many
  }
  join: geo_us_state {
    fields: [state]
    sql_on: 1=1 ;;
    relationship: one_to_one
    type: inner
  }
}

view: keyword_date_fact {
  extends: [date_base, period_base, google_ad_metrics_base, ad_metrics_parent_comparison_base, ad_metrics_period_comparison_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: ad_impressions {
      column: _date { field: fact.date_date }
      column: criterion_id {field: fact.criterion_id}
      column: ad_group_id {field: fact.ad_group_id}
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

  dimension: external_customer_id {
    hidden: yes
  }
  dimension: campaign_id {
    hidden: yes
  }
  dimension: ad_group_id {
    hidden: yes
  }
  dimension: criterion_id {
    hidden: yes
  }
  dimension: key_base {
    sql: CONCAT(
      CAST(${external_customer_id} AS STRING), "-",
      CAST(${campaign_id} AS STRING), "-",
      CAST(${ad_group_id} AS STRING), "-",
      CAST(${criterion_id} AS STRING)) ;;
  }
  dimension: _date {
    hidden: yes
    type: date_raw
  }
  dimension: primary_key {
    primary_key: yes
    sql: concat(CAST(${_date} as STRING), ${key_base}) ;;
  }
  set: detail {
    fields: [external_customer_id, campaign_id, ad_group_id, criterion_id]
  }
}
