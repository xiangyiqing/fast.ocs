package com.tju.fast.ocs.po;

public class Scheduling {

    private Integer id;
    private String msbid;
    private String ssltid;
    private String status;
    private Integer observedcounts;
    private Double observedtime;
    private String msbid_repeatcount;
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

    public String getMsbid_repeatcount() {
        return msbid_repeatcount;
    }

    public void setMsbid_repeatcount(String msbid_repeatcount) {
        this.msbid_repeatcount = msbid_repeatcount;
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
                + ", observedcounts=" + observedcounts + ", observedtime=" + observedtime + ", msbid_repeatcount="
                + msbid_repeatcount + "]";
    }


}
