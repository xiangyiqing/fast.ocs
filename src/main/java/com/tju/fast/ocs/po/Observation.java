package com.tju.fast.ocs.po;

import java.sql.Timestamp;

public class Observation {

    private String id;
    private String title;
    private String msbid;
    private String ra2000;
    private String dec2000;
    private String coordsystem;
    private String mode;
    private String receiver;
    private String backend;
    private Double interfreq;
    private Integer repeatcounts;
    private Double estimatedtime;

    private String start_ra;
    private String start_dec;
    private String end_ra;
    private String end_dec;
    private String epoch;
    private String duration;
    private String backidentity;
    private String scan_velocity;
    private String scan_angle;
    private String terminal_mode;
    private String scan_direction;
    private Timestamp start_time;
    private Timestamp end_time;

    private String note;

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

    public String getMsbid() {
        return msbid;
    }

    public void setMsbid(String msbid) {
        this.msbid = msbid;
    }

    public String getRa2000() {
        return ra2000;
    }

    public void setRa2000(String ra2000) {
        this.ra2000 = ra2000;
    }

    public String getDec2000() {
        return dec2000;
    }

    public void setDec2000(String dec2000) {
        this.dec2000 = dec2000;
    }

    public String getCoordsystem() {
        return coordsystem;
    }

    public void setCoordsystem(String coordsystem) {
        this.coordsystem = coordsystem;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getBackend() {
        return backend;
    }

    public void setBackend(String backend) {
        this.backend = backend;
    }

    public Double getInterfreq() {
        return interfreq;
    }

    public void setInterfreq(Double interfreq) {
        this.interfreq = interfreq;
    }

    public Integer getRepeatcounts() {
        return repeatcounts;
    }

    public void setRepeatcounts(Integer repeatcounts) {
        this.repeatcounts = repeatcounts;
    }

    public Double getEstimatedtime() {
        return estimatedtime;
    }

    public void setEstimatedtime(Double estimatedtime) {
        this.estimatedtime = estimatedtime;
    }

    public String getStart_ra() {
        return start_ra;
    }

    public void setStart_ra(String start_ra) {
        this.start_ra = start_ra;
    }

    public String getStart_dec() {
        return start_dec;
    }

    public void setStart_dec(String start_dec) {
        this.start_dec = start_dec;
    }

    public String getEnd_ra() {
        return end_ra;
    }

    public void setEnd_ra(String end_ra) {
        this.end_ra = end_ra;
    }

    public String getEnd_dec() {
        return end_dec;
    }

    public void setEnd_dec(String end_dec) {
        this.end_dec = end_dec;
    }

    public String getEpoch() {
        return epoch;
    }

    public void setEpoch(String epoch) {
        this.epoch = epoch;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getBackidentity() {
        return backidentity;
    }

    public void setBackidentity(String backidentity) {
        this.backidentity = backidentity;
    }

    public String getScan_velocity() {
        return scan_velocity;
    }

    public void setScan_velocity(String scan_velocity) {
        this.scan_velocity = scan_velocity;
    }

    public String getScan_angle() {
        return scan_angle;
    }

    public void setScan_angle(String scan_angle) {
        this.scan_angle = scan_angle;
    }

    public String getTerminal_mode() {
        return terminal_mode;
    }

    public void setTerminal_mode(String terminal_mode) {
        this.terminal_mode = terminal_mode;
    }

    public String getScan_direction() {
        return scan_direction;
    }

    public void setScan_direction(String scan_direction) {
        this.scan_direction = scan_direction;
    }

    public Timestamp getStart_time() {
        return start_time;
    }

    public void setStart_time(Timestamp start_time) {
        this.start_time = start_time;
    }

    public Timestamp getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Timestamp end_time) {
        this.end_time = end_time;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }


}
