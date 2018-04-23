include: "fb_config.view"

view: fb_campaigns_adapter {
  extension: required
  extends: [fb_config]
  sql_table_name: {{ facebook_ads_schema._sql }}.campaigns ;;
}
