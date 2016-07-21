package com.journaldev.spring.common;

import java.util.Date;
import java.util.List;

/**
 * Created by Tianshan on 2016/7/19.
 */
public class ExperimentalAnimal_Table {
    private int total;
    private List<ExperimentalAnimal_Row> rows;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<ExperimentalAnimal_Row> getRows() {
        return rows;
    }

    public void setRows(List<ExperimentalAnimal_Row> rows) {
        this.rows = rows;
    }
}
