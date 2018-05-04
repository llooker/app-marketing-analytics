include: "fb_adset_fact.view"
include: "fb_campaigns.view"
include: "fb_ads.view"
include: "fb_adsets.view"

explore: fb_ad_date_fact {
  hidden: yes
  from: fb_ad_date_fact
  view_name: fact
  label: "Ad This Period"
  view_label: "Ad This Period"
  join: last_fact {
    from: fb_ad_date_fact
    view_label: "Ad Prior Period"
    sql_on: ${fact.account_id} = ${last_fact.account_id} AND
      ${fact.campaign_id} = ${last_fact.campaign_id} AND
      ${fact.adset_id} = ${last_fact.adset_id} AND
      ${fact.ad_id} = ${last_fact.ad_id} AND
      ${fact.date_last_period} = ${last_fact.date_period} AND
      ${fact.date_day_of_period} = ${last_fact.date_day_of_period} ;;
    relationship: one_to_one
  }
  join: campaigns {
    type: left_outer
    sql_on: ${fact.campaign_id} = ${campaigns.id} ;;
    relationship: many_to_one
  }

  join: ads {
    type: left_outer
    sql_on: ${fact.ad_id} = ${ads.id} ;;
    relationship: many_to_one
  }

  join: adsets {
    type: left_outer
    sql_on: ${fact.adset_id} = ${adsets.id} ;;
    relationship: many_to_one
  }
  join: parent_fact {
    view_label: "Adset This Period"
    from: fb_adset_date_fact
    sql_on: ${fact.account_id} = ${parent_fact.account_id} AND
      ${fact.campaign_id} = ${parent_fact.campaign_id} AND
      ${fact.adset_id} = ${parent_fact.adset_id} AND
      ${fact.date_date} = ${parent_fact.date_date};;
    relationship: many_to_one
  }
}

view: fb_ad_key_base {
  extends: [fb_account_key_base]
  extension: required

  dimension: ad_key_base {
    hidden: yes
    sql: CONCAT(${adset_key_base}, "-", CAST(${ad_id} as STRING)) ;;
  }
  dimension: key_base {
    hidden: yes
    sql: ${ad_key_base} ;;
  }
}

view: fb_ad_date_fact {
  extends: [fb_adset_date_fact, fb_ad_key_base]

  derived_table: {
    explore_source: fb_ad_impressions {
      column: ad_id { field: fact.ad_id }
      column: ad_name { field: fact.ad_name }
    }
  }
  dimension: ad_id {
    hidden: yes
  }
  dimension: ad_name {
#     required_fields: [account_id, campaign_id, adset_id, ad_id]
  }
}
