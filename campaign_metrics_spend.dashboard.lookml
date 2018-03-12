- dashboard: campaign_metrics_spend
  title: Campaign Metrics Spend
  layout: newspaper
  embed_style:
    background_color: "#f6f8fa"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Spend
    name: Spend
    model: looker_app_google_adwords
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
    model: looker_app_google_adwords
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
    model: looker_app_google_adwords
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
  - title: Cost Per Conversion
    name: Cost Per Conversion
    model: looker_app_google_adwords
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
    model: looker_app_google_adwords
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
  - title: Conversion Rate
    name: Conversion Rate
    model: looker_app_google_adwords
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
  - title: Budget Utilization
    name: Budget Utilization
    model: looker_app_google_adwords
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
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 447
      - id: "[20.00%,40.00%)"
        name: "[20.00%,40.00%)"
        axisId: campaign_budget_date_fact.total_cost_usd
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 452
      - id: "[40.00%,60.00%)"
        name: "[40.00%,60.00%)"
        axisId: campaign_budget_date_fact.total_cost_usd
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 457
      - id: "[60.00%,80.00%)"
        name: "[60.00%,80.00%)"
        axisId: campaign_budget_date_fact.total_cost_usd
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 462
      - id: "[80.00%,100.00%)"
        name: "[80.00%,100.00%)"
        axisId: campaign_budget_date_fact.total_cost_usd
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 467
      - id: "[100.00%,inf)"
        name: "[100.00%,inf)"
        axisId: campaign_budget_date_fact.total_cost_usd
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 472
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 435
    row: 4
    col: 16
    width: 8
    height: 11
  - title: Spend by Network
    name: Spend by Network
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad_impressions.ad_network_type
    - ad_impressions.total_cost_usd
    fill_fields:
    - ad_impressions.ad_network_type
    sorts:
    - ad_impressions.total_cost_usd desc
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
      - id: ad_impressions.total_cost_usd
        name: Ad Stats Cost
        axisId: ad_impressions.total_cost_usd
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 735
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 723
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
      Time Frame: ad_impressions.date_date
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
    - ad_impressions.total_cost_usd
    - ad_impressions.device_type
    fill_fields:
    - ad_impressions.device_type
    sorts:
    - ad_impressions.total_cost_usd desc
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
      - id: ad_impressions.total_cost_usd
        name: Ad Stats Cost
        axisId: ad_impressions.total_cost_usd
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 814
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 802
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
      Time Frame: ad_impressions.date_date
    row: 15
    col: 8
    width: 8
    height: 6
  - title: Spend by Bid Strategy
    name: Spend by Bid Strategy
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad_impressions.total_cost_usd
    - keyword.bidding_strategy_type
    sorts:
    - ad_impressions.total_cost_usd desc
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
      - id: ad_impressions.total_cost_usd
        name: Ad Stats Cost
        axisId: ad_impressions.total_cost_usd
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 891
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 879
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
      Time Frame: ad_impressions.date_date
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
    - ad_impressions.total_cost_usd
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
      - id: ad_impressions.total_cost_usd
        name: Ad Stats Cost
        axisId: ad_impressions.total_cost_usd
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 1000
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 988
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
        __LINE_NUM: 1013
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ad_impressions.total_cost_usd
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 1008
    series_labels:
      ad_impressions.hour_of_day: Hour of Day
      ad_impressions.total_cost_usd: Spend
      ad_impressions.date_day_of_week: Day of Week
    listen:
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
      Time Frame: ad_impressions.date_date
    row: 21
    col: 0
    width: 14
    height: 12
  - title: Spend by Day of Week
    name: Spend by Day of Week
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_bar
    fields:
    - ad_impressions.date_day_of_week
    - ad_impressions.total_cost_usd
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
      - id: ad_impressions.total_cost_usd
        name: Ad Stats Cost
        axisId: ad_impressions.total_cost_usd
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 1116
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 1104
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
        __LINE_NUM: 1129
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 1124
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
      Time Frame: ad_impressions.date_date
    row: 21
    col: 14
    width: 10
    height: 6
  - title: Spend by Hour of Day
    name: Spend by Hour of Day
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_column
    fields:
    - ad_impressions.total_cost_usd
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
      - id: ad_impressions.total_cost_usd
        name: Ad Stats Cost
        axisId: ad_impressions.total_cost_usd
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 1238
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 1226
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
        __LINE_NUM: 1251
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 1246
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
      Time Frame: ad_impressions.date_date
    row: 27
    col: 14
    width: 10
    height: 6
  - title: Spend To Date
    name: Spend To Date
    model: looker_app_google_adwords
    explore: ad_impressions
    type: looker_area
    fields:
    - ad_impressions.date_day_of_quarter
    - ad_impressions.date_quarter
    - ad_impressions.total_cost_usd
    pivots:
    - ad_impressions.date_quarter
    filters:
      ad_impressions.date_quarter: 2 quarters
      ad_impressions.date_date: 2 quarters
    sorts:
    - ad_impressions.date_quarter desc
    - ad_impressions.date_day_of_quarter
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: cumulative_spend
      label: Cumulative Spend
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
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 558
        axisId: ad_impressions.average_cost_per_conversion
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 546
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
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 577
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 565
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
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 596
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 584
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
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 615
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 603
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
        __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
        __LINE_NUM: 634
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 622
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
      __FILE: app_marketing_analytics/campaign_metrics_spend.dashboard.lookml
      __LINE_NUM: 645
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
      Campaign: campaign.campaign_name
      Ad Group: ad_group.ad_group_name
    row: 4
    col: 0
    width: 16
    height: 11
  - title: Top Keywords
    name: Top Keywords
    model: looker_app_google_adwords
    explore: ad_impressions
    type: table
    fields:
    - ad_group.ad_group_name
    - campaign.campaign_name
    - ad_impressions.total_cost_usd
    - keyword.criteria
    filters:
      ad_impressions.date_date: 1 quarters
    sorts:
    - ad_impressions.total_cost_usd desc
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
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
    - ad_group.ad_group_name
    - campaign.campaign_name
    row: 33
    col: 8
    width: 8
    height: 6
  - title: Top Landing Pages
    name: Top Landing Pages
    model: looker_app_google_adwords
    explore: ad_impressions
    type: table
    fields:
    - ad.creative_final_urls_domain_path
    - ad_group.ad_group_name
    - campaign.campaign_name
    - ad_impressions.total_cost_usd
    filters:
      ad_impressions.date_date: 1 quarters
    sorts:
    - ad_impressions.total_cost_usd desc
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
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
    - ad_group.ad_group_name
    - campaign.campaign_name
    row: 33
    col: 16
    width: 8
    height: 6
  - title: Top Ads
    name: Top Ads
    model: looker_app_google_adwords
    explore: ad_impressions
    type: table
    fields:
    - ad.creative
    - ad_group.ad_group_name
    - campaign.campaign_name
    - ad_impressions.total_cost_usd
    filters:
      ad_impressions.date_date: 1 quarters
    sorts:
    - ad_impressions.total_cost_usd desc
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
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
    - campaign.campaign_name
    - ad_group.ad_group_name
    row: 33
    col: 0
    width: 8
    height: 6
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
  - name: Time Frame
    title: Time Frame
    type: field_filter
    default_value: 1 quarters
    allow_multiple_values: true
    required: false
    model: looker_app_google_adwords
    explore: ad_impressions
    listens_to_filters: []
    field: ad_impressions.date_date
