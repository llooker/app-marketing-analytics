include: "ad_metrics_base.view"
include: "ad_metrics_parent_comparison_base.view"
include: "ad_group.view"
include: "campaign.view"
include: "campaign_fact.view"
include: "customer.view"
include: "date_base.view"
include: "timeframe_base.view"

explore: ad_group_fact_base {
  extends: [campaign_fact_base]
  hidden: yes
  extension: required
  view_name: fact
  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${fact.ad_group_id} = ${ad_group.ad_group_id} AND
      ${fact.campaign_id} = ${ad_group.campaign_id} AND
      ${fact.external_customer_id} = ${ad_group.external_customer_id} AND
      ${fact.date_date} = ${ad_group.date_date}  ;;
    relationship: many_to_one
  }
}

view: ad_group_base {
  extends: [campaign_base]

  derived_table: {
    explore_source: ad_impressions {
      column: ad_group_id {}
    }
  }

  dimension: ad_group_id {}
}

view: ad_group_fact_base {
  extends: [campaign_fact_base, ad_group_base]
}


explore: ad_group_fact_this_timeframe {
  extends: [campaign_fact_this_timeframe]
  from: ad_group_fact_this_timeframe
  join: last_fact {
    from: ad_group_fact_last_timeframe
    sql_on: ${fact.external_customer_id} = ${last_fact.external_customer_id} AND
          ${fact.campaign_id} = ${last_fact.campaign_id} AND
          ${fact.ad_group_id} = ${last_fact.ad_group_id} ;;
    relationship: one_to_one
  }
  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${fact.ad_group_id} = ${ad_group.ad_group_id} AND
      ${fact.campaign_id} = ${ad_group.campaign_id} AND
      ${fact.external_customer_id} = ${ad_group.external_customer_id} AND
      ${ad_group.latest}  ;;
    relationship: many_to_one
  }
  join: parent_fact {
    view_label: "Campaign This Period"
    from: campaign_fact_this_timeframe
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} ;;
    relationship: one_to_one
    type: inner
  }
}

view: ad_group_fact_this_timeframe {
  extends: [ad_group_fact_base, this_timeframe_base]
}

view: ad_group_fact_last_timeframe {
  extends: [ad_group_fact_base, last_timeframe_base]
}

explore: ad_group_date_fact {
  extends: [ad_group_fact_base]
  from: ad_group_date_fact
  label: "Ad Group Date Fact"
  view_label: "Ad Group Date Fact"
  join: parent_fact {
    from: campaign_date_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.date_date} = ${parent_fact.date_date} ;;
    relationship: one_to_one
    type: inner
  }
}

view: ad_group_date_fact {
  extends: [campaign_date_fact, ad_group_base, date_base]
}

explore: ad_group_week_fact {
  extends: [ad_group_fact_base]
  from: ad_group_week_fact
  label: "Ad Group Week Fact"
  view_label: "Ad Group Week Fact"

  join: last_ad_group_week_fact {
    from: ad_group_week_fact
    view_label: "Last Week Ad Group Fact"
    sql_on: ${fact.external_customer_id} = ${last_ad_group_week_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_ad_group_week_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_ad_group_week_fact.ad_group_id} AND
      ${fact.date_last_week} = ${last_ad_group_week_fact.date_week} AND
      ${fact.less_than_current_day_of_week} = ${last_ad_group_week_fact.less_than_current_day_of_week} AND
      ${last_ad_group_week_fact.less_than_current_day_of_week} ;;
    relationship: one_to_one
    type: inner
  }
  join: parent_fact {
    from: campaign_week_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.date_week} = ${parent_fact.date_week} AND
      ${fact.less_than_current_day_of_week} = ${parent_fact.less_than_current_day_of_week} ;;
    relationship: one_to_one
    type: inner
  }
}

view: ad_group_week_fact {
  extends: [campaign_week_fact, ad_group_base]
}

explore: ad_group_month_fact {
  extends: [ad_group_fact_base]
  from: ad_group_month_fact
  label: "Ad Group Month Fact"
  view_label: "Ad Group Month Fact"

  join: last_ad_group_month_fact {
    from: ad_group_month_fact
    view_label: "Last Month Ad Group Fact"
    sql_on: ${fact.external_customer_id} = ${last_ad_group_month_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_ad_group_month_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_ad_group_month_fact.ad_group_id} AND
      ${fact.date_last_month} = ${last_ad_group_month_fact.date_month} AND
      ${fact.less_than_current_day_of_month} = ${last_ad_group_month_fact.less_than_current_day_of_month} AND
      ${last_ad_group_month_fact.less_than_current_day_of_month} ;;
    relationship: one_to_one
    type: inner
  }
  join: parent_fact {
    from: campaign_month_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.date_month} = ${parent_fact.date_month} AND
      ${fact.less_than_current_day_of_month} = ${parent_fact.less_than_current_day_of_month} ;;
    relationship: one_to_one
    type: inner
  }
}

view: ad_group_month_fact {
  extends: [campaign_month_fact, ad_group_base]
}

explore: ad_group_quarter_fact {
  extends: [ad_group_fact_base]
  from: ad_group_quarter_fact
  label: "Ad Group Quarter Fact"
  view_label: "Ad Group Quarter Fact"

  join: last_ad_group_quarter_fact {
    from: ad_group_quarter_fact
    view_label: "Last Quarter Ad Group Fact"
    sql_on: ${fact.external_customer_id} = ${last_ad_group_quarter_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_ad_group_quarter_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_ad_group_quarter_fact.ad_group_id} AND
      ${fact.date_last_quarter} = ${last_ad_group_quarter_fact.date_quarter} AND
      ${fact.less_than_current_day_of_quarter} = ${last_ad_group_quarter_fact.less_than_current_day_of_quarter} AND
      ${last_ad_group_quarter_fact.less_than_current_day_of_quarter} ;;
    relationship: one_to_one
    type: inner
  }
  join: parent_fact {
    from: campaign_quarter_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.date_quarter} = ${parent_fact.date_quarter} AND
      ${fact.less_than_current_day_of_quarter} = ${parent_fact.less_than_current_day_of_quarter} ;;
    relationship: one_to_one
    type: inner
  }
}

view: ad_group_quarter_fact {
  extends: [campaign_quarter_fact, ad_group_base]
}
