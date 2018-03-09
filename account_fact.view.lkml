include: "ad_metrics_base.view"
include: "customer.view"
include: "date_base.view"

explore: account_fact_base {
  hidden: yes
  extension: required
  view_name: account_fact
  persist_with: etl_datagroup
  join: customer {
    view_label: "Customer"
    sql_on: ${account_fact.external_customer_id} = ${customer.external_customer_id} AND
      ${account_fact.date_date} = ${customer.date_date} ;;
    relationship: many_to_one
  }
}

view: account_fact_base {
  extension: required
  extends: [ad_metrics_base]
  dimension: external_customer_id {
    type: number
  }
}

explore: account_date_fact {
  extends: [account_fact_base]
  from: account_date_fact
  label: "Account Date Fact"
  view_label: "Account Date Fact"
}

view: account_date_fact {
  extends: [account_fact_base, date_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
#     partition_keys: ["_date"]
    explore_source: ad_impressions {
      column: _date { field: ad_impressions.date_date }
      column: external_customer_id {}
      column: clicks { field: ad_impressions.total_clicks }
      column: conversions { field: ad_impressions.total_conversions }
      column: conversionvalue { field: ad_impressions.total_conversion_value }
      column: cost { field: ad_impressions.total_cost }
      column: impressions { field: ad_impressions.total_impressions }
      column: interactions { field: ad_impressions.total_interactions }
    }
  }
  dimension: _date {
    hidden: yes
    sql: TIMESTAMP(${TABLE}._date) ;;
  }
}

explore: account_week_fact {
  extends: [account_fact_base]
  from: account_week_fact
  label: "Account Week Fact"
  view_label: "Account Week Fact"

  join: last_account_week_fact {
    from: account_week_fact
    view_label: "Last Week Account Fact"
    sql_on: ${account_fact.external_customer_id} = ${last_account_week_fact.external_customer_id} AND
      ${account_fact.date_last_week} = ${last_account_week_fact.date_week} AND
      ${account_fact.less_than_current_day_of_week} = ${last_account_week_fact.less_than_current_day_of_week} AND
      ${last_account_week_fact.less_than_current_day_of_week} ;;
    relationship: one_to_one
    type: inner
  }
}

# add last 7 days?
view: account_week_fact {
  extends: [account_fact_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: account_date_fact {
      column: date_week { field: account_fact.date_week }
      column: external_customer_id { field: account_fact.external_customer_id }
      column: less_than_current_day_of_week { field: account_fact.less_than_current_day_of_week }
      column: clicks { field: account_fact.total_clicks }
      column: conversions { field: account_fact.total_conversions }
      column: conversionvalue { field: account_fact.total_conversion_value }
      column: cost { field: account_fact.total_cost }
      column: impressions { field: account_fact.total_impressions }
      column: interactions { field: account_fact.total_interactions }
    }
  }
  dimension: date_week {
    type: date
    allow_fill: no
    sql: TIMESTAMP(${TABLE}.date_week) ;;
  }
  dimension: date_last_week {
    type: date
    sql: DATE_ADD(${date_week}, INTERVAL -1 WEEK) ;;
    allow_fill: no
  }
  dimension: date_date {
    sql: ${date_week} ;;
  }
  dimension: less_than_current_day_of_week {}
}

explore: account_month_fact {
  extends: [account_fact_base]
  from: account_month_fact
  label: "Account Month Fact"
  view_label: "Account Month Fact"

  join: last_account_month_fact {
    from: account_month_fact
    view_label: "Last Month Account Fact"
    sql_on: ${account_fact.external_customer_id} = ${last_account_month_fact.external_customer_id} AND
      ${account_fact.date_last_month} = ${last_account_month_fact.date_month} AND
      ${account_fact.less_than_current_day_of_month} = ${last_account_month_fact.less_than_current_day_of_month} AND
      ${last_account_month_fact.less_than_current_day_of_month} ;;
    relationship: one_to_one
    type: inner
  }
}

view: account_month_fact {
  extends: [account_fact_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: account_date_fact {
      column: date_month { field: account_fact.date_month_date }
      column: external_customer_id { field: account_fact.external_customer_id }
      column: less_than_current_day_of_month { field: account_fact.less_than_current_day_of_month }
      column: clicks { field: account_fact.total_clicks }
      column: conversions { field: account_fact.total_conversions }
      column: conversionvalue { field: account_fact.total_conversion_value }
      column: cost { field: account_fact.total_cost }
      column: impressions { field: account_fact.total_impressions }
      column: interactions { field: account_fact.total_interactions }
    }
  }
  dimension: date_month {
    type: date
    allow_fill: no
    sql: TIMESTAMP(${TABLE}.date_month) ;;
  }
  dimension: date_last_month {
    type: date
    sql: DATE_ADD(${date_month}, INTERVAL -1 MONTH) ;;
    allow_fill: no
  }
  dimension: date_date {
    sql: ${date_month} ;;
  }
  dimension: less_than_current_day_of_month {}
}

explore: account_quarter_fact {
  extends: [account_fact_base]
  from: account_quarter_fact
  label: "Account Quarter Fact"
  view_label: "Account Quarter Fact"

  join: last_account_quarter_fact {
    from: account_quarter_fact
    view_label: "Last Quarter Account Fact"
    sql_on: ${account_fact.external_customer_id} = ${last_account_quarter_fact.external_customer_id} AND
      ${account_fact.date_last_quarter} = ${last_account_quarter_fact.date_quarter} AND
      ${account_fact.less_than_current_day_of_quarter} = ${last_account_quarter_fact.less_than_current_day_of_quarter} AND
      ${last_account_quarter_fact.less_than_current_day_of_quarter} ;;
    relationship: one_to_one
    type: inner
  }
}

view: account_quarter_fact {
  extends: [account_fact_base]

  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: account_date_fact {
      column: date_quarter { field: account_fact.date_quarter_date }
      column: external_customer_id { field: account_fact.external_customer_id }
      column: less_than_current_day_of_quarter { field: account_fact.less_than_current_day_of_quarter }
      column: clicks { field: account_fact.total_clicks }
      column: conversions { field: account_fact.total_conversions }
      column: conversionvalue { field: account_fact.total_conversion_value }
      column: cost { field: account_fact.total_cost }
      column: impressions { field: account_fact.total_impressions }
      column: interactions { field: account_fact.total_interactions }
    }
  }
  dimension: date_quarter {
    type: date
    allow_fill: no
    sql: TIMESTAMP(${TABLE}.date_quarter) ;;
  }
  dimension: date_last_quarter {
    type: date
    sql: DATE_ADD(${date_quarter}, INTERVAL -1 QUARTER) ;;
    allow_fill: no
  }
  dimension: date_date {
    sql: ${date_quarter} ;;
  }
  dimension: less_than_current_day_of_quarter {}
}
