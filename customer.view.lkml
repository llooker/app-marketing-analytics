include: "/app_marketing_analytics_adapter/customer.view"
include: "date_base.view"
include: "date_primary_key_base.view"
include: "google_adwords_base.view"

explore: customer {
  hidden: yes
}

view: customer_key_base {
  extends: [date_primary_key_base]
  extension: required

  dimension: account_key_base {
    hidden: yes
    sql: CAST(${external_customer_id} AS STRING) ;;
  }
  dimension: key_base {
    hidden: yes
    sql: ${account_key_base} ;;
  }
}

view: customer {
  extends: [customer_key_base, date_base, google_adwords_base, customer_adapter]

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

  measure: count {
    type: count_distinct
    sql: ${key_base} ;;
    drill_fields: [drill_detail*]
  }

  set: drill_detail {
    fields: [external_customer_id, primary_company_name]
  }
}
