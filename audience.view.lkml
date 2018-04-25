include: "/app_marketing_analytics_adapter/audience.view"
include: "criteria_base.view"

explore: audience {
  extends: [criteria_joins_base]
  from: audience
  view_label: "Audience"
  view_name: criteria
  hidden: yes
}

view: audience {
  extends: [criteria_base, audience_adapter]

  dimension: criteria {
    label: "Audience"
  }

  dimension: user_list_name {
    type: string
    sql: ${TABLE}.UserListName ;;
  }
}
