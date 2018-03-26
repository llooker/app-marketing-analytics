include: "fb_insights_base.view"
include: "fb_adcreative.view"
include: "fb_ads.view"

explore: ads_insights {
  join: campaigns {
    type: left_outer
    sql_on: ${ads_insights.campaign_id} = ${campaigns.id} ;;
    relationship: many_to_one
  }

  join: adsets {
    type: left_outer
    sql_on: ${ads_insights.adset_id} = ${adsets.id} ;;
    relationship: many_to_one
  }

  join: ads {
    type: left_outer
    sql_on: ${ads_insights.ad_id} = ${ads.id} ;;
    relationship: many_to_one
  }

  join: adcreative {
    type: left_outer
    sql_on: ${ads.creative_id} = ${adcreative.id} ;;
    relationship: one_to_one
  }

  join: ads_insights__video_30_sec_watched_actions {
    view_label: "Ads Insights: Video 30 Sec Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights.video_30_sec_watched_actions}) as ads_insights__video_30_sec_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p75_watched_actions {
    view_label: "Ads Insights: Video P75 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights.video_p75_watched_actions}) as ads_insights__video_p75_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p95_watched_actions {
    view_label: "Ads Insights: Video P95 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights.video_p95_watched_actions}) as ads_insights__video_p95_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__actions {
    view_label: "Ads Insights: Actions"
    sql: LEFT JOIN UNNEST(${ads_insights.actions}) as ads_insights__actions ;;
    relationship: one_to_many
  }

  join: ads_insights__website_ctr {
    view_label: "Ads Insights: Website Ctr"
    sql: LEFT JOIN UNNEST(${ads_insights.website_ctr}) as ads_insights__website_ctr ;;
    relationship: one_to_many
  }

  join: ads_insights__video_15_sec_watched_actions {
    view_label: "Ads Insights: Video 15 Sec Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights.video_15_sec_watched_actions}) as ads_insights__video_15_sec_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_10_sec_watched_actions {
    view_label: "Ads Insights: Video 10 Sec Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights.video_10_sec_watched_actions}) as ads_insights__video_10_sec_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__unique_actions {
    view_label: "Ads Insights: Unique Actions"
    sql: LEFT JOIN UNNEST(${ads_insights.unique_actions}) as ads_insights__unique_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p25_watched_actions {
    view_label: "Ads Insights: Video P25 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights.video_p25_watched_actions}) as ads_insights__video_p25_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p100_watched_actions {
    view_label: "Ads Insights: Video P100 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights.video_p100_watched_actions}) as ads_insights__video_p100_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__video_p50_watched_actions {
    view_label: "Ads Insights: Video P50 Watched Actions"
    sql: LEFT JOIN UNNEST(${ads_insights.video_p50_watched_actions}) as ads_insights__video_p50_watched_actions ;;
    relationship: one_to_many
  }

  join: ads_insights__relevance_score {
    view_label: "Ads Insights: Relevance Score"
    sql: LEFT JOIN UNNEST([${ads_insights.relevance_score}]) as ads_insights__relevance_score ;;
    relationship: one_to_one
  }
}

view: ads_insights {
  extends: ["stitch_base", "insights_base"]

  sql_table_name: {{ _user_attributes["facebook_ads_schema"] }}.ads_insights ;;

  dimension: call_to_action_clicks {
    type: number
    sql: ${TABLE}.call_to_action_clicks ;;
  }

  dimension: relevance_score {
    hidden: yes
    sql: ${TABLE}.relevance_score ;;
  }

  dimension: social_spend {
    type: number
    sql: ${TABLE}.social_spend ;;
  }
}

view: ads_insights__relevance_score {
  dimension: negative_feedback {
    type: string
    sql: ${TABLE}.negative_feedback ;;
  }

  dimension: positive_feedback {
    type: string
    sql: ${TABLE}.positive_feedback ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
}
