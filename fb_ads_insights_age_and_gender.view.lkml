include: "fb_stitch_base.view"
include: "fb_insights_base.view"
include: "fb_adcreative.view"
include: "fb_ads.view"
include: "fb_adsets.view"
include: "fb_campaigns.view"

explore: ads_insights_age_and_gender {
  join: campaigns {
    type: left_outer
    sql_on: ${ads_insights_age_and_gender.campaign_id} = ${campaigns.id} ;;
    relationship: many_to_one
  }

  join: ads {
    type: left_outer
    sql_on: ${ads_insights_age_and_gender.ad_id} = ${ads.id} ;;
    relationship: many_to_one
  }

  join: adcreative {
    type: left_outer
    sql_on: ${ads.creative_id} = ${adcreative.id} ;;
    relationship: one_to_one
  }

  join: adsets {
    type: left_outer
    sql_on: ${ads_insights_age_and_gender.adset_id} = ${adsets.id} ;;
    relationship: many_to_one
  }

  join: ads_insights__video_30_sec_watched_actions {
    view_label: "Ads Insights Age And Gender: Video 30 Sec Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_age_and_gender.video_30_sec_watched_actions}) as ads_insights__video_30_sec_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p75_watched_actions {
    view_label: "Ads Insights Age And Gender: Video P75 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_age_and_gender.video_p75_watched_actions}) as ads_insights__video_p75_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p95_watched_actions {
    view_label: "Ads Insights Age And Gender: Video P95 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_age_and_gender.video_p95_watched_actions}) as ads_insights__video_p95_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__actions {
    view_label: "Ads Insights Age And Gender: Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_age_and_gender.actions}) as ads_insights__actions ;;
    relationship: one_to_many
  }

  join: ads_insights__website_ctr {
    view_label: "Ads Insights Age And Gender: Website Ctr"
    sql: LEFT JOIN UNNEST(${ads_insights_age_and_gender.website_ctr}) as ads_insights__website_ctr ;;
    relationship: one_to_many
  }

  join: ads_insights__video_15_sec_watched_actions {
    view_label: "Ads Insights Age And Gender: Video 15 Sec Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_age_and_gender.video_15_sec_watched_actions}) as ads_insights__video_15_sec_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_10_sec_watched_actions {
    view_label: "Ads Insights Age And Gender: Video 10 Sec Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_age_and_gender.video_10_sec_watched_actions}) as ads_insights__video_10_sec_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__unique_actions {
    view_label: "Ads Insights Age And Gender: Unique Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_age_and_gender.unique_actions}) as ads_insights__unique_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p25_watched_actions {
    view_label: "Ads Insights Age And Gender: Video P25 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_age_and_gender.video_p25_watched_actions}) as ads_insights__video_p25_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p100_watched_actions {
    view_label: "Ads Insights Age And Gender: Video P100 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_age_and_gender.video_p100_watched_actions}) as ads_insights__video_p100_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p50_watched_actions {
    view_label: "Ads Insights Age And Gender: Video P50 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_age_and_gender.video_p50_watched_actions}) as ads_insights__video_p50_watched_actions ;;
    relationship: one_to_many
  }
}

view: ads_insights_age_and_gender {
  extends: ["stitch_base", "insights_base"]

  sql_table_name: {{ _user_attributes["facebook_ads_schema"] }}.ads_insights_age_and_gender ;;

  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
}