- dashboard: marketing_analytics_overview
  title: Marketing Analytics Overview - This Quarter vs Last
  layout: newspaper
  embed_style:
    background_color: "#f6f8fa"
    show_title: true
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Conversions
    name: Conversions
    model: marketing_analytics
    explore: combined_ad_group_date_fact
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
    show_view_names: false
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
      Period: fact.period
      Period Latest: fact.date_period_latest
    row: 0
    col: 6
    width: 6
    height: 3
  - title: Cost Per Conversion
    name: Cost Per Conversion
    model: marketing_analytics
    explore: combined_ad_group_date_fact
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
    show_view_names: false
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
      Period: fact.period
      Period Latest: fact.date_period_latest
    row: 0
    col: 12
    width: 6
    height: 3
  - title: Conversion Rate
    name: Conversion Rate
    model: marketing_analytics
    explore: combined_ad_group_date_fact
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
    show_view_names: false
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
      Period: fact.period
      Period Latest: fact.date_period_latest
    row: 0
    col: 18
    width: 6
    height: 3
  - title: Per Click
    name: Per Click
    model: marketing_analytics
    explore: combined_ad_group_date_fact
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
    show_view_names: false
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
      Period: fact.period
    row: 12
    col: 0
    width: 6
    height: 3
  - title: Click Rate
    name: Click Rate
    model: marketing_analytics
    explore: combined_ad_group_date_fact
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
    show_view_names: false
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
      Period: fact.period
      Period Latest: fact.date_period_latest
    row: 15
    col: 0
    width: 6
    height: 3
  - title: Funnel
    name: Funnel
    model: marketing_analytics
    explore: combined_ad_group_date_fact
    type: looker_column
    fields:
    - fact.total_impressions
    - fact.total_clicks
    - fact.total_conversions
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    hidden_fields: []
    label: Conversion Rate QTD
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    series_types: {}
    single_value_title: Conversion Rate
    comparison_label: ''
    colors:
    - "#d06180"
    - "#a4a6a9"
    - "#7869df"
    - "#6e98f9"
    - "#dc9d4f"
    - "#4bb86a"
    - "#8ac8ca"
    - "#a6b7ff"
    - "#afe8fd"
    - "#ea9895"
    - "#f1e582"
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: log
      unpinAxis: false
      valueFormat:
      series:
      - id: fact.total_impressions
        name: Impressions
        axisId: fact.total_impressions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 695
      - id: fact.total_clicks
        name: Clicks
        axisId: fact.total_clicks
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 700
      - id: fact.total_conversions
        name: Conversions
        axisId: fact.total_conversions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 705
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 683
    show_dropoff: true
    series_colors: {}
    listen:
      Period: fact.period
      Period Latest: fact.date_period_latest
    row: 12
    col: 16
    width: 8
    height: 6
  - title: Channels
    name: Channels
    model: marketing_analytics
    explore: combined_ad_group_date_fact
    type: table
    fields:
    - fact.channel
    - fact.total_cost
    - fact.total_conversions
    - fact.average_cost_per_conversion
    - fact.average_conversion_rate
    - fact.average_cost_per_click
    - fact.average_click_rate
    - fact.average_cost_per_click
    sorts:
    - fact.total_cost desc
    limit: 10
    column_limit: 50
    label: Campaign Details
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    series_labels:
      fact.total_cost: Spend
    listen:
      Period: fact.period
      Period Latest: fact.date_period_latest
    row: 18
    col: 0
    width: 24
    height: 6
  - title: Conversion Trend
    name: Conversion Trend
    model: marketing_analytics
    explore: combined_ad_group_date_fact
    type: looker_area
    fields:
    - fact.date_period_dynamic_grain
    - fact.average_cost_per_conversion
    - fact.average_conversion_rate
    - fact.total_conversions
    - fact.average_cost_per_click
    - fact.average_click_rate
    - fact.total_clicks
    sorts:
    - fact.date_period_dynamic_grain
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: time
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    label: Average Cost per Conversion
    ordering: none
    show_null_labels: false
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - red
    - blue
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    series_types:
      fact.average_cost_per_conversion: line
      fact.total_impressions: line
      fact.total_clicks: line
      fact.average_conversion_rate: line
    show_dropoff: true
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat: "$0"
      series:
      - id: fact.average_cost_per_conversion
        name: Cost per Conversion
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 854
        axisId: fact.average_cost_per_conversion
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 842
    - label: ''
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat: 0.0%
      series:
      - id: fact.average_conversion_rate
        name: Conversion Rate
        axisId: fact.average_conversion_rate
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 873
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 861
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat: ''
      series:
      - id: fact.total_conversions
        name: Conversions
        axisId: fact.total_conversions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 892
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 880
    discontinuous_nulls: false
    focus_on_hover: false
    reference_lines: []
    colors:
    - "#7869df"
    - "#6e98f9"
    - "#8ac8ca"
    - "#d06180"
    - "#dc9d4f"
    - "#4bb86a"
    - "#a4a6a9"
    - "#a6b7ff"
    - "#afe8fd"
    - "#ea9895"
    - "#f1e582"
    series_colors: {}
    hidden_series:
    - fact.total_conversions
    - fact.average_conversion_rate
    series_labels:
      fact.total_cost: Spend
      fact.total_clicks: Clicks
    hidden_fields:
    - fact.average_cost_per_click
    - fact.average_click_rate
    - fact.total_clicks
    listen:
      Period: fact.period
      Period Latest: fact.date_period_latest
    row: 3
    col: 9
    width: 15
    height: 9
  - title: Click Trend
    name: Click Trend
    model: marketing_analytics
    explore: combined_ad_group_date_fact
    type: looker_line
    fields:
    - fact.date_period_dynamic_grain
    - fact.average_cost_per_click
    - fact.average_click_rate
    - fact.total_clicks
    - fact.average_cost_per_conversion
    - fact.average_conversion_rate
    - fact.total_conversions
    sorts:
    - fact.date_period_dynamic_grain
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: time
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    label: Average Cost per Conversion
    ordering: none
    show_null_labels: false
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - red
    - blue
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    series_types:
      fact.total_clicks: area
    show_dropoff: true
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat: "$0"
      series:
      - id: fact.average_cost_per_click
        name: Cost per Click
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 1009
        axisId: fact.average_cost_per_click
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 997
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat: 0.0%
      series:
      - id: fact.average_click_rate
        name: Click Through Rate
        axisId: fact.average_click_rate
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 1028
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 1016
    - label: ''
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: fact.total_clicks
        name: Clicks
        axisId: fact.total_clicks
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 1047
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 1035
    discontinuous_nulls: false
    focus_on_hover: false
    reference_lines: []
    colors:
    - "#d06180"
    - "#dc9d4f"
    - "#7869df"
    - "#6e98f9"
    - "#8ac8ca"
    - "#4bb86a"
    - "#a4a6a9"
    - "#a6b7ff"
    - "#afe8fd"
    - "#ea9895"
    - "#f1e582"
    series_colors: {}
    hidden_series:
    - fact.average_click_rate
    - fact.total_clicks
    series_labels:
      fact.total_cost: Spend
      fact.total_clicks: Clicks
    hidden_fields:
    - fact.average_cost_per_conversion
    - fact.average_conversion_rate
    - fact.total_conversions
    y_axis_reversed: false
    listen:
      Period: fact.period
      Period Latest: fact.date_period_latest
    row: 12
    col: 6
    width: 10
    height: 6
  - title: Spend
    name: Spend
    model: marketing_analytics
    explore: combined_ad_group_date_fact
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
    column_limit: 50
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
    show_view_names: false
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
    listen:
      Period: fact.period
      Period Latest: fact.date_period_latest
    row: 0
    col: 0
    width: 6
    height: 3
  - title: Spend To Date
    name: Spend To Date
    model: marketing_analytics
    explore: combined_ad_group_date_fact
    type: looker_area
    fields:
    - fact.date_day_of_period
    - fact.total_cost
    - fact.cumulative_spend
    - last_fact.total_cost
    - last_fact.cumulative_spend
    sorts:
    - fact.date_day_of_period
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 1
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    label: Average Cost per Conversion
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - red
    - blue
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    series_types: {}
    show_dropoff: false
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: fact.average_cost_per_conversion
        name: Cost per Conversion
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 1173
        axisId: fact.average_cost_per_conversion
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 1161
    - label:
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: fact.total_conversions
        name: Conversions
        axisId: fact.total_conversions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 1192
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 1180
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: fact.total_impressions
        name: Impressions
        axisId: fact.total_impressions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 1211
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 1199
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: fact.total_cost
        name: Cost
        axisId: fact.total_cost
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 1230
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 1218
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: fact.total_clicks
        name: Clicks
        axisId: fact.total_clicks
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 1249
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 1237
    discontinuous_nulls: false
    focus_on_hover: false
    reference_lines: []
    colors:
    - "#4bb86a"
    - "#8fe4a7"
    - "#6e98f9"
    - "#8ac8ca"
    - "#d06180"
    - "#dc9d4f"
    - "#7869df"
    - "#a4a6a9"
    - "#a6b7ff"
    - "#afe8fd"
    - "#ea9895"
    - "#f1e582"
    series_colors: {}
    hidden_series:
    - fact.average_cost_per_conversion
    series_labels:
      fact.total_cost: Spend
    hidden_fields:
    - fact.total_cost
    - last_fact.total_cost
    column_group_spacing_ratio: 0
    column_spacing_ratio: 0
    listen:
      Period: fact.period
      Period Latest: fact.date_period_latest
    row: 3
    col: 0
    width: 9
    height: 9
  filters:
  - name: Period
    title: Period
    type: field_filter
    default_value: 28 day
    allow_multiple_values: true
    required: true
    model: marketing_analytics
    explore: period_fact
    field: fact.period
  - name: Period Latest
    title: Period Latest
    type: field_filter
    default_value: 'Yes'
    allow_multiple_values: true
    required: false
    model: marketing_analytics
    explore: period_fact
    field: fact.date_period_latest