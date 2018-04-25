include: "/app_marketing_analytics_adapter/video.view"
include: "date_base.view"
include: "google_adwords_base.view"

view: video {
  extends: [google_adwords_base, date_base, video_adapter]

  dimension: ad_group_id {
    hidden: yes
    type: number
    sql: ${TABLE}.AdGroupId ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: number
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: video_duration {
    type: number
    sql: ${TABLE}.VideoDuration ;;
  }

  dimension: video_id {
    hidden: yes
    type: string
    sql: ${TABLE}.VideoId ;;
  }

  dimension: video_title {
    type: string
    sql: ${TABLE}.VideoTitle ;;
  }
}
