include: "ad_metrics_base.view"
include: "ad_group.view"
include: "campaign_fact.view"
include: "date_base.view"

include: "fb_ads_insights_platform_and_device.view"
include: "fb_adsets.view"
include: "fb_campaigns.view"

view: combined_ad_impressions_base {
  extends: [ad_metrics_base, date_base]

  dimension: _date {
    hidden: yes
    sql: TIMESTAMP(${TABLE}._date) ;;
  }
  dimension: account_name {}
  dimension: account_id {}
  dimension: campaign_name {}
  dimension: campaign_id {}
  dimension: ad_group_name {}
  dimension: ad_group_id {}
  dimension: device {}
}

explore: google_adwords_ad_impressions {
#   hidden: yes
  persist_with: etl_datagroup

  join: customer {
    view_label: "Customer"
    sql_on: ${google_adwords_ad_impressions.account_id} = ${customer.external_customer_id} AND
      ${google_adwords_ad_impressions.date_date} = ${customer.date_date} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${google_adwords_ad_impressions.campaign_id} = ${campaign.campaign_id} AND
      ${google_adwords_ad_impressions.date_date} = ${campaign.date_date} ;;
    relationship: many_to_one
  }
  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${google_adwords_ad_impressions.campaign_id} = ${ad_group.ad_group_id} AND
      ${google_adwords_ad_impressions.date_date} = ${ad_group.date_date}  ;;
    relationship: many_to_one
  }
}

view: google_adwords_ad_impressions {
  extends: [combined_ad_impressions_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: ad_impressions {
      column: _date { field: ad_impressions.date_date}
      column: account_name { field: customer.account_descriptive_name }
      column: account_id { field: ad_impressions.external_customer_id_string }
      column: campaign_name { field: campaign.campaign_name }
      column: campaign_id { field: ad_impressions.campaign_id_string }
      column: ad_group_name { field: ad_group.ad_group_name }
      column: ad_group_id { field: ad_impressions.ad_group_id_string }
      column: device {field: ad_impressions.device_type }
      column: cost { field: ad_impressions.total_cost }
      column: impressions { field: ad_impressions.total_impressions }
      column: clicks { field: ad_impressions.total_clicks }
      column: conversions { field: ad_impressions.total_conversions }
      column: conversionvalue { field: ad_impressions.total_conversionvalue }
    }
  }
}

explore: facebook_ad_impressions {
#   hidden: yes

  join: campaigns {
    sql_on: ${facebook_ad_impressions.campaign_id} = ${campaigns.id} ;;
    relationship: many_to_one
  }
  join: adsets {
    sql_on: ${facebook_ad_impressions.ad_group_id} = ${adsets.id} ;;
    relationship: many_to_one
  }
}

view: facebook_ad_impressions {
  extends: [combined_ad_impressions_base]

  derived_table: {
    # datagroup_trigger: facebook_etl_datagroup
    explore_source: ads_insights_platform_and_device {
      column: _date { field: ads_insights_platform_and_device.date_start_date}
      column: account_name { field: ads_insights_platform_and_device.account_name }
      column: account_id { field: ads_insights_platform_and_device.account_id }
      column: campaign_name { field: ads_insights_platform_and_device.campaign_name }
      column: campaign_id { field: ads_insights_platform_and_device.campaign_id }
      column: ad_group_name { field: ads_insights_platform_and_device.adset_name }
      column: ad_group_id { field: ads_insights_platform_and_device.adset_id }
      column: device { field: ads_insights_platform_and_device.device_type }
      column: cost { field: ads_insights_platform_and_device.total_spend }
      column: impressions { field: ads_insights_platform_and_device.total_impressions }
      column: clicks { field: ads_insights_platform_and_device.total_clicks }
      # These aren't the correct mapping right now.
      column: conversions { field: ads_insights_platform_and_device.total_actions }
      column: conversionvalue { field: ads_insights_platform_and_device.total_action_value }
    }
  }
}

explore: combined_ad_impressions {}
view: combined_ad_impressions {
  extends: [combined_ad_impressions_base]

  derived_table: {
    sql:
      SELECT
         "Google AdWords" as channel,
          google_adwords_ad_impressions.account_id AS account_id,
          google_adwords_ad_impressions.account_name AS account_name,
          google_adwords_ad_impressions.ad_group_id AS ad_group_id,
          google_adwords_ad_impressions.ad_group_name AS ad_group_name,
          google_adwords_ad_impressions.campaign_id AS campaign_id,
          google_adwords_ad_impressions.campaign_name AS campaign_name,
          google_adwords_ad_impressions.device AS device,
          google_adwords_ad_impressions._date AS _date,
          google_adwords_ad_impressions.Impressions AS impressions,
          google_adwords_ad_impressions.Cost AS cost,
          google_adwords_ad_impressions.Conversions AS conversions,
          google_adwords_ad_impressions.Clicks AS clicks,
          google_adwords_ad_impressions.ConversionValue AS conversionvalue
       FROM ${google_adwords_ad_impressions.SQL_TABLE_NAME} as google_adwords_ad_impressions
       UNION ALL
       SELECT
         "Facebook" as channel,
          facebook_ad_impressions.account_id AS account_id,
          facebook_ad_impressions.account_name AS account_name,
          facebook_ad_impressions.ad_group_id AS ad_group_id,
          facebook_ad_impressions.ad_group_name AS ad_group_name,
          facebook_ad_impressions.campaign_id AS campaign_id,
          facebook_ad_impressions.campaign_name AS campaign_name,
          facebook_ad_impressions.device AS device,
          facebook_ad_impressions._date AS _date,
          facebook_ad_impressions.Impressions AS impressions,
          facebook_ad_impressions.Cost AS cost,
          facebook_ad_impressions.Conversions AS conversions,
          facebook_ad_impressions.Clicks AS clicks,
          facebook_ad_impressions.ConversionValue AS conversionvalue
       FROM ${facebook_ad_impressions.SQL_TABLE_NAME} as facebook_ad_impressions ;;
  }
  dimension: channel {}
}
