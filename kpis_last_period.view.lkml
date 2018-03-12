view: kpis_last_period {
  derived_table: {
    explore_source: ad_impressions {
      column: campaign_name { field: campaign.campaign_name }
      column: ad_group_name { field: ad_group.ad_group_name }
      column: total_clicks_last_period {field: ad_impressions.total_clicks }
      column: external_customer_id_last_period {field: ad_impressions.external_customer_id}
      column: total_conversions_last_period {field: ad_impressions.total_conversions}
      column: total_impressions_last_period {field: ad_impressions.total_impressions}
      column: total_interactions_last_period {field: ad_impressions.total_interactions}
      column: total_cost_usd_last_period {field: ad_impressions.total_cost_usd}
      column: total_cost_any_currency_last_period {field: ad_impressions.total_cost}
      bind_filters: {
        to_field: ad_impressions.period
        from_field: kpis_last_period.last_timeframe
      }
      bind_filters: {
        to_field: ad_impressions.date_date
        from_field: kpis_last_period.last_timeframe
      }
      filters: {
        field: ad_impressions.less_than_current_day_of_period
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


  dimension:  campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension:  ad_group_name {
    type: string
    sql: ${TABLE}.ad_group_name ;;
  }

  dimension:  id {
    type: string
    sql: COALESCE(${TABLE}.campaign_name, ${TABLE}.ad_group_name, ${TABLE}.external_customer_id_last_period) ;;
    primary_key: yes
  }

  dimension:  external_customer_id_last_period {
    type: string
    sql: ${TABLE}.external_customer_id_last_period ;;
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

  dimension: total_cost_any_currency_last_period {
    hidden: yes
    type: number
    sql: ${TABLE}.total_cost_any_currency_last_period;;
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


  measure: cost_any_currency_last_period {
    type: sum
    sql: ${total_cost_any_currency_last_period} ;;
    value_format_name: decimal_0
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

  measure: avg_click_rate_last_period {
    type: number
    sql: ${clicks_last_period} / NULLIF(${impressions_last_period},0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_interaction_last_period {
    type: number
    sql: ${total_cost_last_period} / NULLIF(${interactions_last_period},0) ;;
    value_format_name: usd
  }

  measure: cost_per_click_last_period {
    type: number
    sql: ${total_cost_last_period} / NULLIF(${clicks_last_period},0) ;;
    value_format_name: usd
  }

  measure: cost_per_conversion_last_period {
    type: number
    sql: ${total_cost_last_period} / NULLIF(${conversions_last_period},0) ;;
    value_format_name: usd
  }
}
