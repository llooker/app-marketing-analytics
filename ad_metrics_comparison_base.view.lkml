view: ad_metrics_comparison_base {
  extension: required

  measure: average_click_rate_ratio {
    type: number
    sql: ${campaign_fact.average_click_rate} / ${account_fact.average_click_rate} ;;
    value_format_name: decimal_2
  }
  measure: average_conversion_rate_ratio {
    type: number
    sql: ${campaign_fact.average_conversion_rate} / ${account_fact.average_conversion_rate} ;;
    value_format_name: decimal_2
  }
  measure: total_clicks_delta {
    type: number
    sql: ${account_fact.total_clicks} - ${campaign_fact.total_clicks} ;;
  }
  measure: total_impressions_delta {
    type: number
    sql: ${account_fact.total_impressions} - ${campaign_fact.total_impressions} ;;
  }
  measure: total_conversions_delta {
    type: number
    sql: ${account_fact.total_conversions} - ${campaign_fact.total_conversions} ;;
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
      (${campaign_fact.average_click_rate}) -
      (${average_click_rate_delta})
    ) /
    SQRT(
      ${account_fact.average_click_rate} *
      (1 - ${account_fact.average_click_rate}) *
      (1 / ${campaign_fact.total_impressions} + 1 / ${total_impressions_delta})
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
      (${campaign_fact.average_conversion_rate}) -
      (${average_conversion_rate_delta})
    ) /
    SQRT(
      ${account_fact.average_conversion_rate} *
      (1 - ${account_fact.average_conversion_rate}) *
      (1 / ${campaign_fact.total_clicks} + 1 / ${total_impressions_delta})
    ) ;;
    value_format_name: decimal_2
  }
  measure: average_conversion_rate_significant {
    type: yesno
    sql:  (${average_conversion_rate_z_score} > 1.96) OR
      (${average_conversion_rate_z_score} < -1.96) ;;
  }
}
