package com.tju.fast.ocs.po;

import com.baomidou.mybatisplus.annotations.TableId;

public class Scheduling {

    @TableId
    private Integer id;
    private String msbid;
    private String ssltid;
    private String status;
    private Integer observedcounts;
    private Double observedtime;
    private String msbidRepeatcount;
    private String locked;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMsbid() {
        return msbid;
    }

    public void setMsbid(String msbid) {
        this.msbid = msbid;
    }

    public String getSsltid() {
        return ssltid;
    }

    public void setSsltid(String ssltid) {
        this.ssltid = ssltid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getObservedcounts() {
        return observedcounts;
    }

    public void setObservedcounts(Integer observedcounts) {
        this.observedcounts = observedcounts;
    }

    public Double getObservedtime() {
        return observedtime;
    }

    public void setObservedtime(Double observedtime) {
        this.observedtime = observedtime;
    }

    public String getMsbidRepeatcount() {
        return msbidRepeatcount;
    }

    public void setMsbidRepeatcount(String msbidRepeatcount) {
        this.msbidRepeatcount = msbidRepeatcount;
    }

    public String getLocked() {
        return locked;
    }

    public void setLocked(String locked) {
        this.locked = locked;
    }

    @Override
    public String toString() {
        return "Scheduling [id=" + id + ", msbid=" + msbid + ", ssltid=" + ssltid + ", status=" + status
                + ", observedcounts=" + observedcounts + ", observedtime=" + observedtime + ", msbidRepeatcount="
                + msbidRepeatcount + "]";
    }


}
