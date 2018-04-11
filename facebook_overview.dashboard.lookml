- dashboard: social_overview
  title: Facebook Overview
  layout: newspaper
  elements:
  - title: Click Through Rate
    name: Click Through Rate
    model: looker_app_facebook_ads
    explore: ads_insights
    type: single_value
    fields:
    - ads_insights.average_click_rate
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
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
    listen:
      Untitled Filter: ads_insights.date_start_date
    row: 0
    col: 18
    width: 6
    height: 2
  - title: Spend
    name: Spend
    model: looker_app_facebook_ads
    explore: ads_insights
    type: single_value
    fields:
    - ads_insights.total_spend
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
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
    listen:
      Untitled Filter: ads_insights.date_start_date
    row: 0
    col: 0
    width: 12
    height: 2
  - title: Per Click
    name: Per Click
    model: looker_app_facebook_ads
    explore: ads_insights
    type: single_value
    fields:
    - ads_insights.average_cost_per_click
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
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
    listen:
      Untitled Filter: ads_insights.date_start_date
    row: 0
    col: 12
    width: 6
    height: 2
  - title: Spend To Date
    name: Spend To Date
    model: looker_app_facebook_ads
    explore: ads_insights
    type: looker_area
    fields:
    - ads_insights.date_stop_date
    - ads_insights.total_spend
    fill_fields:
    - ads_insights.date_stop_date
    sorts:
    - ads_insights.date_stop_date
    limit: 500
    dynamic_fields:
    - table_calculation: spend
      label: Spend
      expression: running_total(${ads_insights.total_spend})
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
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
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    hidden_fields:
    - ads_insights.total_spend
    series_types: {}
    colors:
    - "#4bb86a"
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
    listen:
      Untitled Filter: ads_insights.date_start_date
    row: 2
    col: 0
    width: 12
    height: 9
  - title: Impressions
    name: Impressions
    model: looker_app_facebook_ads
    explore: ads_insights
    type: single_value
    fields:
    - ads_insights.total_impressions
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
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
    listen:
      Untitled Filter: ads_insights.date_start_date
    row: 15
    col: 0
    width: 6
    height: 4
  - title: Reach
    name: Reach
    model: looker_app_facebook_ads
    explore: ads_insights
    type: single_value
    fields:
    - ads_insights.total_reach
    - ads_insights.total_clicks
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
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
    comparison_label: Clicks
    listen:
      Untitled Filter: ads_insights.date_start_date
    row: 11
    col: 0
    width: 6
    height: 4
  - title: Spend Age & Gender
    name: Spend Age & Gender
    model: looker_app_facebook_ads
    explore: ads_insights_age_and_gender
    type: table
    fields:
    - ads_insights_age_and_gender.age
    - ads_insights_age_and_gender.gender
    - ads_insights_age_and_gender.total_spend
    pivots:
    - ads_insights_age_and_gender.gender
    filters:
      ads_insights_age_and_gender.gender: "-unknown"
    sorts:
    - ads_insights_age_and_gender.age
    - ads_insights_age_and_gender.gender
    limit: 500
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
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
        __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
        __LINE_NUM: 550
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
      __LINE_NUM: 545
    series_labels:
      ads_insights_age_and_gender.age: Age
      ads_insights_age_and_gender.total_spend: Spend
      ads_insights_age_and_gender.gender: Gender
    row: 19
    col: 0
    width: 6
    height: 5
  - title: CPC Age & Gender
    name: CPC Age & Gender
    model: looker_app_facebook_ads
    explore: ads_insights_age_and_gender
    type: table
    fields:
    - ads_insights_age_and_gender.age
    - ads_insights_age_and_gender.gender
    - ads_insights_age_and_gender.average_cost_per_click
    pivots:
    - ads_insights_age_and_gender.gender
    filters:
      ads_insights_age_and_gender.gender: "-unknown"
    sorts:
    - ads_insights_age_and_gender.age
    - ads_insights_age_and_gender.gender
    limit: 500
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
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
        __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
        __LINE_NUM: 621
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
      __LINE_NUM: 616
    series_labels:
      ads_insights_age_and_gender.age: Age
      ads_insights_age_and_gender.total_spend: Spend
      ads_insights_age_and_gender.gender: Gender
      ads_insights_age_and_gender.average_cost_per_click: CPC
    row: 19
    col: 18
    width: 6
    height: 5
  - title: Clicks Age & Gender
    name: Clicks Age & Gender
    model: looker_app_facebook_ads
    explore: ads_insights_age_and_gender
    type: table
    fields:
    - ads_insights_age_and_gender.age
    - ads_insights_age_and_gender.gender
    - ads_insights_age_and_gender.total_clicks
    pivots:
    - ads_insights_age_and_gender.gender
    filters:
      ads_insights_age_and_gender.gender: "-unknown"
    sorts:
    - ads_insights_age_and_gender.age
    - ads_insights_age_and_gender.gender
    limit: 500
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
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
        __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
        __LINE_NUM: 693
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
      __LINE_NUM: 688
    series_labels:
      ads_insights_age_and_gender.age: Age
      ads_insights_age_and_gender.total_spend: Spend
      ads_insights_age_and_gender.gender: Gender
      ads_insights_age_and_gender.total_clicks: Clicks
    row: 19
    col: 6
    width: 6
    height: 5
  - title: CTR Age & Gender
    name: CTR Age & Gender
    model: looker_app_facebook_ads
    explore: ads_insights_age_and_gender
    type: table
    fields:
    - ads_insights_age_and_gender.age
    - ads_insights_age_and_gender.gender
    - ads_insights_age_and_gender.average_click_rate
    pivots:
    - ads_insights_age_and_gender.gender
    filters:
      ads_insights_age_and_gender.gender: "-unknown"
    sorts:
    - ads_insights_age_and_gender.age
    - ads_insights_age_and_gender.gender
    limit: 500
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
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
        __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
        __LINE_NUM: 765
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
      __LINE_NUM: 760
    series_labels:
      ads_insights_age_and_gender.age: Age
      ads_insights_age_and_gender.total_spend: Spend
      ads_insights_age_and_gender.gender: Gender
      ads_insights_age_and_gender.total_clicks: Clicks
      ads_insights_age_and_gender.average_click_rate: CTR
    row: 19
    col: 12
    width: 6
    height: 5
  - title: Top Ads by Clicks
    name: Top Ads by Clicks
    model: looker_app_facebook_ads
    explore: ads_insights
    type: table
    fields:
    - adcreative.body
    - adcreative.title
    - ads_insights.total_clicks
    sorts:
    - ads_insights.total_clicks desc
    limit: 10
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
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
      show_hide: hide
      first_last: first
      num_rows: '10'
    row: 24
    col: 15
    width: 9
    height: 17
  - title: Reach Trend
    name: Reach Trend
    model: looker_app_facebook_ads
    explore: ads_insights
    type: looker_area
    fields:
    - ads_insights.total_reach
    - ads_insights.date_stop_date
    - ads_insights.total_clicks
    sorts:
    - ads_insights.date_stop_date
    limit: 500
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
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    colors:
    - "#d06180"
    - "#a4a6a9"
    - "#6e98f9"
    - "#7869df"
    - "#f1e582"
    - "#4bb86a"
    - "#dc9d4f"
    - "#a6b7ff"
    - "#afe8fd"
    - "#ea9895"
    - "#8ac8ca"
    y_axes:
    - label: Reach
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: ads_insights.total_reach
        name: Reach
        axisId: ads_insights.total_reach
        __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
        __LINE_NUM: 466
      __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
      __LINE_NUM: 454
    - label: Clicks
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: ads_insights.total_clicks
        name: Clicks
        axisId: ads_insights.total_clicks
        __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
        __LINE_NUM: 481
      __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
      __LINE_NUM: 469
    hidden_fields:
    series_types:
      ads_insights.total_clicks: line
      ads_insights.total_reach: line
    series_labels:
      ads_insights.total_clicks: Clicks
      ads_insights.total_reach: Reach
    series_colors: {}
    listen:
      Untitled Filter: ads_insights.date_start_date
    row: 11
    col: 6
    width: 18
    height: 8
  - title: Click Trend
    name: Click Trend
    model: looker_app_facebook_ads
    explore: ads_insights
    type: looker_line
    fields:
    - ads_insights.average_cost_per_click
    - ads_insights.average_click_rate
    - ads_insights.date_stop_date
    - ads_insights.total_clicks
    sorts:
    - ads_insights.date_stop_date
    limit: 500
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
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types:
      ads_insights.total_clicks: area
    y_axes:
    - label: Cost Per Click
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: ads_insights.average_cost_per_click
        name: Cost Per Click
        axisId: ads_insights.average_cost_per_click
        __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
        __LINE_NUM: 190
      __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
      __LINE_NUM: 178
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
      - id: ads_insights.total_clicks
        name: Clicks
        axisId: ads_insights.total_clicks
        __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
        __LINE_NUM: 205
      __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
      __LINE_NUM: 193
    - label: Click Through Rate
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: ads_insights.average_click_rate
        name: Click Through Rate
        axisId: ads_insights.average_click_rate
        __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
        __LINE_NUM: 220
      __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
      __LINE_NUM: 208
    series_labels:
      ads_insights.average_cost_per_click: Cost Per Click
      ads_insights.average_click_rate: Click Through Rate
      ads_insights.total_clicks: Clicks
    colors:
    - "#7869df"
    - "#6e98f9"
    - "#d7d7d9"
    - "#d06180"
    - "#dc9d4f"
    - "#4bb86a"
    - "#f1e582"
    - "#a6b7ff"
    - "#8ac8ca"
    - "#ea9895"
    - "#a6b7ff"
    series_colors: {}
    listen:
      Untitled Filter: ads_insights.date_start_date
    row: 2
    col: 12
    width: 12
    height: 9
  - title: Clicks & CPC by Device
    name: Clicks & CPC by Device
    model: looker_app_facebook_ads
    explore: ads_insights_platform_and_device
    type: looker_bar
    fields:
    - ads_insights_platform_and_device.impression_device
    - ads_insights_platform_and_device.total_clicks
    - ads_insights_platform_and_device.average_cost_per_click
    - ads_insights_platform_and_device.total_impressions
    sorts:
    - ads_insights_platform_and_device.total_clicks desc
    limit: 500
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
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes:
    - label:
      maxValue:
      minValue:
      orientation: top
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: ads_insights_platform_and_device.total_clicks
        name: Clicks
        axisId: ads_insights_platform_and_device.total_clicks
        __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
        __LINE_NUM: 832
      __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
      __LINE_NUM: 820
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
      - id: ads_insights_platform_and_device.total_impressions
        name: Impressions
        axisId: ads_insights_platform_and_device.total_impressions
        __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
        __LINE_NUM: 847
      __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
      __LINE_NUM: 835
    - label: ''
      maxValue:
      minValue:
      orientation: bottom
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: ads_insights_platform_and_device.average_cost_per_click
        name: CPC
        axisId: ads_insights_platform_and_device.average_cost_per_click
        __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
        __LINE_NUM: 862
      __FILE: app_marketing_analytics/facebook_overview.dashboard.lookml
      __LINE_NUM: 850
    series_labels: {}
    colors:
    - "#a4a6a9"
    - "#6e98f9"
    - "#8ac8ca"
    - "#d06180"
    - "#dc9d4f"
    - "#4bb86a"
    - "#7869df"
    - "#a6b7ff"
    - "#afe8fd"
    - "#ea9895"
    - "#f1e582"
    series_colors: {}
    series_types:
      ads_insights_platform_and_device.total_clicks: line
      ads_insights_platform_and_device.total_impressions: column
    row: 24
    col: 0
    width: 15
    height: 17
  filters:
  - name: Untitled Filter
    title: Untitled Filter
    type: field_filter
    default_value: 1 quarters
    model: looker_app_facebook_ads
    explore: ads_insights
    field: ads_insights.date_start_date
    listens_to_filters: []
    allow_multiple_values: true
    required: false
