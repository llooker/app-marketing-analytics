explore: ad_fact_click_rate_good {
  hidden: yes
}
view: ad_fact_click_rate_good {
  derived_table: {
    explore_source: ad_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: creative_id { field: fact.creative_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.click_rate_good
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: creative_id {}
}

explore: ad_fact_conversion_rate_good {
  hidden: yes
}
view: ad_fact_conversion_rate_good {
  derived_table: {
    explore_source: ad_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: creative_id { field: fact.creative_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.conversion_rate_good
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: creative_id {}
}

explore: ad_fact_cost_per_conversion_good {
  hidden: yes
}
view: ad_fact_cost_per_conversion_good {
  derived_table: {
    explore_source: ad_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: creative_id { field: fact.creative_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.cost_per_conversion_good
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: creative_id {}
}

explore: ad_fact_click_rate_bad {
  hidden: yes
}
view: ad_fact_click_rate_bad {
  derived_table: {
    explore_source: ad_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: creative_id { field: fact.creative_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.click_rate_bad
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: creative_id {}
}

explore: ad_fact_conversion_rate_bad {
  hidden: yes
}
view: ad_fact_conversion_rate_bad {
  derived_table: {
    explore_source: ad_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: creative_id { field: fact.creative_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.conversion_rate_bad
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: creative_id {}
}

explore: ad_fact_cost_per_conversion_bad {
  hidden: yes
}
view: ad_fact_cost_per_conversion_bad {
  derived_table: {
    explore_source: ad_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: creative_id { field: fact.creative_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.cost_per_conversion_bad
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: creative_id {}
}

explore: ad_fact_click_rate_big_mover {
  hidden: yes
}
view: ad_fact_click_rate_big_mover {
  derived_table: {
    explore_source: ad_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: creative_id { field: fact.creative_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.click_rate_big_mover
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: creative_id {}
}

explore: ad_fact_conversion_rate_big_mover {
  hidden: yes
}
view: ad_fact_conversion_rate_big_mover {
  derived_table: {
    explore_source: ad_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: creative_id { field: fact.creative_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.conversion_rate_big_mover
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: creative_id {}
}

explore: ad_fact_cost_per_conversion_big_mover {
  hidden: yes
}
view: ad_fact_cost_per_conversion_big_mover {
  derived_table: {
    explore_source: ad_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: creative_id { field: fact.creative_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.cost_per_conversion_big_mover
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: creative_id {}
}

explore: keyword_fact_click_rate_good {
  hidden: yes
}
view: keyword_fact_click_rate_good {
  derived_table: {
    explore_source: keyword_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: criterion_id { field: fact.criterion_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.click_rate_good
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: criterion_id {}
}

explore: keyword_fact_conversion_rate_good {
  hidden: yes
}
view: keyword_fact_conversion_rate_good {
  derived_table: {
    explore_source: keyword_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: criterion_id { field: fact.criterion_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.conversion_rate_good
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: criterion_id {}
}

explore: keyword_fact_cost_per_conversion_good {
  hidden: yes
}
view: keyword_fact_cost_per_conversion_good {
  derived_table: {
    explore_source: keyword_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: criterion_id { field: fact.criterion_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.cost_per_conversion_good
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: criterion_id {}
}

explore: keyword_fact_click_rate_bad {
  hidden: yes
}
view: keyword_fact_click_rate_bad {
  derived_table: {
    explore_source: keyword_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: criterion_id { field: fact.criterion_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.click_rate_bad
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: criterion_id {}
}

explore: keyword_fact_conversion_rate_bad {
  hidden: yes
}
view: keyword_fact_conversion_rate_bad {
  derived_table: {
    explore_source: keyword_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: criterion_id { field: fact.criterion_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.conversion_rate_bad
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: criterion_id {}
}

explore: keyword_fact_cost_per_conversion_bad {
  hidden: yes
}
view: keyword_fact_cost_per_conversion_bad {
  derived_table: {
    explore_source: keyword_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: criterion_id { field: fact.criterion_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.cost_per_conversion_bad
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: criterion_id {}
}

explore: keyword_fact_click_rate_big_mover {
  hidden: yes
}
view: keyword_fact_click_rate_big_mover {
  derived_table: {
    explore_source: keyword_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: criterion_id { field: fact.criterion_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.click_rate_big_mover
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: criterion_id {}
}

explore: keyword_fact_conversion_rate_big_mover {
  hidden: yes
}
view: keyword_fact_conversion_rate_big_mover {
  derived_table: {
    explore_source: keyword_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: criterion_id { field: fact.criterion_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.conversion_rate_big_mover
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: criterion_id {}
}

explore: keyword_fact_cost_per_conversion_big_mover {
  hidden: yes
}
view: keyword_fact_cost_per_conversion_big_mover {
  derived_table: {
    explore_source: keyword_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      column: criterion_id { field: fact.criterion_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.cost_per_conversion_big_mover
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: criterion_id {}
}

explore: ad_group_fact_click_rate_good {
  hidden: yes
}
view: ad_group_fact_click_rate_good {
  derived_table: {
    explore_source: ad_group_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.click_rate_good
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
}

explore: ad_group_fact_conversion_rate_good {
  hidden: yes
}
view: ad_group_fact_conversion_rate_good {
  derived_table: {
    explore_source: ad_group_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.conversion_rate_good
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
}

explore: ad_group_fact_cost_per_conversion_good {
  hidden: yes
}
view: ad_group_fact_cost_per_conversion_good {
  derived_table: {
    explore_source: ad_group_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.cost_per_conversion_good
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
}

explore: ad_group_fact_click_rate_bad {
  hidden: yes
}
view: ad_group_fact_click_rate_bad {
  derived_table: {
    explore_source: ad_group_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.click_rate_bad
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
}

explore: ad_group_fact_conversion_rate_bad {
  hidden: yes
}
view: ad_group_fact_conversion_rate_bad {
  derived_table: {
    explore_source: ad_group_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.conversion_rate_bad
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
}

explore: ad_group_fact_cost_per_conversion_bad {
  hidden: yes
}
view: ad_group_fact_cost_per_conversion_bad {
  derived_table: {
    explore_source: ad_group_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.cost_per_conversion_bad
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
}

explore: ad_group_fact_click_rate_big_mover {
  hidden: yes
}
view: ad_group_fact_click_rate_big_mover {
  derived_table: {
    explore_source: ad_group_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.click_rate_big_mover
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
}

explore: ad_group_fact_conversion_rate_big_mover {
  hidden: yes
}
view: ad_group_fact_conversion_rate_big_mover {
  derived_table: {
    explore_source: ad_group_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.conversion_rate_big_mover
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
}

explore: ad_group_fact_cost_per_conversion_big_mover {
  hidden: yes
}
view: ad_group_fact_cost_per_conversion_big_mover {
  derived_table: {
    explore_source: ad_group_fact_this_timeframe {
      column: external_customer_id { field: fact.external_customer_id }
      column: campaign_id { field: fact.campaign_id }
      column: ad_group_id { field: fact.ad_group_id }
      filters: {
        field: fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: last_fact.last_timeframe
        value: "1 quarter ago"
      }
      filters: {
        field: parent_fact.this_timeframe
        value: "this quarter"
      }
      filters: {
        field: fact.cost_per_conversion_big_mover
        value: "Yes"
      }
    }
  }
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
}

view: reports {
  derived_table: {
    sql:
    SELECT
      ad_fact_click_rate_good.external_customer_id AS external_customer_id,
      ad_fact_click_rate_good.campaign_id AS campaign_id,
      ad_fact_click_rate_good.ad_group_id AS ad_group_id,
      ad_fact_click_rate_good.creative_id AS creative_id,
      null AS criterion_id,
      "CTR" as metric,
      "Good" as status
    FROM ${ad_fact_click_rate_good.SQL_TABLE_NAME} as ad_fact_click_rate_good
    UNION ALL
    SELECT
      ad_fact_conversion_rate_good.external_customer_id AS external_customer_id,
      ad_fact_conversion_rate_good.campaign_id AS campaign_id,
      ad_fact_conversion_rate_good.ad_group_id AS ad_group_id,
      ad_fact_conversion_rate_good.creative_id AS creative_id,
      null AS criterion_id,
      "CR" as metric,
      "Good" as status
    FROM ${ad_fact_conversion_rate_good.SQL_TABLE_NAME} as ad_fact_conversion_rate_good
    UNION ALL
    SELECT
      ad_fact_cost_per_conversion_good.external_customer_id AS external_customer_id,
      ad_fact_cost_per_conversion_good.campaign_id AS campaign_id,
      ad_fact_cost_per_conversion_good.ad_group_id AS ad_group_id,
      ad_fact_cost_per_conversion_good.creative_id AS creative_id,
      null AS criterion_id,
      "CPA" as metric,
      "Good" as status
    FROM ${ad_fact_cost_per_conversion_good.SQL_TABLE_NAME} as ad_fact_cost_per_conversion_good
    UNION ALL
    SELECT
      ad_fact_click_rate_bad.external_customer_id AS external_customer_id,
      ad_fact_click_rate_bad.campaign_id AS campaign_id,
      ad_fact_click_rate_bad.ad_group_id AS ad_group_id,
      ad_fact_click_rate_bad.creative_id AS creative_id,
      null AS criterion_id,
      "CTR" as metric,
      "Bad" as status
    FROM ${ad_fact_click_rate_bad.SQL_TABLE_NAME} as ad_fact_click_rate_bad
    UNION ALL
    SELECT
      ad_fact_conversion_rate_bad.external_customer_id AS external_customer_id,
      ad_fact_conversion_rate_bad.campaign_id AS campaign_id,
      ad_fact_conversion_rate_bad.ad_group_id AS ad_group_id,
      ad_fact_conversion_rate_bad.creative_id AS creative_id,
      null AS criterion_id,
      "CR" as metric,
      "Bad" as status
    FROM ${ad_fact_conversion_rate_bad.SQL_TABLE_NAME} as ad_fact_conversion_rate_bad
    UNION ALL
    SELECT
      ad_fact_cost_per_conversion_bad.external_customer_id AS external_customer_id,
      ad_fact_cost_per_conversion_bad.campaign_id AS campaign_id,
      ad_fact_cost_per_conversion_bad.ad_group_id AS ad_group_id,
      ad_fact_cost_per_conversion_bad.creative_id AS creative_id,
      null AS criterion_id,
      "CPA" as metric,
      "Bad" as status
    FROM ${ad_fact_cost_per_conversion_bad.SQL_TABLE_NAME} as ad_fact_cost_per_conversion_bad
    UNION ALL
    SELECT
      ad_fact_click_rate_big_mover.external_customer_id AS external_customer_id,
      ad_fact_click_rate_big_mover.campaign_id AS campaign_id,
      ad_fact_click_rate_big_mover.ad_group_id AS ad_group_id,
      ad_fact_click_rate_big_mover.creative_id AS creative_id,
      null AS criterion_id,
      "CTR" as metric,
      "Big Mover" as status
    FROM ${ad_fact_click_rate_big_mover.SQL_TABLE_NAME} as ad_fact_click_rate_big_mover
    UNION ALL
    SELECT
      ad_fact_conversion_rate_big_mover.external_customer_id AS external_customer_id,
      ad_fact_conversion_rate_big_mover.campaign_id AS campaign_id,
      ad_fact_conversion_rate_big_mover.ad_group_id AS ad_group_id,
      ad_fact_conversion_rate_big_mover.creative_id AS creative_id,
      null AS criterion_id,
      "CR" as metric,
      "Big Mover" as status
    FROM ${ad_fact_conversion_rate_big_mover.SQL_TABLE_NAME} as ad_fact_conversion_rate_big_mover
    UNION ALL
    SELECT
      ad_fact_cost_per_conversion_big_mover.external_customer_id AS external_customer_id,
      ad_fact_cost_per_conversion_big_mover.campaign_id AS campaign_id,
      ad_fact_cost_per_conversion_big_mover.ad_group_id AS ad_group_id,
      ad_fact_cost_per_conversion_big_mover.creative_id AS creative_id,
      null AS criterion_id,
      "CPA" as metric,
      "Big Mover" as status
    FROM ${ad_fact_cost_per_conversion_big_mover.SQL_TABLE_NAME} as ad_fact_cost_per_conversion_big_mover
    UNION ALL
    SELECT
      ad_group_fact_click_rate_good.external_customer_id AS external_customer_id,
      ad_group_fact_click_rate_good.campaign_id AS campaign_id,
      ad_group_fact_click_rate_good.ad_group_id AS ad_group_id,
      null AS creative_id,
      null AS criterion_id,
      "CTR" as metric,
      "Good" as status
    FROM ${ad_group_fact_click_rate_good.SQL_TABLE_NAME} as ad_group_fact_click_rate_good
    UNION ALL
    SELECT
      ad_group_fact_conversion_rate_good.external_customer_id AS external_customer_id,
      ad_group_fact_conversion_rate_good.campaign_id AS campaign_id,
      ad_group_fact_conversion_rate_good.ad_group_id AS ad_group_id,
      null AS creative_id,
      null AS criterion_id,
      "CR" as metric,
      "Good" as status
    FROM ${ad_group_fact_conversion_rate_good.SQL_TABLE_NAME} as ad_group_fact_conversion_rate_good
    UNION ALL
    SELECT
      ad_group_fact_cost_per_conversion_good.external_customer_id AS external_customer_id,
      ad_group_fact_cost_per_conversion_good.campaign_id AS campaign_id,
      ad_group_fact_cost_per_conversion_good.ad_group_id AS ad_group_id,
      null AS creative_id,
      null AS criterion_id,
      "CPA" as metric,
      "Good" as status
    FROM ${ad_group_fact_cost_per_conversion_good.SQL_TABLE_NAME} as ad_group_fact_cost_per_conversion_good
    UNION ALL
    SELECT
      ad_group_fact_click_rate_bad.external_customer_id AS external_customer_id,
      ad_group_fact_click_rate_bad.campaign_id AS campaign_id,
      ad_group_fact_click_rate_bad.ad_group_id AS ad_group_id,
      null AS creative_id,
      null AS criterion_id,
      "CTR" as metric,
      "Bad" as status
    FROM ${ad_group_fact_click_rate_bad.SQL_TABLE_NAME} as ad_group_fact_click_rate_bad
    UNION ALL
    SELECT
      ad_group_fact_conversion_rate_bad.external_customer_id AS external_customer_id,
      ad_group_fact_conversion_rate_bad.campaign_id AS campaign_id,
      ad_group_fact_conversion_rate_bad.ad_group_id AS ad_group_id,
      null AS creative_id,
      null AS criterion_id,
      "CR" as metric,
      "Bad" as status
    FROM ${ad_group_fact_conversion_rate_bad.SQL_TABLE_NAME} as ad_group_fact_conversion_rate_bad
    UNION ALL
    SELECT
      ad_group_fact_cost_per_conversion_bad.external_customer_id AS external_customer_id,
      ad_group_fact_cost_per_conversion_bad.campaign_id AS campaign_id,
      ad_group_fact_cost_per_conversion_bad.ad_group_id AS ad_group_id,
      null AS creative_id,
      null AS criterion_id,
      "CPA" as metric,
      "Bad" as status
    FROM ${ad_group_fact_cost_per_conversion_bad.SQL_TABLE_NAME} as ad_group_fact_cost_per_conversion_bad
    UNION ALL
    SELECT
      ad_group_fact_click_rate_big_mover.external_customer_id AS external_customer_id,
      ad_group_fact_click_rate_big_mover.campaign_id AS campaign_id,
      ad_group_fact_click_rate_big_mover.ad_group_id AS ad_group_id,
      null AS creative_id,
      null AS criterion_id,
      "CTR" as metric,
      "Big Mover" as status
    FROM ${ad_group_fact_click_rate_big_mover.SQL_TABLE_NAME} as ad_group_fact_click_rate_big_mover
    UNION ALL
    SELECT
      ad_group_fact_conversion_rate_big_mover.external_customer_id AS external_customer_id,
      ad_group_fact_conversion_rate_big_mover.campaign_id AS campaign_id,
      ad_group_fact_conversion_rate_big_mover.ad_group_id AS ad_group_id,
      null AS creative_id,
      null AS criterion_id,
      "CR" as metric,
      "Big Mover" as status
    FROM ${ad_group_fact_conversion_rate_big_mover.SQL_TABLE_NAME} as ad_group_fact_conversion_rate_big_mover
    UNION ALL
    SELECT
      ad_group_fact_cost_per_conversion_big_mover.external_customer_id AS external_customer_id,
      ad_group_fact_cost_per_conversion_big_mover.campaign_id AS campaign_id,
      ad_group_fact_cost_per_conversion_big_mover.ad_group_id AS ad_group_id,
      null AS creative_id,
      null AS criterion_id,
      "CPA" as metric,
      "Big Mover" as status
    FROM ${ad_group_fact_cost_per_conversion_big_mover.SQL_TABLE_NAME} as ad_group_fact_cost_per_conversion_big_mover
    UNION ALL
    SELECT
      keyword_fact_click_rate_good.external_customer_id AS external_customer_id,
      keyword_fact_click_rate_good.campaign_id AS campaign_id,
      keyword_fact_click_rate_good.ad_group_id AS ad_group_id,
      null AS creative_id,
      keyword_fact_click_rate_good.criterion_id AS criterion_id,
      "CTR" as metric,
      "Good" as status
    FROM ${keyword_fact_click_rate_good.SQL_TABLE_NAME} as keyword_fact_click_rate_good
    UNION ALL
    SELECT
      keyword_fact_conversion_rate_good.external_customer_id AS external_customer_id,
      keyword_fact_conversion_rate_good.campaign_id AS campaign_id,
      keyword_fact_conversion_rate_good.ad_group_id AS ad_group_id,
      null AS creative_id,
      keyword_fact_conversion_rate_good.criterion_id AS criterion_id,
      "CR" as metric,
      "Good" as status
    FROM ${keyword_fact_conversion_rate_good.SQL_TABLE_NAME} as keyword_fact_conversion_rate_good
    UNION ALL
    SELECT
      keyword_fact_cost_per_conversion_good.external_customer_id AS external_customer_id,
      keyword_fact_cost_per_conversion_good.campaign_id AS campaign_id,
      keyword_fact_cost_per_conversion_good.ad_group_id AS ad_group_id,
      null AS creative_id,
      keyword_fact_cost_per_conversion_good.criterion_id AS criterion_id,
      "CPA" as metric,
      "Good" as status
    FROM ${keyword_fact_cost_per_conversion_good.SQL_TABLE_NAME} as keyword_fact_cost_per_conversion_good
    UNION ALL
    SELECT
      keyword_fact_click_rate_bad.external_customer_id AS external_customer_id,
      keyword_fact_click_rate_bad.campaign_id AS campaign_id,
      keyword_fact_click_rate_bad.ad_group_id AS ad_group_id,
      null AS creative_id,
      keyword_fact_click_rate_bad.criterion_id AS criterion_id,
      "CTR" as metric,
      "Bad" as status
    FROM ${keyword_fact_click_rate_bad.SQL_TABLE_NAME} as keyword_fact_click_rate_bad
    UNION ALL
    SELECT
      keyword_fact_conversion_rate_bad.external_customer_id AS external_customer_id,
      keyword_fact_conversion_rate_bad.campaign_id AS campaign_id,
      keyword_fact_conversion_rate_bad.ad_group_id AS ad_group_id,
      null AS creative_id,
      keyword_fact_conversion_rate_bad.criterion_id AS criterion_id,
      "CR" as metric,
      "Bad" as status
    FROM ${keyword_fact_conversion_rate_bad.SQL_TABLE_NAME} as keyword_fact_conversion_rate_bad
    UNION ALL
    SELECT
      keyword_fact_cost_per_conversion_bad.external_customer_id AS external_customer_id,
      keyword_fact_cost_per_conversion_bad.campaign_id AS campaign_id,
      keyword_fact_cost_per_conversion_bad.ad_group_id AS ad_group_id,
      null AS creative_id,
      keyword_fact_cost_per_conversion_bad.criterion_id AS criterion_id,
      "CPA" as metric,
      "Bad" as status
    FROM ${keyword_fact_cost_per_conversion_bad.SQL_TABLE_NAME} as keyword_fact_cost_per_conversion_bad
    UNION ALL
    SELECT
      keyword_fact_click_rate_big_mover.external_customer_id AS external_customer_id,
      keyword_fact_click_rate_big_mover.campaign_id AS campaign_id,
      keyword_fact_click_rate_big_mover.ad_group_id AS ad_group_id,
      null AS creative_id,
      keyword_fact_click_rate_big_mover.criterion_id AS criterion_id,
      "CTR" as metric,
      "Big Mover" as status
    FROM ${keyword_fact_click_rate_big_mover.SQL_TABLE_NAME} as keyword_fact_click_rate_big_mover
    UNION ALL
    SELECT
      keyword_fact_conversion_rate_big_mover.external_customer_id AS external_customer_id,
      keyword_fact_conversion_rate_big_mover.campaign_id AS campaign_id,
      keyword_fact_conversion_rate_big_mover.ad_group_id AS ad_group_id,
      null AS creative_id,
      keyword_fact_conversion_rate_big_mover.criterion_id AS criterion_id,
      "CR" as metric,
      "Big Mover" as status
    FROM ${keyword_fact_conversion_rate_big_mover.SQL_TABLE_NAME} as keyword_fact_conversion_rate_big_mover
    UNION ALL
    SELECT
      keyword_fact_cost_per_conversion_big_mover.external_customer_id AS external_customer_id,
      keyword_fact_cost_per_conversion_big_mover.campaign_id AS campaign_id,
      keyword_fact_cost_per_conversion_big_mover.ad_group_id AS ad_group_id,
      null AS creative_id,
      keyword_fact_cost_per_conversion_big_mover.criterion_id AS criterion_id,
      "CPA" as metric,
      "Big Mover" as status
    FROM ${keyword_fact_cost_per_conversion_big_mover.SQL_TABLE_NAME} as keyword_fact_cost_per_conversion_big_mover
    ;;
  }

  dimension: external_customer_id {
  #     hidden: yes
  }

  dimension: campaign_id {
  #     hidden: yes
  }

  dimension: ad_group_id {
  #     hidden: yes
  }

  dimension: creative_id {
  #     hidden: yes
  }

  dimension: criterion_id {
  #     hidden: yes
  }

  dimension: content_type {
    type: string
    case: {
      when: {
        sql: ${creative_id} IS NOT NULL ;;
        label: "Ad"
      }
      when: {
        sql: ${criterion_id} IS NOT NULL ;;
        label: "Keyword"
      }
      when: {
        sql: ${ad_group_id} IS NOT NULL ;;
        label: "Ad Group"
      }
      when: {
        sql: ${campaign_id} IS NOT NULL ;;
        label: "Campaign"
      }
      else: "Other"
    }
  }

  dimension: metric {}

  dimension: status {}


  measure: count {
    type: count_distinct
    sql: CONCAT(
        CAST(${external_customer_id} AS STRING), "-",
        CAST(${campaign_id} AS STRING), "-",
        CAST(${ad_group_id} AS STRING), "-",
        CAST(${creative_id} AS STRING), "-",
        CAST(${criterion_id} AS STRING)) ;;
  }
}
