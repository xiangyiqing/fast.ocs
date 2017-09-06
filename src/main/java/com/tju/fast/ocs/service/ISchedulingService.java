package com.tju.fast.ocs.service;

import com.tju.fast.ocs.po.Scheduling;

import java.io.Serializable;
import java.util.List;

public interface ISchedulingService extends IBaseService<Scheduling> {

    public Scheduling get(Serializable msbid, Serializable slotid) throws Exception;

    public List<Scheduling> getList(Serializable msbid) throws Exception;


}
