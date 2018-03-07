include: "fb_stitch_base.view.lkml"
include: "fb_insights_base.view.lkml"

view: ads_insights_country {
  extends: ["stitch_base", "insights_base"]

  sql_table_name: {{ _user_attributes["facebook_schema"] }}.ads_insights_country ;;

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
}
