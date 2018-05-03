connection: "looker_app"
label: "Marketing Analytics"

# include all the views
include: "account_fact.view"
include: "ad.view"
include: "ad_impressions.view"
include: "ad_fact.view"
include: "ad_group.view"
include: "ad_group_fact.view"
include: "age_range.view"
include: "audience.view"
include: "campaign.view"
include: "campaign_budget_date_fact.view"
include: "campaign_fact.view"
include: "customer.view"
include: "gender.view"
include: "geotargeting.view"
include: "keyword.view"
include: "keyword_fact.view"
include: "parental_status.view"
include: "period_fact.view"
include: "recent_changes.view"
include: "video.view"

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
include: "campaign_metrics_roas.dashboard"

# include all fb views
include: "fb_*.view"
# include all fb dashboards
include: "fb_*.dashboard"

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
  join: age_range {
    view_label: "Age Range"
    sql_on: ${fact.age_range_criterion_id} = ${age_range.criterion_id} AND
      ${fact.ad_group_id} = ${age_range.ad_group_id} AND
      ${fact.campaign_id} = ${age_range.campaign_id} AND
      ${fact.external_customer_id} = ${age_range.external_customer_id} AND
      ${fact.date_date} = ${age_range.date_date} ;;
    relationship: many_to_one
  }
  join: gender {
    view_label: "Gender"
    sql_on: ${fact.gender_criterion_id} = ${gender.criterion_id} AND
      ${fact.ad_group_id} = ${gender.ad_group_id} AND
      ${fact.campaign_id} = ${gender.campaign_id} AND
      ${fact.external_customer_id} = ${gender.external_customer_id} AND
      ${fact.date_date} = ${gender.date_date} ;;
    relationship: many_to_one
  }
  join: parental_status {
    view_label: "Parental Status"
    sql_on: ${fact.parental_status_criterion_id} = ${parental_status.criterion_id} AND
      ${fact.ad_group_id} = ${parental_status.ad_group_id} AND
      ${fact.campaign_id} = ${parental_status.campaign_id} AND
      ${fact.external_customer_id} = ${parental_status.external_customer_id} AND
      ${fact.date_date} = ${parental_status.date_date} ;;
    relationship: many_to_one
  }
  join: video {
    view_label: "Video"
    sql_on: ${fact.video_id} = ${video.video_id} AND
      ${fact.ad_group_id} = ${video.ad_group_id} AND
      ${fact.campaign_id} = ${video.campaign_id} AND
      ${fact.external_customer_id} = ${video.external_customer_id} AND
      ${fact.date_date} = ${video.date_date} ;;
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

  join: campaign {
    view_label: "Campaigns"
    sql_on: ${fact.campaign_id} = ${campaign.campaign_id} AND
      ${fact.external_customer_id} = ${campaign.external_customer_id};;
    relationship: many_to_one
  }

  join: ad_group {
    view_label: "Ad Groups"
    sql_on: ${fact.ad_group_id} = ${ad_group.ad_group_id} AND
      ${fact.campaign_id} = ${ad_group.campaign_id} AND
      ${fact.external_customer_id} = ${ad_group.external_customer_id};;
    relationship: many_to_one
  }

  join: ad {
    view_label: "Ads"
    sql_on: ${fact.creative_id} = ${ad.creative_id} AND
      ${fact.ad_group_id} = ${ad.ad_group_id} AND
      ${fact.campaign_id} = ${ad.campaign_id} AND
      ${fact.external_customer_id} = ${ad.external_customer_id};;
    relationship:  many_to_one
  }

  join: keyword {
    view_label: "Keywords"
    sql_on: ${fact.criterion_id} = ${keyword.criterion_id} AND
      ${fact.ad_group_id} = ${keyword.ad_group_id} AND
      ${fact.campaign_id} = ${keyword.campaign_id} AND
      ${fact.external_customer_id} = ${keyword.external_customer_id} ;;
    relationship: many_to_one
  }

}
