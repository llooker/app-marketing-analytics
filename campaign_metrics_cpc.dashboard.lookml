- dashboard: campaign_metrics_cost_per_click
  title: Campaign Metrics Cost Per Click
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
  - title: Cost Per Click by Bid Strategy
    name: Cost Per Click by Bid Strategy
    model: google_adwords
    explore: master_stats
    type: looker_bar
    fields:
    - master_stats.average_cost_per_click
    - keyword.bidding_strategy_type
    sorts:
    - master_stats.average_cost_per_click desc
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
      - id: master_stats.average_cost_per_click
        name: Ad Stats Cost
        axisId: master_stats.average_cost_per_click
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 416
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 404
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
      Time Range: master_stats._data_date
    row: 15
    col: 16
    width: 8
    height: 6
  - title: Cost Per Click by Device
    name: Cost Per Click by Device
    model: google_adwords
    explore: master_stats
    type: looker_bar
    fields:
    - master_stats.average_cost_per_click
    - master_stats.device_type
    fill_fields:
    - master_stats.device_type
    sorts:
    - master_stats.average_cost_per_click desc
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
      - id: master_stats.average_cost_per_click
        name: Ad Stats Cost
        axisId: master_stats.average_cost_per_click
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 496
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 484
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
      Time Range: master_stats._data_date
    row: 15
    col: 8
    width: 8
    height: 6
  - title: Cost Per Click by Day of Week and Hour of Day
    name: Cost Per Click by Day of Week and Hour of Day
    model: google_adwords
    explore: master_stats
    type: table
    fields:
    - master_stats.average_cost_per_click
    - master_stats.hour_of_day
    - master_stats._data_day_of_week
    pivots:
    - master_stats._data_day_of_week
    fill_fields:
    - master_stats._data_day_of_week
    sorts:
    - master_stats._data_day_of_week 0
    - master_stats.hour_of_day
    limit: 500
    show_view_names: true
    show_row_numbers: false
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
      - id: master_stats.average_cost_per_click
        name: Ad Stats Cost
        axisId: master_stats.average_cost_per_click
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 606
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 594
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
        __LINE_NUM: 619
      bold: false
      italic: false
      strikethrough: false
      fields:
      - master_stats.average_cost_per_click
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 614
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: master_stats._data_date
    row: 21
    col: 0
    width: 14
    height: 14
  - title: Cost Per Click by Day of Week
    name: Cost Per Click by Day of Week
    model: google_adwords
    explore: master_stats
    type: looker_bar
    fields:
    - master_stats._data_day_of_week
    - master_stats.average_cost_per_click
    fill_fields:
    - master_stats._data_day_of_week
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
      - id: master_stats.average_cost_per_click
        name: Ad Stats Cost
        axisId: master_stats.average_cost_per_click
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 718
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 706
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
        __LINE_NUM: 731
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 726
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: master_stats._data_date
    row: 21
    col: 14
    width: 10
    height: 7
  - title: Cost Per Click by Network
    name: Cost Per Click by Network
    model: google_adwords
    explore: master_stats
    type: looker_bar
    fields:
    - master_stats.ad_network_type
    - master_stats.average_cost_per_click
    fill_fields:
    - master_stats.ad_network_type
    sorts:
    - master_stats.average_cost_per_click desc
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
      - id: master_stats.average_cost_per_click
        name: Ad Stats Cost
        axisId: master_stats.average_cost_per_click
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 807
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 795
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: master_stats._data_date
    row: 15
    col: 0
    width: 8
    height: 6
  - title: Cost Per Click To Date
    name: Cost Per Click To Date
    model: google_adwords
    explore: master_stats
    type: looker_line
    fields:
    - master_stats.average_cost_per_click
    - master_stats.average_cost_per_conversion
    - master_stats._data_week
    sorts:
    - master_stats._data_week desc
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
      - id: master_stats.average_cost_per_conversion
        name: Cost per Conversion
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 891
        axisId: master_stats.average_cost_per_conversion
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 879
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
      - id: master_stats.average_cost_per_click
        name: Cost per Click
        axisId: master_stats.average_cost_per_click
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 910
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 898
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
      __LINE_NUM: 921
    colors:
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
    hidden_series: []
    series_labels:
      master_stats.total_clicks: Interactions
    hidden_fields: []
    column_group_spacing_ratio: 0
    column_spacing_ratio: 0
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Range: master_stats._data_date
    row: 4
    col: 0
    width: 24
    height: 11
  - title: Cost Per Click by Hour of Day
    name: Cost Per Click by Hour of Day
    model: google_adwords
    explore: master_stats
    type: looker_column
    fields:
    - master_stats.average_cost_per_click
    - master_stats.hour_of_day
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
      - id: master_stats.average_cost_per_click
        name: Ad Stats Cost
        axisId: master_stats.average_cost_per_click
        __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
        __LINE_NUM: 1031
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 1019
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
        __LINE_NUM: 1044
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_cpc.dashboard.lookml
      __LINE_NUM: 1039
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
  - title: Top Keywords
    name: Top Keywords
    model: google_adwords
    explore: master_stats
    type: table
    fields:
    - ad_group.ad_group_name
    - campaign.campaign_name
    - master_stats.total_cost_usd
    - keyword.criteria
    - master_stats.average_cost_per_click
    filters:
      master_stats._data_date: 1 quarters
      master_stats.conversions: ">0"
    sorts:
    - master_stats.average_cost_per_click
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hidden_fields:
    - master_stats.total_cost_usd
    - campaign.campaign_name
    - ad_group.ad_group_name
    row: 35
    col: 8
    width: 6
    height: 7
  - title: Top Landing Pages
    name: Top Landing Pages
    model: google_adwords
    explore: master_stats
    type: table
    fields:
    - ad.creative_final_urls
    - ad_group.ad_group_name
    - campaign.campaign_name
    - master_stats.average_cost_per_click
    - master_stats.total_cost_usd
    filters:
      master_stats._data_date: 1 quarters
      master_stats.clicks: ">0"
    sorts:
    - master_stats.average_cost_per_click
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hidden_fields:
    - master_stats.total_cost_usd
    - ad_group.ad_group_name
    - campaign.campaign_name
    row: 35
    col: 14
    width: 10
    height: 7
  - title: Top Ads
    name: Top Ads
    model: google_adwords
    explore: master_stats
    type: table
    fields:
    - ad_group.ad_group_name
    - campaign.campaign_name
    - master_stats.total_cost_usd
    - master_stats.average_cost_per_click
    - ad.creative
    filters:
      master_stats._data_date: 1 quarters
      master_stats.clicks: ">0"
    sorts:
    - master_stats.average_cost_per_click
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hidden_fields:
    - master_stats.total_cost_usd
    - campaign.campaign_name
    - ad_group.ad_group_name
    row: 35
    col: 0
    width: 8
    height: 7
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
  - name: Time Range
    title: Time Range
    type: field_filter
    default_value: 1 quarters
    model: google_adwords
    explore: master_stats
    field: master_stats._data_date
    listens_to_filters: []
    allow_multiple_values: true
    required: false
