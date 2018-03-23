- dashboard: campaign_metrics_base
  extension: required
  title: Campaign Metrics Base
  layout: newspaper
  embed_style:
    background_color: "#f6f8fa"
    show_title: true
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Spend
    name: Spend
    model: looker_app_google_adwords
    explore: ad_group_fact_this_timeframe
    type: single_value
    fields:
    - fact.total_cost
    - fact.total_conversions
    - last_fact.total_cost
    - last_fact.total_conversions
    - last_fact.average_cost_per_conversion
    - fact.average_cost_per_conversion
    - fact.average_conversion_rate
    - last_fact.average_conversion_rate
    - fact.average_click_rate
    - last_fact.average_click_rate
    - fact.average_cost_per_click
    - last_fact.average_cost_per_click
    limit: 500
    dynamic_fields:
    - table_calculation: total_cost_change
      label: Total Cost Change
      expression: "${fact.total_cost} - ${last_fact.total_cost}"
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: total_conversion_change
      label: Total Conversion Change
      expression: "${fact.total_conversions} - ${last_fact.total_conversions}"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cost_per_conversion_percent_change
      label: Cost Per Conversion Percent Change
      expression: "(${fact.average_cost_per_conversion} - ${last_fact.average_cost_per_conversion})\
        \ / ${last_fact.average_cost_per_conversion}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cost_per_click_percent_change
      label: Cost Per Click Percent Change
      expression: "(${fact.average_cost_per_click} - ${last_fact.average_cost_per_click})\
        \ / ${last_fact.average_cost_per_click}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate_percent_change
      label: Conversion Rate Percent Change
      expression: "(${fact.average_conversion_rate} - ${last_fact.average_conversion_rate})\
        \ / ${last_fact.average_conversion_rate}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: click_through_rate_percent_change
      label: Click Through Rate Percent Change
      expression: "(${fact.average_click_rate} - ${last_fact.average_click_rate})\
        \ / ${last_fact.average_click_rate}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - last_fact.total_cost
    - fact.total_conversions
    - last_fact.total_conversions
    - last_fact.average_cost_per_conversion
    - fact.average_cost_per_conversion
    - fact.average_conversion_rate
    - last_fact.average_conversion_rate
    - fact.average_click_rate
    - last_fact.average_click_rate
    - fact.average_cost_per_click
    - last_fact.average_cost_per_click
    - click_through_rate_percent_change
    - conversion_rate_percent_change
    - cost_per_click_percent_change
    - cost_per_conversion_percent_change
    - total_conversion_change
    single_value_title: Spend
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      This Timeframe: fact.this_timeframe
      Last Timeframe: last_fact.last_timeframe
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
    row: 0
    col: 0
    width: 4
    height: 4
  - title: Conversions
    name: Conversions
    model: looker_app_google_adwords
    explore: ad_group_fact_this_timeframe
    type: single_value
    fields:
    - fact.total_cost
    - fact.total_conversions
    - last_fact.total_cost
    - last_fact.total_conversions
    - last_fact.average_cost_per_conversion
    - fact.average_cost_per_conversion
    - fact.average_conversion_rate
    - last_fact.average_conversion_rate
    - fact.average_click_rate
    - last_fact.average_click_rate
    - fact.average_cost_per_click
    - last_fact.average_cost_per_click
    limit: 500
    dynamic_fields:
    - table_calculation: total_cost_change
      label: Total Cost Change
      expression: "${fact.total_cost} - ${last_fact.total_cost}"
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: total_conversion_change
      label: Total Conversion Change
      expression: "${fact.total_conversions} - ${last_fact.total_conversions}"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cost_per_conversion_percent_change
      label: Cost Per Conversion Percent Change
      expression: "(${fact.average_cost_per_conversion} - ${last_fact.average_cost_per_conversion})\
        \ / ${last_fact.average_cost_per_conversion}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cost_per_click_percent_change
      label: Cost Per Click Percent Change
      expression: "(${fact.average_cost_per_click} - ${last_fact.average_cost_per_click})\
        \ / ${last_fact.average_cost_per_click}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate_percent_change
      label: Conversion Rate Percent Change
      expression: "(${fact.average_conversion_rate} - ${last_fact.average_conversion_rate})\
        \ / ${last_fact.average_conversion_rate}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: click_through_rate_percent_change
      label: Click Through Rate Percent Change
      expression: "(${fact.average_click_rate} - ${last_fact.average_click_rate})\
        \ / ${last_fact.average_click_rate}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - fact.total_cost
    - last_fact.total_cost
    - last_fact.total_conversions
    - last_fact.average_cost_per_conversion
    - fact.average_cost_per_conversion
    - fact.average_conversion_rate
    - last_fact.average_conversion_rate
    - fact.average_click_rate
    - last_fact.average_click_rate
    - fact.average_cost_per_click
    - last_fact.average_cost_per_click
    - click_through_rate_percent_change
    - conversion_rate_percent_change
    - cost_per_click_percent_change
    - cost_per_conversion_percent_change
    - total_cost_change
    single_value_title: ''
    listen:
      This Timeframe: fact.this_timeframe
      Last Timeframe: last_fact.last_timeframe
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
    row: 0
    col: 4
    width: 4
    height: 4
  - title: Click Through Rate
    name: Click Through Rate
    model: looker_app_google_adwords
    explore: ad_group_fact_this_timeframe
    type: single_value
    fields:
    - fact.total_cost
    - fact.total_conversions
    - last_fact.total_cost
    - last_fact.total_conversions
    - last_fact.average_cost_per_conversion
    - fact.average_cost_per_conversion
    - fact.average_conversion_rate
    - last_fact.average_conversion_rate
    - fact.average_click_rate
    - last_fact.average_click_rate
    - fact.average_cost_per_click
    - last_fact.average_cost_per_click
    limit: 500
    dynamic_fields:
    - table_calculation: total_cost_change
      label: Total Cost Change
      expression: "${fact.total_cost} - ${last_fact.total_cost}"
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: total_conversion_change
      label: Total Conversion Change
      expression: "${fact.total_conversions} - ${last_fact.total_conversions}"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cost_per_conversion_percent_change
      label: Cost Per Conversion Percent Change
      expression: "(${fact.average_cost_per_conversion} - ${last_fact.average_cost_per_conversion})\
        \ / ${last_fact.average_cost_per_conversion}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cost_per_click_percent_change
      label: Cost Per Click Percent Change
      expression: "(${fact.average_cost_per_click} - ${last_fact.average_cost_per_click})\
        \ / ${last_fact.average_cost_per_click}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate_percent_change
      label: Conversion Rate Percent Change
      expression: "(${fact.average_conversion_rate} - ${last_fact.average_conversion_rate})\
        \ / ${last_fact.average_conversion_rate}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: click_through_rate_percent_change
      label: Click Through Rate Percent Change
      expression: "(${fact.average_click_rate} - ${last_fact.average_click_rate})\
        \ / ${last_fact.average_click_rate}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - fact.total_cost
    - last_fact.total_cost
    - fact.total_conversions
    - last_fact.total_conversions
    - last_fact.average_cost_per_conversion
    - fact.average_cost_per_conversion
    - fact.average_conversion_rate
    - last_fact.average_conversion_rate
    - last_fact.average_click_rate
    - fact.average_cost_per_click
    - last_fact.average_cost_per_click
    - conversion_rate_percent_change
    - cost_per_click_percent_change
    - cost_per_conversion_percent_change
    - total_conversion_change
    - total_cost_change
    single_value_title: ''
    listen:
      This Timeframe: fact.this_timeframe
      Last Timeframe: last_fact.last_timeframe
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
    row: 0
    col: 20
    width: 4
    height: 4
  - title: Cost Per Conversion
    name: Cost Per Conversion
    model: looker_app_google_adwords
    explore: ad_group_fact_this_timeframe
    type: single_value
    fields:
    - fact.total_cost
    - fact.total_conversions
    - last_fact.total_cost
    - last_fact.total_conversions
    - last_fact.average_cost_per_conversion
    - fact.average_cost_per_conversion
    - fact.average_conversion_rate
    - last_fact.average_conversion_rate
    - fact.average_click_rate
    - last_fact.average_click_rate
    - fact.average_cost_per_click
    - last_fact.average_cost_per_click
    limit: 500
    dynamic_fields:
    - table_calculation: total_cost_change
      label: Total Cost Change
      expression: "${fact.total_cost} - ${last_fact.total_cost}"
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: total_conversion_change
      label: Total Conversion Change
      expression: "${fact.total_conversions} - ${last_fact.total_conversions}"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cost_per_conversion_percent_change
      label: Cost Per Conversion Percent Change
      expression: "(${fact.average_cost_per_conversion} - ${last_fact.average_cost_per_conversion})\
        \ / ${last_fact.average_cost_per_conversion}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cost_per_click_percent_change
      label: Cost Per Click Percent Change
      expression: "(${fact.average_cost_per_click} - ${last_fact.average_cost_per_click})\
        \ / ${last_fact.average_cost_per_click}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate_percent_change
      label: Conversion Rate Percent Change
      expression: "(${fact.average_conversion_rate} - ${last_fact.average_conversion_rate})\
        \ / ${last_fact.average_conversion_rate}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: click_through_rate_percent_change
      label: Click Through Rate Percent Change
      expression: "(${fact.average_click_rate} - ${last_fact.average_click_rate})\
        \ / ${last_fact.average_click_rate}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - fact.total_cost
    - last_fact.total_cost
    - fact.total_conversions
    - last_fact.total_conversions
    - last_fact.average_cost_per_conversion
    - fact.average_conversion_rate
    - last_fact.average_conversion_rate
    - fact.average_click_rate
    - last_fact.average_click_rate
    - fact.average_cost_per_click
    - last_fact.average_cost_per_click
    - click_through_rate_percent_change
    - conversion_rate_percent_change
    - cost_per_click_percent_change
    - total_conversion_change
    - total_cost_change
    single_value_title: Per Conversion
    listen:
      This Timeframe: fact.this_timeframe
      Last Timeframe: last_fact.last_timeframe
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
    row: 0
    col: 8
    width: 4
    height: 4
  - title: Cost Per Click
    name: Cost Per Click
    model: looker_app_google_adwords
    explore: ad_group_fact_this_timeframe
    type: single_value
    fields:
    - fact.total_cost
    - fact.total_conversions
    - last_fact.total_cost
    - last_fact.total_conversions
    - last_fact.average_cost_per_conversion
    - fact.average_cost_per_conversion
    - fact.average_conversion_rate
    - last_fact.average_conversion_rate
    - fact.average_click_rate
    - last_fact.average_click_rate
    - fact.average_cost_per_click
    - last_fact.average_cost_per_click
    limit: 500
    dynamic_fields:
    - table_calculation: total_cost_change
      label: Total Cost Change
      expression: "${fact.total_cost} - ${last_fact.total_cost}"
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: total_conversion_change
      label: Total Conversion Change
      expression: "${fact.total_conversions} - ${last_fact.total_conversions}"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cost_per_conversion_percent_change
      label: Cost Per Conversion Percent Change
      expression: "(${fact.average_cost_per_conversion} - ${last_fact.average_cost_per_conversion})\
        \ / ${last_fact.average_cost_per_conversion}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cost_per_click_percent_change
      label: Cost Per Click Percent Change
      expression: "(${fact.average_cost_per_click} - ${last_fact.average_cost_per_click})\
        \ / ${last_fact.average_cost_per_click}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate_percent_change
      label: Conversion Rate Percent Change
      expression: "(${fact.average_conversion_rate} - ${last_fact.average_conversion_rate})\
        \ / ${last_fact.average_conversion_rate}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: click_through_rate_percent_change
      label: Click Through Rate Percent Change
      expression: "(${fact.average_click_rate} - ${last_fact.average_click_rate})\
        \ / ${last_fact.average_click_rate}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - fact.total_cost
    - last_fact.total_cost
    - fact.total_conversions
    - last_fact.total_conversions
    - last_fact.average_cost_per_conversion
    - fact.average_cost_per_conversion
    - fact.average_conversion_rate
    - last_fact.average_conversion_rate
    - fact.average_click_rate
    - last_fact.average_click_rate
    - last_fact.average_cost_per_click
    - click_through_rate_percent_change
    - conversion_rate_percent_change
    - cost_per_conversion_percent_change
    - total_conversion_change
    - total_cost_change
    single_value_title: ''
    listen:
      This Timeframe: fact.this_timeframe
      Last Timeframe: last_fact.last_timeframe
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
    row: 0
    col: 16
    width: 4
    height: 4
  - title: Conversion Rate
    name: Conversion Rate
    model: looker_app_google_adwords
    explore: ad_group_fact_this_timeframe
    type: single_value
    fields:
    - fact.total_cost
    - fact.total_conversions
    - last_fact.total_cost
    - last_fact.total_conversions
    - last_fact.average_cost_per_conversion
    - fact.average_cost_per_conversion
    - fact.average_conversion_rate
    - last_fact.average_conversion_rate
    - fact.average_click_rate
    - last_fact.average_click_rate
    - fact.average_cost_per_click
    - last_fact.average_cost_per_click
    limit: 500
    dynamic_fields:
    - table_calculation: total_cost_change
      label: Total Cost Change
      expression: "${fact.total_cost} - ${last_fact.total_cost}"
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: total_conversion_change
      label: Total Conversion Change
      expression: "${fact.total_conversions} - ${last_fact.total_conversions}"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cost_per_conversion_percent_change
      label: Cost Per Conversion Percent Change
      expression: "(${fact.average_cost_per_conversion} - ${last_fact.average_cost_per_conversion})\
        \ / ${last_fact.average_cost_per_conversion}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cost_per_click_percent_change
      label: Cost Per Click Percent Change
      expression: "(${fact.average_cost_per_click} - ${last_fact.average_cost_per_click})\
        \ / ${last_fact.average_cost_per_click}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate_percent_change
      label: Conversion Rate Percent Change
      expression: "(${fact.average_conversion_rate} - ${last_fact.average_conversion_rate})\
        \ / ${last_fact.average_conversion_rate}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: click_through_rate_percent_change
      label: Click Through Rate Percent Change
      expression: "(${fact.average_click_rate} - ${last_fact.average_click_rate})\
        \ / ${last_fact.average_click_rate}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - fact.total_cost
    - last_fact.total_cost
    - fact.total_conversions
    - last_fact.total_conversions
    - last_fact.average_cost_per_conversion
    - fact.average_cost_per_conversion
    - last_fact.average_conversion_rate
    - fact.average_click_rate
    - last_fact.average_click_rate
    - fact.average_cost_per_click
    - last_fact.average_cost_per_click
    - click_through_rate_percent_change
    - cost_per_click_percent_change
    - cost_per_conversion_percent_change
    - total_conversion_change
    - total_cost_change
    single_value_title: ''
    listen:
      This Timeframe: fact.this_timeframe
      Last Timeframe: last_fact.last_timeframe
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
    row: 0
    col: 12
    width: 4
    height: 4