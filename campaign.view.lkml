include: "date_base.view"
include: "google_adwords_base.view"

view: campaign {
  extends: [date_base, google_adwords_base]
  sql_table_name: adwords_v201609.Campaign_6747157124 ;;

  dimension: _date {
    type: date
    sql: TIMESTAMP(${TABLE}._DATA_DATE) ;;
  }

  dimension: advertising_channel_sub_type {
    type: string
    sql: ${TABLE}.AdvertisingChannelSubType ;;
  }

  dimension: advertising_channel_type {
    type: string
    sql: ${TABLE}.AdvertisingChannelType ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.Amount ;;
  }

  dimension: bid_type {
    type: string
    sql: ${TABLE}.BidType ;;
  }

  dimension: bidding_strategy_id {
    type: number
    sql: ${TABLE}.BiddingStrategyId ;;
  }

  dimension: bidding_strategy_name {
    type: string
    sql: ${TABLE}.BiddingStrategyName ;;
  }

  dimension: bidding_strategy_type {
    type: string
    sql: ${TABLE}.BiddingStrategyType ;;
  }

  dimension: budget_id {
    type: number
    sql: ${TABLE}.BudgetId ;;
  }

  dimension: campaign_desktop_bid_modifier {
    type: number
    sql: ${TABLE}.CampaignDesktopBidModifier ;;
  }

  dimension: campaign_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: campaign_mobile_bid_modifier {
    type: number
    sql: ${TABLE}.CampaignMobileBidModifier ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.CampaignName ;;
    link: {
      label: "Campaign Dashboard"
      url: "/dashboards/looker_app_google_adwords::campaign_metrics_spend?Campaign={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
    link: {
      label: "View on Adwords"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      url: "https://adwords.google.com/aw/adgroups?campaignId={{ campaign_id._value }}"
    }
    link: {
      label: "Pause Campaign"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      url: "https://adwords.google.com/aw/ads?campaignId={{ campaign_id._value }}"
    }
    link: {
      url: "https://adwords.google.com/aw/ads?campaignId={{ campaign_id._value }}"
      icon_url: "https://www.gstatic.com/awn/awsm/brt/awn_awsm_20171108_RC00/aw_blend/favicon.ico"
      label: "Change Budget"
    }
  }

  dimension: campaign_status {
    type: string
    sql: ${TABLE}.CampaignStatus ;;
  }

  dimension: campaign_tablet_bid_modifier {
    type: number
    sql: ${TABLE}.CampaignTabletBidModifier ;;
  }

  dimension: campaign_trial_type {
    type: string
    sql: ${TABLE}.CampaignTrialType ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.EndDate ;;
  }

  dimension: enhanced_cpc_enabled {
    type: yesno
    sql: ${TABLE}.EnhancedCpcEnabled ;;
  }

  dimension: enhanced_cpv_enabled {
    type: yesno
    sql: ${TABLE}.EnhancedCpvEnabled ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.ExternalCustomerId ;;
  }

  dimension: is_budget_explicitly_shared {
    type: yesno
    sql: ${TABLE}.IsBudgetExplicitlyShared ;;
  }

  dimension: label_ids {
    type: string
    sql: ${TABLE}.LabelIds ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.Labels ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.Period ;;
  }

  dimension: serving_status {
    type: string
    sql: ${TABLE}.ServingStatus ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: (TIMESTAMP(${TABLE}.StartDate)) ;;
  }

  dimension: tracking_url_template {
    type: string
    sql: ${TABLE}.TrackingUrlTemplate ;;
  }

  dimension: url_custom_parameters {
    type: string
    sql: ${TABLE}.UrlCustomParameters ;;
  }

  measure: count {
    type: count_distinct
    sql: ${campaign_id} ;;
    drill_fields: [campaign_name, campaign_basic_fact.total_impressions, campaign_basic_fact.total_interactions, campaign_basic_fact.total_conversions, campaign_basic_fact.total_cost_usd, campaign_basic_fact.average_interaction_rate, campaign_basic_fact.average_conversion_rate, campaign_basic_fact.average_cost_per_click, campaign_basic_fact.average_cost_per_conversion]
  }

  dimension: amount_usd {
    description: "Daily Budget in USD"
    type: number
    sql: (${amount}  / 1000000) ;;
  }

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
  }

  measure: total_amount_usd {
    type: sum
    sql: ${amount_usd} ;;
    value_format_name: usd_0
  }

  # ----- Detail ------
  set: detail {
    fields: [campaign_id, campaign_name, campaign_status, ad_group.count, ad.count, keyword.count]
  }
}