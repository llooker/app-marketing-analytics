include: "ad_criterion_base.view"
include: "google_ad_metrics_base.view"
include: "date_base.view"
include: "google_adwords_base.view"

view: ad_impressions {
  extends: [ad_criterion_base, date_base, google_ad_metrics_base, google_adwords_base]

  # this logic hits the right level of aggregate stats table depending on dimensions and filters in query
  sql_table_name:
  {% if (ad._in_query or ad_impressions.creative_id._in_query) %}
    adwords_v201609.AdBasicStats_6747157124
  {% elsif (audience._in_query or ad_impressions.audience_criterion_id._in_query) %}
    adwords_v201609.AudienceBasicStats_6747157124
  {% elsif (keyword._in_query or ad_impressions.criteria_id._in_query) %}
    adwords_v201609.KeywordBasicStats_6747157124
  {% elsif (ad_group._in_query or ad_impressions.ad_group_id._in_query) %}
    {% if ad_impressions.hour_of_day._in_query %}
      adwords_v201609.HourlyAdGroupStats_6747157124
    {% else %}
      adwords_v201609.AdGroupBasicStats_6747157124
    {% endif %}
  {% elsif (campaign._in_query or ad_impressions.campaign_id._in_query) %}
    {% if ad_impressions.hour_of_day._in_query %}
      adwords_v201609.HourlyCampaignStats_6747157124
    {% else %}
      adwords_v201609.CampaignBasicStats_6747157124
    {% endif %}
  {% else %}
    {% if ad_impressions.hour_of_day._in_query %}
      adwords_v201609.HourlyAccountStats_6747157124
    {% else %}
      adwords_v201609.AccountBasicStats_6747157124
    {% endif %}
  {% endif %} ;;

  dimension: hour_of_day {
    hidden: yes
    type: number
    sql: ${TABLE}.HourOfDay ;;
  }

  dimension: audience_criterion_id {
    hidden: yes
    sql: ${TABLE}.CriterionId ;;
  }

  dimension: active_view_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.ActiveViewImpressions ;;
  }

  dimension: active_view_measurability {
    hidden: yes
    type: number
    sql: ${TABLE}.ActiveViewMeasurability ;;
  }

  dimension: active_view_measurable_cost {
    hidden: yes
    type: number
    sql: ${TABLE}.ActiveViewMeasurableCost ;;
  }

  dimension: active_view_measurable_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.ActiveViewMeasurableImpressions ;;
  }

  dimension: active_view_viewability {
    hidden: yes
    type: number
    sql: ${TABLE}.ActiveViewViewability ;;
  }

  dimension: ad_group_id {
    hidden: yes
    sql: ${TABLE}.AdGroupId ;;
  }

  dimension: ad_group_id_string {
    hidden: yes
    sql: CAST(${ad_group_id} as STRING) ;;
  }

  dimension: ad_network_type1 {
    hidden: yes
    type: string
    sql: ${TABLE}.AdNetworkType1 ;;
  }

  dimension: ad_network_type2 {
    hidden: yes
    type: string
    sql: ${TABLE}.AdNetworkType2 ;;
  }

  dimension: base_ad_group_id {
    hidden: yes
    sql: ${TABLE}.BaseAdGroupId ;;
  }

  dimension: base_campaign_id {
    hidden: yes
    sql: ${TABLE}.BaseCampaignId ;;
  }

  dimension: campaign_id {
    hidden: yes
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: campaign_id_string {
    hidden: yes
    sql: CAST(${campaign_id} as STRING) ;;
  }

  dimension: creative_id {
    hidden: yes
    sql: ${TABLE}.CreativeId ;;
  }

  dimension: creative_id_string {
    hidden: yes
    sql: CAST(${creative_id} as STRING) ;;
  }

  dimension: criterion_id {
    hidden: yes
    sql: ${TABLE}.CriterionId ;;
  }

  dimension: criterion_id_string {
    hidden: yes
    sql: CAST(${criterion_id} as STRING) ;;
  }

  dimension: device {
    hidden: yes
    type: string
    sql: ${TABLE}.Device ;;
  }

  dimension: interaction_types {
    hidden: yes
    type: string
    sql: ${TABLE}.InteractionTypes ;;
  }

  dimension: slot {
    hidden: yes
    type: string
    sql: ${TABLE}.Slot ;;
  }

  dimension: view_through_conversions {
    hidden: yes
    type: number
    sql: ${TABLE}.ViewThroughConversions ;;
  }

  dimension: ad_network_type {
    type: string
    case: {
      when: {
        sql: ${ad_network_type1} = 'SHASTA_AD_NETWORK_TYPE_1_SEARCH' AND ${ad_network_type2} = 'SHASTA_AD_NETWORK_TYPE_2_SEARCH' ;;
        label: "Search"
      }
      when: {
        sql: ${ad_network_type1} = 'SHASTA_AD_NETWORK_TYPE_1_SEARCH' AND ${ad_network_type2} = 'SHASTA_AD_NETWORK_TYPE_2_SEARCH_PARTNERS' ;;
        label: "Search Partners"
      }
      when: {
        sql: ${ad_network_type1} = 'SHASTA_AD_NETWORK_TYPE_1_CONTENT' ;;
        label: "Content"
      }
      else: "Other"
    }
  }

  dimension: device_type {
    type: string
    case: {
      when: {
        sql: ${device} LIKE '%Desktop%' ;;
        label: "Desktop"
      }
      when: {
        sql: ${device} LIKE '%Mobile%' ;;
        label: "Mobile"
      }
      when: {
        sql: ${device} LIKE '%Tablet%' ;;
        label: "Tablet"
      }
      else: "Other"
    }
  }

  measure: total_impressions {
  }
  measure: total_clicks {
  }
  measure: total_conversions {
    drill_fields: [ad_impressions.date_date, campaign.campaign_name, ad_impressions.total_conversions]
  }
  measure: total_cost {
    drill_fields: [ad_impressions.date_date, campaign.campaign_name, ad_impressions.total_cost]
  }
  measure: average_click_rate {
    link: {
      label: "By Keyword"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=keyword.criteria,ad_impressions.average_click_rate&f[ad_impressions.date_date]=this quarter"
    }
  }
  measure: average_conversion_rate {
  }
  measure: average_cost_per_click {
  }
  measure: average_cost_per_conversion {
    drill_fields: [ad_impressions.date_date, campaign.campaign_name, ad_impressions.total_conversions]
  }
  measure: cost_this_month {
    type: sum
    sql: ${cost} ;;
    filters: {
      field: date_date
      value: "this month"
    }
    hidden: yes
  }
  measure: conversions_this_month {
    type: sum
    sql: ${conversions} ;;
    filters: {
      field: date_date
      value: "this month"
    }
    hidden: yes
  }
  measure: cost_per_conversion_this_month {
    type: number
    sql: ${cost_this_month} / NULLIF(${conversions_this_month},0) ;;
    value_format_name: usd
    group_label: "Monthly Comparisons"
  }
  measure: cost_last_month {
    type: sum
    sql: ${cost} ;;
    filters: {
      field: date_date
      value: "last month"
    }
    filters: {
      field: less_than_current_day_of_month
      value: "yes"
    }
    hidden: yes
  }
  measure: conversions_last_month {
    type: sum
    sql: ${conversions} ;;
    filters: {
      field: date_date
      value: "last month"
    }
    filters: {
      field: less_than_current_day_of_month
      value: "yes"
    }
    hidden: yes
  }
  measure: cost_per_conversion_last_month {
    type: number
    sql: ${cost_last_month} / NULLIF(${conversions_last_month},0) ;;
    value_format_name: usd
    group_label: "Monthly Comparisons"
  }
  measure: cost_per_conversion_monthly_change {
    type: number
    sql: (${cost_per_conversion_this_month}  - ${cost_per_conversion_last_month}) / NULLIF(${cost_per_conversion_last_month},0) ;;
    value_format_name: percent_1
    group_label: "Monthly Comparisons"
  }
  measure: cpa_monthly_change_absolute_value {
    label: "CPA Monthly Change Absolute Value"
    type: number
    sql: ABS(${cost_per_conversion_monthly_change}) ;;
    value_format_name: percent_1
    group_label: "Monthly Comparisons"
  }

  measure: clicks_this_month {
    type: sum
    sql: ${clicks} ;;
    filters: {
      field: date_date
      value: "this month"
    }
    hidden: yes
  }
  measure: impressions_this_month {
    type: sum
    sql: ${impressions} ;;
    filters: {
      field: date_date
      value: "this month"
    }
    hidden: yes
  }
  measure: click_through_rate_this_month {
    type: number
    sql: ${clicks_this_month} / NULLIF(${impressions_this_month},0) ;;
    value_format_name: percent_1
    group_label: "Monthly Comparisons"
  }
  measure: clicks_last_month {
    type: sum
    sql: ${clicks} ;;
    filters: {
      field: date_date
      value: "last month"
    }
    filters: {
      field: less_than_current_day_of_month
      value: "yes"
    }
    hidden: yes
  }
  measure: impressions_last_month {
    type: sum
    sql: ${impressions} ;;
    filters: {
      field: date_date
      value: "last month"
    }
    filters: {
      field: less_than_current_day_of_month
      value: "yes"
    }
    hidden: yes
  }
  measure: click_through_rate_last_month {
    type: number
    sql: ${clicks_last_month} / NULLIF(${impressions_last_month},0) ;;
    value_format_name: percent_1
    group_label: "Monthly Comparisons"
  }
  measure: click_through_rate_monthly_change {
    type: number
    sql: (${click_through_rate_this_month}  - ${click_through_rate_last_month}) / NULLIF(${click_through_rate_last_month},0) ;;
    value_format_name: percent_1
    group_label: "Monthly Comparisons"
  }
  measure: click_through_rate_absolute_value {
    label: "CTR Monthly Change Absolute Value"
    type: number
    sql: ABS(${click_through_rate_monthly_change}) ;;
    value_format_name: percent_1
    group_label: "Monthly Comparisons"
  }
  measure: interactions_this_month {
    type: sum
    sql: ${interactions} ;;
    filters: {
      field: date_date
      value: "this month"
    }
    hidden: yes
  }
  measure: conversion_rate_this_month {
    type: number
    sql: ${conversions_this_month} / NULLIF(${interactions_this_month},0) ;;
    value_format_name: percent_1
    group_label: "Monthly Comparisons"
  }
  measure: interactions_last_month {
    type: sum
    sql: ${interactions} ;;
    filters: {
      field: date_date
      value: "last month"
    }
    filters: {
      field: less_than_current_day_of_month
      value: "yes"
    }
    hidden: yes
  }
  measure: conversion_rate_last_month {
    type: number
    sql: ${conversions_last_month} / NULLIF(${interactions_last_month},0) ;;
    value_format_name: percent_1
    group_label: "Monthly Comparisons"
  }
  measure: conversion_rate_monthly_change {
    type: number
    sql: (${conversion_rate_this_month}  - ${conversion_rate_last_month}) / NULLIF(${conversion_rate_last_month},0) ;;
    value_format_name: percent_1
    group_label: "Monthly Comparisons"
  }
  measure: conversion_rate_absolute_value {
    label: "Conversion Rate Monthly Change Absolute Value"
    type: number
    sql: ABS(${conversion_rate_monthly_change}) ;;
    value_format_name: percent_1
    group_label: "Monthly Comparisons"
  }
  measure: cost_per_click_this_month {
    type: number
    sql: ${cost_this_month} / NULLIF(${clicks_this_month},0) ;;
    value_format_name: usd
    group_label: "Monthly Comparisons"
  }
  measure: cost_per_click_last_month {
    type: number
    sql: ${cost_last_month} / NULLIF(${clicks_last_month},0) ;;
    value_format_name: usd
    group_label: "Monthly Comparisons"
  }
  measure: cost_per_click_monthly_change {
    type: number
    sql: (${cost_per_click_this_month}  - ${cost_per_click_last_month}) / NULLIF(${cost_per_click_last_month},0) ;;
    value_format_name: percent_1
    group_label: "Monthly Comparisons"
  }
  measure: cost_per_click_absolute_value {
    label: "CPC Monthly Change Absolute Value"
    type: number
    sql: ABS(${cost_per_click_monthly_change}) ;;
    value_format_name: percent_1
    group_label: "Monthly Comparisons"
  }



}
