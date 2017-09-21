package com.tju.fast.ocs.po;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.sql.Timestamp;

@TableName("msb")
public class MSB {

    @TableId
    private String id;
    private String title;
    private String propid;
    private Integer repeatcounts;
    private Integer windspeed;
    private Integer humidity;
    private String dayOrNight;
    private Integer airtemp;
    private Integer opacity;
    private Double estimatedtime;
    private String note;
    private Timestamp begintime;
    private Timestamp endtime;
    private Double priority;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPropid() {
        return propid;
    }

    public void setPropid(String propid) {
        this.propid = propid;
    }

    public Integer getRepeatcounts() {
        return repeatcounts;
    }

    public void setRepeatcounts(Integer repeatcounts) {
        this.repeatcounts = repeatcounts;
    }

    public Integer getWindspeed() {
        return windspeed;
    }

    public void setWindspeed(Integer windspeed) {
        this.windspeed = windspeed;
    }

    public Integer getHumidity() {
        return humidity;
    }

    public void setHumidity(Integer humidity) {
        this.humidity = humidity;
    }

    public String getDayOrNight() {
        return dayOrNight;
    }

    public void setDayOrNight(String dayOrNight) {
        this.dayOrNight = dayOrNight;
    }

    public Integer getAirtemp() {
        return airtemp;
    }

    public void setAirtemp(Integer airtemp) {
        this.airtemp = airtemp;
    }

    public Integer getOpacity() {
        return opacity;
    }

    public void setOpacity(Integer opacity) {
        this.opacity = opacity;
    }

    public Double getEstimatedtime() {
        return estimatedtime;
    }

    public void setEstimatedtime(Double estimatedtime) {
        this.estimatedtime = estimatedtime;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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


    public Double getPriority() {
        return priority;
    }

    public void setPriority(Double priority) {
        this.priority = priority;
    }

    @Override
    public String toString() {
        return "MSB [id=" + id + ", title=" + title + ", projid=" + propid + ", repeatcounts=" + repeatcounts
                + ", windspeed=" + windspeed + ", humidity=" + humidity + ", dayOrNight=" + dayOrNight
                + ", airtemp=" + airtemp + ", opacity=" + opacity + ", estimatedtime=" + estimatedtime + ", note="
                + note + "]";
    }


}
