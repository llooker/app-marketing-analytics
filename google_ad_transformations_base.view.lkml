include: "/app_marketing_analytics_adapter/google_ad_transformations_base.view"
include: "google_ad_metrics_base.view"

view: google_ad_transformations_base {
  extension: required
  extends: [google_ad_metrics_base, google_ad_transformations_base_adapter]

  dimension: cost {
    hidden: yes
    type: number
    sql: (${TABLE}.Cost / 1000000) ;;
  }
}
