connection: "looker_app"

# include all the views
include: "account_fact.view"
include: "ad.view"
include: "ad_fact.view"
include: "ad_group.view"
include: "ad_group_fact.view"
include: "audience.view"
include: "campaign.view"
include: "campaign_budget_date_fact.view"
include: "campaign_fact.view"
include: "customer.view"
include: "expected_conversions.view"
include: "keyword.view"
include: "keyword_fact.view"
include: "ad_impressions.view"
include: "report_single_values.view"
include: "reports.view"
include: "recent_changes.view"

include: "combined_ad_impressions.view"
include: "combined_ad_group_fact.view"

# include all the dashboards
include: "ad_group_performance.dashboard"
include: "adwords_activity.dashboard"
include: "adwords_overview.dashboard"
include: "campaign_metrics_base.dashboard"
include: "campaign_metrics_conversion_rate.dashboard"
include: "campaign_metrics_conversions.dashboard"
include: "campaign_metrics_cpa.dashboard"
include: "campaign_metrics_cpc.dashboard"
include: "campaign_metrics_ctr.dashboard"
include: "campaign_metrics_spend.dashboard"
include: "combined_overview.dashboard"
include: "top_campaign_significant.dashboard"

datagroup: etl_datagroup {
  sql_trigger: SELECT MAX(CONCAT(CAST(_DATA_DATE as STRING), format(" %02d", HourOfDay))) FROM adwords_v201609.HourlyAccountStats_6747157124 ;;
  max_cache_age: "24 hours"
}

persist_with: etl_datagroup

explore: ad_impressions {
  label: "Ad Impressions"
  view_label: "Ad Impressions"

  join: keyword {
    view_label: "Keyword"
    sql_on: ${ad_impressions.criterion_id} = ${keyword.criterion_id} AND
      ${ad_impressions.ad_group_id} = ${ad_group.ad_group_id} AND
      ${ad_impressions.campaign_id} = ${campaign.campaign_id} AND
      ${ad_impressions.external_customer_id} = ${customer.external_customer_id} AND
      ${ad_impressions.date_date} = ${keyword.date_date} ;;
    relationship: many_to_one
  }
  join: audience {
    view_label: "Audience"
    sql_on: ${ad_impressions.audience_criterion_id} = ${audience.criterion_id} AND
      ${ad_impressions.ad_group_id} = ${ad_group.ad_group_id} AND
      ${ad_impressions.campaign_id} = ${campaign.campaign_id} AND
      ${ad_impressions.external_customer_id} = ${customer.external_customer_id} AND
      ${ad_impressions.date_date} = ${audience.date_date} ;;
    relationship: many_to_one
  }
  join: ad {
    view_label: "Ads"
    sql_on: ${ad.creative_id} = ${ad_impressions.creative_id} AND
      ${ad_impressions.ad_group_id} = ${ad_group.ad_group_id} AND
      ${ad_impressions.campaign_id} = ${campaign.campaign_id} AND
      ${ad_impressions.external_customer_id} = ${customer.external_customer_id} AND
      ${ad_impressions.date_date} = ${ad.date_date} ;;
    relationship:  many_to_one
  }
  join: ad_group {
    view_label: "Ad Groups"
    sql_on: ${ad_impressions.ad_group_id} = ${ad_group.ad_group_id} AND
      ${ad_impressions.campaign_id} = ${campaign.campaign_id} AND
      ${ad_impressions.external_customer_id} = ${customer.external_customer_id} AND
      ${ad_impressions.date_date} = ${ad_group.date_date} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${ad_impressions.campaign_id} = ${campaign.campaign_id} AND
      ${ad_impressions.external_customer_id} = ${customer.external_customer_id} AND
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

explore: report_single_values {
  label: "Report Single Values"
}

explore: reports  {
  join: campaign {
    view_label: "Campaign"
    sql_on: ${reports.campaign_id} = ${campaign.campaign_id} AND
      ${reports.external_customer_id} = ${campaign.external_customer_id};;
    relationship: many_to_one
  }
  join: ad_group {
    view_label: "Ad Groups"
    sql_on: ${reports.ad_group_id} = ${ad_group.ad_group_id} AND
      ${reports.campaign_id} = ${campaign.campaign_id} AND
      ${reports.external_customer_id} = ${ad_group.external_customer_id};;
    relationship: many_to_one
  }
  join: ad {
    view_label: "Ads"
    sql_on: ${reports.creative_id} = ${ad.creative_id} AND
      ${reports.ad_group_id} = ${ad.ad_group_id} AND
      ${reports.campaign_id} = ${campaign.campaign_id} AND
      ${reports.external_customer_id} = ${ad.external_customer_id};;
    relationship:  many_to_one
  }
  join: keyword {
    view_label: "Keywords"
    sql_on: ${reports.criterion_id} = ${keyword.criterion_id} AND
      ${reports.ad_group_id} = ${keyword.ad_group_id} AND
      ${reports.campaign_id} = ${campaign.campaign_id} AND
      ${reports.external_customer_id} = ${keyword.external_customer_id} ;;
    relationship: many_to_one
  }
}

explore: status_changes  {
  join: campaign {
    view_label: "Campaign"
    sql_on: ${status_changes.campaign_id} = ${campaign.campaign_id} AND
      ${status_changes.external_customer_id} = ${campaign.external_customer_id};;
    relationship: many_to_one
  }
  join: ad_group {
    view_label: "Ad Groups"
    sql_on: ${status_changes.ad_group_id} = ${ad_group.ad_group_id} AND
      ${status_changes.campaign_id} = ${campaign.campaign_id} AND
      ${status_changes.external_customer_id} = ${ad_group.external_customer_id};;
    relationship: many_to_one
  }
  join: ad {
    view_label: "Ads"
    sql_on: ${status_changes.creative_id} = ${ad.creative_id} AND
      ${status_changes.ad_group_id} = ${ad.ad_group_id} AND
      ${status_changes.campaign_id} = ${campaign.campaign_id} AND
      ${status_changes.external_customer_id} = ${ad.external_customer_id};;
    relationship:  many_to_one
  }
  join: keyword {
    view_label: "Keywords"
    sql_on: ${status_changes.criterion_id} = ${keyword.criterion_id} AND
      ${status_changes.ad_group_id} = ${keyword.ad_group_id} AND
      ${status_changes.campaign_id} = ${campaign.campaign_id} AND
      ${status_changes.external_customer_id} = ${keyword.external_customer_id} ;;
    relationship: many_to_one
  }
}
