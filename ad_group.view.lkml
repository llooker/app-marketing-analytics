include: "date_base.view"
include: "google_adwords_base.view"

view: ad_group {
  extends: [date_base, google_adwords_base]
  sql_table_name: adwords_v201609.AdGroup_6747157124 ;;

  dimension: _date {
    type: date
    sql: TIMESTAMP(${TABLE}._DATA_DATE) ;;
  }

  dimension: ad_group_desktop_bid_modifier {
    type: number
    sql: ${TABLE}.AdGroupDesktopBidModifier ;;
    hidden: yes
  }

  dimension: ad_group_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.AdGroupId ;;
    hidden: yes
  }

  dimension: ad_group_mobile_bid_modifier {
    type: number
    sql: ${TABLE}.AdGroupMobileBidModifier ;;
    hidden: yes
  }

  dimension: ad_group_name {
    type: string
    sql: ${TABLE}.AdGroupName ;;
    link: {
      label: "Ad Group Dashboard"
      url: "/dashboards/looker_app_google_adwords::ad_performance?Ad%20Group%20Name={{ value | encode_uri }}&Campaign%20Name={{ campaign.campaign_name._value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
    link: {
      label: "View on Adwords"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      url: "https://adwords.google.com/aw/ads?campaignId={{ campaign_id._value }}&adGroupId={{ ad_group_id._value }}"
    }
    link: {
      label: "Pause Ad Group"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      url: "https://adwords.google.com/aw/ads?campaignId={{ campaign_id._value }}&adGroupId={{ ad_group_id._value }}"
    }
    link: {
      url: "https://adwords.google.com/aw/ads?campaignId={{ campaign_id._value }}&adGroupId={{ ad_group_id._value }}"
      icon_url: "https://www.gstatic.com/awn/awsm/brt/awn_awsm_20171108_RC00/aw_blend/favicon.ico"
      label: "Change Bid"
    }
    required_fields: [campaign.campaign_name]
  }

  dimension: ad_group_status {
    type: string
    sql: ${TABLE}.AdGroupStatus ;;
  }

  dimension: ad_group_tablet_bid_modifier {
    type: number
    sql: ${TABLE}.AdGroupTabletBidModifier ;;
    hidden: yes
  }

  dimension: bid_type {
    type: string
    sql: ${TABLE}.BidType ;;
  }

  dimension: bidding_strategy_id {
    type: number
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
    type: number
    sql: ${TABLE}.CampaignId ;;
    hidden: yes
  }

  dimension: content_bid_criterion_type_group {
    type: string
    sql: ${TABLE}.ContentBidCriterionTypeGroup ;;
    hidden: yes
  }

  dimension: cpc_bid {
    hidden: yes
    type: string
    sql: ${TABLE}.CpcBid ;;
  }

  dimension: cpm_bid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.CpmBid ;;
  }

  dimension: cpv_bid {
    hidden: yes
    type: string
    sql: ${TABLE}.CpvBid ;;
  }

  dimension: enhanced_cpc_enabled {
    type: yesno
    sql: ${TABLE}.EnhancedCpcEnabled ;;
    hidden: yes
  }

  dimension: enhanced_cpv_enabled {
    type: yesno
    sql: ${TABLE}.EnhancedCpvEnabled ;;
    hidden: yes
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.ExternalCustomerId ;;
    hidden: yes
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

  dimension: target_cpa {
    hidden: yes
    type: number
    sql: ${TABLE}.TargetCpa ;;
  }

  dimension: target_cpa_bid_source {
    type: string
    sql: ${TABLE}.TargetCpaBidSource ;;
  }

  dimension: tracking_url_template {
    type: string
    sql: ${TABLE}.TrackingUrlTemplate ;;
    hidden: yes
  }

  dimension: url_custom_parameters {
    type: string
    sql: ${TABLE}.UrlCustomParameters ;;
    hidden: yes
  }

  measure: count {
    type: count_distinct
    sql: ${ad_group_id} ;;
    drill_fields: [detail*]
  }

  dimension: cpc_bid_usd {
    type: number
    sql: (${cpc_bid} / 1000000)  ;;
  }

  dimension: cpm_bid_usd {
    type: number
    sql: (${cpm_bid} / 1000000) ;;
  }

  dimension: cpv_bid_usd {
    type: number
    sql: (${cpv_bid} / 1000000) ;;
  }

  dimension: target_cpa_usd {
    type: number
    sql: (${target_cpa} / 1000000) ;;
  }

  # ----- Detail ------
  set: detail {
    fields: [ad_group_id, ad_group_name, ad_group_status, cpc_bid, ad.count, keyword.count]
  }
}
