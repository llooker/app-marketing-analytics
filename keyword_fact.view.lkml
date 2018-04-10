include: "ad_group_fact.view"
include: "keyword.view"
include: "recent_changes.view"

explore: keyword_date_fact {
  extends: [ad_group_date_fact]
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
  join: status_changes {
    view_label: "Keywords"
    sql_on: ${fact.criterion_id} = ${status_changes.criterion_id} AND
      ${fact.ad_group_id} = ${status_changes.ad_group_id} AND
      ${fact.campaign_id} = ${status_changes.campaign_id} AND
      ${fact.external_customer_id} = ${status_changes.external_customer_id} AND
      ${fact.date_date} = ${status_changes.date_date}  ;;
    relationship: one_to_many
  }
}

view: keyword_date_fact {
  extends: [ad_group_date_fact]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: ad_impressions {
      column: criterion_id {field: fact.criterion_id}
    }
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
  dimension: primary_key {
    primary_key: yes
    sql: concat(CAST(${_date} as STRING), ${key_base}) ;;
  }
  set: detail {
    fields: [external_customer_id, campaign_id, ad_group_id, criterion_id]
  }
}
