package com.tju.fast.ocs.service;

import com.tju.fast.ocs.po.Observation;

import java.util.List;

public interface IObservationService extends IBaseService<Observation> {

    List<Observation> selectListByMSBId(String msbid);
}
