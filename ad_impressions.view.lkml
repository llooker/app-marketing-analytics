include: "/app_marketing_analytics_adapter/ad_impressions.view"
include: "google_ad_transformations_base.view"
include: "date_base.view"
include: "period_base.view"
include: "google_adwords_base.view"

view: ad_impressions {
  extends: [date_base, period_base, google_ad_transformations_base, google_adwords_base, ad_impressions_adapter]

  dimension: hour_of_day {
    hidden: yes
    type: number
    sql: ${TABLE}.HourOfDay ;;
  }

  dimension: audience_criterion_id {
    hidden: yes
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
    sql: ${TABLE}.AdGroupId ;;
  }

  dimension: ad_group_id_string {
    hidden: yes
    sql: CAST(${ad_group_id} as STRING) ;;
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
    sql: ${TABLE}.BaseAdGroupId ;;
  }

  dimension: base_campaign_id {
    hidden: yes
    sql: ${TABLE}.BaseCampaignId ;;
  }

  dimension: campaign_id {
    hidden: yes
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: campaign_id_string {
    hidden: yes
    sql: CAST(${campaign_id} as STRING) ;;
  }

  dimension: creative_id {
    hidden: yes
    sql: ${TABLE}.CreativeId ;;
  }

  dimension: creative_id_string {
    hidden: yes
    sql: CAST(${creative_id} as STRING) ;;
  }

  dimension: criterion_id {
    hidden: yes
    sql: ${TABLE}.CriterionId ;;
  }

  dimension: criterion_id_string {
    hidden: yes
    sql: CAST(${criterion_id} as STRING) ;;
  }

  dimension: device {
    hidden: yes
    type: string
    sql: ${TABLE}.Device ;;
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
  measure: total_conversions {
    drill_fields: [fact.date_date, campaign.campaign_name, fact.total_conversions]
  }
  measure: total_cost {
    drill_fields: [fact.date_date, campaign.campaign_name, fact.total_cost]
  }
  measure: average_click_rate {
    link: {
      label: "By Keyword"
      url: "/explore/looker_app_google_adwords/ad_impressions?fields=keyword.criteria,fact.average_click_rate&f[fact.date_date]=this quarter"
    }
  }
  measure: average_conversion_rate {
  }
  measure: average_cost_per_click {
  }
  measure: average_cost_per_conversion {
    drill_fields: [fact.date_date, campaign.campaign_name, fact.total_conversions]
  }
}
