  include: "date_base.view"
  include: "fb_ad_metrics_base.view"
  include: "period_base.view"
  include: "fb_campaigns.view"
  include: "fb_adsets.view"
  include: "fb_ads.view"

  explore: fb_period_fact {
    hidden: yes
    from: fb_period_fact
    view_name: fact
    label: "This Period"
    view_label: "This Period"

    join: campaigns {
      view_label: "FB Campaigns"
      type: left_outer
      sql_on: ${fact.campaign_id} = ${campaigns.id} ;;
      relationship: many_to_one
    }

    join: ads {
      view_label: "FB Ads"
      type: left_outer
      sql_on: ${fact.ad_id} = ${ads.id} ;;
      relationship: many_to_one
    }

    join: adcreative {
      view_label: "FB Ad Creatives"
      type: left_outer
      sql_on: ${ads.creative_id} = ${adcreative.id} ;;
      relationship: one_to_one
    }

    join: adsets {
      view_label: "FB Adsets"
      type: left_outer
      sql_on: ${fact.adset_id} = ${adsets.id} ;;
      relationship: many_to_one
    }

    join: last_fact {
      from: fb_period_fact
      view_label: "Prior Period"
      sql_on:
      ${fact.date_last_period} = ${last_fact.date_period}
      AND ${fact.date_day_of_period} = ${last_fact.date_day_of_period}
      {% if (ads._in_query or fact.ad_id._in_query) %}
        AND ${fact.ad_id} = ${last_fact.ad_id}
      {% elsif (adsets._in_query or fact.adset_id._in_query) or (ads._in_query or fact.ad_id._in_query) %}
        AND ${fact.adset_id} = ${last_fact.adset_id}
      {% elsif (campaigns._in_query or fact.campaign_id._in_query) or (adsets._in_query or fact.adset_id._in_query) or (ads._in_query or fact.ad_id._in_query) %}
        AND ${fact.campaign_id} = ${last_fact.campaign_id}
      {% endif %}
      AND ${fact.account_id} = ${last_fact.account_id} ;;
      relationship: one_to_one
      fields: [last_fact.fb_ad_metrics_set*, last_fact.fb_ad_metrics_set*]
    }
  }



  view: fb_period_fact {
    extends: [date_base, period_base, fb_ad_metrics_base]

    dimension: account_id {
      hidden: yes
    }
    dimension: campaign_id {
      hidden: yes
    }
    dimension: adset_id {
      hidden: yes
    }
    dimension: ad_id {
      hidden: yes
    }
    dimension: criterion_id {
      hidden: yes
    }
    dimension: _date {
      type: date_raw
    }

    sql_table_name:
      {% if (ads._in_query or fact.ad_id._in_query) %}
        ${fb_ad_date_fact.SQL_TABLE_NAME}
      {% elsif (adsets._in_query or fact.adset_id._in_query) %}
        ${fb_adset_date_fact.SQL_TABLE_NAME}
      {% elsif (campaigns._in_query or fact.campaign_id._in_query) %}
        ${fb_campaign_date_fact.SQL_TABLE_NAME}
      {% else %}
        ${fb_account_date_fact.SQL_TABLE_NAME}
      {% endif %} ;;

    dimension: primary_key {
      hidden: yes
      primary_key: yes
      sql: CONCAT(CAST(${date_date} AS STRING)
              ,"|", CAST(${account_id} AS STRING)
              ,"|", CAST(${campaign_id} AS STRING)
              ,"|", CAST(${adset_id} AS STRING)
              ,"|", CAST(${ad_id} AS STRING)
              ) ;;
    }
    }
