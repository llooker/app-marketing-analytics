view: fb_ad_impressions_adapter {
  extension: required
  sql_table_name:
  {% if (fact.impression_device._in_query or fact.device_type._in_query or fact.platform_position._in_query or fact.publisher_platform._in_query) %}
    facebook_ads.ads_insights_platform_and_device
  {% elsif (fact.country._in_query) %}
    facebook_ads.ads_insights_country
  {% elsif (fact.age._in_query or fact.gender._in_query) %}
    facebook_ads.fb_ad_impressions
  {% else %}
    facebook_ads.ads_insights
  {% endif %} ;;
}
