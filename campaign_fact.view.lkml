include: "ad_metrics_parent_comparison_base.view"
include: "ad_metrics_period_comparison_base.view"
include: "account_fact.view"
include: "campaign.view"
include: "recent_changes.view"

explore: campaign_date_fact {
  extends: [account_date_fact]
  from: campaign_date_fact
  view_name: fact
  label: "Campaign This Period"
  view_label: "Campaign This Period"
  join: last_fact {
    from: campaign_date_fact
    view_label: "Campaign Prior Period"
    sql_on: ${fact.external_customer_id} = ${last_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_fact.campaign_id} AND
      ${fact.date_last_period} = ${last_fact.date_period} AND
      ${fact.date_day_of_period} = ${last_fact.date_day_of_period} ;;
  }
  join: parent_fact {
    view_label: "Customer This Period"
    from: account_date_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.date_date} = ${parent_fact.date_date};;
    relationship: many_to_one
    fields: [parent_fact.google_ad_metrics_set*]
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${fact.campaign_id} = ${campaign.campaign_id} AND
      ${fact.external_customer_id} = ${campaign.external_customer_id} AND
      ${fact.date_date} = ${campaign.date_date} ;;
    relationship: many_to_one
  }
  join: status_changes {
    sql_on: ${fact.campaign_id} = ${status_changes.campaign_id} AND
      ${fact.external_customer_id} = ${status_changes.external_customer_id}
      ${fact.date_date} = ${status_changes.date_date};;
    relationship: one_to_many
  }
}

view: campaign_date_fact {
  extends: [account_date_fact, ad_metrics_parent_comparison_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: ad_impressions {
      column: campaign_id {field: fact.campaign_id}
    }
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
