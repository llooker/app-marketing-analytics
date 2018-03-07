view: stitch_base {
  extension: required

  dimension_group: _sdc_batched {
    hidden: yes
    type: time
    timeframes: [
      raw,
    ]
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_extracted {
    hidden: yes
    type: time
    timeframes: [
      raw,
    ]
    sql: ${TABLE}._sdc_extracted_at ;;
  }

  dimension_group: _sdc_received {
    type: time
    timeframes: [
      raw,
    ]
    sql: ${TABLE}._sdc_received_at ;;
  }

  dimension: _sdc_sequence {
    hidden: yes
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    hidden: yes
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }
}
