package com.tju.fast.ocs.service;

import com.tju.fast.ocs.po.Scheduling;

import java.io.Serializable;
import java.util.List;

public interface ISchedulingService extends IBaseService<Scheduling> {

    Scheduling get(Serializable msbid, Serializable slotid) throws Exception;

    List<Scheduling> selectListByMSBIds(List<? extends Serializable> msbid) throws Exception;
}
