include: "/app_marketing_analytics_adapter/gender.view"
include: "criteria_base.view"

explore: gender {
  extends: [criteria_joins_base]
  from: gender
  view_label: "Gender"
  view_name: criteria
  hidden: yes
}

view: gender {
  extends: [criteria_base, gender_adapter]

  dimension: gender {
    sql: ${criteria} ;;
  }

}
