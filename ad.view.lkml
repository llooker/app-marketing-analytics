include: "dated_table.view.lkml"

view: ad {
  extends: [dated_table]
  sql_table_name: adwords_v201609.Ad_6747157124 ;;

  dimension: _date {
    type: date
    sql: TIMESTAMP(${TABLE}._DATA_DATE) ;;
  }

  dimension: ad_group_ad_disapproval_reasons {
    type: string
    sql: ${TABLE}.AdGroupAdDisapprovalReasons ;;
  }

  dimension: ad_group_ad_trademark_disapproved {
    type: yesno
    sql: ${TABLE}.AdGroupAdTrademarkDisapproved ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.AdGroupId ;;
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
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: creative_approval_status {
    type: string
    sql: ${TABLE}.CreativeApprovalStatus ;;
  }

  dimension: creative_destination_url {
    type: string
    sql: ${TABLE}.CreativeDestinationUrl ;;
  }

  dimension: creative_final_app_urls {
    type: string
    sql: ${TABLE}.CreativeFinalAppUrls ;;
  }

  dimension: creative_final_mobile_urls {
    type: string
    sql: ${TABLE}.CreativeFinalMobileUrls ;;
  }

  dimension: creative_final_urls {
    type: string
    sql: ${TABLE}.CreativeFinalUrls ;;
  }

  dimension: creative_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.CreativeId ;;
  }

  dimension: creative_tracking_url_template {
    type: string
    sql: ${TABLE}.CreativeTrackingUrlTemplate ;;
  }

  dimension: creative_url_custom_parameters {
    type: string
    sql: ${TABLE}.CreativeUrlCustomParameters ;;
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
  }

  dimension: enhanced_display_creative_logo_image_media_id {
    type: number
    sql: ${TABLE}.EnhancedDisplayCreativeLogoImageMediaId ;;
  }

  dimension: enhanced_display_creative_marketing_image_media_id {
    type: number
    sql: ${TABLE}.EnhancedDisplayCreativeMarketingImageMediaId ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.ExternalCustomerId ;;
  }

  dimension: headline {
    type: string
    sql: ${TABLE}.Headline ;;
  }

  dimension: headline_part1 {
    type: string
    sql: ${TABLE}.HeadlinePart1 ;;
  }

  dimension: headline_part2 {
    type: string
    sql: ${TABLE}.HeadlinePart2 ;;
  }

  dimension: image_ad_url {
    type: string
    sql: ${TABLE}.ImageAdUrl ;;
  }

  dimension: image_creative_image_height {
    type: number
    sql: ${TABLE}.ImageCreativeImageHeight ;;
  }

  dimension: image_creative_image_width {
    type: number
    sql: ${TABLE}.ImageCreativeImageWidth ;;
  }

  dimension: image_creative_name {
    type: string
    sql: ${TABLE}.ImageCreativeName ;;
  }

  dimension: label_ids {
    type: string
    sql: ${TABLE}.LabelIds ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.Labels ;;
  }

  dimension: long_headline {
    type: string
    sql: ${TABLE}.LongHeadline ;;
  }

  dimension: path1 {
    type: string
    sql: ${TABLE}.Path1 ;;
  }

  dimension: path2 {
    type: string
    sql: ${TABLE}.Path2 ;;
  }

  dimension: short_headline {
    type: string
    sql: ${TABLE}.ShortHeadline ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: trademarks {
    type: string
    sql: ${TABLE}.Trademarks ;;
  }

  dimension: creative {
    type: string
    sql: CONCAT(
      COALESCE(CONCAT(${headline}, "\n"),"")
      , COALESCE(CONCAT(${headline_part1}, "\n"),"")
      , COALESCE(CONCAT(${headline_part2}, "\n"),"")
      , COALESCE(CONCAT(${description}, "\n"),"")
      , COALESCE(CONCAT(${description1}, "\n"),"")
      , COALESCE(CONCAT(${description2}, "\n"),"")
      ) ;;
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
    sql: ${ad_group_id} ;;
    drill_fields: [detail*]
  }

  # ----- Detail ------
  set: detail {
    fields: [creative_id, status, ad_type, creative]
  }
}
