view: kpis_this_period {
  derived_table: {
    explore_source: ad_impressions {
      column: campaign_name { field: campaign.campaign_name }
      column: ad_group_name { field: ad_group.ad_group_name }
      column: total_clicks_this_period {field: ad_impressions.total_clicks }
      column: external_customer_id_this_period {field: ad_impressions.external_customer_id}
      column: total_conversions_this_period {field: ad_impressions.total_conversions}
      column: total_impressions_this_period {field: ad_impressions.total_impressions}
      column: total_interactions_this_period {field: ad_impressions.total_interactions}
      column: total_cost_usd_this_period {field: ad_impressions.total_cost_usd}
      column: total_cost_any_currency_this_period {field: ad_impressions.total_cost}
      bind_filters: {
        to_field: ad_impressions.date_date
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
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=campaign.campaign_name,ad_impressions.total_conversions&f[ad_impressions.date_date]=this quarter"
    }
    link: {
      label: "Conversions Dashboard"
      url: "/dashboards/looker_app_google_adwords::campaign_metrics_conversions?Campaign={{_filters['kpis_last_period.campaign_name'] | url_encode  }}&Ad%20Group={{_filters['kpis_last_period.ad_group_name'] | url_encode  }}"
    }
  }

  measure: total_cost_this_period {
    type: sum
    sql: ${total_cost_usd_this_period} ;;
    value_format_name: usd_0
    link: {
      label: "By Campaign"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=campaign.campaign_name,ad_impressions.total_cost_usd&f[ad_impressions.date_date]=this quarter"
    }
    link: {
      label: "Spend Dashboard"
      url: "/dashboards/looker_app_google_adwords::campaign_metrics_spend?Campaign={{_filters['kpis_last_period.campaign_name'] | url_encode  }}&Ad%20Group={{_filters['kpis_last_period.ad_group_name'] | url_encode  }}"
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
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=campaign.campaign_name,ad_impressions.average_conversion_rate&f[ad_impressions.date_date]=this quarter"
    }
    link: {
      label: "Conversion Rate Dashboard"
      url: "/dashboards/looker_app_google_adwords::campaign_metrics_conversion_rate?Campaign={{_filters['kpis_last_period.campaign_name'] | url_encode  }}&Ad%20Group={{_filters['kpis_last_period.ad_group_name'] | url_encode  }}"
    }
  }

  measure: avg_interaction_rate_this_period {
    type: number
    sql: ${interactions_this_period} / NULLIF(${impressions_this_period},0) ;;
    value_format_name: percent_2
    link: {
      label: "By Keyword"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=keyword.criteria,ad_impressions.average_interaction_rate&f[ad_impressions.date_date]=this quarter"
    }
  }

  measure: avg_click_rate_this_period {
    type: number
    sql: ${clicks_this_period} / NULLIF(${impressions_this_period},0) ;;
    value_format_name: percent_2
    link: {
      label: "By Keyword"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=keyword.criteria,ad_impressions.average_click_rate&f[ad_impressions.date_date]=this quarter"
    }
    link: {
      label: "Click Rate Dashboard"
      url: "/dashboards/looker_app_google_adwords::campaign_metrics_click_through_rate?Campaign={{_filters['kpis_last_period.campaign_name'] | url_encode  }}&Ad%20Group={{_filters['kpis_last_period.ad_group_name'] | url_encode  }}"
    }
  }

  measure: cost_per_interaction_this_period {
    type: number
    sql: ${total_cost_this_period} / NULLIF(${interactions_this_period},0) ;;
    value_format_name: usd
    link: {
      label: "By Keyword"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=keyword.criteria,ad_impressions.average_interaction_rate&f[ad_impressions.date_date]=this quarter"
    }
  }

  measure: cost_per_click_this_period {
    type: number
    sql: ${total_cost_this_period} / NULLIF(${clicks_this_period},0) ;;
    value_format_name: usd
    link: {
      label: "By Keyword"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=keyword.criteria,ad_impressions.average_click_rate&f[ad_impressions.date_date]=this quarter"
    }
    link: {
      label: "Cost Per Click Dashboard"
      url: "/dashboards/looker_app_google_adwords::campaign_metrics_cost_per_click?Campaign={{_filters['kpis_last_period.campaign_name'] | url_encode  }}&Ad%20Group={{_filters['kpis_last_period.ad_group_name'] | url_encode  }}"
    }
  }

  measure: cost_per_conversion_this_period {
    type: number
    sql: ${total_cost_this_period} / NULLIF(${conversions_this_period},0) ;;
    value_format_name: usd
    link: {
      label: "By Campaign"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=campaign.campaign_name,ad_impressions.average_cost_per_conversion&f[ad_impressions.date_date]=this quarter"
    }
    link: {
      label: "Cost Per Conversion Dashboard"
      url: "/dashboards/looker_app_google_adwords::campaign_metrics_cost_per_conversion?Campaign={{_filters['kpis_last_period.campaign_name'] | url_encode  }}&Ad%20Group={{_filters['kpis_last_period.ad_group_name'] | url_encode  }}"
    }
  }
}