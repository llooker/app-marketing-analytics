- dashboard: choose_campaign
  title: Choose Campaign
  layout: newspaper
  elements:
  - title: Campaigns
    name: Campaigns
    model: google_adwords
    explore: master_stats
    type: table
    fields:
    - campaign.campaign_name
    - master_stats.total_cost_usd
    - master_stats.total_conversions
    - master_stats.average_cost_per_conversion
    - master_stats.average_conversion_rate
    - master_stats.average_cost_per_interaction
    - master_stats.average_interaction_rate
    - master_stats.average_cost_per_click
    sorts:
    - master_stats.total_conversions desc
    limit: 10
    column_limit: 50
    label: Campaign Details
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
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
    series_labels:
      master_stats.total_cost_usd: Spend
    listen:
      Campaign: campaign.campaign_name
      Date: master_stats._data_date
    row: 0
    col: 0
    width: 24
    height: 7
  - title: Conversions vs Cost Per Conversion
    name: Conversions vs Cost Per Conversion
    model: google_adwords
    explore: master_stats
    type: looker_column
    fields:
    - campaign.campaign_name
    - master_stats.average_cost_per_conversion
    - master_stats.total_conversions
    - master_stats.total_cost_usd
    - master_stats.average_conversion_rate
    - master_stats.average_cost_per_interaction
    - master_stats.average_interaction_rate
    - master_stats.average_cost_per_click
    filters:
      master_stats.total_cost_usd: ">500"
    sorts:
    - master_stats.average_cost_per_conversion desc
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
    show_x_axis_ticks: false
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    label: Campaign Details
    query_timezone: America/Los_Angeles
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    series_types:
      master_stats.average_cost_per_conversion: line
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    - master_stats.total_cost_usd
    - master_stats.average_conversion_rate
    - master_stats.average_cost_per_interaction
    - master_stats.average_interaction_rate
    - master_stats.average_cost_per_click
    series_labels:
      master_stats.total_cost_usd: Spend
    y_axes:
    - label: ''
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
      - id: master_stats.average_cost_per_conversion
        name: Cost per Conversion
        axisId: master_stats.average_cost_per_conversion
    - label:
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
      - id: master_stats.total_conversions
        name: Conversions
        axisId: master_stats.total_conversions
    x_axis_label: Campaigns
    listen:
      Campaign: campaign.campaign_name
      Date: master_stats._data_date
    row: 7
    col: 0
    width: 12
    height: 11
  - title: Interactions vs Cost Per Interaction
    name: Interactions vs Cost Per Interaction
    model: google_adwords
    explore: master_stats
    type: looker_column
    fields:
    - campaign.campaign_name
    - master_stats.average_cost_per_conversion
    - master_stats.total_conversions
    - master_stats.average_cost_per_interaction
    - master_stats.total_interactions
    - master_stats.total_cost_usd
    - master_stats.average_conversion_rate
    - master_stats.average_interaction_rate
    - master_stats.average_cost_per_click
    filters:
      master_stats.total_cost_usd: ">500"
    sorts:
    - master_stats.average_cost_per_interaction desc
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
    show_x_axis_ticks: false
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    label: Campaign Details
    query_timezone: America/Los_Angeles
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    series_types:
      master_stats.average_cost_per_conversion: line
      master_stats.average_cost_per_interaction: line
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    - master_stats.total_cost_usd
    - master_stats.average_conversion_rate
    - master_stats.average_interaction_rate
    - master_stats.average_cost_per_click
    - master_stats.average_cost_per_conversion
    - master_stats.total_conversions
    series_labels:
      master_stats.total_cost_usd: Spend
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
      - id: master_stats.total_interactions
        name: Interactions
        axisId: master_stats.total_interactions
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
      - id: master_stats.average_cost_per_interaction
        name: Cost per Interaction
        axisId: master_stats.average_cost_per_interaction
    x_axis_label: Campaigns
    listen:
      Campaign: campaign.campaign_name
      Date: master_stats._data_date
    row: 7
    col: 12
    width: 12
    height: 11
  filters:
  - name: Campaign
    title: Campaign
    type: field_filter
    default_value: ''
    model: google_adwords
    explore: campaign
    field: campaign.campaign_name
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Date
    title: Date
    type: field_filter
    default_value: 1 quarters
    model: google_adwords
    explore: master_stats
    field: campaign._data_date
    listens_to_filters: []
    allow_multiple_values: true
    required: false
