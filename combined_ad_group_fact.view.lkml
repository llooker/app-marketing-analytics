include: "ad_metrics_base.view"
include: "date_base.view"

explore: combined_ad_group_fact_base {
  extension: required
  view_name: fact
#   persist_with: etl_datagroup

  # TODO make these depend on channel
  # If channel = google adwords then
  # join: customer {
  #   view_label: "Customer"
  #   sql_on: ${fact.account_id} = ${customer.account_id} AND
  #     ${fact.date_date} = ${customer.date_date} ;;
  #   relationship: many_to_one
  # }
  # join: campaign {
  #   view_label: "Campaign"
  #   sql_on: ${fact.campaign_id} = ${combined_ad_impressions.campaign_id} AND
  #     ${fact.date_date} = ${combined_ad_impressions.date_date} ;;
  #   relationship: many_to_one
  # }
  # join: ad_group {
  #   view_label: "Ad Group"
  #   sql_on: ${fact.ad_group_id} = ${combined_ad_impressions.ad_group_id} AND
  #     ${fact.date_date} = ${combined_ad_impressions.date_date}  ;;
  #   relationship: many_to_one
  # }
  # If channel = facebook_ads then
  # join: campaigns {
  #   type: left_outer
  #   sql_on: ${fact.campaign_id} = ${campaigns.id} ;;
  #   relationship: many_to_one
  # }

  # join: adsets {
  #   type: left_outer
  #   sql_on: ${fact.adset_id} = ${adsets.id} ;;
  #   relationship: many_to_one
  # }
}

view: combined_ad_group_fact_base {
  extension: required
  extends: [ad_metrics_base]
  dimension: channel {}
  dimension: account_name {}
  dimension: account_id {}
  dimension: campaign_name {}
  dimension: campaign_id {}
  dimension: ad_group_name {}
  dimension: ad_group_id {}
}

explore: combined_ad_group_fact_this_timeframe {
  extends: [combined_ad_group_fact_base]
  from: combined_ad_group_fact_this_timeframe
  join: combined_last_fact {
    from: combined_ad_group_fact_last_timeframe
    sql_on: ${fact.channel} = ${combined_last_fact.channel} AND
      ${fact.account_id} = ${combined_last_fact.account_id} AND
      ${fact.campaign_id} = ${combined_last_fact.campaign_id} AND
      ${fact.ad_group_id} = ${combined_last_fact.ad_group_id} ;;
    relationship: one_to_one
  }
}

view: combined_ad_group_fact {
  extends: [ad_metrics_base, combined_ad_group_fact_base]

  derived_table: {
    explore_source: combined_ad_impressions {
      column: channel {}
      column: account_name {}
      column: account_id {}
      column: campaign_name {}
      column: campaign_id {}
      column: ad_group_name {}
      column: ad_group_id {}
      column: clicks {field: combined_ad_impressions.total_clicks }
      column: conversions {field: combined_ad_impressions.total_conversions}
      column: conversionvalue { field: combined_ad_impressions.total_conversionvalue }
      column: impressions {field: combined_ad_impressions.total_impressions}
      column: cost {field: combined_ad_impressions.total_cost}
    }
  }
}

view: combined_ad_group_fact_this_timeframe {
  extends: [combined_ad_group_fact]
  view_label: "This Period"

  derived_table: {
    explore_source: combined_ad_impressions {
      bind_filters: {
        to_field: combined_ad_impressions.date_date
        from_field: fact.this_timeframe
      }
    }
  }

  parameter: this_timeframe {
    type: string
    allowed_value: {
      value: "this quarter"
      label: "Quarter"
    }
    allowed_value: {
      value: "this week"
      label: "Week"
    }
    allowed_value: {
      value: "this month"
      label: "Month"
    }
    default_value: "this quarter"
  }

  measure: total_conversions {
    link: {
      label: "By Campaign"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=campaign.campaign_name,ad_impressions.total_conversions&f[ad_impressions.date_date]=this quarter"
    }
  }

  measure: total_cost {
    link: {
      label: "By Campaign"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=campaign.campaign_name,ad_impressions.total_cost&f[ad_impressions.date_date]=this quarter"
    }
  }

  measure: average_conversion_rate {
    link: {
      label: "By Campaign"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=campaign.campaign_name,ad_impressions.average_conversion_rate&f[ad_impressions.date_date]=this quarter"
    }
  }

  measure: average_click_rate {
    link: {
      label: "By Keyword"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=keyword.criteria,ad_impressions.average_click_rate&f[ad_impressions.date_date]=this quarter"
    }
  }

  measure: average_cost_per_click {
    link: {
      label: "By Keyword"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=keyword.criteria,ad_impressions.average_click_rate&f[ad_impressions.date_date]=this quarter"
    }
  }

  measure: average_cost_per_conversion {
    link: {
      label: "By Campaign"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=campaign.campaign_name,ad_impressions.average_cost_per_conversion&f[ad_impressions.date_date]=this quarter"
    }
  }
}

view: combined_ad_group_fact_last_timeframe {
  extends: [combined_ad_group_fact]
  view_label: "Last Period"

  derived_table: {
    explore_source: combined_ad_impressions {
      bind_filters: {
        to_field: combined_ad_impressions.period
        from_field: combined_last_fact.last_timeframe
      }
      bind_filters: {
        to_field: combined_ad_impressions.date_date
        from_field: combined_last_fact.last_timeframe
      }
      filters: {
        field: combined_ad_impressions.less_than_current_day_of_period
        value: "Yes"
      }
    }
  }

  parameter: last_timeframe {
    type: string
    allowed_value: {
      value: "1 quarter ago"
      label: "Quarter"
    }
    allowed_value: {
      value: "1 week ago"
      label: "Week"
    }
    allowed_value: {
      value: "1 month ago"
      label: "Month"
    }
    default_value: "1 quarter ago"
  }
}

explore: combined_ad_group_date_fact {
  extends: [combined_ad_group_fact_base]
  from: combined_ad_group_date_fact
  label: "Combined Ad Group Date Fact"
  view_label: "Combined Ad Group Date Fact"
}

view: combined_ad_group_date_fact {
  extends: [combined_ad_group_fact_base, date_base]

  derived_table: {
#     datagroup_trigger: etl_datagroup
#     partition_keys: ["_date"]
    explore_source: combined_ad_impressions {
      column: _date { field: combined_ad_impressions.date_date }
      column: channel {}
      column: account_name {}
      column: account_id {}
      column: campaign_name {}
      column: campaign_id {}
      column: ad_group_name {}
      column: ad_group_id {}
      column: clicks { field: combined_ad_impressions.total_clicks }
      column: conversions { field: combined_ad_impressions.total_conversions }
      column: conversionvalue { field: combined_ad_impressions.total_conversionvalue }
      column: cost { field: combined_ad_impressions.total_cost }
      column: impressions { field: combined_ad_impressions.total_impressions }
    }
  }
  dimension: _date {
    hidden: yes
    sql: TIMESTAMP(${TABLE}._date) ;;
  }
}
