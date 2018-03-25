include: "date_base.view"
include: "google_adwords_base.view"

view: customer {
  extends: [date_base, google_adwords_base]
  sql_table_name: {{ _user_attributes["google_adwords_schema"] }}.Customer_{{ _user_attributes["google_adwords_customer_id"] }} ;;

  dimension: account_currency_code {
    type: string
    sql: ${TABLE}.AccountCurrencyCode ;;
  }

  dimension: account_descriptive_name {
    type: string
    sql: ${TABLE}.AccountDescriptiveName ;;
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
  }

  dimension_group: date {
    hidden: yes
  }

  measure: count {
    type: count_distinct
    sql: ${external_customer_id} ;;
    drill_fields: [detail*]
  }

  # ----- Detail ------
  set: detail {
    fields: [external_customer_id, primary_company_name]
  }
}
