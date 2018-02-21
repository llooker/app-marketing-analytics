- dashboard: campaign_metrics_cost_per_conversion
  title: Campaign Metrics Cost Per Conversion
  layout: newspaper
  elements:
  - title: Spend
    name: Spend
    model: google_adwords
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
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      This Timeframe: kpis_this_period.this_timeframe
      Last Timeframe: kpis_last_period.last_timeframe
      Campaign: kpis_last_period.campaign_name
      Ad Group: kpis_last_period.ad_group_name
    row: 0
    col: 0
    width: 4
    height: 4
  - title: Conversions
    name: Conversions
    model: google_adwords
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
      Campaign: kpis_last_period.campaign_name
      Ad Group: kpis_last_period.ad_group_name
    row: 0
    col: 4
    width: 4
    height: 4
  - title: Click Through Rate
    name: Click Through Rate
    model: google_adwords
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
    hidden_fields:
    - kpis_last_period.avg_click_rate_last_period
    single_value_title: ''
    listen:
      This Timeframe: kpis_this_period.this_timeframe
      Last Timeframe: kpis_last_period.last_timeframe
      Campaign: kpis_last_period.campaign_name
      Ad Group: kpis_last_period.ad_group_name
    row: 0
    col: 20
    width: 4
    height: 4
  - title: Conversion Rate
    name: Conversion Rate
    model: google_adwords
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
      Campaign: kpis_last_period.campaign_name
      Ad Group: kpis_last_period.ad_group_name
    row: 0
    col: 12
    width: 4
    height: 4
  - title: Cost Per Conversion
    name: Cost Per Conversion
    model: google_adwords
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
      Campaign: kpis_last_period.campaign_name
      Ad Group: kpis_last_period.ad_group_name
    row: 0
    col: 8
    width: 4
    height: 4
  - title: Cost Per Click
    name: Cost Per Click
    model: google_adwords
    explore: kpis_this_period
    type: single_value
    fields:
    - kpis_this_period.cost_per_click_this_period
    - kpis_last_period.cost_per_click_last_period
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
      Campaign: kpis_last_period.campaign_name
      Ad Group: kpis_last_period.ad_group_name
    row: 0
    col: 16
    width: 4
    height: 4
  - title: Cost Per Conversion To Date
    name: Cost Per Conversion To Date
    model: google_adwords
    explore: master_stats
    type: looker_area
    fields:
    - master_stats._data_day_of_quarter
    - master_stats._data_quarter
    - master_stats.average_cost_per_conversion
    pivots:
    - master_stats._data_quarter
    filters:
      master_stats._data_quarter: 2 quarters
      master_stats._data_date: 2 quarters
    sorts:
    - master_stats._data_quarter desc
    - master_stats._data_day_of_quarter
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
      - id: master_stats.average_cost_per_conversion
        name: Cost per Conversion
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 430
        axisId: master_stats.average_cost_per_conversion
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 418
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
      - id: master_stats.average_cost_per_conversion
        name: Conversions
        axisId: master_stats.average_cost_per_conversion
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 449
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 437
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
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 468
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 456
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
        name: Cost
        axisId: master_stats.average_cost_per_conversion
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 487
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 475
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
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 506
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 494
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
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 517
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
      master_stats.average_cost_per_conversion: Spend
      master_stats.total_clicks: Interactions
    hidden_fields: []
    column_group_spacing_ratio: 0
    column_spacing_ratio: 0
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
    row: 4
    col: 0
    width: 24
    height: 11
  - title: Cost Per Conversion versions by Network
    name: Cost Per Conversion versions by Network
    model: google_adwords
    explore: master_stats
    type: looker_bar
    fields:
    - master_stats.ad_network_type
    - master_stats.average_cost_per_conversion
    fill_fields:
    - master_stats.ad_network_type
    filters:
      master_stats._data_date: 1 quarters ago for 1 quarters
    sorts:
    - master_stats.average_cost_per_conversion desc
    - master_stats.ad_network_type
    limit: 500
    stacking: ''
    show_value_labels: true
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
    label_color: []
    x_axis_label: Network
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: bottom
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: master_stats.average_cost_per_conversion
        name: Ad Stats Cost
        axisId: master_stats.average_cost_per_conversion
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 606
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 594
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
    row: 15
    col: 0
    width: 8
    height: 6
  - title: Cost Per Conversion by Device
    name: Cost Per Conversion by Device
    model: google_adwords
    explore: master_stats
    type: looker_bar
    fields:
    - master_stats.average_cost_per_conversion
    - master_stats.device_type
    fill_fields:
    - master_stats.device_type
    filters:
      master_stats._data_date: 1 quarters ago for 1 quarters
    sorts:
    - master_stats.average_cost_per_conversion desc
    limit: 500
    stacking: ''
    show_value_labels: true
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
    label_color: []
    x_axis_label: Device
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: bottom
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: master_stats.average_cost_per_conversion
        name: Ad Stats Cost
        axisId: master_stats.average_cost_per_conversion
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 860
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 848
    colors:
    - "#a9c574"
    - "#62bad4"
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
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
    row: 15
    col: 8
    width: 8
    height: 6
  - title: Cost Per Conversion by Bid Strategy
    name: Cost Per Conversion by Bid Strategy
    model: google_adwords
    explore: master_stats
    type: looker_bar
    fields:
    - master_stats.average_cost_per_conversion
    - keyword.bidding_strategy_type
    filters:
      master_stats._data_date: 1 quarters ago for 1 quarters
    sorts:
    - master_stats.average_cost_per_conversion desc
    limit: 500
    stacking: ''
    show_value_labels: true
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
    label_color: []
    x_axis_label: Bid Strategy
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: bottom
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: master_stats.average_cost_per_conversion
        name: Ad Stats Cost
        axisId: master_stats.average_cost_per_conversion
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 667
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 655
    colors:
    - "#929292"
    - "#a9c574"
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
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
    row: 15
    col: 16
    width: 8
    height: 6
  - title: Cost Per Conversion by Hour of Day
    name: Cost Per Conversion by Hour of Day
    model: google_adwords
    explore: master_stats
    type: looker_column
    fields:
    - master_stats.average_cost_per_conversion
    - master_stats.hour_of_day
    filters:
      master_stats._data_date: 1 quarters ago for 1 quarters
    sorts:
    - master_stats.hour_of_day
    limit: 500
    stacking: ''
    show_value_labels: true
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    groupBars: true
    labelSize: 10pt
    showLegend: true
    series_types: {}
    label_color: []
    x_axis_label: Hour Of Day
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: bottom
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: master_stats.average_cost_per_conversion
        name: Ad Stats Cost
        axisId: master_stats.average_cost_per_conversion
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 768
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 756
    conditional_formatting:
    - type: high to low
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 777
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 772
    colors:
    - "#a9c574"
    - "#62bad4"
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
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
    row: 28
    col: 14
    width: 10
    height: 7
  - title: Cost Per Conversion by Day of Week
    name: Cost Per Conversion by Day of Week
    model: google_adwords
    explore: master_stats
    type: looker_bar
    fields:
    - master_stats._data_day_of_week
    - master_stats.average_cost_per_conversion
    fill_fields:
    - master_stats._data_day_of_week
    filters:
      master_stats._data_date: 1 quarters ago for 1 quarters
    sorts:
    - master_stats._data_day_of_week
    limit: 500
    stacking: ''
    show_value_labels: true
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
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    groupBars: true
    labelSize: 10pt
    showLegend: true
    series_types: {}
    label_color: []
    x_axis_label: ''
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: bottom
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: master_stats.average_cost_per_conversion
        name: Ad Stats Cost
        axisId: master_stats.average_cost_per_conversion
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 963
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 951
    conditional_formatting:
    - type: high to low
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 972
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 967
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
    row: 21
    col: 14
    width: 10
    height: 7
  - title: Cost Per Conversion by Day of Week and Hour of Day
    name: Cost Per Conversion by Day of Week and Hour of Day
    model: google_adwords
    explore: master_stats
    type: table
    fields:
    - master_stats.average_cost_per_conversion
    - master_stats.hour_of_day
    - master_stats._data_day_of_week
    pivots:
    - master_stats._data_day_of_week
    fill_fields:
    - master_stats._data_day_of_week
    filters:
      master_stats._data_date: 1 quarters ago for 1 quarters
    sorts:
    - master_stats._data_day_of_week 0
    - master_stats.hour_of_day
    limit: 500
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    groupBars: true
    labelSize: 10pt
    showLegend: true
    stacking: ''
    show_value_labels: true
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
    label_color: []
    x_axis_label: Network
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: bottom
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: master_stats.average_cost_per_conversion
        name: Ad Stats Cost
        axisId: master_stats.average_cost_per_conversion
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 1074
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 1062
    conditional_formatting:
    - type: high to low
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 1083
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 1078
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
    row: 21
    col: 0
    width: 14
    height: 14
  filters:
  - name: This Timeframe
    title: This Timeframe
    type: field_filter
    default_value: this quarter
    model: google_adwords
    explore: kpis_this_period
    field: kpis_this_period.this_timeframe
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Last Timeframe
    title: Last Timeframe
    type: field_filter
    default_value: 1 quarter ago
    model: google_adwords
    explore: kpis_this_period
    field: kpis_last_period.last_timeframe
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Campaign
    title: Campaign
    type: field_filter
    default_value: ''
    model: google_adwords
    explore: master_stats
    field: campaign.campaign_name
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Ad Group
    title: Ad Group
    type: field_filter
    default_value: ''
    model: google_adwords
    explore: master_stats
    field: ad_group.ad_group_name
    listens_to_filters: []
    allow_multiple_values: true
    required: false
