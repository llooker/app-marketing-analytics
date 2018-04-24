include: "fb_config.view"

view: fb_ads_adapter {
  extension: required
  extends: [fb_config]
  sql_table_name: {{ facebook_ads_schema._sql }}.ads ;;
}
