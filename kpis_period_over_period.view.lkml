
view: kpis_this_period {
  derived_table: {
    explore_source: master_stats {
      column: campaign_name { field: campaign.campaign_name }
      column: ad_group_name { field: ad_group.ad_group_name }
      column: total_clicks_this_period {field: master_stats.total_clicks }
      column: external_customer_id_this_period {field: master_stats.external_customer_id}
      column: total_conversions_this_period {field: master_stats.total_conversions}
      column: total_impressions_this_period {field: master_stats.total_impressions}
      column: total_interactions_this_period {field: master_stats.total_interactions}
      column: total_cost_usd_this_period {field: master_stats.total_cost_usd}
      column: total_cost_any_currency_this_period {field: master_stats.total_cost}
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

  dimension:  campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension:  id {
    type: string
    sql: COALESCE(${TABLE}.campaign_name, ${TABLE}.ad_group_name, ${TABLE}.external_customer_id_this_period) ;;
    primary_key: yes
  }

  dimension:  ad_group_name {
    type: string
    sql: ${TABLE}.ad_group_name ;;
  }

  dimension:  external_customer_id_this_period {
    type: string
    sql: ${TABLE}.external_customer_id_this_period ;;
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

  dimension: total_cost_any_currency_this_period {
    hidden: yes
    type: number
    sql: ${TABLE}.total_cost_any_currency_this_period;;
  }

  measure: conversions_this_period {
    type: sum
    sql: ${total_conversions_this_period} ;;
    value_format_name: decimal_0
    link: {
      label: "By Campaign"
      url: "/explore/google_adwords/master_stats?fields=campaign.campaign_name,master_stats.total_conversions&f[master_stats._data_date]=this quarter"
    }
    link: {
      label: "Conversions Dashboard"
      url: "/dashboards/google_adwords::campaign_metrics_conversions?Campaign={{_filters['kpis_last_period.campaign_name'] | url_encode  }}&Ad%20Group={{_filters['kpis_last_period.ad_group_name'] | url_encode  }}"
    }
  }

  measure: total_cost_this_period {
    type: sum
    sql: ${total_cost_usd_this_period} ;;
    value_format_name: usd_0
    link: {
      label: "By Campaign"
      url: "/explore/google_adwords/master_stats?fields=campaign.campaign_name,master_stats.total_cost_usd&f[master_stats._data_date]=this quarter"
    }
    link: {
      label: "Spend Dashboard"
      url: "/dashboards/google_adwords::campaign_metrics_spend?Campaign={{_filters['kpis_last_period.campaign_name'] | url_encode  }}&Ad%20Group={{_filters['kpis_last_period.ad_group_name'] | url_encode  }}"
    }
  }

  measure: cost_any_currency_this_period {
    type: sum
    sql: ${total_cost_any_currency_this_period} ;;
    value_format_name: decimal_0
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
    link: {
      label: "By Campaign"
      url: "/explore/google_adwords/master_stats?fields=campaign.campaign_name,master_stats.average_conversion_rate&f[master_stats._data_date]=this quarter"
    }
    link: {
      label: "Conversion Rate Dashboard"
      url: "/dashboards/google_adwords::campaign_metrics_conversion_rate?Campaign={{_filters['kpis_last_period.campaign_name'] | url_encode  }}&Ad%20Group={{_filters['kpis_last_period.ad_group_name'] | url_encode  }}"
    }
  }

  measure: avg_interaction_rate_this_period {
    type: number
    sql: ${interactions_this_period} / NULLIF(${impressions_this_period},0) ;;
    value_format_name: percent_2
    link: {
      label: "By Keyword"
      url: "/explore/google_adwords/master_stats?fields=keyword.criteria,master_stats.average_interaction_rate&f[master_stats._data_date]=this quarter"
    }
  }

  measure: avg_click_rate_this_period {
    type: number
    sql: ${clicks_this_period} / NULLIF(${impressions_this_period},0) ;;
    value_format_name: percent_2
    link: {
      label: "By Keyword"
      url: "/explore/google_adwords/master_stats?fields=keyword.criteria,master_stats.average_click_rate&f[master_stats._data_date]=this quarter"
    }
    link: {
      label: "Click Rate Dashboard"
      url: "/dashboards/google_adwords::campaign_metrics_click_through_rate?Campaign={{_filters['kpis_last_period.campaign_name'] | url_encode  }}&Ad%20Group={{_filters['kpis_last_period.ad_group_name'] | url_encode  }}"
    }
  }

  measure: cost_per_interaction_this_period {
    type: number
    sql: ${total_cost_this_period} / NULLIF(${interactions_this_period},0) ;;
    value_format_name: usd
    link: {
      label: "By Keyword"
      url: "/explore/google_adwords/master_stats?fields=keyword.criteria,master_stats.average_interaction_rate&f[master_stats._data_date]=this quarter"
    }
  }

  measure: cost_per_click_this_period {
    type: number
    sql: ${total_cost_this_period} / NULLIF(${clicks_this_period},0) ;;
    value_format_name: usd
    link: {
      label: "By Keyword"
      url: "/explore/google_adwords/master_stats?fields=keyword.criteria,master_stats.average_click_rate&f[master_stats._data_date]=this quarter"
    }
    link: {
      label: "Cost Per Click Dashboard"
      url: "/dashboards/google_adwords::campaign_metrics_cost_per_click?Campaign={{_filters['kpis_last_period.campaign_name'] | url_encode  }}&Ad%20Group={{_filters['kpis_last_period.ad_group_name'] | url_encode  }}"
    }
  }

  measure: cost_per_conversion_this_period {
    type: number
    sql: ${total_cost_this_period} / NULLIF(${conversions_this_period},0) ;;
    value_format_name: usd
    link: {
      label: "By Campaign"
      url: "/explore/google_adwords/master_stats?fields=campaign.campaign_name,master_stats.average_cost_per_conversion&f[master_stats._data_date]=this quarter"
    }
    link: {
      label: "Cost Per Conversion Dashboard"
      url: "/dashboards/google_adwords::campaign_metrics_cost_per_conversion?Campaign={{_filters['kpis_last_period.campaign_name'] | url_encode  }}&Ad%20Group={{_filters['kpis_last_period.ad_group_name'] | url_encode  }}"
    }
  }
}

view: kpis_last_period {
  derived_table: {
    explore_source: master_stats {
      column: campaign_name { field: campaign.campaign_name }
      column: ad_group_name { field: ad_group.ad_group_name }
      column: total_clicks_last_period {field: master_stats.total_clicks }
      column: external_customer_id_last_period {field: master_stats.external_customer_id}
      column: total_conversions_last_period {field: master_stats.total_conversions}
      column: total_impressions_last_period {field: master_stats.total_impressions}
      column: total_interactions_last_period {field: master_stats.total_interactions}
      column: total_cost_usd_last_period {field: master_stats.total_cost_usd}
      column: total_cost_any_currency_last_period {field: master_stats.total_cost}
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
