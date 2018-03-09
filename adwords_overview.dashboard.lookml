- dashboard: adwords_overview
  title: This Quarter vs Last Quarter
  layout: newspaper
  elements:
  - title: Spend
    name: Spend
    model: looker_app_google_adwords
    explore: kpis_this_period
    type: single_value
    fields:
    - kpis_last_period.total_cost_last_period
    - kpis_this_period.total_cost_this_period
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: Change
      expression: "${kpis_this_period.total_cost_this_period} - ${kpis_last_period.total_cost_last_period}"
      value_format:
      value_format_name: usd_0
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
    - kpis_last_period.total_cost_last_period
    single_value_title: Spend
    listen:
      This Timeframe: kpis_this_period.this_timeframe
      Last Timeframe: kpis_last_period.last_timeframe
    row: 0
    col: 0
    width: 10
    height: 2
  - title: Conversions
    name: Conversions
    model: looker_app_google_adwords
    explore: kpis_this_period
    type: single_value
    fields:
    - kpis_last_period.conversions_last_period
    - kpis_this_period.conversions_this_period
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: Change
      expression: "${kpis_this_period.conversions_this_period} - ${kpis_last_period.conversions_last_period}"
      value_format:
      value_format_name: decimal_0
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
    - kpis_last_period.conversions_last_period
    single_value_title: ''
    listen:
      This Timeframe: kpis_this_period.this_timeframe
      Last Timeframe: kpis_last_period.last_timeframe
    row: 0
    col: 10
    width: 4
    height: 2
  - title: Cost Per Conversion
    name: Cost Per Conversion
    model: looker_app_google_adwords
    explore: kpis_this_period
    type: single_value
    fields:
    - kpis_last_period.cost_per_conversion_last_period
    - kpis_this_period.cost_per_conversion_this_period
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: Change
      expression: "(${kpis_this_period.cost_per_conversion_this_period} - ${kpis_last_period.cost_per_conversion_last_period})/${kpis_last_period.cost_per_conversion_last_period}"
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
    - kpis_last_period.cost_per_conversion_last_period
    single_value_title: Per Conversion
    listen:
      This Timeframe: kpis_this_period.this_timeframe
      Last Timeframe: kpis_last_period.last_timeframe
    row: 0
    col: 14
    width: 5
    height: 2
  - title: Conversion Rate
    name: Conversion Rate
    model: looker_app_google_adwords
    explore: kpis_this_period
    type: single_value
    fields:
    - kpis_this_period.avg_conversion_rate_this_period
    - kpis_last_period.avg_conversion_rate_last_period
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: Change
      expression: "(${kpis_this_period.avg_conversion_rate_this_period} - ${kpis_last_period.avg_conversion_rate_last_period})/${kpis_last_period.avg_conversion_rate_last_period}"
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
    - kpis_last_period.avg_conversion_rate_last_period
    single_value_title: ''
    listen:
      This Timeframe: kpis_this_period.this_timeframe
      Last Timeframe: kpis_last_period.last_timeframe
    row: 0
    col: 19
    width: 5
    height: 2
  - title: Campaigns
    name: Campaigns
    model: looker_app_google_adwords
    explore: ad_impressions
    type: table
    fields:
    - campaign.campaign_name
    - ad_impressions.total_cost_usd
    - ad_impressions.total_conversions
    - ad_impressions.average_cost_per_conversion
    - ad_impressions.average_conversion_rate
    - ad_impressions.average_cost_per_interaction
    - ad_impressions.average_interaction_rate
    - ad_impressions.average_cost_per_click
    sorts:
    - ad_impressions.total_conversions desc
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
      ad_impressions.total_cost_usd: Spend
    row: 17
    col: 0
    width: 24
    height: 7
  - title: Per Click
    name: Per Click
    model: looker_app_google_adwords
    explore: kpis_this_period
    type: single_value
    fields:
    - kpis_last_period.cost_per_click_last_period
    - kpis_this_period.cost_per_click_this_period
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: Change
      expression: "(${kpis_this_period.cost_per_click_this_period} - ${kpis_last_period.cost_per_click_last_period})/${kpis_last_period.cost_per_click_last_period}"
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
    hidden_fields: []
    single_value_title: ''
    listen:
      This Timeframe: kpis_this_period.this_timeframe
      Last Timeframe: kpis_last_period.last_timeframe
    row: 11
    col: 0
    width: 5
    height: 3
  - title: Click Rate
    name: Click Rate
    model: looker_app_google_adwords
    explore: kpis_this_period
    type: single_value
    fields:
    - kpis_last_period.avg_click_rate_last_period
    - kpis_this_period.avg_click_rate_this_period
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: Change
      expression: "(${kpis_this_period.avg_click_rate_this_period} - ${kpis_last_period.avg_click_rate_last_period})/${kpis_last_period.avg_click_rate_last_period}"
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
    hidden_fields: []
    single_value_title: ''
    listen:
      This Timeframe: kpis_this_period.this_timeframe
      Last Timeframe: kpis_last_period.last_timeframe
    row: 14
    col: 0
    width: 5
    height: 3
  - title: Spend To Date
    name: Spend To Date
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_area
    fields:
    - ad_impressions.date_day_of_quarter
    - ad_impressions.date_quarter
    - ad_impressions.cumulative_spend
    pivots:
    - ad_impressions.date_quarter
    filters:
      ad_impressions.date_quarter: 2 quarters
      ad_impressions.date_date: 2 quarters
    sorts:
    - ad_impressions.date_quarter desc
    - ad_impressions.date_day_of_quarter
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
      - id: ad_impressions.average_cost_per_conversion
        name: Cost per Conversion
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 467
        axisId: ad_impressions.average_cost_per_conversion
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 455
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
      - id: ad_impressions.total_conversions
        name: Conversions
        axisId: ad_impressions.total_conversions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 486
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 474
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
      - id: ad_impressions.total_impressions
        name: Impressions
        axisId: ad_impressions.total_impressions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 505
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 493
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
      - id: ad_impressions.total_cost_usd
        name: Cost
        axisId: ad_impressions.total_cost_usd
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 524
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 512
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
      - id: ad_impressions.total_clicks
        name: Clicks
        axisId: ad_impressions.total_clicks
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 543
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 531
    discontinuous_nulls: false
    focus_on_hover: false
    reference_lines: []
    trend_lines:
    - color: "#000000"
      label_position: right
      period: 7
      regression_type: linear
      series_index: 1
      show_label: false
      label_type: string
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 554
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
    - ad_impressions.average_cost_per_conversion
    series_labels:
      ad_impressions.total_cost_usd: Spend
      ad_impressions.total_clicks: Interactions
    hidden_fields: []
    column_group_spacing_ratio: 0
    column_spacing_ratio: 0
    row: 2
    col: 0
    width: 10
    height: 9
  - title: Conversion Trends
    name: Conversion Trends
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_area
    fields:
    - ad_impressions.date_week
    - ad_impressions.total_conversions
    - ad_impressions.average_cost_per_conversion
    - ad_impressions.average_conversion_rate
    sorts:
    - ad_impressions.date_week desc
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
      ad_impressions.average_cost_per_conversion: line
      ad_impressions.total_impressions: line
      ad_impressions.total_clicks: line
      ad_impressions.average_conversion_rate: line
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
      valueFormat:
      series:
      - id: ad_impressions.average_cost_per_conversion
        name: Cost per Conversion
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 311
        axisId: ad_impressions.average_cost_per_conversion
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 299
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
      valueFormat:
      series:
      - id: ad_impressions.total_conversions
        name: Conversions
        axisId: ad_impressions.total_conversions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 330
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 318
    - label: ''
      maxValue:
      minValue:
      orientation: right
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: ad_impressions.average_conversion_rate
        name: Conversion Rate
        axisId: ad_impressions.average_conversion_rate
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 349
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 337
    discontinuous_nulls: false
    focus_on_hover: false
    reference_lines: []
    trend_lines:
    - color: "#000000"
      label_position: right
      period: 7
      regression_type: linear
      series_index: 1
      show_label: false
      label_type: string
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 360
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
    - ad_impressions.average_conversion_rate
    series_labels:
      ad_impressions.total_cost_usd: Spend
      ad_impressions.total_clicks: Interactions
    hidden_fields: []
    row: 2
    col: 10
    width: 14
    height: 9
  - title: Click Trend
    name: Click Trend
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_line
    fields:
    - ad_impressions.date_week
    - ad_impressions.average_cost_per_click
    - ad_impressions.average_click_rate
    sorts:
    - ad_impressions.date_week desc
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
    series_types: {}
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
      valueFormat:
      series:
      - id: ad_impressions.average_cost_per_click
        name: Cost per Click
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 925
        axisId: ad_impressions.average_cost_per_click
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 913
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
      valueFormat:
      series:
      - id: ad_impressions.average_click_rate
        name: Click Through Rate
        axisId: ad_impressions.average_click_rate
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 944
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 932
    discontinuous_nulls: false
    focus_on_hover: false
    reference_lines: []
    trend_lines:
    - color: "#000000"
      label_position: right
      period: 7
      regression_type: linear
      series_index: 1
      show_label: false
      label_type: string
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 955
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
    - ad_impressions.average_cost_per_conversion
    series_labels:
      ad_impressions.total_cost_usd: Spend
      ad_impressions.total_clicks: Interactions
    hidden_fields: []
    y_axis_reversed: false
    row: 11
    col: 5
    width: 11
    height: 6
  - title: Funnel
    name: Funnel
    model: looker_app_google_adwords
    explore: account_quarter_fact
    type: looker_column
    fields:
    - account_fact.total_impressions
    - account_fact.total_clicks
    - account_fact.total_conversions
    filters:
      account_fact.date_quarter: 1 quarters
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
      - id: account_fact.total_impressions
        name: Impressions
        axisId: account_fact.total_impressions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 834
      - id: account_fact.total_clicks
        name: Clicks
        axisId: account_fact.total_clicks
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 839
      - id: account_fact.total_conversions
        name: Conversions
        axisId: account_fact.total_conversions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 844
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 822
    show_dropoff: true
    series_colors: {}
    row: 11
    col: 16
    width: 8
    height: 6
  filters:
  - name: This Timeframe
    title: This Timeframe
    type: field_filter
    default_value: this quarter
    model: looker_app_google_adwords
    explore: kpis_this_period
    field: kpis_this_period.this_timeframe
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Last Timeframe
    title: Last Timeframe
    type: field_filter
    default_value: 1 quarter ago
    model: looker_app_google_adwords
    explore: kpis_this_period
    field: kpis_last_period.last_timeframe
    listens_to_filters: []
    allow_multiple_values: true
    required: false
