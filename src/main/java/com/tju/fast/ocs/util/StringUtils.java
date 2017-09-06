package com.tju.fast.ocs.util;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * String Utility
 */
public class StringUtils {

    private final static String DES = "DES";
    private final static String DATE_FOMART = "yyyy-MM-dd";
    private final static SimpleDateFormat format = new SimpleDateFormat(DATE_FOMART);

    /**
     * The <code>isEmpty(String str)</code> method is validate to String.
     *
     * @param str if your want to validate's string
     * @return boolean if return[false] this string is not empty,else so.
     */
    public static boolean isEmpty(String str) {
        if (null == str || str.trim().equals("")) {
            return true;
        }
        return false;
    }

    /**
     * Returns true if all characters in strings are numbers. Accepts non-signed
     * integers only. Does not accept floating point, exponential notation, etc.
     *
     * @param s input string.
     * @return if param is <code>Integer</code> will return true, else will
     * return false.
     */
    public static boolean isInteger(String s) {

        boolean flag = false;

        if (!isEmpty(s)) {

            // Search through string's characters one by one
            // until we find a non-numeric character.
            // When we do, return false; if we don't, return true.
            for (int i = 0; i < s.length(); i++) {
                // Check that current character is number.
                char c = s.charAt(i);

                if (Character.isDigit(c)) {
                    flag = true;
                }
            }
        }
        // All characters are numbers.
        return flag;
    }

    /**
     * Trim need string information.
     *
     * @param content need trim value.
     * @return the string value.
     */
    public static String trim(String content) {

        return content == null ? null : content.trim();
    }

    /**
     * Encode HTML tag.
     *
     * @param text text for need to encode
     * @return encode result
     */
    public static String encodeHtmlEntities(String text) {

        if (isEmpty(text)) {
            return "";
        }

        StringBuffer str = new StringBuffer(text.length());

        for (int j = 0; j < text.length(); ++j) {
            char c = text.charAt(j);
            if (c >= 128) {
                str.append(c);
            } else {
                switch (c) {
                    case '\'':
                        str.append("&#39;");
                        break;
                    case '"':
                        str.append("&quot;");
                        break;
                    case '&':
                        str.append("&amp;");
                        break;
                    case '<':
                        str.append("&lt;");
                        break;
                    case '>':
                        str.append("&gt;");
                        break;
                    default:
                        str.append(c);
                }
            }
        }
        return str.toString();
    }

    /**
     * Generate the File's SHA1 Code (Hash Code)
     *
     * @param fileUrl The file's url.
     * @return The Hash Code value of file.
     * @throws Exception when the instantiation fails for any reason.
     */
    public static String generateFileSHA1(String fileUrl) throws Exception {

        InputStream in = new BufferedInputStream(new FileInputStream(fileUrl));
        return generateFileSHA1(in);
    }

    /**
     * Generate the File's SHA1 Code (Hash Code)
     *
     * @param in input file stream.
     * @return The Hash Code value of file.
     * @throws Exception when the instantiation fails for any reason.
     */
    public static String generateFileSHA1(InputStream in) throws Exception {

        String result = "";

        if (null != in) {

            MessageDigest md = null;
            byte[] buffer = new byte[8192];

            int length = -1;

            try {
                md = MessageDigest.getInstance("SHA-1");
                while ((length = in.read(buffer)) != -1) {
                    md.update(buffer, 0, length);
                }

                result = bytesToHexString(md.digest());
            } catch (Exception e) {
                throw e;
            }
        }

        return result;
    }

    /**
     * MD5 Encoder.
     *
     * @param message String which need be MD5 Encode.
     * @return a MD5 Encode String.
     * @throws NoSuchAlgorithmException if want to use a algorithm which is not existed.
     * @author Gimli King
     */
    public static String md5Encode(String message)
            throws NoSuchAlgorithmException {

        MessageDigest md;
        String result = "";

        try {
            md = MessageDigest.getInstance("MD5");
            md.update(message.getBytes());
            result = bytesToHexString(md.digest());
        } catch (NoSuchAlgorithmException e) {
            throw e;
        }

        return result;
    }

    /**
     * SHA-1 Encoder.
     *
     * @param message String which need be SHA Encode.
     * @return a SHA-1 Encode String.
     * @throws NoSuchAlgorithmException if want to use a algorithm which is not existed.
     * @author Gimli King
     */
    public static String shaEncode(String message)
            throws NoSuchAlgorithmException {

        MessageDigest md;
        String result = "";

        try {
            md = MessageDigest.getInstance("sha-1");
            md.update(message.getBytes());
            result = bytesToHexString(md.digest());
        } catch (NoSuchAlgorithmException e) {
            throw e;
        }

        return result;
    }

    /**
     * SHA-256 Encoder.
     *
     * @param message String which need be SHA Encode.
     * @return a SHA-256 Encode String.
     * @throws NoSuchAlgorithmException if want to use a algorithm which is not existed.
     * @author Gimli King
     */
    public static String sha256Encode(String message)
            throws NoSuchAlgorithmException {

        MessageDigest md;
        String result = "";

        try {
            md = MessageDigest.getInstance("sha-256");
            md.update(message.getBytes());
            result = bytesToHexString(md.digest());
        } catch (NoSuchAlgorithmException e) {
            throw e;
        }

        return result;
    }

    /**
     * String encoder
     *
     * @param message   The String which is need to encode.
     * @param algorithm The secuirty encode algorithm name
     * @return one encoded string.
     * @throws NoSuchAlgorithmException if want to use a algorithm which is not existed.
     */
    public static String encoder(String message, String algorithm)
            throws NoSuchAlgorithmException {

        MessageDigest md;
        String result = "";

        try {
            md = MessageDigest.getInstance(algorithm);
            md.update(message.getBytes());
            result = bytesToHexString(md.digest());
        } catch (NoSuchAlgorithmException e) {
            throw e;
        }

        return result;
    }

    /**
     * DES Encrypt function
     *
     * @param src encrypt source.
     * @param key DES encrypt or decrypt key
     * @return DES encrypt string.
     * @throws Exception Thrown when the instantiation fails for any reason.
     */
    public static String desEncrypt(String src, String key) throws Exception {

        String result = "";

        if (!isEmpty(src) && !isEmpty(key)) {

            byte[] byteSrc = src.getBytes();
            byte[] byteKey = key.getBytes();

            try {
                result = bytesToHexString(encrypt(byteSrc, byteKey));
            } catch (Exception e) {
                throw e;
            }
        }

        return result;

    }

    /**
     * DES Decrypt function
     *
     * @param src encrypt source.
     * @param key DES encrypt or decrypt key
     * @return DES encrypt string.
     * @throws Exception Thrown when the instantiation fails for any reason.
     */
    public static String desDecrypt(String src, String key) throws Exception {

        String result = "";

        if (!isEmpty(src) && !isEmpty(key)) {

            byte[] byteSrc = hexStringToByte(src);
            byte[] byteKey = key.getBytes();

            try {
                result = new String(decrypt(byteSrc, byteKey));
            } catch (Exception e) {
                throw e;
            }
        }

        return result;

    }

    /**
     * Convert bytes to HexString
     *
     * @param bArray input bytes.
     * @return return a HexString.
     */
    public static String bytesToHexString(byte[] bArray) {

        String result = "";

        if (bArray != null) {

            StringBuilder sb = new StringBuilder(bArray.length);
            String sTemp;

            for (int i = 0; i < bArray.length; i++) {
                sTemp = Integer.toHexString(0xFF & bArray[i]);
                if (sTemp.length() < 2)
                    sb.append(0);
                sb.append(sTemp.toUpperCase());
            }

            result = sb.toString();
        }

        return result;
    }

    /**
     * Covert hex string to byte array.
     *
     * @param hex hex string.
     * @return a byte array.
     */
    public static byte[] hexStringToByte(String hex) {

        byte[] result = null;

        if (!isEmpty(hex)) {
            int len = hex.length() / 2;
            result = new byte[len];
            char[] achar = hex.toCharArray();
            for (int i = 0; i < len; i++) {
                int pos = i * 2;
                result[i] = (byte) (toByte(achar[pos]) << 4 | toByte(achar[pos + 1]));
            }
        }

        return result;
    }

    /**
     * <code>Byte[]</code> data to <code>String</code>.
     *
     * @param bArray bytes.
     * @return string result.
     */
    public static String bytesToString(byte[] bArray) {

        String result = "";

        if (bArray != null) {
            result = new String(bArray);
        }

        return result;
    }

    public static String formatDate(Date d) {
        if (d != null)
            return format.format(d);
        else return "";
    }

    public static Date parseDate(String s) throws ParseException {
        return format.parse(s);
    }

    public static Integer toInt(Object obj) {
        if (obj == null)
            obj = Integer.valueOf(0);
        return Double.valueOf(obj.toString()).intValue();
    }

    /**
     * 去除字符串中的空格、回车、换行符、制表符
     *
     * @param str
     * @return
     */
    public static String replaceBlank(String str) {
        String dest = "";
        if (str != null) {
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(str);
            dest = m.replaceAll("");
        }
        return dest;
    }

    /**
     * 将str1以str2为分割符号，分解成相应的数组
     *
     * @param str1 原始字符串
     * @param str2 输入字符串
     * @return 分割后的字符串数组
     */
    public static String[] split(String str1, String str2) {
        StringTokenizer st = new StringTokenizer(str1, str2);
        int count = st.countTokens();
        String array[] = new String[count];
        for (int i = 0; st.hasMoreTokens(); i++) {
            array[i] = st.nextToken();
        }

        return array;
    }

    public static void main(String[] args) {
        System.out.println(StringUtils.replaceBlank("just do it!"));
    }

    /*
     * DES Encrypt function
     */
    private static byte[] encrypt(byte[] src, byte[] key) throws Exception {

        SecureRandom sr = null;
        DESKeySpec dks = null;
        Cipher cipher = null;
        SecretKey securekey = null;
        SecretKeyFactory keyFactory = null;

        byte[] bytes = null;

        try {
            keyFactory = SecretKeyFactory.getInstance(DES);
            cipher = Cipher.getInstance(DES);

            sr = new SecureRandom();
            dks = new DESKeySpec(key);

            securekey = keyFactory.generateSecret(dks);
            cipher.init(Cipher.ENCRYPT_MODE, securekey, sr);

            bytes = cipher.doFinal(src);
        } catch (Exception e) {
            throw e;
        }

        return bytes;
    }

    /*
     * DES Decrypt function
     */
    private static byte[] decrypt(byte[] src, byte[] key) throws Exception {

        SecureRandom sr = null;
        DESKeySpec dks = null;
        SecretKeyFactory keyFactory = null;
        SecretKey securekey = null;
        Cipher cipher = null;

        byte[] bytes = null;

        try {
            sr = new SecureRandom();
            dks = new DESKeySpec(key);

            cipher = Cipher.getInstance(DES);
            keyFactory = SecretKeyFactory.getInstance(DES);

            securekey = keyFactory.generateSecret(dks);
            cipher.init(Cipher.DECRYPT_MODE, securekey, sr);

            bytes = cipher.doFinal(src);
        } catch (Exception e) {
            throw e;
        }
        return bytes;
    }

    /*
     * char to byte
     */
    private static byte toByte(char c) {

        byte b = (byte) "0123456789ABCDEF".indexOf(c);
        return b;
    }


}
