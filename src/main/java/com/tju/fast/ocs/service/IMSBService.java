package com.tju.fast.ocs.service;

import com.tju.fast.ocs.po.MSB;
import com.tju.fast.ocs.po.Scheduling;

import java.util.List;

public interface IMSBService extends IBaseService<MSB> {

    public String getMSBStatus(List<Scheduling> list);
}
