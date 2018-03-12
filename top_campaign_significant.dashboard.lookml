- dashboard: top_campaign_significant
  title: Top Campaign Significant
  model: looker_app_google_adwords
  explore: campaign_quarter_fact
  type: table
  fields: [campaign_fact.date_quarter, campaign_fact.average_click_rate, campaign_fact.average_click_rate_ratio,
    campaign.campaign_name]
  filters:
    campaign_fact.average_click_rate_significant: 'Yes'
  sorts: [campaign_fact.date_quarter desc, campaign_fact.average_click_rate_ratio
      desc]
  limit: 500
  query_timezone: America/Los_Angeles
  show_view_names: false
  show_row_numbers: true
  truncate_column_names: false
  hide_totals: false
  hide_row_totals: false
  table_theme: white
  limit_displayed_rows: false
  enable_conditional_formatting: false
  conditional_formatting_include_totals: false
  conditional_formatting_include_nulls: false
