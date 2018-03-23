view: ad_metrics_parent_comparison_base {
  extension: required

  measure: total_cost_delta {
    type: number
    sql: ${parent_fact.total_cost} - ${fact.total_cost} ;;
  }
  measure: total_impressions_delta {
    type: number
    sql: ${parent_fact.total_impressions} - ${fact.total_impressions} ;;
  }
  measure: total_clicks_delta {
    type: number
    sql: ${parent_fact.total_clicks} - ${fact.total_clicks} ;;
  }
  measure: total_conversions_delta {
    type: number
    sql: ${parent_fact.total_conversions} - ${fact.total_conversions} ;;
  }
  measure: total_conversionvalue_delta {
    type: number
    sql: ${parent_fact.total_conversionvalue} - ${fact.total_conversionvalue} ;;
  }
  measure: average_click_rate_ratio {
    type: number
    sql: ${fact.average_click_rate} / ${parent_fact.average_click_rate} ;;
    value_format_name: decimal_2
  }
  measure: average_conversion_rate_ratio {
    type: number
    sql: ${fact.average_conversion_rate} / ${parent_fact.average_conversion_rate} ;;
    value_format_name: decimal_2
  }
  measure: average_cost_per_conversion_delta {
    type: number
    sql: ${total_cost_delta}*1.0 / NULLIF(${total_conversions_delta},0) ;;
    value_format_name: usd
  }
  measure: average_cost_per_click_delta {
    type: number
    sql: ${total_cost_delta}*1.0 / NULLIF(${total_clicks_delta},0) ;;
    value_format_name: usd
    drill_fields: [ad_impressions.date_date, campaign.campaign_name, average_cost_per_click]
  }
  measure: average_cost_per_impression_delta {
    type: number
    sql: ${total_cost_delta}*1.0 / NULLIF(${total_impressions_delta},0) ;;
    value_format_name: usd
  }
  measure: average_cost_per_conversion_delta_ratio {
    type: number
    sql: ${fact.average_cost_per_conversion} / ${average_cost_per_conversion_delta} ;;
    value_format_name: decimal_2
  }
  measure: average_cost_per_click_delta_ratio {
    type: number
    sql: ${fact.average_cost_per_click} / ${average_cost_per_click_delta} ;;
    value_format_name: decimal_2
  }
  measure: average_cost_per_impression_delta_ratio {
    type: number
    sql: ${fact.average_cost_per_impression} / ${average_cost_per_impression_delta} ;;
    value_format_name: decimal_2
  }
  measure: average_click_rate_delta {
    type: number
    sql: ${total_clicks_delta}*1.0/nullif(${total_impressions_delta},0) ;;
    value_format_name: percent_2
  }
  measure: average_conversion_rate_delta {
    type: number
    sql: ${total_conversions_delta}*1.0/nullif(${total_clicks_delta},0) ;;
    value_format_name: percent_2
  }
  measure: average_click_rate_z_score {
    type: number
    sql:
    (
      (${fact.average_click_rate}) -
      (${average_click_rate_delta})
    ) /
    SQRT(
      ${parent_fact.average_click_rate} *
      (1 - ${parent_fact.average_click_rate}) *
      (1 / ${fact.total_impressions} + 1 / ${total_impressions_delta})
    ) ;;
    value_format_name: decimal_2
  }
  measure: average_click_rate_significant {
    type: yesno
    sql:  (${average_click_rate_z_score} > 1.96) OR
      (${average_click_rate_z_score} < -1.96) ;;
  }
  measure: average_conversion_rate_z_score {
    type: number
    sql:
    (
      (${fact.average_conversion_rate}) -
      (${average_conversion_rate_delta})
    ) /
    SQRT(
      ${parent_fact.average_conversion_rate} *
      (1 - ${parent_fact.average_conversion_rate}) *
      (1 / ${fact.total_clicks} + 1 / ${total_impressions_delta})
    ) ;;
    value_format_name: decimal_2
  }
  measure: average_conversion_rate_significant {
    type: yesno
    sql:  (${average_conversion_rate_z_score} > 1.96) OR
      (${average_conversion_rate_z_score} < -1.96) ;;
  }
}
