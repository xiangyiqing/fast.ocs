package com.tju.fast.ocs.service;

import com.tju.fast.ocs.po.ScheduleSlot;

import java.util.List;

public interface IScheduleslotService extends IBaseService<ScheduleSlot> {

    List<ScheduleSlot> getAvailableSlotList();
}
