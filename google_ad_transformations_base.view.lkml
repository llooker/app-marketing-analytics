include: "google_ad_metrics_base.view"

view: google_ad_transformations_base {
  extension: required
  extends: [google_ad_metrics_base]

  dimension: cost {
    hidden: yes
    type: number
    sql: (${TABLE}.Cost / 1000000) ;;
  }
}
