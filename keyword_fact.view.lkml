include: "ad_metrics_base.view"
include: "ad_metrics_parent_comparison_base.view"
include: "ad_group.view"
include: "ad_group_fact.view"
include: "campaign.view"
include: "campaign_fact.view"
include: "customer.view"
include: "date_base.view"
include: "keyword.view"
include: "timeframe_base.view"

explore: keyword_fact_base {
  extends: [ad_group_fact_base]
  extension: required
  view_name: fact
  join: keyword {
    view_label: "Keyword"
    sql_on: ${fact.criterion_id} = ${keyword.criterion_id} AND
      ${fact.ad_group_id} = ${keyword.ad_group_id} AND
      ${fact.campaign_id} = ${keyword.campaign_id} AND
      ${fact.external_customer_id} = ${keyword.external_customer_id} AND
      ${fact.date_date} = ${keyword.date_date}  ;;
    relationship: many_to_one
  }
}

view: keyword_base {
  extends: [ad_group_base]

  derived_table: {
    explore_source: ad_impressions {
      column: criterion_id {}
    }
  }

  dimension: criterion_id {}
}

view: keyword_fact_base {
  extends: [ad_group_fact_base, keyword_base]
  dimension: keyword_base {
    expression: concat(${ad_group_base}, ${criterion_id}) ;;
  }
  dimension: key_base {
    expression: ${keyword_base} ;;
  }
}

explore: keyword_fact_this_timeframe {
  extends: [ad_group_fact_this_timeframe]
  from: keyword_fact_this_timeframe
  join: last_fact {
    from: keyword_fact_last_timeframe
    sql_on: ${fact.external_customer_id} = ${last_fact.external_customer_id} AND
          ${fact.campaign_id} = ${last_fact.campaign_id} AND
          ${fact.ad_group_id} = ${last_fact.ad_group_id} AND
          ${fact.criterion_id} = ${last_fact.criterion_id} ;;
    relationship: one_to_one
  }
  join: keyword {
    view_label: "Keyword"
    sql_on: ${fact.criterion_id} = ${keyword.criterion_id} AND
      ${fact.ad_group_id} = ${keyword.ad_group_id} AND
      ${fact.campaign_id} = ${keyword.campaign_id} AND
      ${fact.external_customer_id} = ${keyword.external_customer_id} AND
      ${keyword.latest}  ;;
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

view: keyword_fact_this_timeframe {
  extends: [keyword_fact_base, this_timeframe_base]
}

view: keyword_fact_last_timeframe {
  extends: [keyword_fact_base, last_timeframe_base]
}

explore: keyword_date_fact {
  extends: [keyword_fact_base]
  from: keyword_date_fact
  label: "Keyword Date Fact"
  view_label: "Keyword Date Fact"
  join: parent_fact {
    from: ad_group_date_fact
    sql_on: ${fact.external_customer_id} = ${parent_fact.external_customer_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.ad_group_id} = ${parent_fact.ad_group_id} AND
      ${fact.date_date} = ${parent_fact.date_date} ;;
    relationship: one_to_one
  }
}

view: keyword_date_fact {
  extends: [ad_group_date_fact, keyword_base, date_base]
}

explore: keyword_week_fact {
  extends: [keyword_fact_base]
  from: keyword_week_fact
  label: "Keyword Week Fact"
  view_label: "Keyword Week Fact"

  join: last_keyword_week_fact {
    from: keyword_week_fact
    view_label: "Last Week Keyword Fact"
    sql_on: ${fact.external_customer_id} = ${last_keyword_week_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_keyword_week_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_keyword_week_fact.ad_group_id} AND
      ${fact.criterion_id} = ${last_keyword_week_fact.criterion_id} AND
      ${fact.date_last_week} = ${last_keyword_week_fact.date_week} AND
      ${fact.less_than_current_day_of_week} = ${last_keyword_week_fact.less_than_current_day_of_week} AND
      ${last_keyword_week_fact.less_than_current_day_of_week} ;;
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

view: keyword_week_fact {
  extends: [ad_group_week_fact, keyword_base]
}

explore: keyword_month_fact {
  extends: [keyword_fact_base]
  from: keyword_month_fact
  label: "Keyword Month Fact"
  view_label: "Keyword Month Fact"

  join: last_keyword_month_fact {
    from: keyword_month_fact
    view_label: "Last Month Keyword Fact"
    sql_on: ${fact.external_customer_id} = ${last_keyword_month_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_keyword_month_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_keyword_month_fact.ad_group_id} AND
      ${fact.date_last_month} = ${last_keyword_month_fact.date_month} AND
      ${fact.less_than_current_day_of_month} = ${last_keyword_month_fact.less_than_current_day_of_month} AND
      ${last_keyword_month_fact.less_than_current_day_of_month} ;;
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

view: keyword_month_fact {
  extends: [ad_group_month_fact, keyword_base]
}

explore: keyword_quarter_fact {
  extends: [keyword_fact_base]
  from: keyword_quarter_fact
  label: "Keyword Quarter Fact"
  view_label: "Keyword Quarter Fact"

  join: last_keyword_quarter_fact {
    from: keyword_quarter_fact
    view_label: "Last Quarter Keyword Fact"
    sql_on: ${fact.external_customer_id} = ${last_keyword_quarter_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_keyword_quarter_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_keyword_quarter_fact.ad_group_id} AND
      ${fact.criterion_id} = ${last_keyword_quarter_fact.criterion_id} AND
      ${fact.date_last_quarter} = ${last_keyword_quarter_fact.date_quarter} AND
      ${fact.less_than_current_day_of_quarter} = ${last_keyword_quarter_fact.less_than_current_day_of_quarter} AND
      ${last_keyword_quarter_fact.less_than_current_day_of_quarter} ;;
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

view: keyword_quarter_fact {
  extends: [ad_group_quarter_fact, keyword_base]
}
