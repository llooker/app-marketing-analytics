connection: "looker_app"
label: "Google AdWords"

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
include: "geotargeting.view"
include: "keyword.view"
include: "keyword_fact.view"
include: "period_fact.view"
include: "ad_impressions.view"
include: "recent_changes.view"

include: "combined_ad_impressions.view"
include: "combined_ad_group_fact.view"

# include all the dashboards
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

datagroup: etl_datagroup {
  sql_trigger: SELECT MAX(CONCAT(CAST(_DATA_DATE as STRING), format(" %02d", HourOfDay))) FROM adwords_v201609.HourlyAccountStats_6747157124 ;;
  max_cache_age: "24 hours"
}

persist_with: etl_datagroup

explore: ad_impressions {
  label: "Ad Impressions"
  view_label: "Ad Impressions"
  from: ad_impressions
  view_name: fact

  join: keyword {
    view_label: "Keyword"
    sql_on: ${fact.criterion_id} = ${keyword.criterion_id} AND
      ${fact.ad_group_id} = ${keyword.ad_group_id} AND
      ${fact.campaign_id} = ${keyword.campaign_id} AND
      ${fact.external_customer_id} = ${keyword.external_customer_id} AND
      ${fact.date_date} = ${keyword.date_date} ;;
    relationship: many_to_one
  }
  join: audience {
    view_label: "Audience"
    sql_on: ${fact.audience_criterion_id} = ${audience.criterion_id} AND
      ${fact.ad_group_id} = ${audience.ad_group_id} AND
      ${fact.campaign_id} = ${audience.campaign_id} AND
      ${fact.external_customer_id} = ${audience.external_customer_id} AND
      ${fact.date_date} = ${audience.date_date} ;;
    relationship: many_to_one
  }
  join: ad {
    view_label: "Ads"
    sql_on: ${fact.creative_id} = ${ad.creative_id} AND
      ${fact.ad_group_id} = ${ad.ad_group_id} AND
      ${fact.campaign_id} = ${ad.campaign_id} AND
      ${fact.external_customer_id} = ${ad.external_customer_id} AND
      ${fact.date_date} = ${ad.date_date} ;;
    relationship:  many_to_one
  }
  join: ad_group {
    view_label: "Ad Groups"
    sql_on: ${fact.ad_group_id} = ${ad_group.ad_group_id} AND
      ${fact.campaign_id} = ${ad_group.campaign_id} AND
      ${fact.external_customer_id} = ${ad_group.external_customer_id} AND
      ${fact.date_date} = ${ad_group.date_date} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${fact.campaign_id} = ${campaign.campaign_id} AND
      ${fact.external_customer_id} = ${campaign.external_customer_id} AND
      ${fact.date_date} = ${campaign.date_date};;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${fact.external_customer_id} = ${customer.external_customer_id} AND
      ${fact.date_date} = ${customer.date_date} ;;
    relationship: many_to_one
  }

  join: geo_country {
    from: geotargeting
    view_label: "Country"
    fields: [country_code]
    sql_on: ${fact.country_criteria_id} = ${geo_country.criteria_id} ;;
    relationship: many_to_one
  }

  join: geo_us_state {
    from: geotargeting
    view_label: "US State"
    fields: [state]
    sql_on: ${fact.region_criteria_id} = ${geo_us_state.criteria_id} AND
      ${geo_us_state.is_us_state} ;;
    relationship: many_to_one
    type: inner
  }

  join: geo_us_postal_code {
    from: geotargeting
    view_label: "US Postal Code"
    fields: [postal_code]
    sql_on: ${fact.most_specific_criteria_id} = ${geo_us_postal_code.criteria_id} AND
      ${geo_us_postal_code.is_us_postal_code} ;;
    relationship: many_to_one
    type: inner
  }

  join: geo_us_postal_code_state {
    from: geotargeting
    view_label: "US Postal Code"
    fields: [state]
    sql_on: ${geo_us_postal_code.parent_id} = ${geo_us_postal_code_state.criteria_id} AND
      ${geo_us_postal_code_state.is_us_state} ;;
    relationship: many_to_one
    type: inner
    required_joins: [geo_us_postal_code]
  }

  join: geo_region {
    from: geotargeting
    view_label: "Region"
    fields: [name, country_code]
    sql_on: ${fact.region_criteria_id} = ${geo_region.criteria_id} ;;
    relationship: many_to_one
  }

  join: geo_metro {
    from: geotargeting
    view_label: "Metro"
    fields: [name, country_code]
    sql_on: ${fact.metro_criteria_id} = ${geo_metro.criteria_id} ;;
    relationship: many_to_one
  }

  join: geo_city {
    from: geotargeting
    view_label: "City"
    fields: [name, country_code]
    sql_on: ${fact.city_criteria_id} = ${geo_city.criteria_id} ;;
    relationship: many_to_one
  }

}

explore: status_changes  {
  hidden: yes
  from: status_changes
  view_name: fact
  fields: [
    campaign.detail*,
    ad_group.detail*,
    ad.detail*,
    keyword.detail*,
    fact.ad_group_id,
    fact.campaign_id,
    fact.creative_id,
    fact.criterion_id,
    fact.change_type,
    fact.content_type,
    fact.status_lag,
    fact.date_date,
    fact.date_month,
    fact.date_week,
    fact.date_year,
    fact.date_month_name,
    fact.date_month_num,
    fact.period,
    fact.date_period_latest,
    fact.count,
    fact.status_display,
    fact.count_ad_changes,
    fact.count_keyword_changes,
    fact.count_ad_group_changes,
    fact.count_campaign_changes,
    campaign_date_fact.total_cost,
    campaign_date_fact.average_click_rate,
    campaign_date_fact.average_cost_per_click,
    campaign_date_fact.total_clicks,
    campaign_date_fact.average_conversion_rate,
    campaign_date_fact.average_cost_per_interaction,
    campaign_date_fact.average_interaction_rate,
    ad_group_date_fact.total_cost,
    ad_group_date_fact.average_click_rate,
    ad_group_date_fact.average_cost_per_click,
    ad_group_date_fact.total_clicks,
    ad_group_date_fact.average_conversion_rate,
    ad_group_date_fact.average_cost_per_interaction,
    ad_group_date_fact.average_interaction_rate,
    ad_date_fact.total_cost,
    ad_date_fact.average_click_rate,
    ad_date_fact.average_cost_per_click,
    ad_date_fact.average_conversion_rate,
    ad_date_fact.total_clicks,
    ad_date_fact.average_cost_per_interaction,
    ad_date_fact.average_interaction_rate,
    keyword_date_fact.total_cost,
    keyword_date_fact.average_click_rate,
    keyword_date_fact.average_cost_per_click,
    keyword_date_fact.total_clicks,
    keyword_date_fact.average_conversion_rate,
    keyword_date_fact.average_cost_per_interaction,
    keyword_date_fact.average_interaction_rate
    ]

  join: campaign {
    view_label: "Campaigns"
    sql_on: ${fact.campaign_id} = ${campaign.campaign_id} AND
      ${fact.external_customer_id} = ${campaign.external_customer_id};;
    relationship: many_to_one
  }

  join: campaign_date_fact {
    view_label: "Campaigns"
    type: inner
    sql_on:
      ${fact.campaign_id} = ${campaign_date_fact.campaign_id} AND
      ${fact.external_customer_id} = ${campaign_date_fact.external_customer_id} AND
      ${fact._date} = ${campaign_date_fact._date};;
    relationship: one_to_one
  }

  join: ad_group {
    view_label: "Ad Groups"
    sql_on: ${fact.ad_group_id} = ${ad_group.ad_group_id} AND
      ${fact.campaign_id} = ${ad_group.campaign_id} AND
      ${fact.external_customer_id} = ${ad_group.external_customer_id};;
    relationship: many_to_one
  }

  join: ad_group_date_fact {
    view_label: "Ad Groups"
    type: inner
    sql_on:
      ${fact.ad_group_id} = ${ad_group_date_fact.ad_group_id} AND
      ${fact.campaign_id} = ${ad_group_date_fact.campaign_id} AND
      ${fact.external_customer_id} = ${ad_group_date_fact.external_customer_id} AND
      ${fact._date} = ${ad_group_date_fact._date};;
    relationship: one_to_one
  }

  join: ad {
    view_label: "Ads"
    sql_on: ${fact.creative_id} = ${ad.creative_id} AND
      ${fact.ad_group_id} = ${ad.ad_group_id} AND
      ${fact.campaign_id} = ${ad.campaign_id} AND
      ${fact.external_customer_id} = ${ad.external_customer_id};;
    relationship:  many_to_one
  }

  join: ad_date_fact {
    view_label: "Ads"
    type: inner
    sql_on: ${fact.creative_id} = ${ad_date_fact.creative_id} AND
      ${fact.ad_group_id} = ${ad_date_fact.ad_group_id} AND
      ${fact.campaign_id} = ${ad_date_fact.campaign_id} AND
      ${fact.external_customer_id} = ${ad_date_fact.external_customer_id} AND
      ${fact._date} = ${ad_date_fact._date};;
    relationship: one_to_one
  }

  join: keyword {
    view_label: "Keywords"
    sql_on: ${fact.criterion_id} = ${keyword.criterion_id} AND
      ${fact.ad_group_id} = ${keyword.ad_group_id} AND
      ${fact.campaign_id} = ${keyword.campaign_id} AND
      ${fact.external_customer_id} = ${keyword.external_customer_id} ;;
    relationship: many_to_one
  }

  join: keyword_date_fact {
    view_label: "Keywords"
    type: inner
    sql_on: ${fact.criterion_id} = ${keyword_date_fact.criterion_id} AND
      ${fact.ad_group_id} = ${keyword_date_fact.ad_group_id} AND
      ${fact.campaign_id} = ${keyword_date_fact.campaign_id} AND
      ${fact.external_customer_id} = ${keyword_date_fact.external_customer_id} AND
      ${fact._date} = ${keyword_date_fact._date};;
    relationship: one_to_one
  }
}
