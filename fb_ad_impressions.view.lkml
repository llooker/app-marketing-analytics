include: "fb_ad_impressions_adapter.view"
include: "fb_insights_base.view"
include: "fb_adcreative.view"
include: "fb_ads.view"

explore: fb_ad_impressions {
  hidden: yes
  from: fb_ad_impressions
  view_name: fact
  label: "Ad Impressions"
  view_label: "Ad Impressions"

  join: campaigns {
    type: left_outer
    sql_on: ${fact.campaign_id} = ${campaigns.id} ;;
    relationship: many_to_one
  }

  join: ads {
    type: left_outer
    sql_on: ${fact.ad_id} = ${ads.id} ;;
    relationship: many_to_one
  }

  join: adcreative {
    type: left_outer
    sql_on: ${ads.creative_id} = ${adcreative.id} ;;
    relationship: one_to_one
  }

  join: adsets {
    type: left_outer
    sql_on: ${fact.adset_id} = ${adsets.id} ;;
    relationship: many_to_one
  }

  join: ads_insights__video_30_sec_watched_actions {
    view_label: "Ads Insights Age And Gender: Video 30 Sec Watched Actions"
    sql: LEFT JOIN UNNEST(${fact.video_30_sec_watched_actions}) as ads_insights__video_30_sec_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p75_watched_actions {
    view_label: "Ads Insights Age And Gender: Video P75 Watched Actions"
    sql: LEFT JOIN UNNEST(${fact.video_p75_watched_actions}) as ads_insights__video_p75_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p95_watched_actions {
    view_label: "Ads Insights Age And Gender: Video P95 Watched Actions"
    sql: LEFT JOIN UNNEST(${fact.video_p95_watched_actions}) as ads_insights__video_p95_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__actions {
    view_label: "Ads Insights Age And Gender: Actions"
    sql: LEFT JOIN UNNEST(${fact.actions}) as ads_insights__actions ;;
    relationship: one_to_many
  }

  join: ads_insights__website_ctr {
    view_label: "Ads Insights Age And Gender: Website Ctr"
    sql: LEFT JOIN UNNEST(${fact.website_ctr}) as ads_insights__website_ctr ;;
    relationship: one_to_many
  }

  join: ads_insights__video_15_sec_watched_actions {
    view_label: "Ads Insights Age And Gender: Video 15 Sec Watched Actions"
    sql: LEFT JOIN UNNEST(${fact.video_15_sec_watched_actions}) as ads_insights__video_15_sec_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_10_sec_watched_actions {
    view_label: "Ads Insights Age And Gender: Video 10 Sec Watched Actions"
    sql: LEFT JOIN UNNEST(${fact.video_10_sec_watched_actions}) as ads_insights__video_10_sec_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__unique_actions {
    view_label: "Ads Insights Age And Gender: Unique Actions"
    sql: LEFT JOIN UNNEST(${fact.unique_actions}) as ads_insights__unique_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p25_watched_actions {
    view_label: "Ads Insights Age And Gender: Video P25 Watched Actions"
    sql: LEFT JOIN UNNEST(${fact.video_p25_watched_actions}) as ads_insights__video_p25_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p100_watched_actions {
    view_label: "Ads Insights Age And Gender: Video P100 Watched Actions"
    sql: LEFT JOIN UNNEST(${fact.video_p100_watched_actions}) as ads_insights__video_p100_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p50_watched_actions {
    view_label: "Ads Insights Age And Gender: Video P50 Watched Actions"
    sql: LEFT JOIN UNNEST(${fact.video_p50_watched_actions}) as ads_insights__video_p50_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__relevance_score {
    view_label: "Ads Insights: Relevance Score"
    sql: LEFT JOIN UNNEST([${fact.relevance_score}]) as ads_insights__relevance_score ;;
    relationship: one_to_one
  }
}

view: fb_ad_impressions {
  extends: ["stitch_base", "insights_base", "fb_ad_impressions_adapter"]

  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: impression_device {
    type: string
    sql: ${TABLE}.impression_device ;;
  }

  dimension: device_type {
    type: string
    case: {
      when: {
        sql: ${impression_device} = 'desktop' ;;
        label: "Desktop"
      }
      when: {
        sql: ${impression_device} = 'iphone' OR ${impression_device} = 'android_smartphone' ;;
        label: "Mobile"
      }
      when: {
        sql: ${impression_device} = 'ipad'  OR ${impression_device} = 'android_tablet' ;;
        label: "Tablet"
      }
      else: "Other"
    }
  }

  dimension: platform_position {
    type: string
    sql: ${TABLE}.platform_position ;;
  }

  dimension: publisher_platform {
    type: string
    sql: ${TABLE}.publisher_platform ;;
  }

  dimension: call_to_action_clicks {
    hidden: yes
    type: number
    sql: ${TABLE}.call_to_action_clicks ;;
  }

  dimension: relevance_score {
    hidden: yes
    sql: ${TABLE}.relevance_score ;;
  }

  dimension: social_spend {
    hidden: yes
    type: number
    sql: ${TABLE}.social_spend ;;
  }
}

view: ads_insights__relevance_score {
  dimension: negative_feedback {
    hidden: yes
    type: string
    sql: ${TABLE}.negative_feedback ;;
  }

  dimension: positive_feedback {
    hidden: yes
    type: string
    sql: ${TABLE}.positive_feedback ;;
  }

  dimension: score {
    hidden: yes
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: status {
    hidden: yes
    type: string
    sql: ${TABLE}.status ;;
  }
}
