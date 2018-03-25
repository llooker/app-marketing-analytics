include: "customer.view"
include: "date_base.view"
include: "google_adwords_base.view"

explore: campaign {
  hidden: yes
  join: customer {
    view_label: "Customer"
    sql_on: ${campaign.external_customer_id} = ${customer.external_customer_id} AND
      ${campaign.date_date} = ${customer.date_date} ;;
    relationship: many_to_one
  }
}

view: campaign {
  extends: [date_base, google_adwords_base]
  sql_table_name: {{ _user_attributes["google_adwords_schema"] }}.Campaign_{{ _user_attributes["google_adwords_customer_id"] }} ;;

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
    sql: (${TABLE}.Amount / 1000000) ;;
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

  dimension: bidding_strategy_type {
    type: string
    sql: ${TABLE}.BiddingStrategyType ;;
  }

  dimension: budget_id {
    sql: ${TABLE}.BudgetId ;;
    hidden: yes
  }

  dimension: campaign_desktop_bid_modifier {
    type: number
    sql: ${TABLE}.CampaignDesktopBidModifier ;;
    hidden: yes
  }

  dimension: campaign_id {
    primary_key: yes
    sql: ${TABLE}.CampaignId ;;
    hidden: yes
  }

  dimension: campaign_mobile_bid_modifier {
    type: number
    sql: ${TABLE}.CampaignMobileBidModifier ;;
    hidden: yes
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.CampaignName ;;
    link: {
      label: "Campaign Dashboard"
      url: "/dashboards/looker_app_google_adwords::campaign_metrics_cost_per_conversion?Campaign={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
    link: {
      label: "View on Adwords"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      url: "https://adwords.google.com/aw/adgroups?campaignId={{ campaign_id._value | encode_uri }}"
    }
    link: {
      label: "Pause Campaign"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      url: "https://adwords.google.com/aw/ads?campaignId={{ campaign_id._value | encode_uri }}"
    }
    link: {
      url: "https://adwords.google.com/aw/ads?campaignId={{ campaign_id._value | encode_uri }}"
      icon_url: "https://www.gstatic.com/awn/awsm/brt/awn_awsm_20171108_RC00/aw_blend/favicon.ico"
      label: "Change Budget"
    }
  }

  dimension: campaign_status_raw {
    hidden: yes
    type: string
    sql: ${TABLE}.CampaignStatus ;;
  }

  dimension: campaign_status {
    type: string
    sql: REPLACE(${campaign_status_raw}, "Status_", "") ;;
  }

  dimension: campaign_tablet_bid_modifier {
    type: number
    sql: ${TABLE}.CampaignTabletBidModifier ;;
    hidden: yes
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
    sql: (TIMESTAMP(${TABLE}.EndDate)) ;;
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

  dimension: is_budget_explicitly_shared {
    type: yesno
    sql: ${TABLE}.IsBudgetExplicitlyShared ;;
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

  dimension: period {
    type: string
    sql: ${TABLE}.Period ;;
  }

  dimension: serving_status_raw {
    hidden: yes
    type: string
    sql: ${TABLE}.ServingStatus ;;
  }

  dimension: serving_status {
    type: string
    sql: REPLACE(${serving_status_raw}, "CAMPAIGN_SYSTEM_SERVING_STATUS_", "") ;;
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

  dimension_group: date {
    hidden: yes
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
    sql: ${campaign_id} ;;
    drill_fields: [campaign_name, campaign_basic_fact.total_impressions, campaign_basic_fact.total_clicks, campaign_basic_fact.total_conversions, campaign_basic_fact.total_cost, campaign_basic_fact.average_click_rate, campaign_basic_fact.average_conversion_rate, campaign_basic_fact.average_cost_per_click, campaign_basic_fact.average_cost_per_conversion]
  }

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
  }

  # ----- Detail ------
  set: detail {
    fields: [campaign_id, campaign_name, campaign_status, ad_group.count, ad.count, keyword.count]
  }
}
