package com.tju.fast.ocs.connection;

import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

@Component
public class SendUtils {
    private String sendURL, coding;
    private static String SEND_PATH, ENCODEING;
    private static int BUF_SIZE = 1024;

    public void setSendURL(String sendURL) {
        this.sendURL = sendURL;
    }

    public void setCoding(String coding) {
        this.coding = coding;
    }

    //Initialize the path and coding
    @PostConstruct
    public void init() {
        SEND_PATH = this.sendURL;
        ENCODEING = this.coding;
    }

    public int SendFile(String filePath, String fileName) {            //filePath为包含文件名的路径，如 D:/ObsOrderFile/2016-07-01.txt，fileName是http报文里显示的文件名
        try {
            URL url = new URL(SEND_PATH);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setDoInput(true);
            connection.setDoOutput(true);
            connection.setUseCaches(false);                                // post方式不能使用缓存
            connection.setConnectTimeout(10000);                            //连接超时为10秒
            connection.setRequestMethod("POST");

            connection.setRequestProperty("contentType", ENCODEING);
            connection.setRequestProperty("Accept-Charset", ENCODEING);
            connection.setRequestProperty("Charset", ENCODEING);
            connection.setRequestProperty("content-type", "text/html;charset=" + ENCODEING);
            connection.setRequestProperty("Connection", "Keep-Alive");
            connection.addRequestProperty("fileName", fileName);
            connection.connect();

            OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream(), ENCODEING);

            File file = new File(filePath);
            FileInputStream fileInputStream = new FileInputStream(file);
            InputStreamReader in = new InputStreamReader(fileInputStream, ENCODEING);
            char[] bufferOut = new char[BUF_SIZE];
            int numReadByte = 0;
            while ((numReadByte = in.read(bufferOut, 0, BUF_SIZE)) > 0) {
                out.write(bufferOut, 0, numReadByte);
            }
            out.flush();
            fileInputStream.close();
            in.close();
            out.close();
            int Back = connection.getResponseCode();            // 读取服务器响应，必须读取,否则提交不成功
            System.out.println("SendFile status code: " + Back);
            connection.disconnect();
            return Back;
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return 0;
    }

    public int SendFileFull(String filePath, String fileName) {        //filePath为包含文件名的路径，如 D:/ObsOrderFile/2016-07-01.txt，fileName是http报文里显示的文件名
        final String BOUNDARY = "***" + System.currentTimeMillis();
        final String enter = "\r\n";
        final String hyphens = "--";
        try {
            File file = new File(filePath);
            URL urlObj = new URL(SEND_PATH);
            HttpURLConnection connection = (HttpURLConnection) urlObj.openConnection();

            connection.setRequestMethod("POST");                            // 以Post方式提交表单，默认get方式
            connection.setDoInput(true);
            connection.setDoOutput(true);
            connection.setUseCaches(false);                                // post方式不能使用缓存
            connection.setConnectTimeout(10000);                            //连接超时为10秒
            connection.setRequestProperty("contentType", ENCODEING);
            connection.setRequestProperty("Accept-Charset", ENCODEING);
            connection.setRequestProperty("Charset", ENCODEING);
            connection.setRequestProperty("Connection", "Keep-Alive");
            connection.setRequestProperty("Content-Type", "multipart/form-data; charset=" + ENCODEING + "; boundary=" + BOUNDARY);        // 设置边界
            connection.connect();

            StringBuilder item = new StringBuilder();
            item.append(hyphens);
            item.append(BOUNDARY);
            item.append(enter);
            item.append("Content-Disposition: form-data;name=\"file\"; filename=\"" + file.getName() + enter);
            item.append("Content-Type:text/plain" + enter + enter);

            OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream(), ENCODEING);
            out.write(item.toString());

            FileInputStream fileInputStream = new FileInputStream(file);                    // 文件正文部分
            InputStreamReader in = new InputStreamReader(fileInputStream, ENCODEING);
            int bytes = 0;
            char[] bufferOut = new char[BUF_SIZE];
            while ((bytes = in.read(bufferOut, 0, BUF_SIZE)) > 0) {
                out.write(bufferOut, 0, bytes);
            }
            String foot = (enter + hyphens + BOUNDARY + hyphens + enter).getBytes(ENCODEING).toString();// 结尾部分，定义最后数据分隔线

            out.write(foot);
            out.flush();
            in.close();
            fileInputStream.close();
            out.close();

            int Back = connection.getResponseCode();            // 读取服务器响应，必须读取,否则提交不成功
            System.out.println("SendFileFull status code: " + Back);
            connection.disconnect();
            return Back;
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return 0;
    }

}
