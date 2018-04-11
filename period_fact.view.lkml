include: "ad_metrics_parent_comparison_base.view"
include: "ad_metrics_period_comparison_base.view"
include: "date_base.view"
include: "google_ad_metrics_base.view"
include: "period_base.view"
include: "customer.view"
include: "campaign.view"
include: "ad_group.view"
include: "ad.view"
include: "keyword.view"

explore: period_fact {
  hidden: yes
  from: period_fact
  view_name: fact
  label: "This Period"
  view_label: "This Period"

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

  join: last_fact {
    from: period_fact
    view_label: "Prior Period"
    sql_on:
      ${fact.date_last_period} = ${last_fact.date_period}
      AND ${fact.date_day_of_period} = ${last_fact.date_day_of_period}
      {% if (ad._in_query or fact.creative_id._in_query) %}
        AND ${fact.creative_id} = ${last_fact.creative_id}
      {% elsif (keyword._in_query or fact.criterion_id._in_query) %}
        AND ${fact.criterion_id} = ${last_fact.criterion_id}
      {% elsif (ad_group._in_query or fact.ad_group_id._in_query) or (ad._in_query or fact.creative_id._in_query) or (keyword._in_query or fact.criterion_id._in_query) %}
        AND ${fact.ad_group_id} = ${last_fact.ad_group_id}
      {% elsif (campaign._in_query or fact.campaign_id._in_query) or (ad_group._in_query or fact.ad_group_id._in_query) or (ad._in_query or fact.creative_id._in_query) or (keyword._in_query or fact.criterion_id._in_query) %}
        AND ${fact.campaign_id} = ${last_fact.campaign_id}
      {% endif %}
      AND ${fact.external_customer_id} = ${last_fact.external_customer_id} ;;
    relationship: one_to_one
    fields: [last_fact.google_ad_metrics_set*, last_fact.ad_metrics_parent_comparison_measures_set*]
  }
  join: parent_fact {
    from: period_fact
    view_label: "Parent This Period"
    sql_on:
      ${fact.date_period} = ${parent_fact.date_period}
      AND ${fact.date_day_of_period} = ${last_fact.date_day_of_period}
      {% if (ad._in_query or fact.creative_id._in_query) or (keyword._in_query or fact.criterion_id._in_query) %}
        AND ${fact.ad_group_id} = ${parent_fact.ad_group_id}
      {% endif %}
      {% if (ad_group._in_query or fact.ad_group_id._in_query) or (ad._in_query or fact.creative_id._in_query) or (keyword._in_query or fact.criterion_id._in_query) %}
        AND ${fact.campaign_id} = ${parent_fact.campaign_id}
      {% endif %}
      {% if (campaign._in_query or fact.campaign_id._in_query) or (ad_group._in_query or fact.ad_group_id._in_query) or (ad._in_query or fact.creative_id._in_query) or (keyword._in_query or fact.criterion_id._in_query) %}
        AND ${fact.external_customer_id} = ${parent_fact.external_customer_id}
      {% endif %} ;;
    relationship: many_to_one
    fields: [parent_fact.google_ad_metrics_set*]
  }
}

view: period_fact {
  extends: [date_base, period_base, ad_metrics_period_comparison_base, ad_metrics_parent_comparison_base, google_ad_metrics_base]

  dimension: external_customer_id {
    hidden: yes
  }
  dimension: campaign_id {
    hidden: yes
  }
  dimension: ad_group_id {
    hidden: yes
  }
  dimension: creative_id {
    hidden: yes
  }
  dimension: criterion_id {
    hidden: yes
  }
  dimension: _date {
    type: date_raw
  }

  sql_table_name:
  {% if (ad._in_query or fact.creative_id._in_query) %}
    ${ad_date_fact.SQL_TABLE_NAME}
  {% elsif (keyword._in_query or fact.criterion_id._in_query) %}
    ${keyword_date_fact.SQL_TABLE_NAME}
  {% elsif (ad_group._in_query or fact.ad_group_id._in_query) %}
    ${ad_group_date_fact.SQL_TABLE_NAME}
  {% elsif (campaign._in_query or fact.campaign_id._in_query) %}
    ${campaign_date_fact.SQL_TABLE_NAME}
  {% else %}
    ${account_date_fact.SQL_TABLE_NAME}
  {% endif %} ;;

  dimension: key_base {
    hidden: yes
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
    hidden: yes
    sql: concat(CAST(${date_period} as STRING), ${date_day_of_period}, ${key_base}) ;;
  }
}
