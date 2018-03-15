- dashboard: campaign_metrics_cost_per_click
  extends: campaign_metrics_base
  title: Campaign Metrics - Cost Per Click - This Quarter
  elements:
  - title: Cost Per Click To Date
    name: Cost Per Click To Date
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_line
    fields:
    - ad_impressions.average_cost_per_click
    - ad_impressions.average_cost_per_conversion
    - ad_impressions.date_week
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
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 74
        axisId: ad_impressions.average_cost_per_conversion
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 62
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
      - id: ad_impressions.average_cost_per_click
        name: Cost per Click
        axisId: ad_impressions.average_cost_per_click
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 93
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 81
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
      __LINE_NUM: 104
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
  - title: Cost Per Click by Network
    name: Cost Per Click by Network
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad_impressions.ad_network_type
    - ad_impressions.average_cost_per_click
    fill_fields:
    - ad_impressions.ad_network_type
    sorts:
    - ad_impressions.average_cost_per_click desc
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
      - id: ad_impressions.average_cost_per_click
        name: Ad Stats Cost
        axisId: ad_impressions.average_cost_per_click
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 192
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 180
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
  - title: Cost Per Click by Device
    name: Cost Per Click by Device
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad_impressions.average_cost_per_click
    - ad_impressions.device_type
    fill_fields:
    - ad_impressions.device_type
    sorts:
    - ad_impressions.average_cost_per_click desc
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
      - id: ad_impressions.average_cost_per_click
        name: Ad Stats Cost
        axisId: ad_impressions.average_cost_per_click
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 271
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 259
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
  - title: Cost Per Click by Bid Strategy
    name: Cost Per Click by Bid Strategy
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad_impressions.average_cost_per_click
    - keyword.bidding_strategy_type
    sorts:
    - ad_impressions.average_cost_per_click desc
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
      - id: ad_impressions.average_cost_per_click
        name: Ad Stats Cost
        axisId: ad_impressions.average_cost_per_click
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 348
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 336
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
  - title: Cost Per Click by Day of Week and Hour of Day
    name: Cost Per Click by Day of Week and Hour of Day
    model: looker_app_google_adwords
    explore: ad_impressions
    type: table
    fields:
    - ad_impressions.average_cost_per_click
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
      - id: ad_impressions.average_cost_per_click
        name: Ad Stats Cost
        axisId: ad_impressions.average_cost_per_click
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 702
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 690
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
        __LINE_NUM: 715
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ad_impressions.average_cost_per_click
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 710
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: ad_impressions.date_date
    row: 21
    col: 0
    width: 14
    height: 14
  - title: Cost Per Click by Day of Week
    name: Cost Per Click by Day of Week
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad_impressions.date_day_of_week
    - ad_impressions.average_cost_per_click
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
      - id: ad_impressions.average_cost_per_click
        name: Ad Stats Cost
        axisId: ad_impressions.average_cost_per_click
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 453
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 441
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
        __LINE_NUM: 466
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 461
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
  - title: Cost Per Click by Hour of Day
    name: Cost Per Click by Hour of Day
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_column
    fields:
    - ad_impressions.average_cost_per_click
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
      - id: ad_impressions.average_cost_per_click
        name: Ad Stats Cost
        axisId: ad_impressions.average_cost_per_click
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 575
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 563
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
        __LINE_NUM: 588
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 583
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
    row: 28
    col: 14
    width: 10
    height: 7
  - title: Ad Cost Per Click Change
    name: Ad Cost Per Click Change
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad.creative
    - ad_group.ad_group_name
    - campaign.campaign_name
    - ad_impressions.cpa_monthly_change_absolute_value
    - ad_impressions.cost_per_conversion_last_month
    - ad_impressions.cost_per_conversion_this_month
    filters:
      campaign.campaign_name: ''
      ad_group.ad_group_name: ''
      ad_impressions.date_date: 1 quarters
      ad_impressions.cpa_monthly_change_absolute_value: ">0.2"
    sorts:
    - ad_impressions.cpa_monthly_change_absolute_value desc
    limit: 50
    column_limit: 50
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
    - campaign.campaign_name
    - ad_impressions.cpa_monthly_change_absolute_value
    series_types: {}
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    colors:
    - "#dc9d4f"
    - "#dc9d4f"
    - "#ea9895"
    - "#d06180"
    - "#a6b7ff"
    - "#7869df"
    - "#6e98f9"
    - "#8ac8ca"
    - "#dc9d4f"
    - "#4bb86a"
    - "#a4a6a9"
    - "#a6b7ff"
    - "#afe8fd"
    - "#ea989"
    series_colors:
      ad_impressions.cost_per_conversion_last_month: "#f1cc9a"
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
    row: 35
    col: 9
    width: 8
    height: 10
  - title: Ad Group Cost Per Click Change
    name: Ad Group Cost Per Click Change
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad_group.ad_group_name
    - campaign.campaign_name
    - ad_impressions.cost_per_click_absolute_value
    - ad_impressions.cost_per_click_last_month
    - ad_impressions.cost_per_click_this_month
    filters:
      ad_group.ad_group_name: ''
      ad_impressions.date_date: 1 quarters
      campaign.campaign_name: ''
      ad_impressions.cost_per_click_absolute_value: ">0.2"
    sorts:
    - ad_impressions.cost_per_click_absolute_value desc
    limit: 500
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
    series_types: {}
    hidden_fields:
    - campaign.campaign_name
    - ad_impressions.cost_per_click_absolute_value
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
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
      - id: ad_impressions.cost_per_click_absolute_value
        name: Ad Impressions CPC Monthly Change Absolute Value
        axisId: ad_impressions.cost_per_click_absolute_value
      - id: ad_impressions.cost_per_click_this_month
        name: Ad Impressions Cost per Click This Month
        axisId: ad_impressions.cost_per_click_this_month
      - id: ad_impressions.cost_per_click_last_month
        name: Ad Impressions Cost per Click Last Month
        axisId: ad_impressions.cost_per_click_last_month
    series_colors:
      ad_impressions.cost_per_click_this_month: "#a6b7ff"
      ad_impressions.cost_per_click_last_month: "#7869df"
    row: 35
    col: 0
    width: 9
    height: 10
  - title: Keyword Cost Per Click Change
    name: Keyword Cost Per Click Change
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - keyword.criteria
    - ad_group.ad_group_name
    - campaign.campaign_name
    - ad_impressions.cost_per_click_absolute_value
    - ad_impressions.cost_per_click_last_month
    - ad_impressions.cost_per_click_this_month
    filters:
      ad_group.ad_group_name: ''
      ad_impressions.date_date: 1 quarters
      campaign.campaign_name: ''
      ad_impressions.cost_per_click_absolute_value: ">0.2"
    sorts:
    - ad_impressions.cost_per_click_absolute_value desc
    limit: 500
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
    series_types: {}
    hidden_fields:
    - campaign.campaign_name
    - ad_impressions.cost_per_click_absolute_value
    - ad_group.ad_group_name
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
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
      - id: ad_impressions.cost_per_click_absolute_value
        name: Ad Impressions CPC Monthly Change Absolute Value
        axisId: ad_impressions.cost_per_click_absolute_value
      - id: ad_impressions.cost_per_click_this_month
        name: Ad Impressions Cost per Click This Month
        axisId: ad_impressions.cost_per_click_this_month
      - id: ad_impressions.cost_per_click_last_month
        name: Ad Impressions Cost per Click Last Month
        axisId: ad_impressions.cost_per_click_last_month
    series_colors: {}
    colors:
    - "#ea9895"
    - "#d06180"
    - "#a6b7ff"
    - "#7869df"
    - "#6e98f9"
    - "#8ac8ca"
    - "#dc9d4f"
    - "#4bb86a"
    - "#a4a6a9"
    - "#a6b7ff"
    - "#afe8fd"
    - "#ea989"
    row: 35
    col: 17
    width: 7
    height: 10
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
