connection: "looker_app"
label: "Facebook Ads"

# include all the views
include: "fb_*.view"

# include all the dashboards
include: "facebook_*.dashboard"

datagroup: facebook_etl_datagroup {
  sql_trigger: SELECT MAX(_sdc_extracted_at) FROM ads_insight ;;
  max_cache_age: "24 hours"
}

persist_with: facebook_etl_datagroup
