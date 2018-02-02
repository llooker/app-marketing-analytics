- dashboard: ad_performance
  title: Ad Group
  layout: newspaper
  elements:
  - title: Ad spend qtd
    name: Ad spend qtd
    model: google_adwords
    explore: ad_group_quarter_stats
    type: single_value
    fields:
    - ad_group_quarter_stats.total_cost_usd
    - ad_group_quarter_stats._data_quarter
    - last_ad_group_quarter_stats.total_cost_usd
    fill_fields:
    - ad_group_quarter_stats._data_quarter
    sorts:
    - ad_group_quarter_stats._data_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: quarterly_change
      label: Quarterly Change
      expression: "${ad_group_quarter_stats.total_cost_usd} - ${last_ad_group_quarter_stats.total_cost_usd}\n"
      value_format:
      value_format_name: usd_0
    hidden_fields:
    - last_ad_group_quarter_stats.total_cost_usd
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
    listen:
      Campaign Name: campaign.campaign_name
      Ad Group Name: ad_group.ad_group_name
    row: 0
    col: 0
    width: 8
    height: 2
  - title: Conversions qtd (copy)
    name: Conversions qtd (copy)
    model: google_adwords
    explore: ad_group_quarter_stats
    type: single_value
    fields:
    - ad_group_quarter_stats._data_quarter
    - ad_group_quarter_stats.total_conversions
    - last_ad_group_quarter_stats.total_conversions
    fill_fields:
    - ad_group_quarter_stats._data_quarter
    sorts:
    - ad_group_quarter_stats._data_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: quarterly_change
      label: Quarterly Change
      expression: "${ad_group_quarter_stats.total_conversions} - ${last_ad_group_quarter_stats.total_conversions}\n"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    hidden_fields:
    - last_ad_group_quarter_stats.total_conversions
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
    listen:
      Campaign Name: campaign.campaign_name
      Ad Group Name: ad_group.ad_group_name
    row: 0
    col: 8
    width: 5
    height: 2
  - title: Cost per conversion qtd
    name: Cost per conversion qtd
    model: google_adwords
    explore: ad_group_quarter_stats
    type: single_value
    fields:
    - ad_group_quarter_stats._data_quarter
    - ad_group_quarter_stats.average_cost_per_conversion
    - last_ad_group_quarter_stats.average_cost_per_conversion
    fill_fields:
    - ad_group_quarter_stats._data_quarter
    sorts:
    - ad_group_quarter_stats._data_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: quarterly_change
      label: Quarterly % Change
      expression: "(${ad_group_quarter_stats.average_cost_per_conversion} -  ${last_ad_group_quarter_stats.average_cost_per_conversion})/${last_ad_group_quarter_stats.average_cost_per_conversion}\n"
      value_format:
      value_format_name: percent_0
    hidden_fields:
    - last_ad_group_quarter_stats.average_cost_per_conversion
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
    listen:
      Campaign Name: campaign.campaign_name
      Ad Group Name: ad_group.ad_group_name
    row: 2
    col: 8
    width: 5
    height: 2
  - title: Conversion rate qtd
    name: Conversion rate qtd
    model: google_adwords
    explore: ad_group_quarter_stats
    type: single_value
    fields:
    - ad_group_quarter_stats._data_quarter
    - ad_group_quarter_stats.average_conversion_rate
    - last_ad_group_quarter_stats.average_conversion_rate
    fill_fields:
    - ad_group_quarter_stats._data_quarter
    sorts:
    - ad_group_quarter_stats._data_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: quarterly_change
      label: Quarterly % Change
      expression: "(${ad_group_quarter_stats.average_conversion_rate} - ${last_ad_group_quarter_stats.average_conversion_rate})/${last_ad_group_quarter_stats.average_conversion_rate}\n"
      value_format:
      value_format_name: percent_0
    hidden_fields:
    - last_ad_group_quarter_stats.average_conversion_rate
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
    listen:
      Campaign Name: campaign.campaign_name
      Ad Group Name: ad_group.ad_group_name
    row: 4
    col: 8
    width: 5
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
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 347
        axisId: master_stats.average_cost_per_conversion
      __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
      __LINE_NUM: 335
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
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 366
      __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
      __LINE_NUM: 354
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
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 385
      __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
      __LINE_NUM: 373
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
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 404
      __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
      __LINE_NUM: 392
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
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 423
      __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
      __LINE_NUM: 411
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
      __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
      __LINE_NUM: 434
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
    listen:
      Campaign Name: campaign.campaign_name
      Ad Group Name: ad_group.ad_group_name
    row: 2
    col: 0
    width: 8
    height: 8
  - title: Interaction rate qtd
    name: Interaction rate qtd
    model: google_adwords
    explore: ad_group_quarter_stats
    type: single_value
    fields:
    - ad_group_quarter_stats._data_quarter
    - ad_group_quarter_stats.average_interaction_rate
    - last_ad_group_quarter_stats.average_interaction_rate
    fill_fields:
    - ad_group_quarter_stats._data_quarter
    sorts:
    - ad_group_quarter_stats._data_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: quarterly_change
      label: Quarterly % Change
      expression: "(${ad_group_quarter_stats.average_interaction_rate} - ${last_ad_group_quarter_stats.average_interaction_rate}\
        \ )/${last_ad_group_quarter_stats.average_interaction_rate}\n"
      value_format:
      value_format_name: percent_0
    hidden_fields:
    - last_ad_group_quarter_stats.average_interaction_rate
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
    listen:
      Campaign Name: campaign.campaign_name
      Ad Group Name: ad_group.ad_group_name
    row: 8
    col: 8
    width: 5
    height: 2
  - title: Cost per interaction qtd
    name: Cost per interaction qtd
    model: google_adwords
    explore: ad_group_quarter_stats
    type: single_value
    fields:
    - ad_group_quarter_stats._data_quarter
    - last_ad_group_quarter_stats.average_cost_per_interaction
    - ad_group_quarter_stats.average_cost_per_interaction
    fill_fields:
    - ad_group_quarter_stats._data_quarter
    sorts:
    - ad_group_quarter_stats._data_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: change
      label: "% Change"
      expression: "(${ad_group_quarter_stats.average_cost_per_interaction} - ${last_ad_group_quarter_stats.average_cost_per_interaction})/${last_ad_group_quarter_stats.average_cost_per_interaction}\n"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    hidden_fields:
    - last_ad_group_quarter_stats.average_cost_per_interaction
    label: Cost per Interaction QTD
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
    single_value_title: Per Interaction
    comparison_label: ''
    listen:
      Campaign Name: campaign.campaign_name
      Ad Group Name: ad_group.ad_group_name
    row: 6
    col: 8
    width: 5
    height: 2
  - title: Funnel
    name: Funnel
    model: google_adwords
    explore: ad_group_quarter_stats
    type: looker_column
    fields:
    - ad_group_quarter_stats.total_impressions
    - ad_group_quarter_stats.total_clicks
    - ad_group_quarter_stats.total_conversions
    filters:
      ad_group_quarter_stats._data_quarter: 1 quarters
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
      - id: ad_group_quarter_stats.total_impressions
        name: Impressions
        axisId: ad_group_quarter_stats.total_impressions
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 665
      - id: ad_group_quarter_stats.total_clicks
        name: Clicks
        axisId: ad_group_quarter_stats.total_clicks
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 670
      - id: ad_group_quarter_stats.total_conversions
        name: Conversions
        axisId: ad_group_quarter_stats.total_conversions
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 675
      __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
      __LINE_NUM: 653
    show_dropoff: true
    listen:
      Campaign Name: campaign.campaign_name
      Ad Group Name: ad_group.ad_group_name
    row: 10
    col: 16
    width: 8
    height: 6
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
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 766
        axisId: master_stats.average_cost_per_conversion
      __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
      __LINE_NUM: 754
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
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 785
      __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
      __LINE_NUM: 773
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
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 804
      __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
      __LINE_NUM: 792
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
      __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
      __LINE_NUM: 815
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    hidden_series:
    - master_stats.average_conversion_rate
    series_labels:
      master_stats.total_cost_usd: Spend
      master_stats.total_clicks: Interactions
    hidden_fields: []
    listen:
      Campaign Name: campaign.campaign_name
      Ad Group Name: ad_group.ad_group_name
    row: 0
    col: 13
    width: 11
    height: 10
  - title: Bid Strategy
    name: Bid Strategy
    model: google_adwords
    explore: master_stats
    type: looker_column
    fields:
    - keyword.bidding_strategy_type
    - master_stats.average_cost_per_conversion
    - master_stats.total_cost_usd
    filters:
      master_stats._data_date: 1 quarters
    sorts:
    - master_stats.total_cost_usd desc
    limit: 500
    column_limit: 50
    label: Top 10 Keyword Performance
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
    show_null_points: true
    point_style: none
    interpolation: linear
    value_labels: legend
    label_type: labPer
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    font_size: '12'
    hidden_fields:
    - master_stats.total_cost_usd
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
      - id: PHRASE - Keyword Stats Cost per Conversion
        name: PHRASE - Keyword Stats Cost per Conversion
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 1331
      - id: EXACT - Keyword Stats Cost per Conversion
        name: EXACT - Keyword Stats Cost per Conversion
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 1334
      - id: BROAD - Keyword Stats Cost per Conversion
        name: BROAD - Keyword Stats Cost per Conversion
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 1336
      __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
      __LINE_NUM: 1329
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
      - id: PHRASE - Keyword Stats Total Cost USD
        name: PHRASE - Keyword Stats Total Cost USD
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 1342
      - id: EXACT - Keyword Stats Total Cost USD
        name: EXACT - Keyword Stats Total Cost USD
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 1344
      - id: BROAD - Keyword Stats Total Cost USD
        name: BROAD - Keyword Stats Total Cost USD
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 1346
      __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
      __LINE_NUM: 1339
    series_types: {}
    listen:
      Ad Group Name: ad_group.ad_group_name
      Campaign Name: campaign.campaign_name
    row: 10
    col: 0
    width: 8
    height: 6
  - title: Match Type CPA
    name: Match Type CPA
    model: google_adwords
    explore: master_stats
    type: looker_column
    fields:
    - keyword.bidding_strategy_type
    - master_stats.average_cost_per_conversion
    - master_stats.total_cost_usd
    - keyword.keyword_match_type
    pivots:
    - keyword.keyword_match_type
    filters:
      master_stats.average_cost_per_conversion: NOT NULL
    sorts:
    - keyword.keyword_match_type desc 0
    - master_stats.total_cost_usd desc 0
    limit: 500
    column_limit: 50
    label: Top 10 Keyword Performance (keyword)
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
    show_null_points: true
    point_style: none
    interpolation: linear
    value_labels: legend
    label_type: labPer
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    font_size: '12'
    hidden_fields:
    - master_stats.total_cost_usd
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
      - id: PHRASE - Keyword Stats Cost per Conversion
        name: PHRASE - Keyword Stats Cost per Conversion
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 1115
      - id: EXACT - Keyword Stats Cost per Conversion
        name: EXACT - Keyword Stats Cost per Conversion
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 1119
      - id: BROAD - Keyword Stats Cost per Conversion
        name: BROAD - Keyword Stats Cost per Conversion
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 1123
      __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
      __LINE_NUM: 1103
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
      - id: PHRASE - Keyword Stats Total Cost USD
        name: PHRASE - Keyword Stats Total Cost USD
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 1141
      - id: EXACT - Keyword Stats Total Cost USD
        name: EXACT - Keyword Stats Total Cost USD
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 1145
      - id: BROAD - Keyword Stats Total Cost USD
        name: BROAD - Keyword Stats Total Cost USD
        __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
        __LINE_NUM: 1149
      __FILE: app_marketing_analytics/ad_group_performance.dashboard.lookml
      __LINE_NUM: 1129
    series_types: {}
    listen:
      Ad Group Name: ad_group.ad_group_name
      Campaign Name: campaign.campaign_name
    row: 10
    col: 8
    width: 8
    height: 6
  - title: Ad Details
    name: Ad Details
    model: google_adwords
    explore: master_stats
    type: table
    fields:
    - master_stats.total_impressions
    - master_stats.total_interactions
    - master_stats.total_conversions
    - master_stats.total_cost_usd
    - master_stats.average_interaction_rate
    - master_stats.average_conversion_rate
    - master_stats.average_cost_per_click
    - master_stats.average_cost_per_conversion
    - ad.creative
    filters:
      ad_group._data_date: 1 quarters
      campaign.campaign_name: ''
    sorts:
    - master_stats.total_impressions desc
    limit: 500
    column_limit: 50
    label: Ad Group Details
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
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
    - master_stats.total_interactions
    - master_stats.total_impressions
    row: 22
    col: 0
    width: 24
    height: 6
  - title: Keyword Detail
    name: Keyword Detail
    model: google_adwords
    explore: master_stats
    type: table
    fields:
    - master_stats.total_impressions
    - master_stats.total_interactions
    - master_stats.total_conversions
    - master_stats.total_cost_usd
    - master_stats.average_interaction_rate
    - master_stats.average_conversion_rate
    - master_stats.average_cost_per_click
    - master_stats.average_cost_per_conversion
    - keyword.criteria
    filters:
      ad_group._data_date: 1 quarters
      campaign.campaign_name: ''
    sorts:
    - master_stats.total_impressions desc
    limit: 500
    column_limit: 50
    label: Ad Group Details
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
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
    - master_stats.total_interactions
    - master_stats.total_impressions
    row: 16
    col: 0
    width: 24
    height: 6
  filters:
  - name: Campaign Name
    title: Campaign Name
    type: field_filter
    default_value: ''
    model: google_adwords
    explore: campaign
    field: campaign.campaign_name
    listens_to_filters:
    - Campaign Name
    allow_multiple_values: true
    required: false
  - name: Ad Group Name
    title: Ad Group Name
    type: field_filter
    default_value: ''
    model: google_adwords
    explore: ad_group
    field: ad_group.ad_group_name
    listens_to_filters:
    - Ad Group Name
    allow_multiple_values: true
    required: false
