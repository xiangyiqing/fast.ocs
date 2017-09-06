package com.tju.fast.ocs.service;

import com.tju.fast.ocs.po.Scheduleslot;
import com.tju.fast.ocs.util.Page;

import java.util.List;

public interface IScheduleslotService extends IBaseService<Scheduleslot> {

    public List<Scheduleslot> getAvailableSlotList();

    public Page<Scheduleslot> querySlotList(int page, int pagesize) throws Exception;
}
