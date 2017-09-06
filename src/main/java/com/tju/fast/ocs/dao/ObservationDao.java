package com.tju.fast.ocs.dao;

import com.tju.fast.ocs.po.Observation;
import org.springframework.stereotype.Repository;

@Repository
public class ObservationDao extends DAOTemplate<Observation> {

    public ObservationDao() {
        super(Observation.class);
    }

}
