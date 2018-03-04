include: "master_stats.view"

view: base_expected_conversions {

  dimension: clicks {
    type: number
    hidden: yes
  }
  dimension: conversions {
    type: number
    hidden: yes
  }
  dimension: cost {
    type: number
    hidden: yes
  }
  dimension: cost_usd {
    type: number
    hidden: yes
  }
  dimension: impressions {
    type: number
    hidden: yes
  }
  dimension: interactions {
    type: number
    hidden: yes
  }
  measure: total_impressions {
    type: sum
    sql: ${impressions} ;;
    drill_fields: [total_impressions]
    hidden: yes
  }
  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
    drill_fields: [total_clicks]
    hidden: yes
  }
  measure: total_interactions {
    type: sum
    sql: ${interactions} ;;
    drill_fields: [total_interactions]
    hidden: yes
  }
  measure: total_conversions {
    type: sum
    sql: ${conversions} ;;
    drill_fields: [total_conversions]
    hidden: yes
  }
  measure: total_cost_usd {
    type: sum
    sql: ${cost_usd} ;;
    drill_fields: [total_cost_usd]
    hidden: yes
  }
  measure: total_cost {
    drill_fields: [total_cost]
    hidden: yes
  }
}
view: account_avg_cpa {
  extends: [base_expected_conversions]

  derived_table: {
    explore_source: master_stats {
      column: external_customer_id {}
      column: cost { field: master_stats.total_cost }
      column: cost_usd { field: master_stats.total_cost_usd }
      column: clicks { field: master_stats.total_clicks }
      column: conversions { field: master_stats.total_conversions }
      column: impressions { field: master_stats.total_impressions }
      column: interactions { field: master_stats.total_interactions }
    bind_filters: {
      to_field: master_stats.date_date
      from_field: master_stats.date_date
    }
  }
  }

  dimension: external_customer_id {
    type: string
    primary_key: yes
    hidden: yes
  }

  measure: average_cpa_of_the_account {
    label: "Average CPA of the account"
    description: "Average CPA of the whole account for all time"
    view_label: "Ad Stats"
    hidden: yes
    type: number
    sql: ${total_cost_usd} / NULLIF(${total_conversions},0);;
    value_format_name: usd
  }

  measure: expected_conversions_for_campaign {
    label: "Expected Conversions"
    view_label: "Campaigns"
    description: "Cost divided by average CPA for the account"
    type: number
    sql: ${master_stats.total_cost_usd} / NULLIF(${average_cpa_of_the_account},0) ;;
    value_format_name: decimal_2
  }
}

view: campaign_avg_cpa {
  extends: [base_expected_conversions]

  derived_table: {
    explore_source: master_stats {
      column: external_customer_id {}
      column: campaign_id {}
      column: cost { field: master_stats.total_cost }
      column: cost_usd { field: master_stats.total_cost_usd }
      column: clicks { field: master_stats.total_clicks }
      column: conversions { field: master_stats.total_conversions }
      column: impressions { field: master_stats.total_impressions }
      column: interactions { field: master_stats.total_interactions }
      bind_filters: {
        to_field: master_stats.date_date
        from_field: master_stats.date_date
      }
    }
  }

  dimension: id {
    type: string
    sql: CONCAT(${TABLE}.external_customer_id, ${TABLE}.campaign_id) ;;
    primary_key: yes
    hidden: yes
  }
  dimension: external_customer_id {
    type: number
    hidden: yes
  }
  dimension: campaign_id {
    type: number
    hidden: yes
  }

  measure: average_cpa_of_campaign {
    label: "Average CPA of the campaign"
    description: "Average CPA for the campaign"
    view_label: "Ad Groups"
    hidden: yes
    type: number
    sql: ${total_cost_usd} / NULLIF(${total_conversions},0);;
    value_format_name: usd
  }

  measure: average_ctr_of_campaign {
    label: "Average CTR of the campaign"
    description: "Average Click Through Rate for the campaign"
    view_label: "Ad Groups"
    hidden: yes
    type: number
    sql: ${total_clicks} / NULLIF(${total_impressions},0);;
    value_format_name: usd
  }

  measure: cpa_compared_to_average_for_campaign {
    label: "% of Campaign CPA"
    description: "CPA compared to Average CPA of the campaign"
    view_label: "Ad Groups"
    type: number
    sql: ${master_stats.average_cost_per_conversion} / NULLIF(${average_cpa_of_campaign},0);;
    value_format_name: percent_0
  }

  measure: ctr_compared_to_average_for_campaign {
    description: "CTR compared to Average CTR of the campaign"
    label: "% of Campaign CTR"
    view_label: "Ad Groups"
    type: number
    sql: ${master_stats.average_click_rate} / NULLIF(${average_ctr_of_campaign},0);;
    value_format_name: percent_0
  }

  measure: expected_conversions_for_ad_group {
    label: "Expected Conversions"
    view_label: "Ad Groups"
    description: "Cost divided by average CPA of the campaign"
    type: number
    sql: ${master_stats.total_cost_usd} / NULLIF(${campaign_avg_cpa.average_cpa_of_campaign},0) ;;
    value_format_name: decimal_2
  }
}

view: ad_group_avg_cpa {
  extends: [base_expected_conversions]

  derived_table: {
    explore_source: master_stats {
      column: external_customer_id {}
      column: campaign_id {}
      column: ad_group_id {}
      column: cost { field: master_stats.total_cost }
      column: cost_usd { field: master_stats.total_cost_usd }
      column: clicks { field: master_stats.total_clicks }
      column: conversions { field: master_stats.total_conversions }
      column: impressions { field: master_stats.total_impressions }
      column: interactions { field: master_stats.total_interactions }
    bind_filters: {
      to_field: master_stats.date_date
      from_field: master_stats.date_date
    }
  }}

  dimension: id {
    type: string
    sql: CONCAT(${TABLE}.external_customer_id, ${TABLE}.campaign_id, ${TABLE}.ad_group_id) ;;
    primary_key: yes
    hidden: yes
  }
  dimension: external_customer_id {
    type: number
    hidden: yes
  }
  dimension: ad_group_id {
    type: number
    hidden: yes
  }
  dimension: campaign_id {
    type: number
    hidden: yes
  }

  measure: average_conversion_rate {
    description: "Average Conversion Rate of the ad group"
    label: "Average Conversion Rate of the Ad Group"
    view_label: "Keywords"
    hidden: yes
    type: number
    sql: ${total_conversions} / NULLIF(${total_interactions},0);;
    value_format_name: percent_2
  }

  measure: average_cpa_of_ad_group {
    description: "Average CPA of the ad group"
    label: "Average CPA of the Ad Group"
    view_label: "Ads"
    hidden: yes
    type: number
    sql: ${total_cost_usd} / NULLIF(${total_conversions},0);;
    value_format_name: usd
  }

  measure: average_ctr_of_ad_group {
    description: "Average CTR of the ad group"
    label: "Average Click Through Rate of the Ad Group"
    view_label: "Ads"
    type: number
    sql: ${total_clicks} / NULLIF(${total_impressions},0);;
    value_format_name: percent_2
  }

  measure: cpa_compared_to_average_for_ad_group {
    description: "CPA compared to Average CPA of the ad group"
    label: "% of Ad Group CPA"
    view_label: "Ads"
    type: number
    sql: ${master_stats.average_cost_per_conversion} / NULLIF(${average_cpa_of_ad_group},0);;
    value_format_name: percent_0
  }

  measure: ctr_compared_to_average_for_ad_group {
    description: "CTR compared to Average CTR of the ad group"
    label: "% of Ad Group CTR"
    view_label: "Ads"
    type: number
    sql: ${master_stats.average_click_rate} / NULLIF(${average_ctr_of_ad_group},0);;
    value_format_name: percent_0
  }

  measure: expected_conversions_for_ad {
    label: "Expected Conversions"
    view_label: "Ads"
    description: "Cost divided by average CPA of the Ad Group"
    type: number
    sql: ${master_stats.total_cost_usd} / NULLIF(${ad_group_avg_cpa.average_cpa_of_ad_group},0) ;;
    value_format_name: decimal_2
  }

    measure: expected_conversions_for_keyword {
      label: "Expected Conversions"
      view_label: "Keyword"
      description: "Cost divided by average CPA of the Ad Group"
      type: number
      sql: ${master_stats.total_cost_usd} / NULLIF(${ad_group_avg_cpa.average_cpa_of_ad_group},0) ;;
      value_format_name: decimal_2
    }

    measure: cpa_compared_to_average_for_ad_group_keyword {
      description: "CPA compared to Average CPA of the ad group"
      label: "% of Ad Group CPA"
      view_label: "Keyword"
      type: number
      sql: ${master_stats.average_cost_per_conversion} / NULLIF(${average_cpa_of_ad_group},0);;
      value_format_name: percent_0
    }

    measure: conversion_rate_compared_to_average_for_ad_group {
      description: "Conversion rate compared to Average Conversions of the ad group"
      label: "% of Ad Group Conversion Rate"
      view_label: "Keyword"
      type: number
      sql: ${master_stats.average_conversion_rate} / NULLIF(${average_conversion_rate},0);;
      value_format_name: percent_0
    }
}