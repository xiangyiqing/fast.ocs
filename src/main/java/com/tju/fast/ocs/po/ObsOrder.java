package com.tju.fast.ocs.po;

import com.tju.fast.ocs.util.DateUtils;

public class ObsOrder {

    private final String TIMEFORMAT = "yyyyMMdd hhmmss z";

    //每个变量后边给出一个例子
    private String obsId;            //指令编号						例：1
    private String obsName;        //源名							例：M31
    private String ra;            //赤经							例：03 32 59.368    		注： 时	分	秒
    private String dec;            //赤纬							例：+54 34 43.57			注： 度	分	秒
    private String epoch;            //历年							例：2000					注：	2000.0=J2000（目前系统默认取这个值）, 1950.0=B1950, 2050.0=J2050?
    private String pId;            //项目编号						例：1001
    private String recv;            //接收机编号						例：101
    private String bknd;            //终端模式编号					例：201
    private String obsMode;        //观测模式						例：4
    private String obsTime;            //持续时间						例：10800				注：如无输入，取无穷长(99999)
    private String dlyTag;            //后移标识						例：	1					注：0=不可后移 1=可后移（如无输入，默认1）
    private String startTime;        //起始时刻						例：	20150607 131415 +08	注：如无输入，取系统最快开始时间
    private String scanDir;            //扫描方向(沿赤经、赤纬扫面)		例：0					注：0=赤经 1=赤纬
    private String scanSpeed;        //扫描运动速度					例：15.0	   				注： 单位为arcsec/s（角秒/秒）， 1 度=60角分=3600角秒
    private String scanSpace;        //扫描间隔角度					例：	3.0 				注：单位为arcmin（角分）
    private String startRa;            //起始赤经						例：03 32 59.368
    private String startDec;        //起始赤纬						例：+54 34 43.57
    private String endRa;            //结束赤经						例：03 32 59.368
    private String endDec;            //结束赤纬						例：+54 34 43.57
    private String PMRa;            //自行赤经						例：9999.999
    private String PMDec;            //自行赤纬						例：9999.999
    private String remark;            //备注							例：静态扫描

    public ObsOrder() {
    }

    public ObsOrder(String id, Observation obs, Scheduleslot slot, MSB m) {
        obsId = id;
        obsName = obs.getTitle();
        ra = obs.getRa2000();
        dec = obs.getDec2000();
        epoch = obs.getEpoch();
        pId = m.getPropid();
        recv = obs.getReceiver();
        bknd = obs.getBackend();
        obsMode = obs.getMode();
        obsTime = obs.getDuration();
        dlyTag = obs.getBackidentity();
        startTime = DateUtils.getDateString(TIMEFORMAT, slot.getBegintime());
        scanDir = obs.getScan_direction();
        scanSpeed = obs.getScan_velocity();
        scanSpace = obs.getScan_angle();
        startRa = obs.getStart_ra();
        startDec = obs.getStart_dec();
        endRa = obs.getEnd_ra();
        endDec = obs.getEnd_dec();
        remark = obs.getNote();
    }

    public String getPMRa() {
        return PMRa;
    }

    public void setPMRa(String pMRa) {
        PMRa = pMRa;
    }

    public String getPMDec() {
        return PMDec;
    }

    public void setPMDec(String pMDec) {
        PMDec = pMDec;
    }

    public String getObsId() {
        return obsId;
    }

    public void setObsId(String obsId) {
        this.obsId = obsId;
    }

    public String getObsName() {
        return obsName;
    }

    public void setObsName(String obsName) {
        this.obsName = obsName;
    }

    public String getRa() {
        return ra;
    }

    public void setRa(String ra) {
        this.ra = ra;
    }

    public String getDec() {
        return dec;
    }

    public void setDec(String dec) {
        this.dec = dec;
    }

    public String getEpoch() {
        return epoch;
    }

    public void setEpoch(String epoch) {
        this.epoch = epoch;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getObsMode() {
        return obsMode;
    }

    public void setObsMode(String obsMode) {
        this.obsMode = obsMode;
    }

    public String getRecv() {
        return recv;
    }

    public void setRecv(String recv) {
        this.recv = recv;
    }

    public String getBknd() {
        return bknd;
    }

    public void setBknd(String bknd) {
        this.bknd = bknd;
    }

    public String getObsTime() {
        return obsTime;
    }

    public void setObsTime(String obsTime) {
        this.obsTime = obsTime;
    }

    public String getDlyTag() {
        return dlyTag;
    }

    public void setDlyTag(String dlyTag) {
        this.dlyTag = dlyTag;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getScanDir() {
        return scanDir;
    }

    public void setScanDir(String scanDir) {
        this.scanDir = scanDir;
    }

    public String getScanSpeed() {
        return scanSpeed;
    }

    public void setScanSpeed(String scanSpeed) {
        this.scanSpeed = scanSpeed;
    }

    public String getScanSpace() {
        return scanSpace;
    }

    public void setScanSpace(String scanSpace) {
        this.scanSpace = scanSpace;
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
