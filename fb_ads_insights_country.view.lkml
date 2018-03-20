include: "fb_stitch_base.view"
include: "fb_insights_base.view"
include: "fb_adcreative.view"
include: "fb_ads.view"
include: "fb_adsets.view"
include: "fb_campaigns.view"

explore: ads_insights_country {
  join: campaigns {
    type: left_outer
    sql_on: ${ads_insights_country.campaign_id} = ${campaigns.id} ;;
    relationship: many_to_one
  }

  join: ads {
    type: left_outer
    sql_on: ${ads_insights_country.ad_id} = ${ads.id} ;;
    relationship: many_to_one
  }

  join: adcreative {
    type: left_outer
    sql_on: ${ads.creative_id} = ${adcreative.id} ;;
    relationship: one_to_one
  }

  join: adsets {
    type: left_outer
    sql_on: ${ads_insights_country.adset_id} = ${adsets.id} ;;
    relationship: many_to_one
  }

  join: ads_insights__video_30_sec_watched_actions {
    view_label: "Ads Insights Country: Video 30 Sec Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_country.video_30_sec_watched_actions}) as ads_insights__video_30_sec_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p75_watched_actions {
    view_label: "Ads Insights Country: Video P75 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_country.video_p75_watched_actions}) as ads_insights__video_p75_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p95_watched_actions {
    view_label: "Ads Insights Country: Video P95 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_country.video_p95_watched_actions}) as ads_insights__video_p95_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__actions {
    view_label: "Ads Insights Country: Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_country.actions}) as ads_insights__actions ;;
    relationship: one_to_many
  }

  join: ads_insights__website_ctr {
    view_label: "Ads Insights Country: Website Ctr"
    sql: LEFT JOIN UNNEST(${ads_insights_country.website_ctr}) as ads_insights__website_ctr ;;
    relationship: one_to_many
  }

  join: ads_insights__video_15_sec_watched_actions {
    view_label: "Ads Insights Country: Video 15 Sec Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_country.video_15_sec_watched_actions}) as ads_insights__video_15_sec_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_10_sec_watched_actions {
    view_label: "Ads Insights Country: Video 10 Sec Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_country.video_10_sec_watched_actions}) as ads_insights__video_10_sec_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__unique_actions {
    view_label: "Ads Insights Country: Unique Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_country.unique_actions}) as ads_insights__unique_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p25_watched_actions {
    view_label: "Ads Insights Country: Video P25 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_country.video_p25_watched_actions}) as ads_insights__video_p25_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p100_watched_actions {
    view_label: "Ads Insights Country: Video P100 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_country.video_p100_watched_actions}) as ads_insights__video_p100_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p50_watched_actions {
    view_label: "Ads Insights Country: Video P50 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights_country.video_p50_watched_actions}) as ads_insights__video_p50_watched_actions ;;
    relationship: one_to_many
  }
}

view: ads_insights_country {
  extends: ["stitch_base", "insights_base"]

  sql_table_name: {{ _user_attributes["facebook_ads_schema"] }}.ads_insights_country ;;

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
}