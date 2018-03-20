include: "fb_stitch_base.view"
include: "fb_insights_base.view"
include: "fb_adcreative.view"
include: "fb_ads.view"
include: "fb_adsets.view"
include: "fb_campaigns.view"

explore: ads_insights_platform_and_device {
  join: campaigns {
    type: left_outer
    sql_on: ${ads_insights_platform_and_device.campaign_id} = ${campaigns.id} ;;
    relationship: many_to_one
  }

  join: ads {
    type: left_outer
    sql_on: ${ads_insights_platform_and_device.ad_id} = ${ads.id} ;;
    relationship: many_to_one
  }

  join: adcreative {
    type: left_outer
    sql_on: ${ads.creative_id} = ${adcreative.id} ;;
    relationship: one_to_one
  }

  join: adsets {
    type: left_outer
    sql_on: ${ads_insights_platform_and_device.adset_id} = ${adsets.id} ;;
    relationship: many_to_one
  }

  join: ads_insights__video_30_sec_watched_actions {
    view_label: "Ads Insights Platform And Device: Video 30 Sec Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_platform_and_device.video_30_sec_watched_actions}) as ads_insights__video_30_sec_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p75_watched_actions {
    view_label: "Ads Insights Platform And Device: Video P75 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_platform_and_device.video_p75_watched_actions}) as ads_insights__video_p75_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p95_watched_actions {
    view_label: "Ads Insights Platform And Device: Video P95 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_platform_and_device.video_p95_watched_actions}) as ads_insights__video_p95_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__actions {
    view_label: "Ads Insights Platform And Device: Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_platform_and_device.actions}) as ads_insights__actions ;;
    relationship: one_to_many
  }

  join: ads_insights__website_ctr {
    view_label: "Ads Insights Platform And Device: Website Ctr"
    sql: LEFT JOIN UNNEST(${ads_insights_platform_and_device.website_ctr}) as ads_insights__website_ctr ;;
    relationship: one_to_many
  }

  join: ads_insights__video_15_sec_watched_actions {
    view_label: "Ads Insights Platform And Device: Video 15 Sec Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_platform_and_device.video_15_sec_watched_actions}) as ads_insights__video_15_sec_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_10_sec_watched_actions {
    view_label: "Ads Insights Platform And Device: Video 10 Sec Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_platform_and_device.video_10_sec_watched_actions}) as ads_insights__video_10_sec_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__unique_actions {
    view_label: "Ads Insights Platform And Device: Unique Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_platform_and_device.unique_actions}) as ads_insights__unique_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p25_watched_actions {
    view_label: "Ads Insights Platform And Device: Video P25 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_platform_and_device.video_p25_watched_actions}) as ads_insights__video_p25_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p100_watched_actions {
    view_label: "Ads Insights Platform And Device: Video P100 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_platform_and_device.video_p100_watched_actions}) as ads_insights__video_p100_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p50_watched_actions {
    view_label: "Ads Insights Platform And Device: Video P50 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_platform_and_device.video_p50_watched_actions}) as ads_insights__video_p50_watched_actions ;;
    relationship: one_to_many
  }
}

view: ads_insights_platform_and_device {
  extends: ["stitch_base", "insights_base"]

  sql_table_name: {{ _user_attributes["facebook_ads_schema"] }}.ads_insights_platform_and_device ;;

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
}