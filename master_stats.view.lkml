include: "ad_criterion_base.view.lkml"
include: "base.view.lkml"
include: "stats.view.lkml"

view: master_stats {
  extends: [ad_criterion_base, base, stats]

  sql_table_name:
  {% if (ad._in_query or master_stats.creative_id._in_query) %}
    adwords_v201609.AdBasicStats_6747157124
  {% elsif (audience._in_query or master_stats.audience_criterion_id._in_query) %}
    adwords_v201609.AudienceBasicStats_6747157124
  {% elsif (keyword._in_query or master_stats.criteria_id._in_query) %}
    adwords_v201609.KeywordBasicStats_6747157124
  {% elsif (ad_group._in_query or master_stats.ad_group_id._in_query) %}
    {% if master_stats.hour_of_day._in_query %}
      adwords_v201609.HourlyAdGroupStats_6747157124
    {% else %}
      adwords_v201609.AdGroupBasicStats_6747157124
    {% endif %}
  {% elsif (campaign._in_query or master_stats.campaign_id._in_query) %}
    {% if master_stats.hour_of_day._in_query %}
      adwords_v201609.HourlyCampaignStats_6747157124
    {% else %}
      adwords_v201609.CampaignBasicStats_6747157124
    {% endif %}
  {% else %}
    {% if master_stats.hour_of_day._in_query %}
      adwords_v201609.HourlyAccountStats_6747157124
    {% else %}
      adwords_v201609.AccountBasicStats_6747157124
    {% endif %}
  {% endif %} ;;

  dimension: _data {
    sql: TIMESTAMP(${TABLE}._DATA_DATE) ;;
    drill_fields: []
  }

  dimension: _latest {
    sql: TIMESTAMP(${TABLE}._LATEST_DATE) ;;
  }

  dimension: hour_of_day {
    type: number
    sql: ${TABLE}.HourOfDay ;;
  }

  dimension: audience_criterion_id {
    type: number
    sql: ${TABLE}.CriterionId ;;
  }

  dimension: active_view_impressions {
    type: number
    sql: ${TABLE}.ActiveViewImpressions ;;
  }

  dimension: active_view_measurability {
    type: number
    sql: ${TABLE}.ActiveViewMeasurability ;;
  }

  dimension: active_view_measurable_cost {
    type: number
    sql: ${TABLE}.ActiveViewMeasurableCost ;;
  }

  dimension: active_view_measurable_impressions {
    type: number
    sql: ${TABLE}.ActiveViewMeasurableImpressions ;;
  }

  dimension: active_view_viewability {
    type: number
    sql: ${TABLE}.ActiveViewViewability ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.AdGroupId ;;
  }

  dimension: ad_network_type1 {
    type: string
    sql: ${TABLE}.AdNetworkType1 ;;
  }

  dimension: ad_network_type2 {
    type: string
    sql: ${TABLE}.AdNetworkType2 ;;
  }

  dimension: average_position {
    type: number
    sql: ${TABLE}.AveragePosition ;;
  }

  dimension: base_ad_group_id {
    type: number
    sql: ${TABLE}.BaseAdGroupId ;;
  }

  dimension: base_campaign_id {
    type: number
    sql: ${TABLE}.BaseCampaignId ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.Clicks ;;
  }

  dimension: conversion_value {
    type: number
    sql: ${TABLE}.ConversionValue ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.Conversions ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.Cost ;;
  }

  dimension: creative_id {
    type: number
    sql: ${TABLE}.CreativeId ;;
  }

  dimension: criterion_id {
    type: number
    sql: ${TABLE}.CriterionId ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.Date ;;
  }

  dimension: week_of_year {
    type: number
    sql: CAST(FORMAT_TIMESTAMP('%V', TIMESTAMP(${TABLE}.Date) ) AS INT64) ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.Device ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.ExternalCustomerId ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.Impressions ;;
  }

  dimension: interaction_types {
    type: string
    sql: ${TABLE}.InteractionTypes ;;
  }

  dimension: interactions {
    type: number
    sql: ${TABLE}.Interactions ;;
  }

  dimension: slot {
    type: string
    sql: ${TABLE}.Slot ;;
  }

  dimension: view_through_conversions {
    type: number
    sql: ${TABLE}.ViewThroughConversions ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: weighted_average_position {
    label: "Average Position"
    description: "Average auction position."
    type: number
    sql: ${average_position}*${total_impressions} / NULLIF(${total_impressions},0) ;;
    value_format_name: decimal_0
  }

  measure: total_impressions {
  }
  measure: total_clicks {
  }
  measure: total_interactions {
  }
  measure: total_conversions {
    drill_fields: [master_stats._data_date, campaign.campaign_name, master_stats.total_conversions]
  }
  measure: total_cost_usd {
    drill_fields: [master_stats._data_date, campaign.campaign_name, master_stats.total_cost_usd]
  }
  measure: cumulative_spend {
    type: running_total
    sql: ${total_cost_usd} ;;
    drill_fields: [master_stats._data_date, campaign.campaign_name, master_stats.total_cost_usd]
    value_format_name: usd_0
    direction: "column"
  }

  measure: cumulative_conversions {
    type: running_total
    sql: ${total_conversions} ;;
    drill_fields: [master_stats._data_date, campaign.campaign_name, master_stats.total_cost_usd]
    value_format_name: decimal_0
    direction: "column"
  }
  measure: average_interaction_rate {
    link: {
      label: "By Keyword"
      url: "/explore/google_adwords/master_stats?fields=keyword.criteria,master_stats.average_interaction_rate&f[master_stats._data_date]=this quarter"
    }
  }
  measure: average_click_rate {
  }
  measure: average_conversion_rate {
  }
  measure: average_cost_per_click {
  }
  measure: average_cost_per_conversion {
    drill_fields: [master_stats._data_date, campaign.campaign_name, master_stats.total_conversions]
  }
}
