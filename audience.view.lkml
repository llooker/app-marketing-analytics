include: "/app_marketing_analytics_adapter/audience.view"
include: "ad_group.view"

explore: audience {
  hidden: yes
  join: ad_group {
    view_label: "Ad Groups"
    sql_on: ${audience.ad_group_id} = ${ad_group.ad_group_id} AND
      ${audience.campaign_id} = ${ad_group.campaign_id} AND
      ${audience.external_customer_id} = ${ad_group.external_customer_id} AND
      ${audience.date_date} = ${ad_group.date_date} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${audience.campaign_id} = ${campaign.campaign_id} AND
      ${audience.external_customer_id} = ${campaign.external_customer_id} AND
      ${audience.date_date} = ${campaign.date_date};;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${audience.external_customer_id} = ${customer.external_customer_id} AND
      ${audience.date_date} = ${customer.date_date} ;;
    relationship: many_to_one
  }
}

view: audience {
  extends: [date_base, google_adwords_base, audience_adapter]

  dimension: ad_group_id {
    sql: ${TABLE}.AdGroupId ;;
    hidden:  yes
  }

  dimension: base_ad_group_id {
    sql: ${TABLE}.BaseAdGroupId ;;
    hidden:  yes
  }

  dimension: base_campaign_id {
    sql: ${TABLE}.BaseCampaignId ;;
    hidden:  yes
  }

  dimension: bid_modifier {
    type: number
    sql: ${TABLE}.BidModifier ;;
  }

  dimension: bid_type {
    type: string
    sql: ${TABLE}.BidType ;;
  }

  dimension: campaign_id {
    sql: ${TABLE}.CampaignId ;;
    hidden:  yes
  }

  dimension: cpc_bid {
    type: string
    sql: ${TABLE}.CpcBid ;;
  }

  dimension: cpc_bid_source {
    type: string
    sql: ${TABLE}.CpcBidSource ;;
  }

  dimension: cpm_bid {
    type: number
    sql: ${TABLE}.CpmBid ;;
  }

  dimension: cpm_bid_source {
    type: string
    sql: ${TABLE}.CpmBidSource ;;
  }

  dimension: criteria {
    type: string
    sql: ${TABLE}.Criteria ;;
  }

  dimension: criteria_destination_url {
    type: string
    sql: ${TABLE}.CriteriaDestinationUrl ;;
  }

  dimension: criterion_id {
    sql: ${TABLE}.CriterionId ;;
    hidden:  yes
  }

  dimension: final_app_urls {
    type: string
    sql: ${TABLE}.FinalAppUrls ;;
  }

  dimension: final_mobile_urls {
    type: string
    sql: ${TABLE}.FinalMobileUrls ;;
  }

  dimension: final_urls {
    type: string
    sql: ${TABLE}.FinalUrls ;;
  }

  dimension: is_negative {
    type: yesno
    sql: ${TABLE}.IsNegative ;;
  }

  dimension: is_restrict {
    type: yesno
    sql: ${TABLE}.IsRestrict ;;
  }

  dimension: status_raw {
    hidden: yes
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: status {
    hidden: yes
    type: string
    sql: REPLACE(${status_raw}, "Status_", "") ;;
  }

  dimension: status_active {
    type: yesno
    sql: ${status} = "Active" ;;
  }

  dimension: tracking_url_template {
    type: string
    sql: ${TABLE}.TrackingUrlTemplate ;;
  }

  dimension: url_custom_parameters {
    type: string
    sql: ${TABLE}.UrlCustomParameters ;;
  }

  dimension: user_list_name {
    type: string
    sql: ${TABLE}.UserListName ;;
  }

  dimension: key_base {
    hidden: yes
    sql: CONCAT(
      CAST(${external_customer_id} AS STRING), "-",
      CAST(${campaign_id} AS STRING), "-",
      CAST(${ad_group_id} AS STRING), "-",
      CAST(${criterion_id} AS STRING)) ;;
  }

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${_date} AS STRING), "-", ${key_base}) ;;
  }

  measure: count {
    type: count_distinct
    sql: ${key_base} ;;
    drill_fields: [drill_detail*]
  }

  measure: count_active {
    type: count_distinct
    sql: ${key_base} ;;
    filters: {
      field: status_active
      value: "Yes"
    }
    drill_fields: [drill_detail*]
  }

  set: drill_detail {
    fields: [criterion_id, criteria, status, cpc_bid]
  }
  set: detail {
    fields: [external_customer_id, campaign_id, ad_group_id, count, count_active, status_active, drill_detail*]
  }
}
