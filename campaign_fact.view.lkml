include: "ad_metrics_base.view"
include: "ad_metrics_parent_comparison_base.view"
include: "account_fact.view"
include: "campaign.view"
include: "customer.view"
include: "date_base.view"
include: "timeframe_base.view"

explore: campaign_fact_base {
  extends: [account_fact_base]
  extension: required
  view_name: fact
  join: campaign {
    view_label: "Campaign"
    sql_on: ${fact.campaign_id} = ${campaign.campaign_id} AND
      ${fact.date_date} = ${campaign.date_date} ;;
    relationship: many_to_one
  }
}

view: campaign_base {
  extends: [ad_metrics_parent_comparison_base]

  derived_table: {
    explore_source: ad_impressions {
      column: campaign_id {}
    }
  }
  dimension: campaign_id {}
}


view: campaign_fact_base {
  extends: [account_fact_base, campaign_base]
  dimension: campaign_base {
    expression: concat(${account_base}, ${campaign_id}) ;;
  }
  dimension: key_base {
    expression: ${campaign_base} ;;
  }
}

explore: campaign_fact_this_timeframe {
  extends: [account_fact_this_timeframe]
  from: campaign_fact_this_timeframe
  always_filter: {
    filters: {
      field: parent_fact.this_timeframe
    }
  }
  join: last_fact {
    from: campaign_fact_last_timeframe
    sql_on: ${fact.external_customer_id} = ${last_fact.external_customer_id} AND
          ${fact.campaign_id} = ${last_fact.campaign_id} ;;
    relationship: one_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${fact.campaign_id} = ${campaign.campaign_id} AND
      ${campaign.latest} ;;
    relationship: many_to_one
  }
  join: parent_fact {
    view_label: "Customer This Period"
    from: account_fact_this_timeframe
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} ;;
    relationship: many_to_one
  }
}

view: campaign_fact_this_timeframe {
  extends: [campaign_fact_base, this_timeframe_base]
}

view: campaign_fact_last_timeframe {
  extends: [campaign_fact_base, last_timeframe_base]
}

explore: campaign_date_fact {
  extends: [campaign_fact_base]
  from: campaign_date_fact
  label: "Campaign Date Fact"
  view_label: "Campaign Date Fact"
  join: parent_fact {
    view_label: "Customer This Period"
    from: account_date_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.date_date} = ${parent_fact.date_date};;
    relationship: many_to_one
  }
}

view: campaign_date_fact {
  extends: [account_date_fact, campaign_base, date_base]
}

explore: campaign_week_fact {
  extends: [campaign_fact_base]
  from: campaign_week_fact
  label: "Campaign Week Fact"
  view_label: "Campaign Week Fact"

  join: last_campaign_week_fact {
    from: campaign_week_fact
    view_label: "Last Week Campaign Fact"
    sql_on: ${fact.external_customer_id} = ${last_campaign_week_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_campaign_week_fact.campaign_id} AND
      ${fact.date_last_week} = ${last_campaign_week_fact.date_week} AND
      ${fact.less_than_current_day_of_week} = ${last_campaign_week_fact.less_than_current_day_of_week} AND
      ${last_campaign_week_fact.less_than_current_day_of_week} ;;
    relationship: one_to_one
    type: inner
  }
  join: parent_fact {
    from: account_week_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.date_week} = ${parent_fact.date_week} AND
      ${fact.less_than_current_day_of_week} = ${parent_fact.less_than_current_day_of_week} ;;
    relationship:many_to_one
  }
}

view: campaign_week_fact {
  extends: [account_week_fact, campaign_base]
}

explore: campaign_month_fact {
  extends: [campaign_fact_base]
  from: campaign_month_fact
  label: "Campaign Month Fact"
  view_label: "Campaign Month Fact"

  join: last_campaign_month_fact {
    from: campaign_month_fact
    view_label: "Last Month Campaign Fact"
    sql_on: ${fact.external_customer_id} = ${last_campaign_month_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_campaign_month_fact.campaign_id} AND
      ${fact.date_last_month} = ${last_campaign_month_fact.date_month} AND
      ${fact.less_than_current_day_of_month} = ${last_campaign_month_fact.less_than_current_day_of_month} AND
      ${fact.less_than_current_day_of_month} ;;
    relationship: one_to_one
  }
  join: parent_fact {
    from: account_month_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.date_month} = ${parent_fact.date_month} AND
      ${fact.less_than_current_day_of_month} = ${parent_fact.less_than_current_day_of_month} ;;
    relationship: many_to_one
  }
}

view: campaign_month_fact {
  extends: [account_month_fact, campaign_base]
}

explore: campaign_quarter_fact {
  extends: [campaign_fact_base]
  from: campaign_quarter_fact
  label: "Campaign Quarter Fact"
  view_label: "Campaign Quarter Fact"

  join: last_campaign_quarter_fact {
    from: campaign_quarter_fact
    view_label: "Last Quarter Campaign Fact"
    sql_on: ${fact.external_customer_id} = ${last_campaign_quarter_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_campaign_quarter_fact.campaign_id} AND
      ${fact.date_last_quarter} = ${last_campaign_quarter_fact.date_quarter} AND
      ${fact.less_than_current_day_of_quarter} = ${last_campaign_quarter_fact.less_than_current_day_of_quarter} AND
      ${last_campaign_quarter_fact.less_than_current_day_of_quarter} ;;
    relationship: one_to_one
  }
  join: parent_fact {
    from: account_quarter_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.date_quarter} = ${parent_fact.date_quarter} AND
      ${fact.less_than_current_day_of_quarter} = ${parent_fact.less_than_current_day_of_quarter} ;;
    relationship: many_to_one
  }
}

view: campaign_quarter_fact {
  extends: [account_quarter_fact, campaign_base]
}
