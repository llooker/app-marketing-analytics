include: "date_base.view.lkml"

view: google_adwords_base {
  extension: required

  dimension: latest {
    hidden: yes
    sql: ${TABLE}._DATA_DATE = ${TABLE}._LATEST_DATE ;;
  }
}
