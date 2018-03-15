- dashboard: campaign_metrics_conversions
  extends: campaign_metrics_base
  title: Campaign Metrics - Conversions - This Quarter
  layout: newspaper
  elements:
  - title: Conversions To Date
    name: Conversions To Date
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_column
    fields:
    - ad_impressions.average_cost_per_conversion
    - ad_impressions.total_conversions
    - ad_impressions.date_week
    sorts:
    - ad_impressions.date_week
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: false
    point_style: none
    interpolation: linear
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
    series_types:
      ad_impressions.average_cost_per_conversion: line
    show_dropoff: false
    y_axes:
    - label:
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
        name: Cost Per Conversion
        __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
        __LINE_NUM: 75
        axisId: ad_impressions.average_cost_per_conversion
      __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
      __LINE_NUM: 63
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
        __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
        __LINE_NUM: 94
      __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
      __LINE_NUM: 82
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
      __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
      __LINE_NUM: 105
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
      ad_impressions.total_conversions: Conversions
      ad_impressions.total_clicks: Interactions
      ad_impressions.average_conversion_rate: Conversion Rate
      ad_impressions.average_cost_per_conversion: Cost Per Conversion
    hidden_fields: []
    column_group_spacing_ratio:
    column_spacing_ratio:
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: ad_impressions.date_date
    row: 4
    col: 0
    width: 24
    height: 11
  - title: Conversions by Day of Week
    name: Conversions by Day of Week
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad_impressions.date_day_of_week
    - ad_impressions.total_conversions
    fill_fields:
    - ad_impressions.date_day_of_week
    sorts:
    - ad_impressions.date_day_of_week
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
      - id: ad_impressions.total_conversions
        name: Ad Stats Cost
        axisId: ad_impressions.total_conversions
        __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
        __LINE_NUM: 222
      __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
      __LINE_NUM: 210
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
        __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
        __LINE_NUM: 235
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
      __LINE_NUM: 230
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
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: ad_impressions.date_date
    row: 21
    col: 14
    width: 10
    height: 7
  - title: Conversions by Hour of Day
    name: Conversions by Hour of Day
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_column
    fields:
    - ad_impressions.total_conversions
    - ad_impressions.hour_of_day
    sorts:
    - ad_impressions.hour_of_day
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
      - id: ad_impressions.total_conversions
        name: Ad Stats Cost
        axisId: ad_impressions.total_conversions
        __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
        __LINE_NUM: 344
      __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
      __LINE_NUM: 332
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
        __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
        __LINE_NUM: 357
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
      __LINE_NUM: 352
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
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: ad_impressions.date_date
    row: 28
    col: 14
    width: 10
    height: 7
  - title: Conversions by Day of Week and Hour of Day
    name: Conversions by Day of Week and Hour of Day
    model: looker_app_google_adwords
    explore: ad_impressions
    type: table
    fields:
    - ad_impressions.total_conversions
    - ad_impressions.hour_of_day
    - ad_impressions.date_day_of_week
    pivots:
    - ad_impressions.date_day_of_week
    fill_fields:
    - ad_impressions.date_day_of_week
    sorts:
    - ad_impressions.date_day_of_week 0
    - ad_impressions.hour_of_day
    limit: 500
    show_view_names: true
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
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
      - id: ad_impressions.total_conversions
        name: Ad Stats Cost
        axisId: ad_impressions.total_conversions
        __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
        __LINE_NUM: 472
      __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
      __LINE_NUM: 460
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
        __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
        __LINE_NUM: 485
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ad_impressions.total_conversions
      __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
      __LINE_NUM: 480
    series_labels:
      ad_impressions.hour_of_day: Hour of Day
      ad_impressions.total_conversions: Conversions
      ad_impressions.date_day_of_week: Day of Week
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: ad_impressions.date_date
    row: 21
    col: 0
    width: 14
    height: 14
  - title: Conversions by Network
    name: Conversions by Network
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad_impressions.ad_network_type
    - ad_impressions.total_conversions
    fill_fields:
    - ad_impressions.ad_network_type
    sorts:
    - ad_impressions.total_conversions desc
    - ad_impressions.ad_network_type
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
      - id: ad_impressions.total_conversions
        name: Ad Stats Cost
        axisId: ad_impressions.total_conversions
        __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
        __LINE_NUM: 741
      __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
      __LINE_NUM: 729
    colors:
    - "#8ac8ca"
    - "#7869df"
    - "#6e98f9"
    - "#d06180"
    - "#dc9d4f"
    - "#4bb86a"
    - "#a4a6a9"
    - "#a6b7ff"
    - "#afe8fd"
    - "#ea9895"
    - "#f1e582"
    series_colors: {}
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: ad_impressions.date_date
    row: 15
    col: 0
    width: 8
    height: 6
  - title: Conversions by Device
    name: Conversions by Device
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad_impressions.total_conversions
    - ad_impressions.device_type
    fill_fields:
    - ad_impressions.device_type
    sorts:
    - ad_impressions.total_conversions desc
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
      - id: ad_impressions.total_conversions
        name: Ad Stats Cost
        axisId: ad_impressions.total_conversions
        __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
        __LINE_NUM: 820
      __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
      __LINE_NUM: 808
    colors:
    - "#d06180"
    - "#7869df"
    - "#6e98f9"
    - "#8ac8ca"
    - "#dc9d4f"
    - "#4bb86a"
    - "#a4a6a9"
    - "#a6b7ff"
    - "#afe8fd"
    - "#ea9895"
    - "#f1e582"
    series_colors: {}
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: ad_impressions.date_date
    row: 15
    col: 8
    width: 8
    height: 6
  - title: Conversions by Bid Strategy
    name: Conversions by Bid Strategy
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad_impressions.total_conversions
    - keyword.bidding_strategy_type
    sorts:
    - ad_impressions.total_conversions desc
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
      - id: ad_impressions.total_conversions
        name: Ad Stats Cost
        axisId: ad_impressions.total_conversions
        __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
        __LINE_NUM: 897
      __FILE: app_marketing_analytics/campaign_metrics_conversions.dashboard.lookml
      __LINE_NUM: 885
    colors:
    - "#dc9d4f"
    - "#7869df"
    - "#6e98f9"
    - "#8ac8ca"
    - "#d06180"
    - "#4bb86a"
    - "#a4a6a9"
    - "#a6b7ff"
    - "#afe8fd"
    - "#ea9895"
    - "#f1e582"
    series_colors: {}
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: ad_impressions.date_date
    row: 15
    col: 16
    width: 8
    height: 6
  - name: Top Landing Pages by Conversions
    title: Top Landing Pages by Conversions
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad.creative_final_urls_domain_path
    - ad_group.ad_group_name
    - campaign.campaign_name
    - ad_impressions.total_conversions
    sorts:
    - ad_impressions.total_conversions desc
    limit: 50
    column_limit: 50
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: true
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
    query_timezone: America/Los_Angeles
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '7'
    hidden_fields:
    - ad_group.ad_group_name
    - campaign.campaign_name
    colors:
    - "#f1e582"
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
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: bottom
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
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 1199
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 1187
    row: 42
    col: 0
    width: 12
    height: 7
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: ad_impressions.date_date
  - name: Top Keywords by Conversions
    title: Top Keywords by Conversions
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_column
    fields:
    - ad_group.ad_group_name
    - campaign.campaign_name
    - keyword.criteria
    - ad_impressions.total_conversions
    sorts:
    - ad_impressions.total_conversions desc
    limit: 50
    column_limit: 50
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: true
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
    query_timezone: America/Los_Angeles
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '7'
    hidden_fields:
    - ad_group.ad_group_name
    - campaign.campaign_name
    colors:
    - "#ea9895"
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
      - id: ad_impressions.total_conversions
        name: Conversions
        axisId: ad_impressions.total_conversions
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 1180
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 1168
    row: 35
    col: 12
    width: 12
    height: 14
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: ad_impressions.date_date
  - name: Top Ads by Conversions
    title: Top Ads by Conversions
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad.creative
    - ad_group.ad_group_name
    - campaign.campaign_name
    - ad_impressions.total_conversions
    sorts:
    - ad_impressions.total_conversions desc
    limit: 50
    column_limit: 50
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: true
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
    query_timezone: America/Los_Angeles
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '7'
    hidden_fields:
    - campaign.campaign_name
    - ad_group.ad_group_name
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: bottom
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
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 1079
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 1067
    hide_legend: false
    colors:
    - "#a6b7ff"
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
    row: 35
    col: 0
    width: 12
    height: 7
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: ad_impressions.date_date
  filters:
  - name: This Timeframe
    title: This Timeframe
    type: field_filter
    default_value: this quarter
    allow_multiple_values: true
    required: false
    model: looker_app_google_adwords
    explore: kpis_this_period
    listens_to_filters: []
    field: kpis_this_period.this_timeframe
  - name: Last Timeframe
    title: Last Timeframe
    type: field_filter
    default_value: 1 quarter ago
    allow_multiple_values: true
    required: false
    model: looker_app_google_adwords
    explore: kpis_this_period
    listens_to_filters: []
    field: kpis_last_period.last_timeframe
  - name: Campaign
    title: Campaign
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: looker_app_google_adwords
    explore: ad_impressions
    listens_to_filters: []
    field: campaign.campaign_name
  - name: Ad Group
    title: Ad Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: looker_app_google_adwords
    explore: ad_impressions
    listens_to_filters: []
    field: ad_group.ad_group_name
  - name: Time Range
    title: Time Range
    type: field_filter
    default_value: 1 quarters
    allow_multiple_values: true
    required: false
    model: looker_app_google_adwords
    explore: ad_impressions
    listens_to_filters: []
    field: ad_impressions.date_date
