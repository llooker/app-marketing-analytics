- dashboard: adwords_overview
  title: Overview
  layout: newspaper
  elements:
  - title: Conversion rate qtd
    name: Conversion rate qtd
    model: google_adwords
    explore: account_quarter_stats
    type: single_value
    fields:
    - account_quarter_stats._data_quarter
    - account_quarter_stats.average_conversion_rate
    - last_account_quarter_stats.average_conversion_rate
    fill_fields:
    - account_quarter_stats._data_quarter
    sorts:
    - account_quarter_stats._data_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: quarterly_change
      label: Quarterly % Change
      expression: "(${account_quarter_stats.average_conversion_rate} - ${last_account_quarter_stats.average_conversion_rate})/${last_account_quarter_stats.average_conversion_rate}\n"
      value_format:
      value_format_name: percent_0
    hidden_fields:
    - last_account_quarter_stats.average_conversion_rate
    label: Conversion Rate QTD
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
    single_value_title: Conversion Rate
    comparison_label: ''
    row: 0
    col: 20
    width: 4
    height: 2
  - title: Ad spend qtd
    name: Ad spend qtd
    model: google_adwords
    explore: account_quarter_stats
    type: single_value
    fields:
    - account_quarter_stats.total_cost_usd
    - account_quarter_stats._data_quarter
    - last_account_quarter_stats.total_cost_usd
    fill_fields:
    - account_quarter_stats._data_quarter
    sorts:
    - account_quarter_stats._data_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: quarterly_change
      label: Quarterly Change
      expression: "${account_quarter_stats.total_cost_usd} - ${last_account_quarter_stats.total_cost_usd}\n"
      value_format:
      value_format_name: usd_0
    hidden_fields:
    - last_account_quarter_stats.total_cost_usd
    label: Ad Spend QTD
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
    single_value_title: Spend
    comparison_label: ''
    row: 0
    col: 0
    width: 10
    height: 2
  - title: Conversions qtd (copy)
    name: Conversions qtd (copy)
    model: google_adwords
    explore: account_quarter_stats
    type: single_value
    fields:
    - account_quarter_stats._data_quarter
    - account_quarter_stats.total_conversions
    - last_account_quarter_stats.total_conversions
    fill_fields:
    - account_quarter_stats._data_quarter
    sorts:
    - account_quarter_stats._data_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: quarterly_change
      label: Quarterly Change
      expression: "${account_quarter_stats.total_conversions} - ${last_account_quarter_stats.total_conversions}\n"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    hidden_fields:
    - last_account_quarter_stats.total_conversions
    label: Conversions QTD
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
    single_value_title: Conversions
    comparison_label: ''
    row: 0
    col: 10
    width: 6
    height: 2
  - title: Cost per conversion qtd
    name: Cost per conversion qtd
    model: google_adwords
    explore: account_quarter_stats
    type: single_value
    fields:
    - account_quarter_stats._data_quarter
    - account_quarter_stats.average_cost_per_conversion
    - last_account_quarter_stats.average_cost_per_conversion
    fill_fields:
    - account_quarter_stats._data_quarter
    sorts:
    - account_quarter_stats._data_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: quarterly_change
      label: Quarterly % Change
      expression: "(${account_quarter_stats.average_cost_per_conversion} -  ${last_account_quarter_stats.average_cost_per_conversion})/${last_account_quarter_stats.average_cost_per_conversion}\n"
      value_format:
      value_format_name: percent_0
    hidden_fields:
    - last_account_quarter_stats.average_cost_per_conversion
    label: Cost per Conversion QTD
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
    single_value_title: Per Conversion
    comparison_label: ''
    row: 0
    col: 16
    width: 4
    height: 2
  - title: Spend To Date
    name: Spend To Date
    model: google_adwords
    explore: master_stats
    type: looker_area
    fields:
    - master_stats.total_cost_usd
    - master_stats._data_day_of_quarter
    - master_stats._data_quarter
    pivots:
    - master_stats._data_quarter
    fill_fields:
    - master_stats._data_quarter
    filters:
      master_stats._data_quarter: 2 quarters
    sorts:
    - master_stats._data_quarter desc
    - master_stats._data_day_of_quarter
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: spend
      label: Spend
      expression: if(is_null(${master_stats.total_cost_usd}), null, running_total(${master_stats.total_cost_usd}))
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
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
      - id: master_stats.average_cost_per_conversion
        name: Cost per Conversion
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 657
        axisId: master_stats.average_cost_per_conversion
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 645
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
      - id: master_stats.total_conversions
        name: Conversions
        axisId: master_stats.total_conversions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 676
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 664
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
      - id: master_stats.total_impressions
        name: Impressions
        axisId: master_stats.total_impressions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 691
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 679
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
      - id: master_stats.total_cost_usd
        name: Cost
        axisId: master_stats.total_cost_usd
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 706
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 694
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
      - id: master_stats.total_clicks
        name: Clicks
        axisId: master_stats.total_clicks
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 721
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 709
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
      __LINE_NUM: 728
    colors:
    - "#a9c574"
    - "#c5c5c5"
    - "#929292"
    - "#9fdee0"
    - "#1f3e5a"
    - "#90c8ae"
    - "#92818d"
    - "#c5c6a6"
    - "#82c2ca"
    - "#cee0a0"
    - "#928fb4"
    - "#9fc190"
    series_colors: {}
    hidden_series:
    - master_stats.average_cost_per_conversion
    series_labels:
      master_stats.total_cost_usd: Spend
      master_stats.total_clicks: Interactions
    hidden_fields:
    - master_stats.total_cost_usd
    column_group_spacing_ratio: 0
    column_spacing_ratio: 0
    row: 2
    col: 0
    width: 10
    height: 10
  - title: Conversion Trends
    name: Conversion Trends
    model: google_adwords
    explore: master_stats
    type: looker_area
    fields:
    - master_stats._data_week
    - master_stats.total_conversions
    - master_stats.average_cost_per_conversion
    - master_stats.average_conversion_rate
    filters:
      master_stats._data_date: 5 quarters
    sorts:
    - master_stats._data_week desc
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
      master_stats.average_cost_per_conversion: line
      master_stats.total_impressions: line
      master_stats.total_clicks: line
      master_stats.average_conversion_rate: line
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
      - id: master_stats.average_cost_per_conversion
        name: Cost per Conversion
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 1050
        axisId: master_stats.average_cost_per_conversion
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 1038
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
      - id: master_stats.total_conversions
        name: Conversions
        axisId: master_stats.total_conversions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 1069
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 1057
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
      - id: master_stats.average_conversion_rate
        name: Conversion Rate
        axisId: master_stats.average_conversion_rate
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 1084
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 1072
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
      __LINE_NUM: 1091
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    hidden_series:
    - master_stats.average_conversion_rate
    series_labels:
      master_stats.total_cost_usd: Spend
      master_stats.total_clicks: Interactions
    hidden_fields: []
    row: 2
    col: 10
    width: 14
    height: 10
  - title: Interaction Trend
    name: Interaction Trend
    model: google_adwords
    explore: master_stats
    type: looker_area
    fields:
    - master_stats._data_week
    - master_stats.average_cost_per_interaction
    - master_stats.average_interaction_rate
    filters:
      master_stats._data_date: 5 quarters
    sorts:
    - master_stats._data_week desc
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
      master_stats.average_cost_per_conversion: line
      master_stats.total_impressions: line
      master_stats.total_clicks: line
      master_stats.average_cost_per_interaction: line
      master_stats.average_interaction_rate: line
    show_dropoff: true
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
      - id: master_stats.average_cost_per_interaction
        name: Cost per Interaction
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 450
        axisId: master_stats.average_cost_per_interaction
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 438
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
      - id: master_stats.average_interaction_rate
        name: Interation Rate
        axisId: master_stats.average_interaction_rate
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 469
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 457
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
      __LINE_NUM: 476
    colors:
    - "#a9c574"
    - "#929292"
    - "#62bad4"
    - "#9fdee0"
    - "#1f3e5a"
    - "#90c8ae"
    - "#92818d"
    - "#c5c6a6"
    - "#82c2ca"
    - "#cee0a0"
    - "#928fb4"
    - "#9fc190"
    series_colors: {}
    hidden_series:
    - master_stats.average_cost_per_conversion
    series_labels:
      master_stats.total_cost_usd: Spend
      master_stats.total_clicks: Interactions
    hidden_fields: []
    y_axis_reversed: false
    row: 12
    col: 5
    width: 11
    height: 6
  - title: Funnel
    name: Funnel
    model: google_adwords
    explore: account_quarter_stats
    type: looker_column
    fields:
    - account_quarter_stats.total_impressions
    - account_quarter_stats.total_clicks
    - account_quarter_stats.total_conversions
    filters:
      account_quarter_stats._data_quarter: 1 quarters
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
      - id: account_quarter_stats.total_impressions
        name: Impressions
        axisId: account_quarter_stats.total_impressions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 962
      - id: account_quarter_stats.total_clicks
        name: Clicks
        axisId: account_quarter_stats.total_clicks
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 965
      - id: account_quarter_stats.total_conversions
        name: Conversions
        axisId: account_quarter_stats.total_conversions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 968
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 950
    show_dropoff: true
    row: 12
    col: 16
    width: 8
    height: 6
  - title: Cost per interaction qtd
    name: Cost per interaction qtd
    model: google_adwords
    explore: account_quarter_stats
    type: single_value
    fields:
    - account_quarter_stats._data_quarter
    - account_quarter_stats.average_cost_per_interaction
    - last_account_quarter_stats.average_cost_per_interaction
    fill_fields:
    - account_quarter_stats._data_quarter
    sorts:
    - account_quarter_stats._data_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: change
      label: "% Change"
      expression: "(${account_quarter_stats.average_cost_per_interaction} - ${last_account_quarter_stats.average_cost_per_interaction})/${last_account_quarter_stats.average_cost_per_interaction}\n"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    hidden_fields:
    - last_account_quarter_stats.average_cost_per_interaction
    label: Cost per Interaction QTD
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
    single_value_title: Per Interaction
    comparison_label: ''
    row: 12
    col: 0
    width: 5
    height: 3
  - title: Campaigns
    name: Campaigns
    model: google_adwords
    explore: master_stats
    type: table
    fields:
    - campaign.campaign_name
    - master_stats.total_cost_usd
    - master_stats.total_conversions
    - master_stats.average_cost_per_conversion
    - master_stats.average_conversion_rate
    - master_stats.average_cost_per_interaction
    - master_stats.average_interaction_rate
    - master_stats.average_cost_per_click
    filters:
      master_stats._data_date: 1 quarters
    sorts:
    - master_stats.total_conversions desc
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
      master_stats.total_cost_usd: Spend
    row: 18
    col: 0
    width: 24
    height: 8
  - title: Interaction rate qtd
    name: Interaction rate qtd
    model: google_adwords
    explore: account_quarter_stats
    type: single_value
    fields:
    - account_quarter_stats._data_quarter
    - account_quarter_stats.average_interaction_rate
    - last_account_quarter_stats.average_interaction_rate
    fill_fields:
    - account_quarter_stats._data_quarter
    sorts:
    - account_quarter_stats._data_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: quarterly_change
      label: Quarterly % Change
      expression: "(${account_quarter_stats.average_interaction_rate} - ${last_account_quarter_stats.average_interaction_rate}\
        \ )/${last_account_quarter_stats.average_interaction_rate}\n"
      value_format:
      value_format_name: percent_0
    hidden_fields:
    - last_account_quarter_stats.average_interaction_rate
    label: Interaction Rate QTD
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
    single_value_title: Interaction Rate
    comparison_label: ''
    row: 15
    col: 0
    width: 5
    height: 3
