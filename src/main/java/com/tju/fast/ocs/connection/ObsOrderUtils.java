package com.tju.fast.ocs.connection;

import com.tju.fast.ocs.po.ObsOrder;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.List;

@Component("NewObs")
public class ObsOrderUtils {
    private String fileDirectory, coding;
    private static String FILE_PATH, ENCODEING;

    public void setFileDirectory(String fileDirectory) {
        this.fileDirectory = fileDirectory;
    }

    public void setCoding(String coding) {
        this.coding = coding;
    }

    //Initialize the path and coding
    @PostConstruct
    public void init() {
        FILE_PATH = this.fileDirectory;
        ENCODEING = this.coding;
    }

    public String newObsFile(List<ObsOrder> obs, String fileName) {                //返回文件所在位置，如：D:/ObsOrderFile/2016-07-01.txt
        //System.out.println(obs.size()); 										//保存失败或obs list为空，则返回null
        if (obs.size() > 0) {
            try {
                File file = new File(FILE_PATH + fileName);
                FileOutputStream fos = new FileOutputStream(file);
                OutputStreamWriter out = new OutputStreamWriter(fos, ENCODEING);
                for (int i = 0; i < obs.size(); i++) {
                    out.write(getObsLine(i, obs));
                }
                out.flush();
                out.close();
                fos.close();
                return FILE_PATH + fileName;
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return null;
    }

    public String getObsLine(int n, List<ObsOrder> obs) {
        String line = "";
        line += obs.get(n).getObsName();
        for (int i = obs.get(n).getObsName().length(); i < 30; i++) {
            line += " ";
        }
        line += " " + obs.get(n).getRa();
        line += " " + obs.get(n).getDec();
        line += " " + obs.get(n).getEpoch();
        line += " " + obs.get(n).getpId();
        line += " " + obs.get(n).getRecv();
        line += " " + obs.get(n).getBknd();
        line += " " + obs.get(n).getObsMode();
        line += " " + obs.get(n).getObsTime();
        line += " " + obs.get(n).getDlyTag();
        line += " " + obs.get(n).getStartTime();
        line += " " + obs.get(n).getScanDir();
        line += " " + obs.get(n).getScanSpeed();
        line += " " + obs.get(n).getScanSpace();
        line += " " + obs.get(n).getStartRa();
        line += " " + obs.get(n).getStartDec();
        line += " " + obs.get(n).getEndRa();
        line += " " + obs.get(n).getEndDec();
        line += " " + obs.get(n).getObsId();
        line += " " + obs.get(n).getRemark();
        line += System.getProperty("line.separator");
        return line;
    }
}
