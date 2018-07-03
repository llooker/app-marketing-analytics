include: "ad_impressions.view"
include: "ad_metrics_base.view"
include: "date_base.view"
include: "fb_ad_impressions.view"
include: "period_base.view"

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
}

explore: google_adwords_ad_impressions {
  persist_with: adwords_etl_datagroup
  hidden: yes
  from: google_adwords_ad_impressions
  view_name: fact
}

view: google_adwords_ad_impressions {
  extends: [combined_ad_impressions_base]

  derived_table: {
    datagroup_trigger: adwords_etl_datagroup
    explore_source: ad_impressions_ad_group {
      column: _date { field: fact.date_date}
      column: account_name { field: customer.account_descriptive_name }
      column: account_id { field: fact.external_customer_id_string }
      column: campaign_name { field: campaign.name }
      column: campaign_id { field: fact.campaign_id_string }
      column: ad_group_name { field: ad_group.ad_group_name }
      column: ad_group_id { field: fact.ad_group_id_string }
      column: cost { field: fact.total_cost }
      column: impressions { field: fact.total_impressions }
      column: clicks { field: fact.total_clicks }
      column: conversions { field: fact.total_conversions }
      column: conversionvalue { field: fact.total_conversionvalue }
      derived_column: department {
        sql:  CASE WHEN campaign_name like '%Sponsor%' THEN 'Spon'
             WHEN campaign_name like '%Gift Catalog%' THEN 'Gift Cat'
             WHEN campaign_name like '%Emergency%' OR campaign_name like '% Charity & Donations%' OR campaign_name like '%Children Charity%' OR campaign_name like '%Coping with Crisis%' OR campaign_name like '%Girls%' OR campaign_name like '%Giving Tuesday%' OR campaign_name like '%Honor & Memorial%' OR campaign_name like '%Red Nose Day%' OR campaign_name like '%Save the Children - Brand%'  OR campaign_name like '% Search & Rescue - Display%' OR campaign_name like  '%SOWM%' OR campaign_name like '%Where We Work - Africa%' OR campaign_name like  '%South Sudan - Display%'  OR campaign_name like '%Syria - Native%' OR campaign_name like '%Syria - Display%' OR campaign_name like '%Retargeting Display%' OR campaign_name like '%2X Match - gmail%'  OR campaign_name like '%gp - Ramadan%' THEN 'Web'
             ELSE 'Other'
             END  ;;
      }
    }
  }
}

explore: facebook_ad_impressions {
  persist_with: facebook_ads_etl_datagroup
  hidden: yes
  from: facebook_ad_impressions
  view_name: fact
}

view: facebook_ad_impressions {
  extends: [combined_ad_impressions_base]

  derived_table: {
    datagroup_trigger: facebook_ads_etl_datagroup
    explore_source: fb_ad_impressions {
      column: _date { field: fact.date_date}
      column: account_name { field: fact.account_name }
      column: account_id { field: fact.account_id }
      column: campaign_name { field: fact.campaign_name }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_name { field: fact.adset_name }
      column: ad_group_id { field: fact.adset_id }
      column: cost { field: fact.total_cost }
      column: impressions { field: fact.total_impressions }
      column: clicks { field: fact.total_clicks }
      column: conversions { field: fact.total_conversions }
      column: conversionvalue { field: fact.total_conversionvalue }
      derived_column: department {
        sql: CASE WHEN campaign_name LIKE '%spon%' THEN 'Sponsorhip'
             WHEN campaign_name LIKE '%Gift Cat%' OR campaign_name LIKE '%GC%' THEN 'Gift Cat'
             WHEN campaign_name LIKE '%RD%' THEN 'RD'
             WHEN campaign_name LIKE '%DM%' OR campaign_name LIKE '%Ramadan%' THEN 'Web'
             WHEN campaign_name LIKE '%P2P%' THEN 'P2P'
             ELSE 'Other'
             END;;
      }
    }
  }
}

explore: combined_ad_impressions {
  persist_with: ama_etl_datagroup
  # hidden: yes
  from: combined_ad_impressions
  view_name: fact
}
view: combined_ad_impressions {
  extends: [combined_ad_impressions_base]

  derived_table: {
    datagroup_trigger: ama_etl_datagroup
    sql:
      SELECT
         "Google AdWords" as channel,
          google_adwords_ad_impressions.account_id AS account_id,
          google_adwords_ad_impressions.account_name AS account_name,
          google_adwords_ad_impressions.ad_group_id AS ad_group_id,
          google_adwords_ad_impressions.ad_group_name AS ad_group_name,
          google_adwords_ad_impressions.campaign_id AS campaign_id,
          google_adwords_ad_impressions.campaign_name AS campaign_name,
          google_adwords_ad_impressions._date AS _date,
          google_adwords_ad_impressions.Impressions AS impressions,
          google_adwords_ad_impressions.Cost AS cost,
          google_adwords_ad_impressions.Conversions AS conversions,
          google_adwords_ad_impressions.Clicks AS clicks,
          google_adwords_ad_impressions.ConversionValue AS conversionvalue,
          google_adwords_ad_impressions.department AS department
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
          facebook_ad_impressions._date AS _date,
          facebook_ad_impressions.Impressions AS impressions,
          facebook_ad_impressions.Cost AS cost,
          facebook_ad_impressions.Conversions AS conversions,
          facebook_ad_impressions.Clicks AS clicks,
          facebook_ad_impressions.ConversionValue AS conversionvalue,
          facebook_ad_impressions.department AS department
       FROM ${facebook_ad_impressions.SQL_TABLE_NAME} as facebook_ad_impressions ;;
  }
  dimension: channel {}
  dimension: department {
    drill_fields: [campaign_name]
  }
}
