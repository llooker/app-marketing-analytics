include: "/app_marketing_analytics_adapter/ad.view"
include: "ad_group.view"

explore: ad {
  hidden: yes

  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${ad.ad_group_id} = ${ad_group.ad_group_id} AND
      ${ad_group.campaign_id} = ${campaign.campaign_id} AND
      ${ad_group.external_customer_id} = ${customer.external_customer_id} AND
      ${ad.date_date} = ${ad_group.date_date};;
    relationship: many_to_one

  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${ad_group.campaign_id} = ${campaign.campaign_id} AND
      ${ad_group.external_customer_id} = ${customer.external_customer_id} AND
      ${ad_group.date_date} = ${campaign.date_date};;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${ad_group.external_customer_id} = ${customer.external_customer_id} AND
      ${ad_group.date_date} = ${customer.date_date} ;;
    relationship: many_to_one
  }
}

view: ad {
  extends: [date_base, google_adwords_base, ad_adapter]

  dimension: ad_group_ad_disapproval_reasons {
    type: string
    sql: ${TABLE}.AdGroupAdDisapprovalReasons ;;
  }

  dimension: ad_group_ad_trademark_disapproved {
    type: yesno
    sql: ${TABLE}.AdGroupAdTrademarkDisapproved ;;
  }

  dimension: ad_group_id {
    sql: ${TABLE}.AdGroupId ;;
    hidden: yes
  }

  dimension: ad_type {
    type: string
    sql: ${TABLE}.AdType ;;
  }

  dimension: business_name {
    type: string
    sql: ${TABLE}.BusinessName ;;
  }

  dimension: call_only_phone_number {
    type: string
    sql: ${TABLE}.CallOnlyPhoneNumber ;;
    hidden: yes
  }

  dimension: campaign_id {
    sql: ${TABLE}.CampaignId ;;
    hidden: yes
  }

  dimension: creative_approval_status_raw {
    hidden: yes
    type: string
    sql: ${TABLE}.CreativeApprovalStatus ;;
  }

  dimension: creative_approval_status {
    type: string
    sql: REPLACE(${creative_approval_status_raw}, "ApprovalStatus_", "") ;;
#     expression: replace(${creative_approval_status_raw}, "ApprovalStatus_", "") ;;
  }

  dimension: creative_destination_url {
    type: string
    sql: ${TABLE}.CreativeDestinationUrl ;;
    group_label: "URLS"
  }

  dimension: creative_final_app_urls {
    type: string
    sql: ${TABLE}.CreativeFinalAppUrls ;;
    group_label: "URLS"
  }

  dimension: creative_final_mobile_urls {
    type: string
    sql: ${TABLE}.CreativeFinalMobileUrls ;;
    group_label: "URLS"
  }

  dimension: creative_final_urls {
    hidden: yes
    type: string
    group_label: "URLS"
  }

  dimension: creative_final_urls_clean {
    hidden: yes
    type: string
    sql: REGEXP_EXTRACT(${creative_final_urls}, r'\"([^\"]*)\"') ;;
  }

  dimension: creative_final_urls_domain_path {
    label: "Creative Final Urls"
    type: string
    sql: SUBSTR(REGEXP_EXTRACT(${creative_final_urls_clean}, r'^https?://(.*)\?'), 0, 50) ;;
    link: {
      url: "{{ creative_final_urls_clean }}"
      label: "Landing Page"
    }
    group_label: "URLS"
  }

  dimension: creative_id {
    primary_key: yes
    sql: ${TABLE}.CreativeId ;;
    hidden: yes
  }

  dimension: creative_tracking_url_template {
    type: string
    sql: ${TABLE}.CreativeTrackingUrlTemplate ;;
    hidden: yes
  }

  dimension: creative_url_custom_parameters {
    type: string
    sql: ${TABLE}.CreativeUrlCustomParameters ;;
    hidden: yes
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: description1 {
    type: string
    sql: ${TABLE}.Description1 ;;
  }

  dimension: description2 {
    type: string
    sql: ${TABLE}.Description2 ;;
  }

  dimension: device_preference {
    type: number
    sql: ${TABLE}.DevicePreference ;;
  }

  dimension: display_url {
    type: string
    sql: ${TABLE}.DisplayUrl ;;
    group_label: "URLS"
  }

  dimension: enhanced_display_creative_logo_image_media_id {
    sql: ${TABLE}.EnhancedDisplayCreativeLogoImageMediaId ;;
    hidden: yes
  }

  dimension: enhanced_display_creative_marketing_image_media_id {
    sql: ${TABLE}.EnhancedDisplayCreativeMarketingImageMediaId ;;
    hidden: yes
  }

  dimension: headline {
    type: string
    group_label: "Headline"
  }

  dimension: headline_part1 {
    type: string
    group_label: "Headline"
  }

  dimension: headline_part2 {
    type: string
    group_label: "Headline"
  }

  dimension: image_ad_url {
    type: string
    group_label: "URLS"
  }

  dimension: image_creative_image_height {
    type: number
    sql: ${TABLE}.ImageCreativeImageHeight ;;
    hidden: yes
  }

  dimension: image_creative_image_width {
    type: number
    sql: ${TABLE}.ImageCreativeImageWidth ;;
    hidden: yes
  }

  dimension: image_creative_name {
    type: string
    sql: ${TABLE}.ImageCreativeName ;;
  }

  dimension: label_ids {
    type: string
    sql: ${TABLE}.LabelIds ;;
    hidden: yes
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.Labels ;;
  }

  dimension: long_headline {
    type: string
    sql: ${TABLE}.LongHeadline ;;
    hidden: yes
  }

  dimension: path1 {
    type: string
    sql: ${TABLE}.Path1 ;;
    hidden: yes
  }

  dimension: path2 {
    type: string
    sql: ${TABLE}.Path2 ;;
    hidden: yes
  }

  dimension: short_headline {
    type: string
    sql: ${TABLE}.ShortHeadline ;;
    hidden: yes
  }

  dimension: status_raw {
    hidden: yes
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: status {
    type: string
    sql: REPLACE(${status_raw}, "Status_", "") ;;
    # expression: replace(${status_raw}, "Status_", "") ;;
  }

  dimension: trademarks {
    type: string
    sql: ${TABLE}.Trademarks ;;
  }

  dimension: creative {
    type: string
    sql: SUBSTR(CONCAT(
      COALESCE(CONCAT(${headline}, "\n"),"")
      , COALESCE(CONCAT(${headline_part1}, "\n"),"")
      , COALESCE(CONCAT(${headline_part2}, "\n"),"")
      ), 0, 50) ;;
    link: {
      url: "https://adwords.google.com/aw/ads?campaignId={{ campaign_id._value }}&adGroupId={{ ad_group_id._value }}"
      icon_url: "https://www.gstatic.com/awn/awsm/brt/awn_awsm_20171108_RC00/aw_blend/favicon.ico"
      label: "Pause Ad"
    }
    link: {
      url: "https://adwords.google.com/aw/ads?campaignId={{ campaign_id._value }}&adGroupId={{ ad_group_id._value }}"
      icon_url: "https://www.gstatic.com/awn/awsm/brt/awn_awsm_20171108_RC00/aw_blend/favicon.ico"
      label: "Change Bid"
    }
    required_fields: [campaign.campaign_name, ad_group.ad_group_name]
    # expression: substring(concat(${headline}, ${headline_part1}, ${headline_part2}), 0, 50)
  }

  dimension: display_headline {
    type: string
    sql: CONCAT(
      COALESCE(CONCAT(${headline}, "\n"),"")
      , COALESCE(CONCAT(${headline_part1}, "\n"),"")) ;;
  }

  dimension: campaign_ad_group_ad_combination {
    type: string
    sql: CONCAT(${campaign.campaign_name}, "_", ${ad_group.ad_group_name}, "_", ${ad.creative}) ;;
  }

  measure: count {
    type: count_distinct
    sql: CONCAT(
      CAST(${external_customer_id} AS STRING), "-",
      CAST(${campaign_id} AS STRING), "-",
      CAST(${ad_group_id} AS STRING), "-",
      CAST(${creative_id} AS STRING)) ;;
    drill_fields: [detail*]
  }

  # ----- Detail ------
  set: detail {
    fields: [creative_id, status, ad_type, creative]
  }
}
