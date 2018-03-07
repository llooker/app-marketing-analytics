- dashboard: campaign_performance
  title: Campaign
  layout: newspaper
  elements:
  - title: Ad spend qtd
    name: Ad spend qtd
    model: google_adwords
    explore: campaign_quarter_fact
    type: single_value
    fields:
    - campaign_quarter_fact.total_cost_usd
    - campaign_quarter_fact.date_quarter
    - last_campaign_quarter_fact.total_cost_usd
    fill_fields:
    - campaign_quarter_fact.date_quarter
    sorts:
    - campaign_quarter_fact.date_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: quarterly_change
      label: Quarterly Change
      expression: "${campaign_quarter_fact.total_cost_usd} - ${last_campaign_quarter_fact.total_cost_usd}\n"
      value_format:
      value_format_name: usd_0
    hidden_fields:
    - last_campaign_quarter_fact.total_cost_usd
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
    row: 0
    col: 0
    width: 11
    height: 2
  - title: Conversions qtd (copy)
    name: Conversions qtd (copy)
    model: google_adwords
    explore: campaign_quarter_fact
    type: single_value
    fields:
    - campaign_quarter_fact.date_quarter
    - campaign_quarter_fact.total_conversions
    - last_campaign_quarter_fact.total_conversions
    fill_fields:
    - campaign_quarter_fact.date_quarter
    sorts:
    - campaign_quarter_fact.date_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: quarterly_change
      label: Quarterly Change
      expression: "${campaign_quarter_fact.total_conversions} - ${last_campaign_quarter_fact.total_conversions}\n"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    hidden_fields:
    - last_campaign_quarter_fact.total_conversions
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
    row: 0
    col: 11
    width: 5
    height: 4
  - title: Cost per conversion qtd
    name: Cost per conversion qtd
    model: google_adwords
    explore: campaign_quarter_fact
    type: single_value
    fields:
    - campaign_quarter_fact.date_quarter
    - campaign_quarter_fact.average_cost_per_conversion
    - last_campaign_quarter_fact.average_cost_per_conversion
    fill_fields:
    - campaign_quarter_fact.date_quarter
    sorts:
    - campaign_quarter_fact.date_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: quarterly_change
      label: Quarterly % Change
      expression: "(${campaign_quarter_fact.average_cost_per_conversion} -  ${last_campaign_quarter_fact.average_cost_per_conversion})/${last_campaign_quarter_fact.average_cost_per_conversion}\n"
      value_format:
      value_format_name: percent_0
    hidden_fields:
    - last_campaign_quarter_fact.average_cost_per_conversion
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
    row: 0
    col: 16
    width: 8
    height: 2
  - title: Conversion rate qtd
    name: Conversion rate qtd
    model: google_adwords
    explore: campaign_quarter_fact
    type: single_value
    fields:
    - campaign_quarter_fact.date_quarter
    - campaign_quarter_fact.average_conversion_rate
    - last_campaign_quarter_fact.average_conversion_rate
    fill_fields:
    - campaign_quarter_fact.date_quarter
    sorts:
    - campaign_quarter_fact.date_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: quarterly_change
      label: Quarterly % Change
      expression: "(${campaign_quarter_fact.average_conversion_rate} - ${last_campaign_quarter_fact.average_conversion_rate})/${last_campaign_quarter_fact.average_conversion_rate}\n"
      value_format:
      value_format_name: percent_0
    hidden_fields:
    - last_campaign_quarter_fact.average_conversion_rate
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
    row: 2
    col: 16
    width: 8
    height: 2
  - title: Spend To Date
    name: Spend To Date
    model: google_adwords
    explore: ad_impressions
    type: looker_area
    fields:
    - ad_impressions.total_cost_usd
    - ad_impressions.date_day_of_quarter
    - ad_impressions.date_quarter
    pivots:
    - ad_impressions.date_quarter
    fill_fields:
    - ad_impressions.date_quarter
    filters:
      ad_impressions.date_quarter: 2 quarters
    sorts:
    - ad_impressions.date_quarter desc
    - ad_impressions.date_day_of_quarter
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: spend
      label: Spend
      expression: if(is_null(${ad_impressions.total_cost_usd}), null, running_total(${ad_impressions.total_cost_usd}))
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
      - id: ad_impressions.average_cost_per_conversion
        name: Cost per Conversion
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 343
        axisId: ad_impressions.average_cost_per_conversion
      __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
      __LINE_NUM: 331
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
      - id: ad_impressions.total_conversions
        name: Conversions
        axisId: ad_impressions.total_conversions
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 362
      __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
      __LINE_NUM: 350
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
      - id: ad_impressions.total_impressions
        name: Impressions
        axisId: ad_impressions.total_impressions
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 381
      __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
      __LINE_NUM: 369
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
      - id: ad_impressions.total_cost_usd
        name: Cost
        axisId: ad_impressions.total_cost_usd
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 400
      __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
      __LINE_NUM: 388
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
      - id: ad_impressions.total_clicks
        name: Clicks
        axisId: ad_impressions.total_clicks
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 419
      __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
      __LINE_NUM: 407
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
      __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
      __LINE_NUM: 430
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
    - ad_impressions.average_cost_per_conversion
    series_labels:
      ad_impressions.total_cost_usd: Spend
      ad_impressions.total_clicks: Interactions
    hidden_fields:
    - ad_impressions.total_cost_usd
    column_group_spacing_ratio: 0
    column_spacing_ratio: 0
    listen:
      Campaign Name: campaign.campaign_name
    row: 2
    col: 0
    width: 11
    height: 9
  - title: Interaction rate qtd
    name: Interaction rate qtd
    model: google_adwords
    explore: campaign_quarter_fact
    type: single_value
    fields:
    - campaign_quarter_fact.date_quarter
    - campaign_quarter_fact.average_interaction_rate
    - last_campaign_quarter_fact.average_interaction_rate
    fill_fields:
    - campaign_quarter_fact.date_quarter
    sorts:
    - campaign_quarter_fact.date_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: quarterly_change
      label: Quarterly % Change
      expression: "(${campaign_quarter_fact.average_interaction_rate} - ${last_campaign_quarter_fact.average_interaction_rate}\
        \ )/${last_campaign_quarter_fact.average_interaction_rate}\n"
      value_format:
      value_format_name: percent_0
    hidden_fields:
    - last_campaign_quarter_fact.average_interaction_rate
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
    row: 11
    col: 19
    width: 5
    height: 2
  - title: Cost per interaction qtd
    name: Cost per interaction qtd
    model: google_adwords
    explore: campaign_quarter_fact
    type: single_value
    fields:
    - campaign_quarter_fact.date_quarter
    - last_campaign_quarter_fact.average_cost_per_interaction
    - campaign_quarter_fact.average_cost_per_interaction
    fill_fields:
    - campaign_quarter_fact.date_quarter
    sorts:
    - campaign_quarter_fact.date_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: change
      label: "% Change"
      expression: "(${campaign_quarter_fact.average_cost_per_interaction} - ${last_campaign_quarter_fact.average_cost_per_interaction})/${last_campaign_quarter_fact.average_cost_per_interaction}\n"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    hidden_fields:
    - last_campaign_quarter_fact.average_cost_per_interaction
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
    row: 11
    col: 14
    width: 5
    height: 2
  - title: Funnel
    name: Funnel
    model: google_adwords
    explore: campaign_quarter_fact
    type: looker_column
    fields:
    - campaign_quarter_fact.total_impressions
    - campaign_quarter_fact.total_interactions
    - campaign_quarter_fact.total_conversions
    filters:
      campaign_quarter_fact.date_quarter: 1 quarters
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
      - id: campaign_quarter_fact.total_impressions
        name: Impressions
        axisId: campaign_quarter_fact.total_impressions
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 658
      - id: campaign_quarter_fact.total_clicks
        name: Clicks
        axisId: campaign_quarter_fact.total_clicks
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 663
      - id: campaign_quarter_fact.total_conversions
        name: Conversions
        axisId: campaign_quarter_fact.total_conversions
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 668
      __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
      __LINE_NUM: 646
    show_dropoff: true
    listen:
      Campaign Name: campaign.campaign_name
    row: 11
    col: 7
    width: 7
    height: 7
  - title: Budget Utilization
    name: Budget Utilization
    model: google_adwords
    explore: campaign_budget_date_fact
    type: looker_column
    fields:
    - campaign_budget_date_fact.percent_used_budget_tier
    - campaign_budget_date_fact.total_cost_usd
    - campaign_budget_date_fact.date_week
    pivots:
    - campaign_budget_date_fact.percent_used_budget_tier
    fill_fields:
    - campaign_budget_date_fact.date_week
    filters:
      campaign.campaign_name: ''
      campaign_budget_date_fact.date_date: 2 quarters
    sorts:
    - campaign_budget_date_fact.percent_used_budget_tier
    - campaign_budget_date_fact.date_week desc
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
    column_group_spacing_ratio:
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
        axisId: campaign_budget_date_fact.total_cost_usd
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 763
      - id: "[20.00%,40.00%)"
        name: "[20.00%,40.00%)"
        axisId: campaign_budget_date_fact.total_cost_usd
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 766
      - id: "[40.00%,60.00%)"
        name: "[40.00%,60.00%)"
        axisId: campaign_budget_date_fact.total_cost_usd
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 769
      - id: "[60.00%,80.00%)"
        name: "[60.00%,80.00%)"
        axisId: campaign_budget_date_fact.total_cost_usd
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 772
      - id: "[80.00%,100.00%)"
        name: "[80.00%,100.00%)"
        axisId: campaign_budget_date_fact.total_cost_usd
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 775
      - id: "[100.00%,inf)"
        name: "[100.00%,inf)"
        axisId: campaign_budget_date_fact.total_cost_usd
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 778
      __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
      __LINE_NUM: 751
    listen:
      Campaign Name: campaign.campaign_name
    row: 11
    col: 0
    width: 7
    height: 7
  - title: Conversion Trends
    name: Conversion Trends
    model: google_adwords
    explore: ad_impressions
    type: looker_area
    fields:
    - ad_impressions.date_week
    - ad_impressions.total_conversions
    - ad_impressions.average_cost_per_conversion
    - ad_impressions.average_conversion_rate
    filters:
      ad_impressions.date_date: 5 quarters
    sorts:
    - ad_impressions.date_week desc
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
      ad_impressions.average_cost_per_conversion: line
      ad_impressions.total_impressions: line
      ad_impressions.total_clicks: line
      ad_impressions.average_conversion_rate: line
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
      - id: ad_impressions.average_cost_per_conversion
        name: Cost per Conversion
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 863
        axisId: ad_impressions.average_cost_per_conversion
      __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
      __LINE_NUM: 851
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
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 882
      __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
      __LINE_NUM: 870
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
      - id: ad_impressions.average_conversion_rate
        name: Conversion Rate
        axisId: ad_impressions.average_conversion_rate
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 901
      __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
      __LINE_NUM: 889
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
      __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
      __LINE_NUM: 912
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    hidden_series:
    - ad_impressions.average_conversion_rate
    series_labels:
      ad_impressions.total_cost_usd: Spend
      ad_impressions.total_clicks: Interactions
    hidden_fields: []
    listen:
      Campaign Name: campaign.campaign_name
    row: 4
    col: 11
    width: 13
    height: 7
  - title: Interaction Trend
    name: Interaction Trend
    model: google_adwords
    explore: ad_impressions
    type: looker_area
    fields:
    - ad_impressions.date_week
    - ad_impressions.average_cost_per_interaction
    - ad_impressions.average_interaction_rate
    filters:
      ad_impressions.date_date: 5 quarters
    sorts:
    - ad_impressions.date_week desc
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
      ad_impressions.average_cost_per_conversion: line
      ad_impressions.total_impressions: line
      ad_impressions.total_clicks: line
      ad_impressions.average_cost_per_interaction: line
      ad_impressions.average_interaction_rate: line
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
      - id: ad_impressions.average_cost_per_interaction
        name: Cost per Interaction
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 1012
        axisId: ad_impressions.average_cost_per_interaction
      __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
      __LINE_NUM: 1000
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
      - id: ad_impressions.average_interaction_rate
        name: Interaction Rate
        axisId: ad_impressions.average_interaction_rate
        __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
        __LINE_NUM: 1031
      __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
      __LINE_NUM: 1019
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
      __FILE: app_marketing_analytics/campaign_performance.dashboard.lookml
      __LINE_NUM: 1042
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
    - ad_impressions.average_cost_per_conversion
    series_labels:
      ad_impressions.total_cost_usd: Spend
      ad_impressions.total_clicks: Interactions
    hidden_fields: []
    y_axis_reversed: false
    listen:
      Campaign Name: campaign.campaign_name
    row: 13
    col: 14
    width: 10
    height: 5
  - title: Ad group details
    name: Ad group details
    model: google_adwords
    explore: ad_impressions
    type: table
    fields:
    - ad_group.ad_group_name
    - ad_impressions.total_impressions
    - ad_impressions.total_interactions
    - ad_impressions.total_conversions
    - ad_impressions.total_cost_usd
    - ad_impressions.average_interaction_rate
    - ad_impressions.average_conversion_rate
    - ad_impressions.average_cost_per_click
    - ad_impressions.average_cost_per_conversion
    filters:
      ad_group.date_date: 1 quarters
    sorts:
    - ad_impressions.total_impressions desc
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
    listen:
      Campaign Name: campaign.campaign_name
    row: 18
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