include: "/app_marketing_analytics_adapter/ad_impressions.view"
include: "google_ad_transformations_base.view"
include: "date_base.view"
include: "period_base.view"
include: "google_adwords_base.view"

view: ad_impressions {
  extends: [date_base, period_base, google_ad_transformations_base, google_adwords_base, ad_impressions_adapter]

  dimension: hour_of_day {
    hidden: yes
    type: number
    sql: ${TABLE}.HourOfDay ;;
  }

  dimension: audience_criterion_id {
    hidden: yes
    sql: ${TABLE}.CriterionId ;;
  }

  dimension: age_range_criterion_id {
    hidden: yes
    sql: ${TABLE}.CriterionId ;;
  }

  dimension: gender_criterion_id {
    hidden: yes
    sql: ${TABLE}.CriterionId ;;
  }

  dimension: parental_status_criterion_id {
    hidden: yes
    sql: ${TABLE}.CriterionId ;;
  }

  dimension: video_id {
    hidden: yes
    sql: ${TABLE}.VideoId ;;
  }

  dimension: video_channel_id {
    hidden: yes
    sql: ${TABLE}.VideoChannelId ;;
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
#         expression: contains(${device}, 'Desktop') ;;
        label: "Desktop"
      }
      when: {
        sql: ${device} LIKE '%Mobile%' ;;
#         expression: contains(${device}, 'Mobile') ;;
        label: "Mobile"
      }
      when: {
        sql: ${device} LIKE '%Tablet%' ;;
#         expression: contains(${device}, 'Tablet') ;;
        label: "Tablet"
      }
      else: "Other"
    }
  }

  dimension: city_criteria_id {
    hidden: yes
    type: number
    sql: ${TABLE}.CityCriteriaId ;;
  }

  dimension: country_criteria_id {
    hidden: yes
    type: number
    sql: ${TABLE}.CountryCriteriaId ;;
  }

  dimension: metro_criteria_id {
    hidden: yes
    type: number
    sql: ${TABLE}.MetroCriteriaId ;;
  }

  dimension: most_specific_criteria_id {
    hidden: yes
    type: number
    sql: ${TABLE}.MostSpecificCriteriaId ;;
  }

  dimension: region_criteria_id {
    hidden: yes
    type: number
    sql: ${TABLE}.RegionCriteriaId ;;
  }

  measure: total_impressions {
  }
  measure: total_clicks {
  }
  measure: total_conversions {
    drill_fields: [fact.date_date, campaign.campaign_name, fact.total_conversions]
  }
  measure: total_cost {
    drill_fields: [fact.date_date, campaign.campaign_name, fact.total_cost]
  }
  measure: average_click_rate {
    link: {
      label: "By Keyword"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=keyword.criteria,fact.average_click_rate&f[fact.date_date]=this quarter"
    }
    html:  {% if (geo_us_state.state._in_query) %}
    <a href= "/explore/looker_app_google_adwords/ad_impressions?fields=fact.average_click_rate,geo_us_postal_code.postal_code&f[geo_us_postal_code_state.state]={{geo_us_state.state._value | url_encode}}&sorts=fact.average_click_rate+desc&vis=%7B%22type%22%3A%22looker_map%22%2C%22map_plot_mode%22%3A%22points%22%2C%22heatmap_gridlines%22%3Afalse%2C%22heatmap_gridlines_empty%22%3Afalse%2C%22heatmap_opacity%22%3A0.5%2C%22show_region_field%22%3Atrue%2C%22draw_map_labels_above_data%22%3Atrue%2C%22map_tile_provider%22%3A%22positron%22%2C%22map_position%22%3A%22fit_data%22%2C%22map_scale_indicator%22%3A%22off%22%2C%22map_pannable%22%3Atrue%2C%22map_zoomable%22%3Atrue%2C%22map_marker_type%22%3A%22circle%22%2C%22map_marker_icon_name%22%3A%22default%22%2C%22map_marker_radius_mode%22%3A%22proportional_value%22%2C%22map_marker_units%22%3A%22meters%22%2C%22map_marker_proportional_scale_type%22%3A%22linear%22%2C%22map_marker_color_mode%22%3A%22fixed%22%2C%22show_view_names%22%3Atrue%2C%22show_legend%22%3Atrue%2C%22quantize_map_value_colors%22%3Afalse%2C%22reverse_map_value_colors%22%3Afalse%7D&filter_config=%7B%22geo_us_postal_code_state.state%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22{{ geo_us_state.state._value | url_encode }}%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D"> {{rendered_value}}  </a>
    {% else %} {{rendered_value}}
    {% endif %};;
  }
  measure: average_conversion_rate {
    html: {% if (geo_us_state.state._in_query) %}
    <a href= "/explore/looker_app_google_adwords/ad_impressions?fields=fact.average_conversion_rate,geo_us_postal_code.postal_code&f[geo_us_postal_code_state.state]={{ geo_us_state.state._value | url_encode }}&sorts=fact.average_click_rate+desc&vis=%7B%22type%22%3A%22looker_map%22%2C%22map_plot_mode%22%3A%22points%22%2C%22heatmap_gridlines%22%3Afalse%2C%22heatmap_gridlines_empty%22%3Afalse%2C%22heatmap_opacity%22%3A0.5%2C%22show_region_field%22%3Atrue%2C%22draw_map_labels_above_data%22%3Atrue%2C%22map_tile_provider%22%3A%22positron%22%2C%22map_position%22%3A%22fit_data%22%2C%22map_scale_indicator%22%3A%22off%22%2C%22map_pannable%22%3Atrue%2C%22map_zoomable%22%3Atrue%2C%22map_marker_type%22%3A%22circle%22%2C%22map_marker_icon_name%22%3A%22default%22%2C%22map_marker_radius_mode%22%3A%22proportional_value%22%2C%22map_marker_units%22%3A%22meters%22%2C%22map_marker_proportional_scale_type%22%3A%22linear%22%2C%22map_marker_color_mode%22%3A%22fixed%22%2C%22show_view_names%22%3Atrue%2C%22show_legend%22%3Atrue%2C%22quantize_map_value_colors%22%3Afalse%2C%22reverse_map_value_colors%22%3Afalse%7D&filter_config=%7B%22geo_us_postal_code_state.state%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22{{ geo_us_state.state._value | url_encode }}%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D"> {{rendered_value}}  </a>
    {% else %} {{rendered_value}}
    {% endif %} ;;
  }
  measure: average_cost_per_click {
     html:  {% if (geo_us_state.state._in_query) %}
    <a href= "/explore/looker_app_google_adwords/ad_impressions?fields=fact.average_cost_per_click,geo_us_postal_code.postal_code&f[geo_us_postal_code_state.state]={{geo_us_state.state._value | url_encode}}&sorts=fact.average_click_rate+desc&vis=%7B%22type%22%3A%22looker_map%22%2C%22map_plot_mode%22%3A%22points%22%2C%22heatmap_gridlines%22%3Afalse%2C%22heatmap_gridlines_empty%22%3Afalse%2C%22heatmap_opacity%22%3A0.5%2C%22show_region_field%22%3Atrue%2C%22draw_map_labels_above_data%22%3Atrue%2C%22map_tile_provider%22%3A%22positron%22%2C%22map_position%22%3A%22fit_data%22%2C%22map_scale_indicator%22%3A%22off%22%2C%22map_pannable%22%3Atrue%2C%22map_zoomable%22%3Atrue%2C%22map_marker_type%22%3A%22circle%22%2C%22map_marker_icon_name%22%3A%22default%22%2C%22map_marker_radius_mode%22%3A%22proportional_value%22%2C%22map_marker_units%22%3A%22meters%22%2C%22map_marker_proportional_scale_type%22%3A%22linear%22%2C%22map_marker_color_mode%22%3A%22fixed%22%2C%22show_view_names%22%3Atrue%2C%22show_legend%22%3Atrue%2C%22quantize_map_value_colors%22%3Afalse%2C%22reverse_map_value_colors%22%3Afalse%7D&filter_config=%7B%22geo_us_postal_code_state.state%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22{{ geo_us_state.state._value | url_encode }}%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D"> {{rendered_value}}  </a>
    {% else %} {{rendered_value}}
    {% endif %};;
  }
  measure: average_cost_per_conversion {
    drill_fields: [fact.date_date, campaign.campaign_name, fact.total_conversions]
    html:  {% if (geo_us_state.state._in_query) %}
    <a href= "/explore/looker_app_google_adwords/ad_impressions?fields=fact.average_cost_per_conversion,geo_us_postal_code.postal_code&f[geo_us_postal_code_state.state]={{geo_us_state.state._value | url_encode}}&sorts=fact.average_click_rate+desc&vis=%7B%22type%22%3A%22looker_map%22%2C%22map_plot_mode%22%3A%22points%22%2C%22heatmap_gridlines%22%3Afalse%2C%22heatmap_gridlines_empty%22%3Afalse%2C%22heatmap_opacity%22%3A0.5%2C%22show_region_field%22%3Atrue%2C%22draw_map_labels_above_data%22%3Atrue%2C%22map_tile_provider%22%3A%22positron%22%2C%22map_position%22%3A%22fit_data%22%2C%22map_scale_indicator%22%3A%22off%22%2C%22map_pannable%22%3Atrue%2C%22map_zoomable%22%3Atrue%2C%22map_marker_type%22%3A%22circle%22%2C%22map_marker_icon_name%22%3A%22default%22%2C%22map_marker_radius_mode%22%3A%22proportional_value%22%2C%22map_marker_units%22%3A%22meters%22%2C%22map_marker_proportional_scale_type%22%3A%22linear%22%2C%22map_marker_color_mode%22%3A%22fixed%22%2C%22show_view_names%22%3Atrue%2C%22show_legend%22%3Atrue%2C%22quantize_map_value_colors%22%3Afalse%2C%22reverse_map_value_colors%22%3Afalse%7D&filter_config=%7B%22geo_us_postal_code_state.state%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22{{ geo_us_state.state._value | url_encode }}%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D"> {{rendered_value}}  </a>
    {% else %} {{rendered_value}}
    {% endif %};;
  }
}
