include: "ad.view"
include: "ad_group_fact.view"
include: "ad_metrics_period_comparison_base.view"

explore: ad_fact_base {
  extends: [ad_group_fact_base]
  extension: required
  view_name: fact
  join: ad {
    view_label: "Ad"
    sql_on: ${fact.creative_id} = ${ad.creative_id} AND
      ${fact.ad_group_id} = ${ad.ad_group_id} AND
      ${fact.campaign_id} = ${ad.campaign_id} AND
      ${fact.external_customer_id} = ${ad.external_customer_id} AND
      ${fact.date_date} = ${ad.date_date}  ;;
    relationship: many_to_one
  }
}

view: ad_base {
  extends: [ad_group_base]

  derived_table: {
    explore_source: ad_impressions {
      column: creative_id {}
    }
  }

  dimension: creative_id {}
}

view: ad_fact_base {
  extends: [ad_group_fact_base, ad_base]
  dimension: ad_base {
    expression: concat(${ad_group_base}, ${creative_id}) ;;
  }
  dimension: key_base {
    expression: ${ad_base} ;;
  }
}

explore: ad_fact_this_timeframe {
  extends: [ad_group_fact_this_timeframe]
  from: ad_fact_this_timeframe
  join: last_fact {
    from: ad_fact_last_timeframe
    sql_on: ${fact.external_customer_id} = ${last_fact.external_customer_id} AND
          ${fact.campaign_id} = ${last_fact.campaign_id} AND
          ${fact.ad_group_id} = ${last_fact.ad_group_id} AND
          ${fact.creative_id} = ${last_fact.creative_id} ;;
    relationship: one_to_one
  }
  join: ad {
    view_label: "Ad"
    sql_on: ${fact.creative_id} = ${ad.creative_id} AND
      ${fact.ad_group_id} = ${ad.ad_group_id} AND
      ${fact.campaign_id} = ${ad.campaign_id} AND
      ${fact.external_customer_id} = ${ad.external_customer_id} AND
      ${ad.latest}  ;;
    relationship: many_to_one
  }
  join: parent_fact {
    view_label: "Ad Group This Period"
    from: ad_group_fact_this_timeframe
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.ad_group_id} = ${parent_fact.ad_group_id} ;;
    relationship: many_to_one
  }
}

view: ad_fact_this_timeframe {
  extends: [ad_fact_base, ad_metrics_period_comparison_base, this_timeframe_base]
}

view: ad_fact_last_timeframe {
  extends: [ad_fact_base, last_timeframe_base]
}

explore: ad_date_fact {
  extends: [ad_fact_base]
  from: ad_date_fact
  label: "Ad Date Fact"
  view_label: "Ad Date Fact"
  join: parent_fact {
    from: ad_group_date_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.ad_group_id} = ${parent_fact.ad_group_id} AND
      ${fact.date_date} = ${parent_fact.date_date} ;;
    relationship: many_to_one
  }
}

view: ad_date_fact {
  extends: [ad_group_date_fact, ad_base]
}

explore: ad_week_fact {
  extends: [ad_fact_base]
  from: ad_week_fact
  label: "Ad Week Fact"
  view_label: "Ad Week Fact"

  join: last_ad_week_fact {
    from: ad_week_fact
    view_label: "Last Week Ad Fact"
    sql_on: ${fact.external_customer_id} = ${last_ad_week_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_ad_week_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_ad_week_fact.ad_group_id} AND
      ${fact.creative_id} = ${last_ad_week_fact.creative_id} AND
      ${fact.date_last_week} = ${last_ad_week_fact.date_week} AND
      ${fact.less_than_current_day_of_week} = ${last_ad_week_fact.less_than_current_day_of_week} AND
      ${last_ad_week_fact.less_than_current_day_of_week} = "Yes" ;;
    relationship: one_to_one
  }
  join: parent_fact {
    from: ad_group_week_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.ad_group_id} = ${parent_fact.ad_group_id} AND
      ${fact.date_week} = ${parent_fact.date_week} AND
      ${fact.less_than_current_day_of_week} = ${parent_fact.less_than_current_day_of_week} ;;
    relationship: many_to_one
  }
}

view: ad_week_fact {
  extends: [ad_group_week_fact, ad_base]
}

explore: ad_month_fact {
  extends: [ad_fact_base]
  from: ad_month_fact
  label: "Ad Month Fact"
  view_label: "Ad Month Fact"

  join: last_ad_month_fact {
    from: ad_month_fact
    view_label: "Last Month Ad Fact"
    sql_on: ${fact.external_customer_id} = ${last_ad_month_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_ad_month_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_ad_month_fact.ad_group_id} AND
      ${fact.date_last_month} = ${last_ad_month_fact.date_month} AND
      ${fact.less_than_current_day_of_month} = ${last_ad_month_fact.less_than_current_day_of_month} AND
      ${last_ad_month_fact.less_than_current_day_of_month} = "Yes" ;;
    relationship: one_to_one
  }
  join: parent_fact {
    from: ad_group_month_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.ad_group_id} = ${parent_fact.ad_group_id} AND
      ${fact.date_month} = ${parent_fact.date_month} AND
      ${fact.less_than_current_day_of_month} = ${parent_fact.less_than_current_day_of_month} ;;
    relationship: many_to_one
  }
}

view: ad_month_fact {
  extends: [ad_group_month_fact, ad_base]
}

explore: ad_quarter_fact {
  extends: [ad_fact_base]
  from: ad_quarter_fact
  label: "Ad Quarter Fact"
  view_label: "Ad Quarter Fact"

  join: last_ad_quarter_fact {
    from: ad_quarter_fact
    view_label: "Last Quarter Ad Fact"
    sql_on: ${fact.external_customer_id} = ${last_ad_quarter_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_ad_quarter_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_ad_quarter_fact.ad_group_id} AND
      ${fact.creative_id} = ${last_ad_quarter_fact.creative_id} AND
      ${fact.date_last_quarter} = ${last_ad_quarter_fact.date_quarter} AND
      ${fact.less_than_current_day_of_quarter} = ${last_ad_quarter_fact.less_than_current_day_of_quarter} AND
      ${last_ad_quarter_fact.less_than_current_day_of_quarter} = "Yes" ;;
    relationship: one_to_one
  }
  join: parent_fact {
    from: ad_group_quarter_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.ad_group_id} = ${parent_fact.ad_group_id} AND
      ${fact.date_quarter} = ${parent_fact.date_quarter} AND
      ${fact.less_than_current_day_of_quarter} = ${parent_fact.less_than_current_day_of_quarter} ;;
    relationship: many_to_one
  }
}

view: ad_quarter_fact {
  extends: [ad_group_quarter_fact, ad_base]
}
