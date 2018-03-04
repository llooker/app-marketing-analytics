include: "stats.view.lkml"
include: "base_quarter_stats.view.lkml"

view: account_quarter_stats {
  extends: [stats, base_quarter_stats]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: master_stats {
      column: date_quarter {}
      column: external_customer_id {}
      column: cost { field: master_stats.total_cost }
      column: clicks { field: master_stats.total_clicks }
      column: conversions { field: master_stats.total_conversions }
      column: impressions { field: master_stats.total_impressions }
      column: interactions { field: master_stats.total_interactions }
      filters: {
        field: master_stats.less_than_current_day_of_quarter
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {
    type: number
  }
  measure: total_impressions {
    drill_fields: [customer.detail*, total_impressions]
  }
  measure: total_clicks {
    drill_fields: [customer.detail*, total_clicks]
  }
  measure: total_interactions {
    drill_fields: [customer.detail*, total_interactions]
  }
  measure: total_conversions {
    drill_fields: [customer.detail*, total_conversions]
    link: {
      label: "By Campaign"
      url: "/explore/google_adwords/master_stats?fields=campaign.campaign_name,master_stats.total_conversions&f[master_stats.date_date]=this quarter"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }
  measure: total_cost_usd {
    drill_fields: [customer.detail*, total_cost_usd]
    link: {
      label: "By Campaign"
      url: "/explore/google_adwords/master_stats?fields=campaign.campaign_name,master_stats.total_cost_usd&f[master_stats.date_date]=this quarter"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }
  measure: average_interaction_rate {
    drill_fields: [customer.detail*, average_interaction_rate]
    link: {
      label: "By Keyword"
      url: "/explore/google_adwords/master_stats?fields=keyword.criteria,master_stats.average_interaction_rate&f[master_stats.date_date]=this quarter"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }
  measure: average_click_rate {
    drill_fields: [customer.detail*, average_click_rate]
  }
  measure: average_conversion_rate {
    drill_fields: [customer.detail*, average_conversion_rate]
    link: {
      label: "By Campaign"
      url: "/explore/google_adwords/master_stats?fields=campaign.campaign_name,master_stats.average_conversion_rate&f[master_stats.date_date]=this quarter"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }
  measure: average_cost_per_click {
    drill_fields: [customer.detail*, average_cost_per_click]
  }
  measure: average_cost_per_conversion {
    drill_fields: [customer.detail*, average_cost_per_conversion]
    link: {
      label: "By Campaign"
      url: "/explore/google_adwords/master_stats?fields=campaign.campaign_name,master_stats.average_cost_per_conversion&f[master_stats.date_date]=this quarter"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }
}