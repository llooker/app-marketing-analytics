include: "fb_stitch.view.lkml"
include: "fb_base_insights.view.lkml"

view: ads_insights_age_and_gender {
  extends: ["stitch", "base_insights"]

  sql_table_name: {{ _user_attributes["facebook_schema"] }}.ads_insights_age_and_gender ;;

  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
}
