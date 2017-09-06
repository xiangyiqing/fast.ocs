package com.tju.fast.ocs.dao;

import com.tju.fast.ocs.po.Scheduling;
import org.springframework.stereotype.Repository;

@Repository
public class SchedulingDao extends DAOTemplate<Scheduling> {

    public SchedulingDao() {
        super(Scheduling.class);
    }

}
