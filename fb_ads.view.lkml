include: "fb_stitch_base.view.lkml"

view: ads {
  extends: ["stitch_base"]

  sql_table_name: {{ _user_attributes["facebook_schema"] }}.ads ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: adset_id {
    type: string
    sql: ${TABLE}.adset_id ;;
  }

  dimension: bid_amount {
    type: number
    sql: ${TABLE}.bid_amount ;;
  }

  dimension: bid_info {
    hidden: yes
    sql: ${TABLE}.bid_info ;;
  }

  dimension: bid_type {
    type: string
    sql: ${TABLE}.bid_type ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: conversion_specs {
    hidden: yes
    sql: ${TABLE}.conversion_specs ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_time ;;
  }

  dimension: creative_id {
    type: string
    sql: ${TABLE}.creative.id ;;
  }

  dimension: effective_status {
    type: string
    sql: ${TABLE}.effective_status ;;
  }

  dimension: last_updated_by_app_id {
    type: string
    sql: ${TABLE}.last_updated_by_app_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: recommendations {
    hidden: yes
    sql: ${TABLE}.recommendations ;;
  }

  dimension: source_ad_id {
    type: string
    sql: ${TABLE}.source_ad_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: targeting {
    hidden: yes
    sql: ${TABLE}.targeting ;;
  }

  dimension: tracking_specs {
    hidden: yes
    sql: ${TABLE}.tracking_specs ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_time ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      source_ad_id,
      name,
      adsets.created_time,
      adsets.name,
      adsets.id,
      campaigns.name,
      campaigns.id,
      ads_insights.count,
      ads_insights_age_and_gender.count,
      ads_insights_country.count,
      ads_insights_platform_and_device.count
    ]
  }
}

view: ads__conversion_specs {
  dimension: action_type {
    type: string
    sql: ${TABLE}.action_type ;;
  }

  dimension: conversion_id {
    type: string
    sql: ${TABLE}.conversion_id ;;
  }

  dimension: leadgen {
    type: string
    sql: ${TABLE}.leadgen ;;
  }

  dimension: page {
    type: string
    sql: ${TABLE}.page ;;
  }

  dimension: post {
    type: string
    sql: ${TABLE}.post ;;
  }

  dimension: post_wall {
    type: string
    sql: ${TABLE}.post_wall ;;
  }
}

view: ads__bid_info {
  dimension: actions {
    type: number
    sql: ${TABLE}.actions ;;
  }
}

view: ads__recommendations {
  dimension: blame_field {
    type: string
    sql: ${TABLE}.blame_field ;;
  }

  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: confidence {
    type: string
    sql: ${TABLE}.confidence ;;
  }

  dimension: importance {
    type: string
    sql: ${TABLE}.importance ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
}

view: ads__targeting {
  dimension: age_max {
    type: number
    sql: ${TABLE}.age_max ;;
  }

  dimension: age_min {
    type: number
    sql: ${TABLE}.age_min ;;
  }

  dimension: audience_network_positions {
    type: string
    sql: ${TABLE}.audience_network_positions ;;
  }

  dimension: custom_audiences {
    hidden: yes
    sql: ${TABLE}.custom_audiences ;;
  }

  dimension: device_platforms {
    type: string
    sql: ${TABLE}.device_platforms ;;
  }

  dimension: facebook_positions {
    type: string
    sql: ${TABLE}.facebook_positions ;;
  }

  dimension: flexible_spec {
    hidden: yes
    sql: ${TABLE}.flexible_spec ;;
  }

  dimension: friends_of_connections {
    hidden: yes
    sql: ${TABLE}.friends_of_connections ;;
  }

  dimension: geo_locations {
    hidden: yes
    sql: ${TABLE}.geo_locations ;;
  }

  dimension: instagram_positions {
    type: string
    sql: ${TABLE}.instagram_positions ;;
  }

  dimension: interests {
    hidden: yes
    sql: ${TABLE}.interests ;;
  }

  dimension: messenger_positions {
    type: string
    sql: ${TABLE}.messenger_positions ;;
  }

  dimension: publisher_platforms {
    type: string
    sql: ${TABLE}.publisher_platforms ;;
  }

  dimension: targeting_optimization {
    type: string
    sql: ${TABLE}.targeting_optimization ;;
  }
}

view: ads__targeting__friends_of_connections {
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}

view: ads__targeting__geo_locations__regions {
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}

view: ads__targeting__geo_locations {
  dimension: cities {
    hidden: yes
    sql: ${TABLE}.cities ;;
  }

  dimension: countries {
    hidden: yes
    sql: ${TABLE}.countries ;;
  }

  dimension: location_types {
    hidden: yes
    sql: ${TABLE}.location_types ;;
  }

  dimension: regions {
    hidden: yes
    sql: ${TABLE}.regions ;;
  }

  dimension: zips {
    hidden: yes
    sql: ${TABLE}.zips ;;
  }
}

view: ads__targeting__geo_locations__cities {
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: distance_unit {
    type: string
    sql: ${TABLE}.distance_unit ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: radius {
    type: number
    sql: ${TABLE}.radius ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: region_id {
    type: string
    sql: ${TABLE}.region_id ;;
  }
}

view: ads__targeting__geo_locations__countries {
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE} ;;
  }
}

view: ads__targeting__geo_locations__location_types {
  dimension: location_type {
    type: string
    sql: ${TABLE} ;;
  }
}

view: ads__targeting__geo_locations__zips {
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: primary_city_id {
    type: number
    sql: ${TABLE}.primary_city_id ;;
  }

  dimension: region_id {
    type: number
    sql: ${TABLE}.region_id ;;
  }
}

view: ads__targeting__custom_audiences {
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}

view: ads__targeting__flexible_spec__work_positions {
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}

view: ads__targeting__flexible_spec__friends_of_connections {
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}

view: ads__targeting__flexible_spec__behaviors {
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}

view: ads__targeting__flexible_spec__interests {
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}

view: ads__targeting__flexible_spec__connections {
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}

view: ads__targeting__flexible_spec__work_employers {
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}

view: ads__targeting__interests {
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}

view: ads__tracking_specs {
  dimension: action_type {
    type: string
    sql: ${TABLE}.action_type ;;
  }

  dimension: fb_pixel {
    type: string
    sql: ${TABLE}.fb_pixel ;;
  }

  dimension: page {
    type: string
    sql: ${TABLE}.page ;;
  }

  dimension: post {
    type: string
    sql: ${TABLE}.post ;;
  }

  dimension: post_wall {
    type: string
    sql: ${TABLE}.post_wall ;;
  }
}

view: ads__targeting__flexible_spec {
  dimension: behaviors {
    hidden: yes
    sql: ${TABLE}.behaviors ;;
  }

  dimension: connections {
    hidden: yes
    sql: ${TABLE}.connections ;;
  }

  dimension: friends_of_connections {
    hidden: yes
    sql: ${TABLE}.friends_of_connections ;;
  }

  dimension: interests {
    hidden: yes
    sql: ${TABLE}.interests ;;
  }

  dimension: work_employers {
    hidden: yes
    sql: ${TABLE}.work_employers ;;
  }

  dimension: work_positions {
    hidden: yes
    sql: ${TABLE}.work_positions ;;
  }
}
