- dashboard: significantly_different
  title: Significantly Different
  layout: newspaper
  elements:
  - title: Bottom Campaign CTR
    name: Bottom Campaign CTR
    model: looker_app_google_adwords
    explore: campaign_quarter_fact
    type: looker_column
    fields:
    - campaign_fact.date_quarter
    - campaign.campaign_name
    - campaign_fact.average_click_rate
    - account_fact.average_click_rate
    - campaign_fact.average_click_rate_ratio
    filters:
      campaign_fact.average_click_rate_significant: 'Yes'
    sorts:
    - campaign_fact.date_quarter desc
    - campaign_fact.average_click_rate_ratio
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
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
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields:
    - campaign_fact.average_click_rate
    - account_fact.average_click_rate
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    column_spacing_ratio:
    column_group_spacing_ratio:
    row: 0
    col: 0
    width: 8
    height: 6
