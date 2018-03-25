- dashboard: campaign_metrics_conversion_rate
  extends: campaign_metrics_base
  title: Campaign Metrics - Conversion Rate - This Quarter
  layout: newspaper
  elements:
  - title: Conversion Rate vs Cost Per Conversion
    name: Conversion Rate vs Cost Per Conversion
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_line
    fields:
    - ad_impressions.date_week
    - ad_impressions.average_cost_per_conversion
    - ad_impressions.average_conversion_rate
    sorts:
    - ad_impressions.date_week desc
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
        name: Cost per Conversion
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 82
        axisId: ad_impressions.average_cost_per_conversion
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 70
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
      - id: ad_impressions.average_conversion_rate
        name: Conversion Rate
        axisId: ad_impressions.average_conversion_rate
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 101
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 89
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
    hidden_series: []
    series_labels:
      ad_impressions.total_conversions: Spend
      ad_impressions.total_clicks: Interactions
    hidden_fields: []
    column_group_spacing_ratio: 0
    column_spacing_ratio: 0
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: ad_impressions.date_date
    row: 4
    col: 0
    width: 24
    height: 11
  - title: Conversion Rate by Network
    name: Conversion Rate by Network
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad_impressions.ad_network_type
    - ad_impressions.average_conversion_rate
    fill_fields:
    - ad_impressions.ad_network_type
    sorts:
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
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: ad_impressions.average_conversion_rate
        name: Ad Stats Conversion Rate
        axisId: ad_impressions.average_conversion_rate
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 200
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 188
    series_colors: {}
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
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: ad_impressions.date_date
    row: 15
    col: 0
    width: 8
    height: 6
  - title: Conversion Rate by Bid Strategy
    name: Conversion Rate by Bid Strategy
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - keyword.bidding_strategy_type
    - ad_impressions.average_conversion_rate
    sorts:
    - ad_impressions.average_conversion_rate desc
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
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: ad_impressions.average_conversion_rate
        name: Ad Stats Conversion Rate
        axisId: ad_impressions.average_conversion_rate
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 277
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 265
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
  - title: Conversion Rate by Device
    name: Conversion Rate by Device
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad_impressions.device_type
    - ad_impressions.average_conversion_rate
    fill_fields:
    - ad_impressions.device_type
    sorts:
    - ad_impressions.average_conversion_rate desc
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
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: ad_impressions.average_conversion_rate
        name: Ad Stats Conversion Rate
        axisId: ad_impressions.average_conversion_rate
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 356
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 344
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
  - title: Conversion Rate by Day of Week and Hour of Day
    name: Conversion Rate by Day of Week and Hour of Day
    model: looker_app_google_adwords
    explore: ad_impressions
    type: table
    fields:
    - ad_impressions.hour_of_day
    - ad_impressions.date_day_of_week
    - ad_impressions.average_conversion_rate
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
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 465
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 453
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
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 478
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ad_impressions.average_conversion_rate
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 473
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
  - title: Ad Group Conversion Rate Change
    name: Ad Group Conversion Rate Change
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad_group.ad_group_name
    - campaign.campaign_name
    - ad_impressions.conversion_rate_monthly_change
    - ad_impressions.conversion_rate_absolute_value
    - ad_impressions.conversion_rate_last_month
    - ad_impressions.conversion_rate_this_month
    filters:
      ad_impressions.conversion_rate_absolute_value: ">0.2"
    sorts:
    - ad_impressions.conversion_rate_absolute_value desc
    limit: 50
    query_timezone: America/Los_Angeles
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    - campaign.campaign_name
    - ad_impressions.conversion_rate_absolute_value
    - ad_impressions.conversion_rate_monthly_change
    series_types: {}
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
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: bottom
      showLabels: true
      showValues: false
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: ad_impressions.conversion_rate_last_month
        name: Conversion Rate Last Month
        axisId: ad_impressions.conversion_rate_last_month
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 832
      - id: ad_impressions.conversion_rate_this_month
        name: Conversion Rate This Month
        axisId: ad_impressions.conversion_rate_this_month
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 820
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: ad_impressions.date_date
    row: 35
    col: 0
    width: 12
    height: 10
  - title: Keyword Conversion Rate Changes
    name: Keyword Conversion Rate Changes
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - keyword.criteria
    - ad_group.ad_group_name
    - campaign.campaign_name
    - ad_impressions.conversion_rate_monthly_change
    - ad_impressions.conversion_rate_absolute_value
    - ad_impressions.conversion_rate_last_month
    - ad_impressions.conversion_rate_this_month
    filters:
      ad_impressions.conversion_rate_absolute_value: ">0.2"
    sorts:
    - ad_impressions.conversion_rate_absolute_value desc
    limit: 50
    query_timezone: America/Los_Angeles
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    - ad_group.ad_group_name
    - ad_impressions.conversion_rate_absolute_value
    - ad_impressions.conversion_rate_monthly_change
    - campaign.campaign_name
    series_types: {}
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
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
    series_colors:
      ad_impressions.conversion_rate_this_month: "#d06180"
      ad_impressions.conversion_rate_last_month: "#ea9895"
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: bottom
      showLabels: true
      showValues: false
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: ad_impressions.conversion_rate_last_month
        name: Conversion Rate Last Month
        axisId: ad_impressions.conversion_rate_last_month
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 942
      - id: ad_impressions.conversion_rate_this_month
        name: Conversion Rate This Month
        axisId: ad_impressions.conversion_rate_this_month
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 930
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: ad_impressions.date_date
    row: 35
    col: 12
    width: 12
    height: 10
  - title: Conversion Rate by Day of Week
    name: Conversion Rate by Day of Week
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad_impressions.date_day_of_week
    - ad_impressions.average_conversion_rate
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
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: ad_impressions.average_conversion_rate
        name: Ad Stats Conversion Rate
        axisId: ad_impressions.average_conversion_rate
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 703
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 691
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
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 716
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 711
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
    row: 21
    col: 14
    width: 10
    height: 7
  - title: Conversion Rate by Hour of Day
    name: Conversion Rate by Hour of Day
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_column
    fields:
    - ad_impressions.hour_of_day
    - ad_impressions.average_conversion_rate
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
      orientation: left
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: ad_impressions.average_conversion_rate
        name: Ad Stats Conversion Rate
        axisId: ad_impressions.average_conversion_rate
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 579
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 567
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
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 592
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 587
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
    row: 28
    col: 14
    width: 10
    height: 7
  filters:
  - name: This Timeframe
    title: This Timeframe
    type: field_filter
    default_value: this quarter
    model: looker_app_google_adwords
    explore: ad_group_fact_this_timeframe
    field: fact.this_timeframe
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Last Timeframe
    title: Last Timeframe
    type: field_filter
    default_value: 1 quarter ago
    model: looker_app_google_adwords
    explore: ad_group_fact_this_timeframe
    field: last_fact.last_timeframe
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Campaign
    title: Campaign
    type: field_filter
    default_value: ''
    model: looker_app_google_adwords
    explore: ad_impressions
    field: campaign.campaign_name
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Ad Group
    title: Ad Group
    type: field_filter
    default_value: ''
    model: looker_app_google_adwords
    explore: ad_impressions
    field: ad_group.ad_group_name
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Time Range
    title: Time Range
    type: field_filter
    default_value: 1 quarters
    model: looker_app_google_adwords
    explore: ad_impressions
    field: ad_impressions.date_date
    listens_to_filters: []
    allow_multiple_values: true
    required: false
