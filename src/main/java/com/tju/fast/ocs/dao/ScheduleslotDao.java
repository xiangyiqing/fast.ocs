package com.tju.fast.ocs.dao;

import com.tju.fast.ocs.po.Scheduleslot;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleslotDao extends DAOTemplate<Scheduleslot> {

    public ScheduleslotDao() {
        super(Scheduleslot.class);
    }

}
