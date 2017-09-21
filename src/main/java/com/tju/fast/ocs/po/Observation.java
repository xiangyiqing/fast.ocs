package com.tju.fast.ocs.po;

import com.baomidou.mybatisplus.annotations.TableId;

import java.sql.Timestamp;

public class Observation {

    @TableId
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

    private String startRa;
    private String startDec;
    private String endRa;
    private String endDec;
    private String epoch;
    private String duration;
    private String backidentity;
    private String scanVelocity;
    private String scanAngle;
    private String terminalMode;
    private String scanDirection;
    private Timestamp startTime;
    private Timestamp endTime;

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

    public String getStartRa() {
        return startRa;
    }

    public void setStartRa(String startRa) {
        this.startRa = startRa;
    }

    public String getStartDec() {
        return startDec;
    }

    public void setStartDec(String startDec) {
        this.startDec = startDec;
    }

    public String getEndRa() {
        return endRa;
    }

    public void setEndRa(String endRa) {
        this.endRa = endRa;
    }

    public String getEndDec() {
        return endDec;
    }

    public void setEndDec(String endDec) {
        this.endDec = endDec;
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

    public String getScanVelocity() {
        return scanVelocity;
    }

    public void setScanVelocity(String scanVelocity) {
        this.scanVelocity = scanVelocity;
    }

    public String getScanAngle() {
        return scanAngle;
    }

    public void setScanAngle(String scanAngle) {
        this.scanAngle = scanAngle;
    }

    public String getTerminalMode() {
        return terminalMode;
    }

    public void setTerminalMode(String terminalMode) {
        this.terminalMode = terminalMode;
    }

    public String getScanDirection() {
        return scanDirection;
    }

    public void setScanDirection(String scanDirection) {
        this.scanDirection = scanDirection;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }


}
