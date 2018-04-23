include: "fb_config.view"

view: fb_adsets_adapter {
  extension: required
  extends: [fb_config]
  sql_table_name: {{ facebook_ads_schema._sql }}.adsets ;;
}
