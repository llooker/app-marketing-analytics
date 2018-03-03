include: "fb_stitch.view.lkml"
include: "fb_base_insights.view.lkml"

view: ads_insights_country {
  extends: ["stitch", "base_insights"]

  sql_table_name: {{ _user_attributes["facebook_schema"] }}.ads_insights_country ;;

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
}
