
view: kpis_this_period {
  derived_table: {
    explore_source: master_stats {
      column: total_clicks_this_period {field: master_stats.total_clicks }
      column: external_customer_id_this_period {field: master_stats.external_customer_id}
      column: total_conversions_this_period {field: master_stats.total_conversions}
      column: total_impressions_this_period {field: master_stats.total_impressions}
      column: total_interactions_this_period {field: master_stats.total_interactions}
      column: total_cost_usd_this_period {field: master_stats.total_cost_usd}
      bind_filters: {
        to_field: master_stats._data_date
        from_field: kpis_this_period.this_timeframe
      }
    }
  }

  parameter: this_timeframe {
    type: string
    allowed_value: {
      value: "this quarter"
      label: "Quarter"
    }
    allowed_value: {
      value: "this week"
      label: "Week"
    }
    allowed_value: {
      value: "this month"
      label: "Month"
    }
  }

  dimension:  external_customer_id_this_period {
    type: number
    sql: ${TABLE}.external_customer_id_this_period ;;
    hidden: yes
    primary_key: yes
  }

  dimension: total_clicks_this_period {
    type: number
    hidden: yes
    sql: ${TABLE}.total_clicks_this_period ;;
  }

  dimension: total_conversions_this_period {
    type: number
    hidden: yes
    sql: ${TABLE}.total_conversions_this_period;;
  }

  dimension: total_impressions_this_period {
    type: number
    hidden: yes
    sql: ${TABLE}.total_impressions_this_period;;
  }

  dimension: total_interactions_this_period {
    hidden: yes
    type: number
    sql: ${TABLE}.total_interactions_this_period;;
  }

  dimension: total_cost_usd_this_period {
    hidden: yes
    type: number
    sql: ${TABLE}.total_cost_usd_this_period;;
  }

  measure: conversions_this_period {
    type: sum
    sql: ${total_conversions_this_period} ;;
    value_format_name: decimal_0
  }

  measure: total_cost_this_period {
    type: sum
    sql: ${total_cost_usd_this_period} ;;
    value_format_name: usd_0
  }

  measure: clicks_this_period {
    type: sum
    sql: ${total_clicks_this_period} ;;
    value_format_name: decimal_0
  }

  measure: interactions_this_period {
    type: sum
    sql: ${total_interactions_this_period} ;;
    value_format_name: decimal_0
  }

  measure: impressions_this_period {
    type: sum
    sql: ${total_impressions_this_period} ;;
    value_format_name: decimal_0
  }

  measure: avg_conversion_rate_this_period {
    type: number
    sql: ${conversions_this_period} / NULLIF(${clicks_this_period},0) ;;
    value_format_name: percent_2
  }

  measure: avg_interaction_rate_this_period {
    type: number
    sql: ${interactions_this_period} / NULLIF(${impressions_this_period},0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_interaction_this_period {
    type: number
    sql: ${total_cost_this_period} / NULLIF(${interactions_this_period},0) ;;
    value_format_name: usd
  }

  measure: cost_per_conversion_this_period {
    type: number
    sql: ${total_cost_this_period} / NULLIF(${conversions_this_period},0) ;;
    value_format_name: usd
  }
}

view: kpis_last_period {
  derived_table: {
    explore_source: master_stats {
      column: total_clicks_last_period {field: master_stats.total_clicks }
      column: external_customer_id_last_period {field: master_stats.external_customer_id}
      column: total_conversions_last_period {field: master_stats.total_conversions}
      column: total_impressions_last_period {field: master_stats.total_impressions}
      column: total_interactions_last_period {field: master_stats.total_interactions}
      column: total_cost_usd_last_period {field: master_stats.total_cost_usd}
      bind_filters: {
        to_field: master_stats.parameter
        from_field: kpis_last_period.last_timeframe
      }
      bind_filters: {
        to_field: master_stats._data_date
        from_field: kpis_last_period.last_timeframe
      }
      filters: {
        field: master_stats.less_than_current_day_of_period
        value: "Yes"
      }
    }
  }

  parameter: last_timeframe {
    type: string
      allowed_value: {
        value: "1 quarter ago"
        label: "Quarter"
      }
      allowed_value: {
        value: "1 week ago"
        label: "Week"
      }
      allowed_value: {
        value: "1 month ago"
        label: "Month"
      }
  }

  dimension:  external_customer_id_last_period {
    type: number
    sql: ${TABLE}.external_customer_id_last_period ;;
    hidden: yes
    primary_key: yes
  }

  dimension: total_clicks_last_period {
    type: number
    hidden: yes
    sql: ${TABLE}.total_clicks_last_period ;;
  }

  dimension: total_conversions_last_period {
    type: number
    hidden: yes
    sql: ${TABLE}.total_conversions_last_period;;
  }

  dimension: total_impressions_last_period {
    type: number
    hidden: yes
    sql: ${TABLE}.total_impressions_last_period;;
  }

  dimension: total_interactions_last_period {
    hidden: yes
    type: number
    sql: ${TABLE}.total_interactions_last_period;;
  }

  dimension: total_cost_usd_last_period {
    hidden: yes
    type: number
    sql: ${TABLE}.total_cost_usd_last_period;;
  }

  measure: conversions_last_period {
    type: sum
    sql: ${total_conversions_last_period} ;;
    value_format_name: decimal_0
  }

  measure: total_cost_last_period {
    type: sum
    sql: ${total_cost_usd_last_period} ;;
    value_format_name: usd_0
  }

  measure: clicks_last_period {
    type: sum
    sql: ${total_clicks_last_period} ;;
    value_format_name: decimal_0
  }

  measure: interactions_last_period {
    type: sum
    sql: ${total_interactions_last_period} ;;
    value_format_name: decimal_0
  }

  measure: impressions_last_period {
    type: sum
    sql: ${total_impressions_last_period} ;;
    value_format_name: decimal_0
  }

  measure: avg_conversion_rate_last_period {
    type: number
    sql: ${conversions_last_period} / NULLIF(${clicks_last_period},0) ;;
    value_format_name: percent_2
  }

  measure: avg_interaction_rate_last_period {
    type: number
    sql: ${interactions_last_period} / NULLIF(${impressions_last_period},0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_interaction_last_period {
    type: number
    sql: ${total_cost_last_period} / NULLIF(${interactions_last_period},0) ;;
    value_format_name: usd
  }

  measure: cost_per_conversion_last_period {
    type: number
    sql: ${total_cost_last_period} / NULLIF(${conversions_last_period},0) ;;
    value_format_name: usd
  }
}
