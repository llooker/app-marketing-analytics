include: "/app_marketing_analytics_adapter/age_range.view"
include: "criteria_base.view"

explore: age_range {
  extends: [criteria_joins_base]
  from: age_range
  view_label: "Age Range"
  view_name: criteria
  hidden: yes
}

view: age_range {
  extends: [criteria_base, age_range_adapter]

  dimension: age_range {
    sql: ${criteria} ;;
  }

}
