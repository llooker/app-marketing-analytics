include: "/app_marketing_analytics_adapter/customer.view"
include: "date_base.view"
include: "google_adwords_base.view"

explore: customer {
  hidden: yes
}

view: customer {
  extends: [date_base, google_adwords_base, customer_adapter]

  dimension: account_currency_code {
    type: string
    sql: ${TABLE}.AccountCurrencyCode ;;
  }

  dimension: account_descriptive_name {
    type: string
    sql: ${TABLE}.AccountDescriptiveName ;;
    required_fields: [external_customer_id]
  }

  dimension: account_time_zone_id {
    type: string
    sql: ${TABLE}.AccountTimeZoneId ;;
    hidden:  yes
  }

  dimension: can_manage_clients {
    type: yesno
    sql: ${TABLE}.CanManageClients ;;
  }

  dimension: customer_descriptive_name {
    type: string
    sql: ${TABLE}.CustomerDescriptiveName ;;
  }

  dimension: is_auto_tagging_enabled {
    type: yesno
    sql: ${TABLE}.IsAutoTaggingEnabled ;;
  }

  dimension: is_test_account {
    type: yesno
    sql: ${TABLE}.IsTestAccount ;;
  }

  dimension: primary_company_name {
    type: string
    sql: ${TABLE}.PrimaryCompanyName ;;
    required_fields: [external_customer_id]
  }

  dimension: key_base {
    hidden: yes
    sql: CAST(${external_customer_id} AS STRING) ;;
  }

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${_date} AS STRING), "-", ${key_base}) ;;
  }

  measure: count {
    type: count_distinct
    sql: ${key_base} ;;
    drill_fields: [drill_detail*]
  }

  set: drill_detail {
    fields: [external_customer_id, primary_company_name]
  }
}
