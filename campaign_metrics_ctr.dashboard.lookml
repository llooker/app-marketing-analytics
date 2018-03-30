- dashboard: campaign_metrics__click_through_rate__this_quarter
  title: Campaign Metrics - Click Through Rate - This Quarter
  layout: newspaper
  embed_style:
    background_color: "#ffffff"
    title_color: "#3a4245"
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Click Through Rate To Date
    name: Click Through Rate To Date
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_line
    fields:
    - fact.average_click_rate
    - fact.date_period_dynamic_grain
    - fact.average_cost_per_click
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
      - id: fact.average_click_rate
        name: Click Through Rate
        __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
        __LINE_NUM: 74
        axisId: fact.average_click_rate
      __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
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
      - id: fact.average_cost_per_click
        name: Cost per Click
        axisId: fact.average_cost_per_click
        __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
        __LINE_NUM: 93
      __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
      __LINE_NUM: 81
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
      fact.total_clicks: Interactions
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
  - title: Click Through Rate by Network
    name: Click Through Rate by Network
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - fact.ad_network_type
    - fact.average_click_rate
    fill_fields:
    - fact.ad_network_type
    sorts:
    - fact.average_click_rate desc
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
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: fact.average_click_rate
        name: Ad Stats Cost
        axisId: fact.average_click_rate
        __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
        __LINE_NUM: 182
      __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
      __LINE_NUM: 170
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
    row: 15
    col: 0
    width: 8
    height: 6
  - title: Click Through Rate by Bid Strategy
    name: Click Through Rate by Bid Strategy
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - fact.average_click_rate
    - keyword.bidding_strategy_type
    sorts:
    - fact.average_click_rate desc
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
      - id: fact.average_click_rate
        name: Ad Stats Cost
        axisId: fact.average_click_rate
        __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
        __LINE_NUM: 338
      __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
      __LINE_NUM: 326
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
  - title: Click Through Rate by Day of Week and Hour of Day
    name: Click Through Rate by Day of Week and Hour of Day
    model: looker_app_google_adwords
    explore: ad_impressions
    type: table
    fields:
    - fact.average_click_rate
    - fact.hour_of_day
    - fact.date_day_of_week
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
      - id: fact.average_click_rate
        name: Ad Stats Cost
        axisId: fact.average_click_rate
        __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
        __LINE_NUM: 447
      __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
      __LINE_NUM: 435
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
        __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
        __LINE_NUM: 460
      bold: false
      italic: false
      strikethrough: false
      fields:
      - fact.average_click_rate
      __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
      __LINE_NUM: 455
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: fact.date_date
      Period: fact.period
    row: 21
    col: 0
    width: 14
    height: 14
  - title: Click Through Rate by Device
    name: Click Through Rate by Device
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - fact.average_click_rate
    - fact.device_type
    fill_fields:
    - fact.device_type
    sorts:
    - fact.average_click_rate desc
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
      - id: fact.average_click_rate
        name: Ad Stats Cost
        axisId: fact.average_click_rate
        __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
        __LINE_NUM: 261
      __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
      __LINE_NUM: 249
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
  - title: Click Through Rate by Day of Week
    name: Click Through Rate by Day of Week
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - fact.date_day_of_week
    - fact.average_click_rate
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
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: fact.average_click_rate
        name: Ad Stats Cost
        axisId: fact.average_click_rate
        __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
        __LINE_NUM: 559
      __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
      __LINE_NUM: 547
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
        __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
        __LINE_NUM: 572
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
      __LINE_NUM: 567
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
  - title: Click Through Rate by Hour of Day
    name: Click Through Rate by Hour of Day
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_column
    fields:
    - fact.average_click_rate
    - fact.hour_of_day
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
      orientation: bottom
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: fact.average_click_rate
        name: Ad Stats Cost
        axisId: fact.average_click_rate
        __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
        __LINE_NUM: 681
      __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
      __LINE_NUM: 669
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
        __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
        __LINE_NUM: 694
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
      __LINE_NUM: 689
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
  - title: Ad Group Click Through Rate Change
    name: Ad Group Click Through Rate Change
    model: looker_app_google_adwords
    explore: period_fact
    type: looker_bar
    fields:
    - ad_group.ad_group_name
    - campaign.campaign_name
    - fact.average_click_rate_period_percent_change_abs
    - fact.average_click_rate
    - last_fact.average_click_rate
    filters:
      fact.click_rate_big_mover: 'Yes'
    sorts:
    - fact.average_click_rate_period_percent_change_abs desc
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
    - campaign.campaign_name
    - fact.average_click_rate_period_percent_change_abs
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
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: fact.click_through_rate_last_month
        name: Click Through Rate Last Month
        axisId: fact.click_through_rate_last_month
        __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
        __LINE_NUM: 811
      - id: fact.click_through_rate_this_month
        name: Click Through Rate This Month
        axisId: fact.click_through_rate_this_month
        __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
        __LINE_NUM: 816
      __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
      __LINE_NUM: 799
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: fact.date_date
      Period: fact.period
    row: 35
    col: 0
    width: 12
    height: 10
  - title: Ad Click Through Rate Change
    name: Ad Click Through Rate Change
    model: looker_app_google_adwords
    explore: period_fact
    type: looker_bar
    fields:
    - ad.creative
    - ad_group.ad_group_name
    - campaign.campaign_name
    - fact.average_click_rate_period_percent_change_abs
    - fact.average_click_rate
    - last_fact.average_click_rate
    filters:
      fact.click_rate_big_mover: 'Yes'
    sorts:
    - fact.average_click_rate_period_percent_change_abs desc
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
    - fact.average_click_rate_period_percent_change_abs
    series_types: {}
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
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
      - id: fact.click_through_rate_last_month
        name: Click Through Rate Last Month
        axisId: fact.click_through_rate_last_month
        __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
        __LINE_NUM: 912
      - id: fact.click_through_rate_this_month
        name: Click Through Rate This Month
        axisId: fact.click_through_rate_this_month
        __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
        __LINE_NUM: 917
      __FILE: app_marketing_analytics/campaign_metrics_ctr.dashboard.lookml
      __LINE_NUM: 900
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
