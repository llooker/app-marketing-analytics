include: "fb_stitch_base.view.lkml"
include: "fb_insights_base.view.lkml"

view: ads_insights_age_and_gender {
  extends: ["stitch_base", "insights_base"]

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
