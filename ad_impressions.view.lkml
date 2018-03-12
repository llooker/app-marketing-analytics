include: "ad_criterion_base.view"
include: "ad_metrics_base.view"
include: "date_base.view"
include: "google_adwords_base.view"

view: ad_impressions {
  extends: [ad_criterion_base, ad_metrics_base, date_base, google_adwords_base]

  # this logic hits the right level of aggregate stats table depending on dimensions and filters in query
  sql_table_name:
  {% if (ad._in_query or ad_impressions.creative_id._in_query) %}
    adwords_v201609.AdBasicStats_6747157124
  {% elsif (audience._in_query or ad_impressions.audience_criterion_id._in_query) %}
    adwords_v201609.AudienceBasicStats_6747157124
  {% elsif (keyword._in_query or ad_impressions.criteria_id._in_query) %}
    adwords_v201609.KeywordBasicStats_6747157124
  {% elsif (ad_group._in_query or ad_impressions.ad_group_id._in_query) %}
    {% if ad_impressions.hour_of_day._in_query %}
      adwords_v201609.HourlyAdGroupStats_6747157124
    {% else %}
      adwords_v201609.AdGroupBasicStats_6747157124
    {% endif %}
  {% elsif (campaign._in_query or ad_impressions.campaign_id._in_query) %}
    {% if ad_impressions.hour_of_day._in_query %}
      adwords_v201609.HourlyCampaignStats_6747157124
    {% else %}
      adwords_v201609.CampaignBasicStats_6747157124
    {% endif %}
  {% else %}
    {% if ad_impressions.hour_of_day._in_query %}
      adwords_v201609.HourlyAccountStats_6747157124
    {% else %}
      adwords_v201609.AccountBasicStats_6747157124
    {% endif %}
  {% endif %} ;;

  dimension: hour_of_day {
    hidden: yes
    type: number
    sql: ${TABLE}.HourOfDay ;;
  }

  dimension: audience_criterion_id {
    hidden: yes
    type: number
    sql: ${TABLE}.CriterionId ;;
  }

  dimension: active_view_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.ActiveViewImpressions ;;
  }

  dimension: active_view_measurability {
    hidden: yes
    type: number
    sql: ${TABLE}.ActiveViewMeasurability ;;
  }

  dimension: active_view_measurable_cost {
    hidden: yes
    type: number
    sql: ${TABLE}.ActiveViewMeasurableCost ;;
  }

  dimension: active_view_measurable_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.ActiveViewMeasurableImpressions ;;
  }

  dimension: active_view_viewability {
    hidden: yes
    type: number
    sql: ${TABLE}.ActiveViewViewability ;;
  }

  dimension: ad_group_id {
    hidden: yes
    type: number
    sql: ${TABLE}.AdGroupId ;;
  }

  dimension: ad_network_type1 {
    hidden: yes
    type: string
    sql: ${TABLE}.AdNetworkType1 ;;
  }

  dimension: ad_network_type2 {
    hidden: yes
    type: string
    sql: ${TABLE}.AdNetworkType2 ;;
  }

  dimension: base_ad_group_id {
    hidden: yes
    type: number
    sql: ${TABLE}.BaseAdGroupId ;;
  }

  dimension: base_campaign_id {
    hidden: yes
    type: number
    sql: ${TABLE}.BaseCampaignId ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: number
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: creative_id {
    hidden: yes
    type: number
    sql: ${TABLE}.CreativeId ;;
  }

  dimension: criterion_id {
    hidden: yes
    type: number
    sql: ${TABLE}.CriterionId ;;
  }

  dimension: device {
    hidden: yes
    type: string
    sql: ${TABLE}.Device ;;
  }

  dimension: external_customer_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ExternalCustomerId ;;
  }

  dimension: interaction_types {
    hidden: yes
    type: string
    sql: ${TABLE}.InteractionTypes ;;
  }

  dimension: slot {
    hidden: yes
    type: string
    sql: ${TABLE}.Slot ;;
  }

  dimension: view_through_conversions {
    hidden: yes
    type: number
    sql: ${TABLE}.ViewThroughConversions ;;
  }

  dimension: ad_network_type {
    type: string
    case: {
      when: {
        sql: ${ad_network_type1} = 'SHASTA_AD_NETWORK_TYPE_1_SEARCH' AND ${ad_network_type2} = 'SHASTA_AD_NETWORK_TYPE_2_SEARCH' ;;
        label: "Search"
      }
      when: {
        sql: ${ad_network_type1} = 'SHASTA_AD_NETWORK_TYPE_1_SEARCH' AND ${ad_network_type2} = 'SHASTA_AD_NETWORK_TYPE_2_SEARCH_PARTNERS' ;;
        label: "Search Partners"
      }
      when: {
        sql: ${ad_network_type1} = 'SHASTA_AD_NETWORK_TYPE_1_CONTENT' ;;
        label: "Content"
      }
      else: "Other"
    }
  }

  dimension: device_type {
    type: string
    case: {
      when: {
        sql: ${device} LIKE '%Desktop%' ;;
        label: "Desktop"
      }
      when: {
        sql: ${device} LIKE '%Mobile%' ;;
        label: "Mobile"
      }
      when: {
        sql: ${device} LIKE '%Tablet%' ;;
        label: "Tablet"
      }
      else: "Other"
    }
  }

  measure: total_impressions {
  }
  measure: total_clicks {
  }
  measure: total_interactions {
  }
  measure: total_conversions {
    drill_fields: [ad_impressions.date_date, campaign.campaign_name, ad_impressions.total_conversions]
  }
  measure: total_cost_usd {
    drill_fields: [ad_impressions.date_date, campaign.campaign_name, ad_impressions.total_cost_usd]
  }
  measure: average_interaction_rate {
    link: {
      label: "By Keyword"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=keyword.criteria,ad_impressions.average_interaction_rate&f[ad_impressions.date_date]=this quarter"
    }
  }
  measure: average_click_rate {
  }
  measure: average_conversion_rate {
  }
  measure: average_cost_per_click {
  }
  measure: average_cost_per_conversion {
    drill_fields: [ad_impressions.date_date, campaign.campaign_name, ad_impressions.total_conversions]
  }
}
