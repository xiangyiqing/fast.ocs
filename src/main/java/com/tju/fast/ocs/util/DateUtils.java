package com.tju.fast.ocs.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    public static String getShortDateWithoutDay(Date arg) {
        return new SimpleDateFormat("yyyy-MM").format(arg);
    }

    public static String getSimpleDate(Date arg) {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(arg);
    }

    public static String getSimpleDate(Timestamp arg) {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(arg.getTime()));
    }

    public static String getDateString(String format, Timestamp arg) {
        return new SimpleDateFormat(format).format(new Date(arg.getTime()));
    }

    public static String getDateString(String format, Date arg) {
        return new SimpleDateFormat(format).format(arg);
    }

}
