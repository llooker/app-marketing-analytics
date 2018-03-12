include: "date_base.view.lkml"

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
    type: number
    sql: ${TABLE}.ExternalCustomerId ;;
    hidden: yes
  }

}
