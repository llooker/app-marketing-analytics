include: "/app_marketing_analytics_adapter/parental_status.view"
include: "criteria_base.view"

explore: parental_status {
  extends: [criteria_joins_base]
  from: parental_status
  view_label: "Parental Status"
  view_name: criteria
  hidden: yes
}

view: parental_status {
  extends: [criteria_base, parental_status_adapter]

  dimension: criteria {
    label: "Parental Status"
  }

}
