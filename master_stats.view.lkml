include: "ad_criterion_base.view.lkml"
include: "base.view.lkml"
include: "stats.view.lkml"

view: master_stats {
  extends: [ad_criterion_base, base, stats]

  sql_table_name:
  {% if (ad._in_query or master_stats.creative_id._in_query) %}
    adwords_v201609.AdBasicStats_6747157124
  {% elsif (audience._in_query or master_stats.audience_criterion_id._in_query) %}
    adwords_v201609.AudienceBasicStats_6747157124
  {% elsif (keyword._in_query or master_stats.criteria_id._in_query) %}
    adwords_v201609.KeywordBasicStats_6747157124
  {% elsif (ad_group._in_query or master_stats.ad_group_id._in_query) %}
    {% if master_stats.hour_of_day._in_query %}
      adwords_v201609.HourlyAdGroupStats_6747157124
    {% else %}
      adwords_v201609.AdGroupBasicStats_6747157124
    {% endif %}
  {% elsif (campaign._in_query or master_stats.campaign_id._in_query) %}
    {% if master_stats.hour_of_day._in_query %}
      adwords_v201609.HourlyCampaignStats_6747157124
    {% else %}
      adwords_v201609.CampaignBasicStats_6747157124
    {% endif %}
  {% else %}
    {% if master_stats.hour_of_day._in_query %}
      adwords_v201609.HourlyAccountStats_6747157124
    {% else %}
      adwords_v201609.AccountBasicStats_6747157124
    {% endif %}
  {% endif %} ;;

  dimension: _date {
    hidden: yes
    sql: TIMESTAMP(${TABLE}._DATA_DATE) ;;
  }

  dimension: hour_of_day {
    type: number
    sql: ${TABLE}.HourOfDay ;;
  }

  dimension: audience_criterion_id {
    type: number
    sql: ${TABLE}.CriterionId ;;
  }

  dimension: active_view_impressions {
    type: number
    sql: ${TABLE}.ActiveViewImpressions ;;
  }

  dimension: active_view_measurability {
    type: number
    sql: ${TABLE}.ActiveViewMeasurability ;;
  }

  dimension: active_view_measurable_cost {
    type: number
    sql: ${TABLE}.ActiveViewMeasurableCost ;;
  }

  dimension: active_view_measurable_impressions {
    type: number
    sql: ${TABLE}.ActiveViewMeasurableImpressions ;;
  }

  dimension: active_view_viewability {
    type: number
    sql: ${TABLE}.ActiveViewViewability ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.AdGroupId ;;
  }

  dimension: ad_network_type1 {
    type: string
    sql: ${TABLE}.AdNetworkType1 ;;
  }

  dimension: ad_network_type2 {
    type: string
    sql: ${TABLE}.AdNetworkType2 ;;
  }

  dimension: base_ad_group_id {
    type: number
    sql: ${TABLE}.BaseAdGroupId ;;
  }

  dimension: base_campaign_id {
    type: number
    sql: ${TABLE}.BaseCampaignId ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: creative_id {
    type: number
    sql: ${TABLE}.CreativeId ;;
  }

  dimension: criterion_id {
    type: number
    sql: ${TABLE}.CriterionId ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.Device ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.ExternalCustomerId ;;
  }

  dimension: interaction_types {
    type: string
    sql: ${TABLE}.InteractionTypes ;;
  }

  dimension: slot {
    type: string
    sql: ${TABLE}.Slot ;;
  }

  dimension: view_through_conversions {
    type: number
    sql: ${TABLE}.ViewThroughConversions ;;
  }

  measure: total_impressions {
  }
  measure: total_clicks {
  }
  measure: total_interactions {
  }
  measure: total_conversions {
    drill_fields: [master_stats.date_date, campaign.campaign_name, master_stats.total_conversions]
  }
  measure: total_cost_usd {
    drill_fields: [master_stats.date_date, campaign.campaign_name, master_stats.total_cost_usd]
  }
  measure: average_interaction_rate {
    link: {
      label: "By Keyword"
      url: "/explore/google_adwords/master_stats?fields=keyword.criteria,master_stats.average_interaction_rate&f[master_stats.date_date]=this quarter"
    }
  }
  measure: average_click_rate {
  }
  measure: average_conversion_rate {
  }
  measure: average_cost_per_click {
  }
  measure: average_cost_per_conversion {
    drill_fields: [master_stats.date_date, campaign.campaign_name, master_stats.total_conversions]
  }
}
