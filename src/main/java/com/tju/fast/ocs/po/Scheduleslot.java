package com.tju.fast.ocs.po;

import java.sql.Timestamp;

public class Scheduleslot {

    private String id;
    private Timestamp begintime;
    private Timestamp endtime;
    private String status;
    private String note;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Timestamp getBegintime() {
        return begintime;
    }

    public void setBegintime(Timestamp begintime) {
        this.begintime = begintime;
    }

    public Timestamp getEndtime() {
        return endtime;
    }

    public void setEndtime(Timestamp endtime) {
        this.endtime = endtime;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


}
