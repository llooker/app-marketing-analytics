include: "fb_stitch_base.view.lkml"
include: "fb_insights_base.view.lkml"

view: ads_insights_platform_and_device {
  extends: ["stitch_base", "insights_base"]

  sql_table_name: {{ _user_attributes["facebook_schema"] }}.ads_insights_platform_and_device ;;

  dimension: impression_device {
    type: string
    sql: ${TABLE}.impression_device ;;
  }

  dimension: platform_position {
    type: string
    sql: ${TABLE}.platform_position ;;
  }

  dimension: publisher_platform {
    type: string
    sql: ${TABLE}.publisher_platform ;;
  }
}
