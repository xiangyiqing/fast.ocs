package com.tju.fast.ocs.schedule;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class ToALT_AZ {
    /**
     * maxAngle:	FAST不转动时，可观测的最大角度，单位为度（degs）
     * secAngle:	FAST转动时，可观测的最大角度，单位为度（degs）
     * LAT:		latitude，FAST的纬度，单位为度（degs）
     * LONG:	longitude，FAST的经度，单位为度（degs）
     * RA:		right ascension，天体的赤经，单位为度（degs）
     * DEC:		declination，天体的赤纬，单位为度（degs）
     * AZ:		azimuth，天体的方位角，单位为度（degs）
     * ALT:		altitude，天体的高度角，单位为度（degs）
     * UT:		世界时
     * J2000:	天文纪元标准
     */
    final Double maxAngle = 90.0 - 40.0;
    final Double secAngle = 90.0 - 25.6;
    final Double LAT = (25.0 + 39.0 / 60.0 + 3.79 / 3600.0);
    final Double LONG = (106.0 + 51.0 / 60.0 + 24.76 / 3600.0);
    private Double RA;
    private Double DEC;
    private Double AZ;
    private Double ALT;
    private Date UT;
    private Date J2000 = new Date();

    /**
     * @param RA:  输入的单位为小时（hrs），要转换为度（degs）
     * @param DEC：
     * @param UT
     */
    public ToALT_AZ(Double RA, Double DEC, Date UT) {
        this.RA = RA * 15.0;
        while (RA < 0) {
            RA += 360;
        }
        RA %= 360;
        this.DEC = DEC;
        Calendar c = Calendar.getInstance();
        c.setTime(UT);
        c.add(Calendar.HOUR, -8);
        this.UT = c.getTime();
    }

    public Double getAZ() {
        return AZ;
    }

    public Double getALT() {
        return ALT;
    }

    /**
     * 定义J2000。0纪元
     */
    public void setJ2000() {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            this.J2000 = sdf.parse("2000-01-01 12:00:00");
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 将天体的RA/DEC坐标转换为UT时刻关于FAST的AZ/ALT坐标
     */
    public void work() {
        setJ2000();
        long gap = UT.getTime() - J2000.getTime();
        double d = (double) gap / (1000.0 * 60.0 * 60.0 * 24);
        long hrs = UT.getHours();
        long min = UT.getMinutes();
        double ut = (double) hrs + (double) min / 60.0;
        double LST = (100.46 + 0.985647 * d + LONG + 15.0 * ut);
        while (LST < 0) {
            LST += 360;
        }
        LST %= 360;
        double HA = LST - RA;
        while (HA < 0) {
            HA += 360;
        }
        HA %= 360;
        double sinALT = Math.sin(Math.PI * DEC / 180) * Math.sin(Math.PI * LAT / 180) + Math.cos(Math.PI * DEC / 180) * Math.cos(Math.PI * LAT / 180) * Math.cos(Math.PI * HA / 180);
        this.ALT = Math.asin(sinALT) * 180.0 / Math.PI;
        double cosA = (Math.sin(Math.PI * DEC / 180) - Math.sin(Math.PI * ALT / 180) * Math.sin(Math.PI * LAT / 180)) / (Math.cos(Math.PI * ALT / 180) * Math.cos(Math.PI * LAT / 180));
        double A = Math.acos(cosA) * 180.0 / Math.PI;
        if (Math.sin(Math.PI * HA / 180) < 0) {
            this.AZ = A;
        } else {
            this.AZ = 360 - A;
        }
    }

    /**
     * 返回2：在UT时刻，不转动FAST，就能观测到该天体
     * 返回1：在UT时刻，转动FAST，才能观测到该天体
     * 返回0：在UT时刻，FAST观测不到该天体
     *
     * @return
     */
    public int isInside() {
        work();
        if (getALT() >= secAngle && getALT() <= 90.0) {
            return 2;
        } else if (getALT() >= maxAngle && getALT() < secAngle) {
            return 1;
        } else {
            return 0;
        }
    }

}
