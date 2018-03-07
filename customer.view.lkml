include: "date_base.view"
include: "google_adwords_base.view"

view: customer {
  extends: [date_base, google_adwords_base]
  sql_table_name: adwords_v201609.Customer_6747157124 ;;

  dimension: _date {
    type: date
    sql: TIMESTAMP(${TABLE}._DATA_DATE) ;;
  }

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
  }

  dimension: can_manage_clients {
    type: yesno
    sql: ${TABLE}.CanManageClients ;;
  }

  dimension: customer_descriptive_name {
    type: string
    sql: ${TABLE}.CustomerDescriptiveName ;;
    link: {
      label: "Account Dashboard"
      url: "/dashboards/looker_app_google_adwords::account_performance?Customer%20Name={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.ExternalCustomerId ;;
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