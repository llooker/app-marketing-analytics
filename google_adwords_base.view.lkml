view: google_adwords_base {
  extension: required

  dimension: _date {
    hidden: yes
    sql: TIMESTAMP(${TABLE}._DATA_DATE) ;;
  }

  dimension: latest {
    hidden: yes
    sql: ${TABLE}._DATA_DATE = ${TABLE}._LATEST_DATE ;;
  }

  dimension: external_customer_id {
    sql: ${TABLE}.ExternalCustomerId ;;
    hidden: yes
  }

  dimension: external_customer_id_string {
    sql: CAST(${TABLE}.ExternalCustomerId as STRING) ;;
    hidden: yes
  }

}
