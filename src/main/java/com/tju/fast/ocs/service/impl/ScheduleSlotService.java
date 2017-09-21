package com.tju.fast.ocs.service.impl;

import com.baomidou.mybatisplus.mapper.Condition;
import com.tju.fast.ocs.mapper.ScheduleSlotMapper;
import com.tju.fast.ocs.po.ScheduleSlot;
import com.tju.fast.ocs.service.IScheduleslotService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScheduleSlotService extends BaseServiceImpl<ScheduleSlotMapper, ScheduleSlot> implements IScheduleslotService {

    @Override
    public List<ScheduleSlot> getAvailableSlotList() {
        return baseMapper.selectList(Condition.create()
                .eq("status", "1")
                .orderBy("begintime"));
    }

}
