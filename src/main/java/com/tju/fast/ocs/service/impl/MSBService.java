package com.tju.fast.ocs.service.impl;

import com.tju.fast.ocs.dao.MSBDao;
import com.tju.fast.ocs.po.MSB;
import com.tju.fast.ocs.po.Scheduling;
import com.tju.fast.ocs.service.IMSBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MSBService extends BaseService<MSB> implements IMSBService {

    MSBDao msbDao;

    @Autowired
    public MSBService(MSBDao arg) {
        super(arg);
        this.msbDao = arg;
    }

    @Override
    public String getMSBStatus(List<Scheduling> slist) {
        String status = "0";
        for (Scheduling s : slist) {
            if (s.getStatus().equals("1")) {
                status = "1";
            } else if (s.getStatus().equals("2") && status.equals("0")) {
                status = "2";
            }
        }
        return status;
    }


}
