package com.tju.fast.ocs.service.impl;

import com.tju.fast.ocs.mapper.MSBMapper;
import com.tju.fast.ocs.po.MSB;
import com.tju.fast.ocs.po.Scheduling;
import com.tju.fast.ocs.service.IMSBService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MSBService extends BaseServiceImpl<MSBMapper, MSB> implements IMSBService {

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
