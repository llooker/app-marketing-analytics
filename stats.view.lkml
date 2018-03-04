view: stats {
  extension: required

  dimension: clicks {
    type: number
    sql: ${TABLE}.Clicks ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.Conversions ;;
  }

  dimension: conversion_value {
    type: number
    sql: ${TABLE}.ConversionValue ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.Cost ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.Impressions ;;
  }

  dimension: interactions {
    type: number
    sql: ${TABLE}.Interactions ;;
  }

  dimension: average_position {
    type: number
    sql: ${TABLE}.AveragePosition ;;
  }

  dimension: cost_usd {
    type: number
    sql: (${cost} / 1000000) ;;
  }

  measure: average_interaction_rate {
    label: "Interaction Rate"
    description: "Percent of people that interact with an ad."
    type: number
    sql: ${total_interactions}*1.0/nullif(${total_impressions},0) ;;
    value_format_name: percent_2
  }

  measure: average_click_rate {
    label: "Click Through Rate"
    description: "Percent of people that click on an ad."
    type: number
    sql: ${total_clicks}*1.0/nullif(${total_impressions},0) ;;
    value_format_name: percent_2
  }

  measure: average_cost_per_conversion {
    label: "Cost per Conversion"
    description: "Cost per conversion."
    type: number
    sql: ${total_cost_usd}*1.0 / NULLIF(${total_conversions},0) ;;
    value_format_name: usd
  }

  measure: average_cost_per_click {
    label: "Cost per Click"
    description: "Average cost per ad click."
    type: number
    sql: ${total_cost_usd}*1.0 / NULLIF(${total_clicks},0) ;;
    value_format_name: usd
  }

  measure: average_cost_per_interaction {
    label: "Cost per Interaction"
    description: "Average cost per interaction with an ad."
    type: number
    sql: ${total_cost_usd}*1.0 / NULLIF(${total_interactions},0) ;;
    value_format_name: usd
    link: {
      label: "By Keyword"
      url: "/explore/google_adwords/master_stats?fields=keyword.criteria,master_stats.average_cost_per_interaction&f[master_stats.date_date]=this quarter"
    }
  }

  measure: average_cost_per_impression {
    label: "Cost per Impression"
    description: "Average cost per ad impression viewed."
    type: number
    sql: ${total_cost_usd}*1.0 / NULLIF(${total_impressions},0) ;;
    value_format_name: usd
  }

  measure: average_conversion_rate {
    label: "Conversion Rate"
    description: "Percent of people that convert after they interact with an ad."
    type: number
    sql: ${total_conversions}*1.0 / NULLIF(${total_interactions},0) ;;
    value_format_name: percent_2
  }

  measure: weighted_average_position {
    label: "Average Position"
    description: "Average auction position."
    type: number
    sql: ${average_position}*${total_impressions} / NULLIF(${total_impressions},0) ;;
    value_format_name: decimal_0
  }

  measure: cumulative_spend {
    type: running_total
    sql: ${total_cost_usd} ;;
    drill_fields: [master_stats.date_date, campaign.campaign_name, master_stats.total_cost_usd]
    value_format_name: usd_0
    direction: "column"
  }

  measure: cumulative_conversions {
    type: running_total
    sql: ${total_conversions} ;;
    drill_fields: [master_stats.date_date, campaign.campaign_name, master_stats.total_cost_usd]
    value_format_name: decimal_0
    direction: "column"
  }

  measure: total_clicks {
    label: "Clicks"
    description: "Total ad clicks."
    type: sum
    sql: ${clicks} ;;
    value_format_name: decimal_0
  }

  measure: total_conversions {
    label: "Conversions"
    description: "Total conversions."
    type: sum
    sql: ${conversions} ;;
    value_format_name: decimal_0
  }

  measure: total_conversion_value {
    label: "Conversion Value"
    description: "Total conversion value."
    type: sum
    sql: ${conversion_value} ;;
    value_format_name: decimal_0
  }

  measure: total_cost {
    hidden: yes
    type: sum
    sql: ${cost} ;;
  }

  measure: total_cost_usd {
    label: "Cost"
    description: "Total cost."
    type: sum
    sql: ${cost_usd} ;;
    value_format_name: usd_0
  }

  measure: total_impressions {
    label: "Impressions"
    description: "Total ad impressions."
    type:  sum
    sql:  ${impressions} ;;
    drill_fields: [external_customer_id, total_impressions]
    value_format_name: decimal_0
  }

  measure: total_interactions {
    label: "Interactions"
    description: "Total ad interactions."
    type:  sum
    sql:  ${interactions} ;;
    drill_fields: [external_customer_id, total_impressions]
    value_format_name: decimal_0
  }

}