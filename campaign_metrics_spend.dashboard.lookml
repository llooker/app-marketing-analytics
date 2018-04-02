- dashboard: campaign_metrics_spend
  title: Campaign Metrics - Spend
  layout: newspaper
  embed_style:
    background_color: "#ffffff"
    title_color: "#3a4245"
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Budget Utilization
    name: Budget Utilization
    model: looker_app_google_adwords
    explore: campaign_budget_date_fact
    type: looker_column
    fields:
    - fact.percent_used_budget_tier
    - fact.total_cost
    - fact.date_period_dynamic_grain
    pivots:
    - fact.percent_used_budget_tier
    sorts:
    - fact.percent_used_budget_tier
    - fact.date_period_dynamic_grain desc
    limit: 500
    column_limit: 50
    label: Campaign Budget Utilization
    stacking: normal
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
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    column_spacing_ratio:
    colors:
    - "#85D67C"
    - "#B1DB7A"
    - "#E2DF78"
    - "#E7AF75"
    - "#EB9474"
    - "#EE7772"
    series_colors: {}
    hide_legend: true
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: "[0.00%,20.00%)"
        name: "[0.00%,20.00%)"
        axisId: fact.total_cost
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 194
      - id: "[20.00%,40.00%)"
        name: "[20.00%,40.00%)"
        axisId: fact.total_cost
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 199
      - id: "[40.00%,60.00%)"
        name: "[40.00%,60.00%)"
        axisId: fact.total_cost
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 204
      - id: "[60.00%,80.00%)"
        name: "[60.00%,80.00%)"
        axisId: fact.total_cost
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 209
      - id: "[80.00%,100.00%)"
        name: "[80.00%,100.00%)"
        axisId: fact.total_cost
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 214
      - id: "[100.00%,inf)"
        name: "[100.00%,inf)"
        axisId: fact.total_cost
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 219
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 182
    listen:
      Campaign: campaign.campaign_name
      Time Range: fact.date_date
      Period: fact.period
    row: 4
    col: 16
    width: 8
    height: 11
  - title: Spend To Date
    name: Spend To Date
    model: looker_app_google_adwords
    explore: period_fact
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
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 81
        axisId: fact.average_cost_per_conversion
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 69
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
    hidden_fields:
    - fact.total_cost
    - last_fact.total_cost
    column_group_spacing_ratio: 0
    column_spacing_ratio: 0
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: fact.date_date
      Period: fact.period
    row: 4
    col: 0
    width: 16
    height: 11
  - title: Spend by Network
    name: Spend by Network
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - fact.ad_network_type
    - fact.total_cost
    fill_fields:
    - fact.ad_network_type
    sorts:
    - fact.total_cost desc
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
      - id: fact.total_cost
        name: Ad Stats Cost
        axisId: fact.total_cost
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 366
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 354
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
  - title: Spend by Device
    name: Spend by Device
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - fact.total_cost
    - fact.device_type
    fill_fields:
    - fact.device_type
    sorts:
    - fact.total_cost desc
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
      - id: fact.total_cost
        name: Ad Stats Cost
        axisId: fact.total_cost
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 285
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 273
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
  - title: Spend by Day of Week
    name: Spend by Day of Week
    model: looker_app_google_adwords
    explore: period_fact
    type: looker_bar
    fields:
    - fact.date_day_of_week
    - fact.total_cost
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
      - id: fact.total_cost
        name: Ad Stats Cost
        axisId: fact.total_cost
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 555
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 543
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
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 568
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 563
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
    height: 6
  - title: Spend by Bid Strategy
    name: Spend by Bid Strategy
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - fact.total_cost
    - keyword.bidding_strategy_type
    sorts:
    - fact.total_cost desc
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
      - id: fact.total_cost
        name: Ad Stats Cost
        axisId: fact.total_cost
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 569
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 557
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
  - title: Spend by Day of Week and Hour of Day
    name: Spend by Day of Week and Hour of Day
    model: looker_app_google_adwords
    explore: ad_impressions
    type: table
    fields:
    - fact.total_cost
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
      - id: fact.total_cost
        name: Ad Stats Cost
        axisId: fact.total_cost
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 802
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 790
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
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 815
      bold: false
      italic: false
      strikethrough: false
      fields:
      - fact.total_cost
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 810
    series_labels:
      fact.hour_of_day: Hour of Day
      fact.total_cost: Spend
      fact.date_day_of_week: Day of Week
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: fact.date_date
      Period: fact.period
    row: 21
    col: 0
    width: 14
    height: 12
  - title: Spend by Hour of Day
    name: Spend by Hour of Day
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_column
    fields:
    - fact.total_cost
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
      - id: fact.total_cost
        name: Ad Stats Cost
        axisId: fact.total_cost
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 677
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 665
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
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 690
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 685
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
    row: 27
    col: 14
    width: 10
    height: 6
  - title: Top Keywords by Spend
    name: Top Keywords by Spend
    model: looker_app_google_adwords
    explore: period_fact
    type: looker_column
    fields:
    - ad_group.ad_group_name
    - campaign.campaign_name
    - fact.total_cost
    - keyword.criteria
    sorts:
    - fact.total_cost desc
    limit: 50
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
      orientation: bottom
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: fact.total_cost
        name: Cost
        axisId: fact.total_cost
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 921
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 909
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: fact.date_date
      Period: fact.period
    row: 33
    col: 12
    width: 12
    height: 14
  - title: Top Ads by Spend
    name: Top Ads by Spend
    model: looker_app_google_adwords
    explore: period_fact
    type: looker_bar
    fields:
    - ad.creative
    - ad_group.ad_group_name
    - campaign.campaign_name
    - fact.total_cost
    sorts:
    - fact.total_cost desc
    limit: 50
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
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: fact.total_cost
        name: Cost
        axisId: fact.total_cost
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 1002
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 990
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
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: fact.date_date
      Period: fact.period
    row: 33
    col: 0
    width: 12
    height: 7
  - title: Top Landing Pages by Spend
    name: Top Landing Pages by Spend
    model: looker_app_google_adwords
    explore: period_fact
    type: looker_bar
    fields:
    - ad.creative_final_urls_domain_path
    - ad_group.ad_group_name
    - campaign.campaign_name
    - fact.total_cost
    sorts:
    - fact.total_cost desc
    limit: 50
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
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: fact.total_cost
        name: Cost
        axisId: fact.total_cost
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 1112
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 1100
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: fact.date_date
      Period: fact.period
    row: 40
    col: 0
    width: 12
    height: 7
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
    default_value: 28 days
    allow_multiple_values: true
    required: false
    model: looker_app_google_adwords
    explore: period_fact
    listens_to_filters: []
    field: fact.date_date
  - name: Period
    title: Period
    type: field_filter
    default_value: 28day
    allow_multiple_values: true
    required: true
    model: looker_app_google_adwords
    explore: period_fact
    listens_to_filters: []
    field: fact.period
