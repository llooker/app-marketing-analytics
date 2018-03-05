connection: "bigquery-connectors-adwords"

# include all the views
include: "account_date_stats.view"
include: "account_week_stats.view"
include: "account_month_stats.view"
include: "account_quarter_stats.view"
include: "ad.view"
include: "ad_criterion_base.view"
include: "ad_group.view"
include: "ad_group_date_stats.view"
include: "ad_group_week_stats.view"
include: "ad_group_month_stats.view"
include: "ad_group_quarter_stats.view"
include: "audience.view"
include: "base.view"
include: "base_quarter_stats.view"
include: "campaign.view"
include: "campaign_budget_stats.view"
include: "campaign_date_stats.view"
include: "campaign_week_stats.view"
include: "campaign_month_stats.view"
include: "campaign_quarter_stats.view"
include: "customer.view"
include: "dated_table.view"
include: "expected_conversions.view"
include: "keyword.view"
include: "kpis_last_period.view"
include: "kpis_this_period.view"
include: "master_stats.view"
include: "period_stats.view"
include: "report_single_values.view"
include: "stats.view"

# include all the dashboards
include: "ad_group_performance.dashboard"
include: "adwords_overview.dashboard"
include: "campaign_metrics_conversion_rate.dashboard"
include: "campaign_metrics_conversions.dashboard"
include: "campaign_metrics_cpa.dashboard"
include: "campaign_metrics_cpc.dashboard"
include: "campaign_metrics_ctr.dashboard"
include: "campaign_metrics_spend.dashboard"
include: "choose_campaign.dashboard"

datagroup: etl_datagroup {
  sql_trigger: SELECT MAX(CONCAT(CAST(_DATA_DATE as STRING), format(" %02d", HourOfDay))) FROM adwords_v201609.HourlyAccountStats_6747157124 ;;
  max_cache_age: "24 hours"
}

explore: master_stats {
  persist_with: etl_datagroup
  label: "Ad Stats"
  view_label: "Ad Stats"

  join: keyword {
    view_label: "Keyword"
    sql_on: ${master_stats.unique_key} = ${keyword.unique_key} AND
      ${master_stats.date_raw} = ${keyword.date_raw} ;;
    relationship: many_to_one
  }
  join: audience {
    view_label: "Audience"
    sql_on: ${master_stats.unique_key} = ${audience.unique_key} AND
      ${master_stats.date_raw} = ${audience.date_raw} ;;
    relationship: many_to_one
  }
  join: ad {
    view_label: "Ads"
    sql_on: ${ad.creative_id} = ${master_stats.creative_id} AND
      ${master_stats.date_raw} = ${ad.date_raw} ;;
    relationship:  many_to_one
  }
  join: ad_group {
    view_label: "Ad Groups"
    sql_on: ${master_stats.ad_group_id} = ${ad_group.ad_group_id} AND
      ${master_stats.date_raw} = ${ad_group.date_raw} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaigns"
    sql_on: ${master_stats.campaign_id} = ${campaign.campaign_id} AND
      ${master_stats.date_raw} = ${campaign.date_raw};;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${master_stats.external_customer_id} = ${customer.external_customer_id} AND
      ${master_stats.date_raw} = ${customer.date_raw} ;;
    relationship: many_to_one
  }
  join: account_avg_cpa {
    view_label: "Account Average CPA"
    sql_on: ${master_stats.external_customer_id} = ${account_avg_cpa.external_customer_id} ;;
    relationship: one_to_one
  }
  join: campaign_avg_cpa {
    view_label: "Campaign Average CPA"
    sql_on: ${master_stats.external_customer_id} = ${campaign_avg_cpa.external_customer_id} AND
      ${master_stats.campaign_id} = ${campaign_avg_cpa.campaign_id};;
    relationship: one_to_one
  }
  join: ad_group_avg_cpa {
    view_label: "Ad Group Average CPA"
    sql_on: ${master_stats.external_customer_id} = ${ad_group_avg_cpa.external_customer_id} AND
      ${master_stats.campaign_id} = ${ad_group_avg_cpa.campaign_id} AND
      ${master_stats.ad_group_id} = ${ad_group_avg_cpa.ad_group_id};;
    relationship: one_to_one
  }
}

## Entity tables are daily snapshots
explore: customer {
  hidden: yes
  conditionally_filter: {
    filters: {
      field: latest
      value: "Yes"
    }
    unless: [date_date]
  }
}

explore: campaign {
  hidden: yes
  conditionally_filter: {
    filters: {
      field: latest
      value: "Yes"
    }
    unless: [date_date]
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${campaign.external_customer_id} = ${customer.external_customer_id} AND
      ${campaign.date_raw} = ${customer.date_raw} ;;
    relationship:  many_to_one
  }
}

explore: ad_group {
  hidden: yes
  conditionally_filter: {
    filters: {
      field: latest
      value: "Yes"
    }
    unless: [date_date]
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${ad_group.campaign_id} = ${campaign.campaign_id} AND
      ${ad_group.date_raw} = ${campaign.date_raw} ;;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${ad_group.external_customer_id} = ${customer.external_customer_id} AND
      ${ad_group.date_raw} = ${customer.date_raw} ;;
    relationship:  many_to_one
  }
}

explore: keyword {
  hidden: yes
  conditionally_filter: {
    filters: {
      field: latest
      value: "Yes"
    }
    unless: [date_date]
  }
  join: ad_group {
    view_label: "Keyword"
    sql_on: ${keyword.ad_group_id} = ${ad_group.ad_group_id} AND
      ${keyword.date_raw} = ${ad_group.date_raw} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${keyword.campaign_id} = ${campaign.campaign_id} AND
      ${keyword.date_raw} = ${campaign.date_raw} ;;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${keyword.external_customer_id} = ${customer.external_customer_id} AND
      ${keyword.date_raw} = ${customer.date_raw} ;;
    relationship:  many_to_one
  }
}

explore: ad {
  hidden: yes
  conditionally_filter: {
    filters: {
      field: latest
      value: "Yes"
    }
    unless: [date_date]
  }
  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${ad.ad_group_id} = ${ad_group.ad_group_id}  AND
      ${ad.date_raw} = ${ad_group.date_raw} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${ad.campaign_id} = ${campaign.campaign_id} AND
      ${ad.date_raw} = ${campaign.date_raw} ;;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${customer.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.date_raw} = ${customer.date_raw} ;;
    relationship:  many_to_one
  }
}

explore: campaign_date_stats {
  hidden: yes
  persist_with: etl_datagroup
  label: "Campaign Date Stats"
  view_label: "Campaign Date Stats"
}

explore: campaign_quarter_stats {
  hidden: yes
  persist_with: etl_datagroup
  label: "Campaign Quarter Stats"
  view_label: "Campaign Quarter Stats"

  join: last_campaign_quarter_stats {
    from: campaign_quarter_stats
    view_label: "Last Quarter Campaign Stats"
    sql_on: ${campaign_quarter_stats.campaign_id} = ${last_campaign_quarter_stats.campaign_id} AND
      ${campaign_quarter_stats.date_last_quarter} = ${last_campaign_quarter_stats.date_quarter} ;;
    relationship: one_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${campaign_quarter_stats.campaign_id} = ${campaign.campaign_id}  AND
      ${campaign.latest} = "Yes" ;;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${campaign_quarter_stats.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} = "Yes" ;;
    relationship: many_to_one
  }
}

explore: ad_group_date_stats {
  hidden: yes
  persist_with: etl_datagroup
  label: "Ad Group Date Stats"
  view_label: "Ad Group Date Stats"
}

explore: ad_group_quarter_stats {
  hidden: yes
  persist_with: etl_datagroup
  label: "Ad Group Quarter Stats"
  view_label: "Ad Group Quarter Stats"

  join: last_ad_group_quarter_stats {
    from: ad_group_quarter_stats
    view_label: "Last Quarter Ad Group Stats"
    sql_on: ${ad_group_quarter_stats.ad_group_id} = ${last_ad_group_quarter_stats.ad_group_id} AND
      ${ad_group_quarter_stats.date_last_quarter} = ${last_ad_group_quarter_stats.date_quarter} ;;
    relationship: one_to_one
  }
  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${ad_group_quarter_stats.ad_group_id} = ${ad_group.ad_group_id}  AND
      ${ad_group.latest} = "Yes" ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaigns"
    sql_on: ${ad_group.campaign_id} = ${campaign.campaign_id} AND
      ${campaign.latest} = "Yes";;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${ad_group_quarter_stats.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} = "Yes" ;;
    relationship: many_to_one
  }
}

explore: campaign_budget_stats {
  hidden: yes
  persist_with: etl_datagroup
  label: "Campaign Budget Stats"
  view_label: "Campaign Budget Stats"

  join: campaign {
    view_label: "Campaign"
    sql_on: ${campaign_budget_stats.campaign_id} = ${campaign.campaign_id}  AND
      ${campaign_budget_stats.date_date} = ${campaign.date_date} ;;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${campaign_budget_stats.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} = "Yes" ;;
    relationship: many_to_one
  }
}

explore: kpis_this_period {
  label: "Kpis Period Over Period"
  join: kpis_last_period {
    sql_on: ${kpis_this_period.external_customer_id_this_period} = ${kpis_last_period.external_customer_id_last_period} AND
    ${kpis_this_period.campaign_name} = ${kpis_last_period.campaign_name} AND
    ${kpis_this_period.ad_group_name} = ${kpis_last_period.ad_group_name};;
    relationship: one_to_one
  }
}

explore: report_single_values {
  label: "Report Single Values"
}
