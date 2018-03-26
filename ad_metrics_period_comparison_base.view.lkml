view: ad_metrics_period_comparison_base {
  extension: required

  measure: total_cost_period_delta {
    type: number
    sql: ${fact.total_cost} - ${last_fact.total_cost} ;;
    group_label: "Period Comparisons"
  }
  measure: total_impressions_period_delta {
    type: number
    sql: ${fact.total_impressions} - ${last_fact.total_impressions} ;;
    group_label: "Period Comparisons"
  }
  measure: total_clicks_period_delta {
    type: number
    sql: ${fact.total_clicks} - ${last_fact.total_clicks} ;;
    group_label: "Period Comparisons"
  }
  measure: total_conversions_period_delta {
    type: number
    sql: ${fact.total_conversions} - ${last_fact.total_conversions} ;;
    group_label: "Period Comparisons"
  }
  measure: total_conversionvalue_period_delta {
    type: number
    sql: ${fact.total_conversionvalue} - ${last_fact.total_conversionvalue} ;;
    group_label: "Period Comparisons"
  }
  measure: average_click_rate_period_percent_change {
    type: number
    sql: (${fact.average_click_rate} - ${last_fact.average_click_rate}) / NULLIF(${last_fact.average_click_rate}, 0) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_click_rate_period_percent_change_abs {
    type: number
    sql: abs(${fact.average_click_rate_period_percent_change}) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_conversion_rate_period_percent_change {
    type: number
    sql: (${fact.average_conversion_rate} - ${last_fact.average_conversion_rate}) / NULLIF(${last_fact.average_conversion_rate}, 0) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_conversion_rate_period_percent_change_abs {
    type: number
    sql: abs(${fact.average_conversion_rate_period_percent_change}) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_cost_per_click_period_percent_change {
    type: number
    sql: (${fact.average_cost_per_click} - ${last_fact.average_cost_per_click}) / NULLIF(${last_fact.average_cost_per_click}, 0) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_cost_per_click_period_percent_change_abs {
    type: number
    sql: abs(${fact.average_cost_per_click_period_percent_change}) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_cost_per_conversion_period_percent_change {
    type: number
    sql: (${fact.average_cost_per_conversion} - ${last_fact.average_cost_per_conversion}) / NULLIF(${last_fact.average_cost_per_conversion}, 0) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_cost_per_conversion_period_percent_change_abs {
    type: number
    sql: abs(${fact.average_cost_per_conversion_period_percent_change}) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_click_rate_period_z_score {
    type: number
    sql:
    (
      (${fact.average_click_rate}) -
      (${last_fact.average_click_rate})
    ) /
    SQRT(
      (${fact.total_clicks} + ${last_fact.total_clicks}) / (${fact.total_impressions} + ${last_fact.total_impressions}) *
      (1 - (${fact.total_clicks} + ${last_fact.total_clicks}) / (${fact.total_impressions} + ${last_fact.total_impressions})) *
      ((1 / NULLIF(${fact.total_impressions},0)) + (1 / NULLIF(${last_fact.total_impressions},0)))
    ) ;;
    group_label: "Period Comparisons"
    value_format_name: decimal_2
  }
  measure: average_click_rate_period_significant {
    type: yesno
    sql:  (${fact.average_click_rate_period_z_score} > 1.96) OR
      (${fact.average_click_rate_period_z_score} < -1.96) ;;
    group_label: "Period Comparisons"
  }
  measure: average_click_rate_period_better {
    type: yesno
    sql:  ${fact.average_click_rate} > ${last_fact.average_click_rate} ;;
    group_label: "Period Comparisons"
  }
  measure: average_conversion_rate_period_z_score {
    type: number
    sql:
    (
      (${fact.average_conversion_rate}) -
      (${last_fact.average_conversion_rate})
    ) /
    SQRT(
      (${fact.total_conversions} + ${last_fact.total_conversions}) / (${fact.total_clicks} + ${last_fact.total_clicks}) *
      (1 - (${fact.total_conversions} + ${last_fact.total_conversions}) / (${fact.total_clicks} + ${last_fact.total_clicks})) *
      ((1 / NULLIF(${fact.total_clicks},0)) + (1 / NULLIF(${last_fact.total_clicks},0)))
    ) ;;
    group_label: "Period Comparisons"
    value_format_name: decimal_2
  }
  measure: average_conversion_rate_period_significant {
    type: yesno
    sql:  (${fact.average_conversion_rate_period_z_score} > 1.96) OR
      (${fact.average_conversion_rate_period_z_score} < -1.96) ;;
    group_label: "Period Comparisons"
  }
  measure: average_conversion_rate_period_better {
    type: yesno
    sql:  ${fact.average_conversion_rate} > ${last_fact.average_conversion_rate} ;;
    group_label: "Period Comparisons"
  }

  set: ad_metrics_period_comparison_set {
    fields: [
      total_cost_period_delta,
      total_clicks_period_delta,
      total_conversions_period_delta,
      total_impressions_period_delta,
      total_conversionvalue_period_delta,
      average_click_rate_period_percent_change,
      average_click_rate_period_percent_change_abs,
      average_conversion_rate_period_percent_change,
      average_conversion_rate_period_percent_change_abs,
      average_cost_per_click_period_percent_change,
      average_cost_per_click_period_percent_change_abs,
      average_cost_per_conversion_period_percent_change,
      average_cost_per_conversion_period_percent_change_abs,
      average_click_rate_period_z_score,
      average_click_rate_period_significant,
      average_click_rate_period_better,
      average_conversion_rate_period_z_score,
      average_conversion_rate_period_significant,
      average_conversion_rate_period_better
    ]
  }

}
