connection: "bigquery-connectors-adwords"

# include all the views
include: "account_fact.view"
include: "ad.view"
include: "ad_group.view"
include: "ad_group_fact.view"
include: "audience.view"
include: "campaign.view"
include: "campaign_budget_date_fact.view"
include: "campaign_fact.view"
include: "customer.view"
include: "expected_conversions.view"
include: "keyword.view"
include: "kpis_last_period.view"
include: "kpis_this_period.view"
include: "ad_impressions.view"
include: "period_fact.view"
include: "report_single_values.view"
include: "recent_changes.view"

# include all the dashboards
include: "ad_group_performance.dashboard"
include: "adwords_overview.dashboard"
include: "campaign_metrics_conversion_rate.dashboard"
include: "campaign_metrics_conversions.dashboard"
include: "campaign_metrics_cpa.dashboard"
include: "campaign_metrics_cpc.dashboard"
include: "campaign_metrics_ctr.dashboard"
include: "campaign_metrics_spend.dashboard"
include: "choose_campaign.dashboard"

datagroup: etl_datagroup {
  sql_trigger: SELECT MAX(CONCAT(CAST(_DATA_DATE as STRING), format(" %02d", HourOfDay))) FROM adwords_v201609.HourlyAccountStats_6747157124 ;;
  max_cache_age: "24 hours"
}

explore: ad_impressions {
  persist_with: etl_datagroup
  label: "Ad Stats"
  view_label: "Ad Stats"

  join: keyword {
    view_label: "Keyword"
    sql_on: ${ad_impressions.unique_key} = ${keyword.unique_key} AND
      ${ad_impressions.date_date} = ${keyword.date_date} ;;
    relationship: many_to_one
  }
  join: audience {
    view_label: "Audience"
    sql_on: ${ad_impressions.unique_key} = ${audience.unique_key} AND
      ${ad_impressions.date_date} = ${audience.date_date} ;;
    relationship: many_to_one
  }
  join: ad {
    view_label: "Ads"
    sql_on: ${ad.creative_id} = ${ad_impressions.creative_id} AND
      ${ad_impressions.date_date} = ${ad.date_date} ;;
    relationship:  many_to_one
  }
  join: ad_group {
    view_label: "Ad Groups"
    sql_on: ${ad_impressions.ad_group_id} = ${ad_group.ad_group_id} AND
      ${ad_impressions.date_date} = ${ad_group.date_date} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaigns"
    sql_on: ${ad_impressions.campaign_id} = ${campaign.campaign_id} AND
      ${ad_impressions.date_date} = ${campaign.date_date};;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${ad_impressions.external_customer_id} = ${customer.external_customer_id} AND
      ${ad_impressions.date_date} = ${customer.date_date} ;;
    relationship: many_to_one
  }
  join: account_avg_cpa {
    view_label: "Account Average CPA"
    sql_on: ${ad_impressions.external_customer_id} = ${account_avg_cpa.external_customer_id} ;;
    relationship: one_to_one
  }
  join: campaign_avg_cpa {
    view_label: "Campaign Average CPA"
    sql_on: ${ad_impressions.external_customer_id} = ${campaign_avg_cpa.external_customer_id} AND
      ${ad_impressions.campaign_id} = ${campaign_avg_cpa.campaign_id};;
    relationship: one_to_one
  }
  join: ad_group_avg_cpa {
    view_label: "Ad Group Average CPA"
    sql_on: ${ad_impressions.external_customer_id} = ${ad_group_avg_cpa.external_customer_id} AND
      ${ad_impressions.campaign_id} = ${ad_group_avg_cpa.campaign_id} AND
      ${ad_impressions.ad_group_id} = ${ad_group_avg_cpa.ad_group_id};;
    relationship: one_to_one
  }
}

## Entity tables are daily snapshots
explore: customer {
  hidden: yes
}

explore: campaign {
  hidden: yes
  join: customer {
    view_label: "Customer"
    sql_on: ${campaign.external_customer_id} = ${customer.external_customer_id} AND
      ${campaign.date_date} = ${customer.date_date} ;;
    relationship:  many_to_one
  }
}

explore: ad_group {
  hidden: yes
  join: campaign {
    view_label: "Campaign"
    sql_on: ${ad_group.campaign_id} = ${campaign.campaign_id} AND
      ${ad_group.date_date} = ${campaign.date_date} ;;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${ad_group.external_customer_id} = ${customer.external_customer_id} AND
      ${ad_group.date_date} = ${customer.date_date} ;;
    relationship:  many_to_one
  }
}

explore: keyword {
  hidden: yes
  join: ad_group {
    view_label: "Keyword"
    sql_on: ${keyword.ad_group_id} = ${ad_group.ad_group_id} AND
      ${keyword.date_date} = ${ad_group.date_date} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${keyword.campaign_id} = ${campaign.campaign_id} AND
      ${keyword.date_date} = ${campaign.date_date} ;;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${keyword.external_customer_id} = ${customer.external_customer_id} AND
      ${keyword.date_date} = ${customer.date_date} ;;
    relationship:  many_to_one
  }
}

explore: ad {
  hidden: yes
  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${ad.ad_group_id} = ${ad_group.ad_group_id}  AND
      ${ad.date_date} = ${ad_group.date_date} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${ad.campaign_id} = ${campaign.campaign_id} AND
      ${ad.date_date} = ${campaign.date_date} ;;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${customer.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.date_date} = ${customer.date_date} ;;
    relationship:  many_to_one
  }
}

explore: kpis_this_period {
  label: "Kpis Period Over Period"
  join: kpis_last_period {
    sql_on: ${kpis_this_period.external_customer_id_this_period} = ${kpis_last_period.external_customer_id_last_period} AND
    ${kpis_this_period.campaign_name} = ${kpis_last_period.campaign_name} AND
    ${kpis_this_period.ad_group_name} = ${kpis_last_period.ad_group_name};;
    relationship: one_to_one
  }
}

explore: report_single_values {
  label: "Report Single Values"
}

explore: status_changes  {

  join: campaign {
    view_label: "Campaigns"
    sql_on: ${status_changes.campaign_id} = ${campaign.campaign_id} AND
      ${status_changes.external_customer_id} = ${campaign.external_customer_id};;
    relationship: many_to_one
  }
  join: ad_group {
    view_label: "Ad Groups"
    sql_on: ${status_changes.ad_group_id} = ${ad_group.ad_group_id} AND
      ${status_changes.external_customer_id} = ${ad_group.external_customer_id};;
    relationship: many_to_one
  }
  join: ad {
    view_label: "Ads"
    sql_on: ${ad.creative_id} = ${status_changes.ad_creative_id}  AND
      ${status_changes.external_customer_id} = ${ad.external_customer_id};;
    relationship:  many_to_one
  }
  join: keyword {
    view_label: "Keywords"
    sql_on: ${status_changes.keyword_criterion_id} = ${keyword.criterion_id} AND
      ${status_changes.external_customer_id} = ${keyword.external_customer_id} ;;
    relationship: many_to_one
  }
}
