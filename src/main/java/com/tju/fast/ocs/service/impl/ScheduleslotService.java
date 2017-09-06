package com.tju.fast.ocs.service.impl;

import com.tju.fast.ocs.dao.ScheduleslotDao;
import com.tju.fast.ocs.po.Scheduleslot;
import com.tju.fast.ocs.service.IScheduleslotService;
import com.tju.fast.ocs.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScheduleslotService extends BaseService<Scheduleslot> implements IScheduleslotService {

    ScheduleslotDao sslotDao;

    @Autowired
    public ScheduleslotService(ScheduleslotDao arg) {
        super(arg);
        this.sslotDao = arg;
    }

    @Override
    public List<Scheduleslot> getAvailableSlotList() {
        return getList("ORDER BY begintime asc ", "where status = ?", "1");
    }

    @Override
    public Page<Scheduleslot> querySlotList(int page, int pagesize) throws Exception {
        return queryPage(page, pagesize, "ORDER BY begintime asc", null, (Object[]) null);
    }
}
