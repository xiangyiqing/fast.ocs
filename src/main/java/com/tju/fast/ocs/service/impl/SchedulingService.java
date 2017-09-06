package com.tju.fast.ocs.service.impl;

import com.tju.fast.ocs.dao.SchedulingDao;
import com.tju.fast.ocs.po.Scheduling;
import com.tju.fast.ocs.service.ISchedulingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

@Service
public class SchedulingService extends BaseService<Scheduling> implements ISchedulingService {

    SchedulingDao schngDao;

    @Autowired
    public SchedulingService(SchedulingDao arg) {
        super(arg);
        this.schngDao = arg;
    }

    @Override
    public Scheduling get(Serializable msbid, Serializable slotid) throws Exception {
        return schngDao.selectOne("where msbid = ? and ssltid = ?", msbid, slotid);
    }

    @Override
    public List<Scheduling> getList(Serializable msbid) throws Exception {
        return getList("ORDER BY msbid_repeatcount asc", "where msbid = ?", msbid);
    }


}
