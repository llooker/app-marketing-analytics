include: "ad_metrics_parent_comparison_base.view"
include: "ad_metrics_period_comparison_base.view"
include: "google_ad_metrics_base.view"

explore: period_fact_base {
  extension: required
  view_name: fact
  join: customer {
    view_label: "Customer"
    sql_on: ${fact.external_customer_id} = ${customer.external_customer_id} AND
      ${fact.date_date} = ${customer.date_date} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${fact.campaign_id} = ${campaign.campaign_id} AND
      ${fact.external_customer_id} = ${campaign.external_customer_id} AND
      ${fact.date_date} = ${campaign.date_date} ;;
    relationship: many_to_one
  }
  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${fact.ad_group_id} = ${ad_group.ad_group_id} AND
      ${fact.campaign_id} = ${ad_group.campaign_id} AND
      ${fact.external_customer_id} = ${ad_group.external_customer_id} AND
      ${fact.date_date} = ${ad_group.date_date}  ;;
    relationship: many_to_one
  }
  join: ad {
    view_label: "Ad"
    sql_on: ${fact.creative_id} = ${ad.creative_id} AND
      ${fact.ad_group_id} = ${ad.ad_group_id} AND
      ${fact.campaign_id} = ${ad.campaign_id} AND
      ${fact.external_customer_id} = ${ad.external_customer_id} AND
      ${fact.date_date} = ${ad.date_date}  ;;
    relationship: many_to_one
  }
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

view: period_fact_base {
  extends: [ad_metrics_parent_comparison_base, google_ad_metrics_base]

  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: creative_id {}
  dimension: criterion_id {}
}

explore: period_fact {
  hidden: yes
  extends: [period_fact_base]
  from: period_fact
  view_name: fact
  label: "Period Fact"
  view_label: "Period Fact"

  always_filter: {
    filters: {
      field: fact.period
    }
    filters: {
      field: fact.less_than_current_day_of_period
      value: "Yes"
    }
  }

  join: last_fact {
    from: period_fact
    view_label: "Last Period Fact"
    sql_on:
      ${fact.date_period} = ${last_fact.date_period}
      AND ${fact.less_than_current_day_of_period} = ${last_fact.less_than_current_day_of_period}
      {% if (ad._in_query or fact.creative_id._in_query) or (keyword._in_query or fact.criterion_id._in_query) %}
        AND ${fact.ad_group_id} = ${last_fact.ad_group_id}
      {% elsif (ad_group._in_query or fact.ad_group_id._in_query) or (ad._in_query or fact.creative_id._in_query) or (keyword._in_query or fact.criterion_id._in_query) %}
        AND ${fact.campaign_id} = ${last_fact.campaign_id}
      {% elsif (campaign._in_query or fact.campaign_id._in_query) (ad_group._in_query or fact.ad_group_id._in_query) or (ad._in_query or fact.creative_id._in_query) or (keyword._in_query or fact.criterion_id._in_query) %}
        AND ${fact.external_customer_id} = ${last_fact.external_customer_id}
      {% endif %} ;;
    relationship: one_to_one
    fields: [last_fact.google_ad_metrics_set*]
  }
  join: parent_fact {
    from: period_fact
    view_label: "Parent Period Fact"
    sql_on:
      ${fact.date_period} = ${parent_fact.date_period}
      AND ${fact.less_than_current_day_of_period} = ${parent_fact.less_than_current_day_of_period}
      {% if (ad._in_query or fact.creative_id._in_query) or (keyword._in_query or fact.criterion_id._in_query) %}
        AND ${fact.ad_group_id} = ${parent_fact.ad_group_id}
      {% endif %}
      {% if (ad_group._in_query or fact.ad_group_id._in_query) or (ad._in_query or fact.creative_id._in_query) or (keyword._in_query or fact.criterion_id._in_query) %}
        AND ${fact.campaign_id} = ${parent_fact.campaign_id}
      {% endif %}
      {% if (campaign._in_query or fact.campaign_id._in_query) (ad_group._in_query or fact.ad_group_id._in_query) or (ad._in_query or fact.creative_id._in_query) or (keyword._in_query or fact.criterion_id._in_query) %}
        AND ${fact.external_customer_id} = ${parent_fact.external_customer_id}
      {% endif %} ;;
    relationship: many_to_one
    fields: [parent_fact.google_ad_metrics_set*]
  }
}

view: period_fact {
  extends: [period_fact_base, ad_metrics_period_comparison_base]

  sql_table_name:
  {% if (ad._in_query or fact.creative_id._in_query) %}
    {% if (fact.period_passthrough._sql == "week") %}${ad_week_fact.SQL_TABLE_NAME}
    {% elsif (fact.period_passthrough._sql == "month") %}${ad_month_fact.SQL_TABLE_NAME}
    {% elsif (fact.period_passthrough._sql == "quarter") %}${ad_quarter_fact.SQL_TABLE_NAME}
    {% endif %}
  {% elsif (keyword._in_query or fact.criterion_id._in_query) %}
    {% if (fact.period_passthrough._sql == "week") %}${keyword_week_fact.SQL_TABLE_NAME}
    {% elsif (fact.period_passthrough._sql == "month") %}${keyword_month_fact.SQL_TABLE_NAME}
    {% elsif (fact.period_passthrough._sql == "quarter") %}${keyword_quarter_fact.SQL_TABLE_NAME}
    {% endif %}
  {% elsif (ad_group._in_query or fact.ad_group_id._in_query) %}
    {% if (fact.period_passthrough._sql == "week") %}${ad_group_week_fact.SQL_TABLE_NAME}
    {% elsif (fact.period_passthrough._sql == "month") %}${ad_group_month_fact.SQL_TABLE_NAME}
    {% elsif (fact.period_passthrough._sql == "quarter") %}${ad_group_quarter_fact.SQL_TABLE_NAME}
    {% endif %}
  {% elsif (campaign._in_query or fact.campaign_id._in_query) %}
    {% if (fact.period_passthrough._sql == "week") %}${campaign_week_fact.SQL_TABLE_NAME}
    {% elsif (fact.period_passthrough._sql == "month") %}${campaign_month_fact.SQL_TABLE_NAME}
    {% elsif (fact.period_passthrough._sql == "quarter") %}${campaign_quarter_fact.SQL_TABLE_NAME}
    {% endif %}
  {% else %}
    {% if (fact.period_passthrough._sql == "week") %}${account_week_fact.SQL_TABLE_NAME}
    {% elsif (fact.period_passthrough._sql == "month") %}${account_month_fact.SQL_TABLE_NAME}
    {% elsif (fact.period_passthrough._sql == "quarter") %}${account_quarter_fact.SQL_TABLE_NAME}
    {% endif %}
  {% endif %} ;;

  parameter: period {
    type: unquoted
    allowed_value: {
      value: "quarter"
      label: "Quarter"
    }
    allowed_value: {
      value: "week"
      label: "Week"
    }
    allowed_value: {
      value: "month"
      label: "Month"
    }
    default_value: "quarter"
  }

  dimension: period_passthrough {
    hidden: yes
    sql: {% parameter period %};;
  }

  dimension: date_period {
    type: date
    sql: TIMESTAMP(${TABLE}.date_{% if fact.period_passthrough._sql == "week" %}week{% elsif fact.period_passthrough._sql == "month" %}month{% elsif fact.period_passthrough._sql == "quarter" %}quarter{% endif %}) ;;
    allow_fill: no
  }
  dimension: date_date {
    sql: ${date_period} ;;
  }
  dimension: less_than_current_day_of_period {
    sql: ${TABLE}.less_than_current_day_of_{% if fact.period_passthrough._sql == "week" %}week{% elsif fact.period_passthrough._sql == "month" %}month{% elsif fact.period_passthrough._sql == "quarter" %}quarter{% endif %} ;;
  }
  dimension: date_last_period {
    type: date
    sql: DATE_ADD(${date_period}, INTERVAL -1 {% if fact.period_passthrough._sql == "week" %}week{% elsif fact.period_passthrough._sql == "month" %}month{% elsif fact.period_passthrough._sql == "quarter" %}quarter{% endif %}) ;;
    allow_fill: no
  }
  dimension: key_base {
    sql:
      CONCAT(
      CAST(${external_customer_id} AS STRING),
    {% if (campaign._in_query or fact.campaign_id._in_query or ad_group._in_query or fact.ad_group_id._in_query or ad._in_query or fact.creative_id._in_query or keyword._in_query or fact.criterion_id._in_query %}
      "-", CAST(${campaign_id} AS STRING),
    {% endif %}
    {% if (ad_group._in_query or fact.ad_group_id._in_query or ad._in_query or fact.creative_id._in_query or keyword._in_query or fact.criterion_id._in_query %}
      "-", CAST(${ad_group_id} AS STRING),
    {% endif %}
    {% if (ad._in_query or fact.creative_id._in_query) %}
      "-", CAST(${creative_id} AS STRING)
    {% elsif (keyword._in_query or fact.criterion_id._in_query) %}
      "-", CAST(${criterion_id} AS STRING)
    {% endif %}
    ) ;;
  }
  dimension: primary_key {
    primary_key: yes
    sql: concat(CAST(${date_date} as STRING), ${less_than_current_day_of_period}, ${key_base}) ;;
  }
}
