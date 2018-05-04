include: "/ama_fb_adapter/ad_impressions.view"

include: "date_base.view"
include: "period_base.view"
include: "fb_ad_metrics_base.view"

explore: fb_ad_impressions {
  extends: [ad_impressions_fb_adapter]
  from: fb_ad_impressions
  view_name: fact
  label: "Facebook Ad Impressions"
  view_label: "Facebook Ad Impressions"
}

view: fb_ad_impressions {
  extends: [date_base, period_base, fb_ad_metrics_base, ad_impressions_fb_adapter]
}

explore: fb_ad_impressions_age_and_gender {
  extends: [ad_impressions_age_and_gender_fb_adapter]
  from: fb_ad_impressions_age_and_gender
  view_name: fact
  label: "Facebook Ad Impressions"
  view_label: "Facebook Ad Impressions"
}

view: fb_ad_impressions_age_and_gender {
  extends: [date_base, period_base, fb_ad_metrics_base, ad_impressions_age_and_gender_fb_adapter]
}

explore: fb_ad_impressions_country {
  extends: [ad_impressions_country_fb_adapter]
  from: fb_ad_impressions_country
  view_name: fact
  label: "Facebook Ad Impressions"
  view_label: "Facebook Ad Impressions"
}

view: fb_ad_impressions_country {
  extends: [date_base, period_base, fb_ad_metrics_base, ad_impressions_country_fb_adapter]
}

explore: fb_ad_impressions_platform_and_device {
  extends: [ad_impressions_platform_and_device_fb_adapter]
  from: fb_ad_impressions_platform_and_device
  view_name: fact
  label: "Facebook Ad Impressions"
  view_label: "Facebook Ad Impressions"
}

view: fb_ad_impressions_platform_and_device {
  extends: [date_base, period_base, fb_ad_metrics_base, ad_impressions_platform_and_device_fb_adapter]
}
