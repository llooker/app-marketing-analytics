- dashboard: campaign_metrics__conversion_rate__this_quarter
  title: Campaign Metrics - Conversion Rate - This Quarter
  layout: newspaper
  embed_style:
    background_color: "#ffffff"
    title_color: "#3a4245"
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Conversion Rate vs Cost Per Conversion
    name: Conversion Rate vs Cost Per Conversion
    model: looker_app_google_adwords
    explore: period_fact
    type: looker_line
    fields:
    - fact.date_period_dynamic_grain
    - fact.average_cost_per_conversion
    - fact.average_conversion_rate
    sorts:
    - fact.date_period_dynamic_grain desc
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
      - id: fact.average_cost_per_conversion
        name: Cost per Conversion
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 75
        axisId: fact.average_cost_per_conversion
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
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
      - id: fact.average_conversion_rate
        name: Conversion Rate
        axisId: fact.average_conversion_rate
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 94
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 82
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
    hidden_fields: []
    column_group_spacing_ratio: 0
    column_spacing_ratio: 0
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: fact.date_date
      Period: fact.period
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
    - fact.ad_network_type
    - fact.average_conversion_rate
    fill_fields:
    - fact.ad_network_type
    sorts:
    - fact.ad_network_type
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
      - id: fact.average_conversion_rate
        name: Ad Stats Conversion Rate
        axisId: fact.average_conversion_rate
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 180
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 168
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
      Time Range: fact.date_date
      Period: fact.period
    row: 15
    col: 0
    width: 8
    height: 6
  - title: Ad Group Conversion Rate Change
    name: Ad Group Conversion Rate Change
    model: looker_app_google_adwords
    explore: period_fact
    type: looker_bar
    fields:
    - ad_group.ad_group_name
    - campaign.campaign_name
    - fact.average_conversion_rate_period_percent_change_abs
    - fact.average_conversion_rate
    - last_fact.average_conversion_rate
    filters:
      fact.conversion_rate_big_mover: 'Yes'
    sorts:
    - fact.average_conversion_rate_period_percent_change_abs desc
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
    - fact.average_conversion_rate_period_percent_change_abs
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
      - id: fact.conversion_rate_last_month
        name: Conversion Rate Last Month
        axisId: fact.conversion_rate_last_month
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 566
      - id: fac.conversion_rate_this_month
        name: Conversion Rate This Month
        axisId: fact.conversion_rate_this_month
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 571
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 554
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: fact.date_date
      Period: fact.period
    row: 35
    col: 0
    width: 12
    height: 10
  - title: Conversion Rate by Device
    name: Conversion Rate by Device
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - fact.device_type
    - fact.average_conversion_rate
    fill_fields:
    - fact.device_type
    sorts:
    - fact.average_conversion_rate desc
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
      - id: fact.average_conversion_rate
        name: Ad Stats Conversion Rate
        axisId: fact.average_conversion_rate
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 336
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 324
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
      Time Range: fact.date_date
      Period: fact.period
    row: 15
    col: 8
    width: 8
    height: 6
  - title: Conversion Rate by Day of Week
    name: Conversion Rate by Day of Week
    model: looker_app_google_adwords
    explore: period_fact
    type: looker_bar
    fields:
    - fact.date_day_of_week
    - fact.average_conversion_rate
    fill_fields:
    - fact.date_day_of_week
    sorts:
    - fact.date_day_of_week
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
      - id: fact.average_conversion_rate
        name: Ad Stats Conversion Rate
        axisId: fact.average_conversion_rate
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 765
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 753
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
        __LINE_NUM: 778
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 773
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
      Time Range: fact.date_date
      Period: fact.period
    row: 21
    col: 14
    width: 10
    height: 7
  - title: Conversion Rate by Day of Week and Hour of Day
    name: Conversion Rate by Day of Week and Hour of Day
    model: looker_app_google_adwords
    explore: ad_impressions
    type: table
    fields:
    - fact.hour_of_day
    - fact.date_day_of_week
    - fact.average_conversion_rate
    pivots:
    - fact.date_day_of_week
    fill_fields:
    - fact.date_day_of_week
    sorts:
    - fact.date_day_of_week 0
    - fact.hour_of_day
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
      - id: fact.total_conversions
        name: Ad Stats Cost
        axisId: fact.total_conversions
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 445
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 433
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
        __LINE_NUM: 458
      bold: false
      italic: false
      strikethrough: false
      fields:
      - fact.average_conversion_rate
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 453
    series_labels:
      fact.hour_of_day: Hour of Day
      fact.total_conversions: Conversions
      fact.date_day_of_week: Day of Week
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: fact.date_date
      Period: fact.period
    row: 21
    col: 0
    width: 14
    height: 14
  - title: Conversion Rate by Hour of Day
    name: Conversion Rate by Hour of Day
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_column
    fields:
    - fact.hour_of_day
    - fact.average_conversion_rate
    sorts:
    - fact.hour_of_day
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
      - id: fact.average_conversion_rate
        name: Ad Stats Conversion Rate
        axisId: fact.average_conversion_rate
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 887
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 875
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
        __LINE_NUM: 900
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 895
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
      Time Range: fact.date_date
      Period: fact.period
    row: 28
    col: 14
    width: 10
    height: 7
  - title: Conversion Rate by Bid Strategy
    name: Conversion Rate by Bid Strategy
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - keyword.bidding_strategy_type
    - fact.average_conversion_rate
    sorts:
    - fact.average_conversion_rate desc
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
      - id: fact.average_conversion_rate
        name: Ad Stats Conversion Rate
        axisId: fact.average_conversion_rate
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 257
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 245
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
      Time Range: fact.date_date
      Period: fact.period
    row: 15
    col: 16
    width: 8
    height: 6
  - title: Keyword Conversion Rate Changes
    name: Keyword Conversion Rate Changes
    model: looker_app_google_adwords
    explore: period_fact
    type: looker_bar
    fields:
    - keyword.criteria
    - ad_group.ad_group_name
    - campaign.campaign_name
    - fact.average_conversion_rate_period_percent_change_abs
    - fact.average_conversion_rate
    - last_fact.average_conversion_rate
    filters:
      fact.conversion_rate_big_mover: 'Yes'
    sorts:
    - fact.average_conversion_rate_period_percent_change_abs desc
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
    - fact.average_conversion_rate_period_percent_change_abs
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
      fact.conversion_rate_this_month: "#d06180"
      fact.conversion_rate_last_month: "#ea9895"
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
      - id: fact.conversion_rate_last_month
        name: Conversion Rate Last Month
        axisId: fact.conversion_rate_last_month
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 670
      - id: fact.conversion_rate_this_month
        name: Conversion Rate This Month
        axisId: fact.conversion_rate_this_month
        __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
        __LINE_NUM: 675
      __FILE: app_marketing_analytics/campaign_metrics_conversion_rate.dashboard.lookml
      __LINE_NUM: 658
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: fact.date_date
      Period: fact.period
    row: 35
    col: 12
    width: 12
    height: 10
  filters:
  - name: Campaign
    title: Campaign
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: looker_app_google_adwords
    explore: period_fact
    listens_to_filters: []
    field: campaign.campaign_name
  - name: Ad Group
    title: Ad Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: looker_app_google_adwords
    explore: period_fact
    listens_to_filters: []
    field: ad_group.ad_group_name
  - name: Time Range
    title: Time Range
    type: field_filter
    default_value: 1 quarters
    allow_multiple_values: true
    required: false
    model: looker_app_google_adwords
    explore: period_fact
    listens_to_filters: []
    field: fact.date_date
  - name: Period
    title: Period
    type: field_filter
    default_value: quarter
    allow_multiple_values: true
    required: true
    model: looker_app_google_adwords
    explore: period_fact
    listens_to_filters: []
    field: fact.period
