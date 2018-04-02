include: "ad_metrics_base.view"
include: "period_fact.view"
include: "date_base.view"
include: "period_base.view"

include: "fb_ads_insights_platform_and_device.view"

view: combined_ad_impressions_base {
  extends: [ad_metrics_base, date_base, period_base]

  dimension: _date {
    hidden: yes
    type: date_raw
  }
  dimension: account_name {}
  dimension: account_id {
    hidden: yes
  }
  dimension: campaign_name {}
  dimension: campaign_id {
    hidden: yes
  }
  dimension: ad_group_name {}
  dimension: ad_group_id {
    hidden: yes
  }
  dimension: device {}
}

explore: google_adwords_ad_impressions {
  hidden: yes
  from: google_adwords_ad_impressions
  view_name: fact
}

view: google_adwords_ad_impressions {
  extends: [combined_ad_impressions_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: ad_impressions {
      column: _date { field: fact.date_date}
      column: account_name { field: customer.account_descriptive_name }
      column: account_id { field: fact.external_customer_id_string }
      column: campaign_name { field: campaign.campaign_name }
      column: campaign_id { field: fact.campaign_id_string }
      column: ad_group_name { field: ad_group.ad_group_name }
      column: ad_group_id { field: fact.ad_group_id_string }
      column: device {field: fact.device_type }
      column: cost { field: fact.total_cost }
      column: impressions { field: fact.total_impressions }
      column: clicks { field: fact.total_clicks }
      column: conversions { field: fact.total_conversions }
      column: conversionvalue { field: fact.total_conversionvalue }
    }
  }
}

explore: facebook_ad_impressions {
  hidden: yes
  from: facebook_ad_impressions
  view_name: fact
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

explore: combined_ad_impressions {
  hidden: yes
  from: combined_ad_impressions
  view_name: fact
}
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
