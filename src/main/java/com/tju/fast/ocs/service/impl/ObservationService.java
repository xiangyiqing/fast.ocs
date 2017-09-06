package com.tju.fast.ocs.service.impl;

import com.tju.fast.ocs.dao.ObservationDao;
import com.tju.fast.ocs.po.Observation;
import com.tju.fast.ocs.service.IObservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ObservationService extends BaseService<Observation> implements IObservationService {

    ObservationDao obsDao;

    @Autowired
    public ObservationService(ObservationDao arg) {
        super(arg);
        this.obsDao = arg;
    }


}
