include: "ad_criterion_base.view"
include: "ad_group.view"
include: "campaign.view"
include: "customer.view"
include: "date_base.view"
include: "google_adwords_base.view"

explore: keyword {
  hidden: yes
  join: ad_group {
    view_label: "Ad Groups"
    sql_on: ${keyword.ad_group_id} = ${ad_group.ad_group_id} AND
      ${keyword.date_date} = ${ad_group.date_date} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${keyword.campaign_id} = ${campaign.campaign_id} AND
      ${keyword.date_date} = ${campaign.date_date};;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${keyword.external_customer_id} = ${customer.external_customer_id} AND
      ${keyword.date_date} = ${customer.date_date} ;;
    relationship: many_to_one
  }
}

view: keyword {
  extends: [ad_criterion_base, date_base, google_adwords_base]
  sql_table_name: {{ _user_attributes["google_adwords_schema"] }}.Keyword_{{ _user_attributes["google_adwords_customer_id"] }} ;;

  dimension: ad_group_id {
    sql: ${TABLE}.AdGroupId ;;
    hidden: yes
  }

  dimension: approval_status {
    type: string
    sql: ${TABLE}.ApprovalStatus ;;
  }

  dimension: bid_type {
    type: string
    sql: ${TABLE}.BidType ;;
  }

  dimension: bidding_strategy_id {
    sql: ${TABLE}.BiddingStrategyId ;;
    hidden: yes
  }

  dimension: bidding_strategy_name {
    type: string
    sql: ${TABLE}.BiddingStrategyName ;;
  }

  dimension: bidding_strategy_source {
    type: string
    sql: ${TABLE}.BiddingStrategySource ;;
  }

  dimension: bidding_strategy_type {
    type: string
    sql: ${TABLE}.BiddingStrategyType ;;
  }

  dimension: campaign_id {
    sql: ${TABLE}.CampaignId ;;
    hidden: yes
  }

  dimension: cpc_bid {
    hidden: yes
    type: number
    sql: (${TABLE}.CpcBid / 1000000) ;;
  }

  dimension: cpc_bid_source {
    type: string
    sql: ${TABLE}.CpcBidSource ;;
  }

  dimension: cpm_bid {
    hidden: yes
    type: number
    sql: (${TABLE}.CpmBid / 1000000) ;;
  }

  dimension: creative_quality_score {
    type: string
    sql: ${TABLE}.CreativeQualityScore ;;
    hidden: yes
  }

  dimension: criteria {
    type: string
    sql: ${TABLE}.Criteria ;;
    link: {
      icon_url: "https://www.google.com/images/branding/product/ico/googleg_lodp.ico"
      label: "Google Search"
      url: "https://www.google.com/search?q={{ value | encode_uri}}"
    }
  }

  dimension: campaign_ad_group_keyword_combination {
    type: string
    sql: CONCAT(${campaign.campaign_name}, "_", ${ad_group.ad_group_name}, "_", ${keyword.criteria}) ;;
  }

  dimension: criteria_destination_url {
    type: string
    sql: ${TABLE}.CriteriaDestinationUrl ;;
    group_label: "URLS"
  }

  dimension: criterion_id {
    sql: ${TABLE}.CriterionId ;;
    hidden: yes
  }

  dimension: enhanced_cpc_enabled {
    type: yesno
    sql: ${TABLE}.EnhancedCpcEnabled ;;
    hidden:  yes
  }

  dimension: estimated_add_clicks_at_first_position_cpc {
    type: number
    sql: ${TABLE}.EstimatedAddClicksAtFirstPositionCpc ;;
    hidden:  yes
  }

  dimension: estimated_add_cost_at_first_position_cpc {
    type: number
    sql: ${TABLE}.EstimatedAddCostAtFirstPositionCpc ;;
    hidden:  yes
  }

  dimension: final_app_urls {
    type: string
    sql: ${TABLE}.FinalAppUrls ;;
    group_label: "URLS"
  }

  dimension: final_mobile_urls {
    type: string
    sql: ${TABLE}.FinalMobileUrls ;;
    group_label: "URLS"
  }

  dimension: final_urls {
    type: string
    sql: ${TABLE}.FinalUrls ;;
    group_label: "URLS"
  }

  dimension: first_page_cpc {
    type: string
    sql: ${TABLE}.FirstPageCpc ;;
  }

  dimension: first_position_cpc {
    type: string
    sql: ${TABLE}.FirstPositionCpc ;;
  }

  dimension: has_quality_score {
    type: yesno
    sql: ${TABLE}.HasQualityScore ;;
    hidden: yes
  }

  dimension: is_negative {
    type: yesno
    sql: ${TABLE}.IsNegative ;;
  }

  dimension: keyword_match_type {
    type: string
    sql: ${TABLE}.KeywordMatchType ;;
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

  dimension: post_click_quality_score {
    type: string
    sql: ${TABLE}.PostClickQualityScore ;;
  }

  dimension: quality_score {
    type: number
    sql: ${TABLE}.QualityScore ;;
  }

  dimension: search_predicted_ctr {
    type: string
    sql: ${TABLE}.SearchPredictedCtr ;;
    hidden:  yes
  }

  dimension: status_raw {
    hidden: yes
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: status {
    type: string
    sql: REPLACE(${status_raw}, "Status_", "") ;;
  }

  dimension: system_serving_status_raw {
    hidden: yes
    type: string
    sql: ${TABLE}.SystemServingStatus ;;
  }

  dimension: system_serving_status {
    type: string
    sql: REPLACE(${system_serving_status_raw}, "CRITERIA_SYSTEM_SERVING_STATUS_", "") ;;
  }

  dimension: top_of_page_cpc {
    type: string
    sql: ${TABLE}.TopOfPageCpc ;;
  }

  dimension: tracking_url_template {
    type: string
    sql: ${TABLE}.TrackingUrlTemplate ;;
    hidden:  yes
  }

  dimension: url_custom_parameters {
    type: string
    sql: ${TABLE}.UrlCustomParameters ;;
    hidden:  yes
  }

  measure: count {
    type: count_distinct
    sql: ${criterion_id} ;;
    drill_fields: [detail*, ad_group.detail*]
  }

  # ----- Detail ------
  set: detail {
    fields: [criterion_id, criteria, status, quality_score, post_click_quality_score, cpc_bid]
  }
}
