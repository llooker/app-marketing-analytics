view: account_avg_cpa {
  derived_table: {
    explore_source: master_stats {
      column: external_customer_id {}
      column: total_cost_usd {}
      column: total_conversions {}
    }
  }

  dimension: external_customer_id {
    type: number
    primary_key: yes
    hidden: yes
  }

  dimension: total_cost_usd_dim {
    description: "Total cost."
    value_format: "$#,##0"
    type: number
    sql: ${TABLE}.total_cost_usd ;;
    hidden: yes
  }

  dimension: total_conversions_dim {
    description: "Total conversions."
    value_format: "#,##0"
    type: number
    sql: ${TABLE}.total_conversions ;;
    hidden: yes
  }

  measure: total_cost {
    type: sum
    sql: ${total_cost_usd_dim} ;;
    hidden: yes
  }

  measure: total_conversions {
    type: sum
    sql: ${total_conversions_dim} ;;
    hidden: yes
  }

  measure: average_cpa_of_the_account {
    label: "Average CPA of the account"
    description: "Average CPA of the whole account for all time"
    view_label: "Ad Stats"
    type: number
    sql: ${total_cost} / NULLIF(${total_conversions},0);;
    value_format_name: usd
  }

  measure: expected_conversions_for_campaign {
    label: "Expected Conversions"
    view_label: "Campaigns"
    description: "Cost divided by average CPA for the account"
    type: number
    sql: ${master_stats.total_cost_usd} / NULLIF(${average_cpa_of_the_account},0) ;;
    value_format_name: decimal_2
  }

}

view: campaign_avg_cpa {
  derived_table: {
    explore_source: master_stats {
      column: external_customer_id {}
      column: total_cost_usd {}
      column: total_conversions {}
      column: campaign_id {}
    }
  }

  dimension: external_customer_id {
    type: number
    hidden: yes
  }

  dimension: campaign_id {
    type: number
    hidden: yes
  }

  dimension: id {
    type: string
    sql: CONCAT(${external_customer_id}, ${campaign_id}) ;;
    primary_key: yes
    hidden: yes
  }

  dimension: total_cost_usd_dim {
    description: "Total cost."
    value_format: "$#,##0"
    type: number
    sql: ${TABLE}.total_cost_usd ;;
    hidden: yes
  }

  dimension: total_conversions_dim {
    description: "Total conversions."
    value_format: "#,##0"
    type: number
    sql: ${TABLE}.total_conversions;;
    hidden: yes
  }

  measure: total_cost {
    type: sum
    sql: ${total_cost_usd_dim} ;;
    hidden: yes
  }

  measure: total_conversions {
    type: sum
    sql: ${total_conversions_dim} ;;
    hidden: yes
  }

  measure: average_cpa_of_campaign {
    label: "Average CPA of the campaign"
    description: "Average CPA for the campaign"
    view_label: "Ad Groups"
    type: number
    sql: ${total_cost} / NULLIF(${total_conversions},0);;
    value_format_name: usd
  }

  measure: cpa_compared_to_average_for_campaign {
    label: "Ad Group CPA compared to Average CPA of the campaign"
    description: "CPA compared to Average CPA of the campaign"
    view_label: "Ad Groups"
    type: number
    sql: (${master_stats.average_cost_per_conversion} - ${average_cpa_of_campaign}) / NULLIF(${average_cpa_of_campaign},0);;
    value_format_name: percent_0
  }

  measure: expected_conversions_for_ad_group {
    label: "Expected Conversions"
    view_label: "Ad Groups"
    description: "Cost divided by average CPA of the campaign"
    type: number
    sql: ${master_stats.total_cost_usd} / NULLIF(${campaign_avg_cpa.average_cpa_of_campaign},0) ;;
    value_format_name: decimal_2
  }
}

view: ad_group_avg_cpa {
  derived_table: {
    explore_source: master_stats {
      column: external_customer_id {}
      column: total_cost_usd {}
      column: total_conversions {}
      column: campaign_id {}
      column: ad_group_id {}
    }
  }

  dimension: id {
    type: string
    sql: CONCAT(${external_customer_id}, ${campaign_id}, ${ad_group_id}) ;;
    primary_key: yes
    hidden: yes
  }

  dimension: external_customer_id {
    type: number
    hidden: yes
  }

  dimension: total_cost_usd_dim {
    description: "Total cost."
    value_format: "$#,##0"
    type: number
    sql: ${TABLE}.total_cost_usd;;
    hidden: yes
  }

  dimension: total_conversions_dim {
    description: "Total conversions."
    value_format: "#,##0"
    type: number
    sql: ${TABLE}.total_conversions;;
    hidden: yes
  }

  dimension: campaign_id {
    type: number
    hidden: yes
  }

  dimension: ad_group_id {
    type: number
    hidden: yes
  }

  measure: total_cost {
    type: sum
    sql: ${total_cost_usd_dim} ;;
    hidden: yes
  }

  measure: total_conversions {
    type: sum
    sql: ${total_conversions_dim} ;;
    hidden: yes
  }

  measure: average_cpa_of_ad_group {
    description: "Average CPA of the ad group"
    label: "Average CPA of the Ad Group"
    view_label: "Ads"
    type: number
    sql: ${total_cost} / NULLIF(${total_conversions},0);;
    value_format_name: usd
  }

  measure: cpa_compared_to_average_for_ad_group {
    description: "CPA compared to Average CPA of the ad group"
    label: "Ad CPA compared to Average CPA of the Ad Group"
    view_label: "Ads"
    type: number
    sql: (${master_stats.average_cost_per_conversion} - ${average_cpa_of_ad_group}) / NULLIF(${average_cpa_of_ad_group},0);;
    value_format_name: percent_0
  }

  measure: expected_conversions_for_ad {
    label: "Expected Conversions"
    view_label: "Ads"
    description: "Cost divided by average CPA of the Ad Group"
    type: number
    sql: ${master_stats.total_cost_usd} / NULLIF(${ad_group_avg_cpa.average_cpa_of_ad_group},0) ;;
    value_format_name: decimal_2
  }
}
