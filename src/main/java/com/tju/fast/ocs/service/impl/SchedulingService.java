package com.tju.fast.ocs.service.impl;

import com.baomidou.mybatisplus.mapper.Condition;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.google.common.collect.Maps;
import com.tju.fast.ocs.mapper.SchedulingMapper;
import com.tju.fast.ocs.po.Scheduling;
import com.tju.fast.ocs.service.ISchedulingService;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service
public class SchedulingService extends BaseServiceImpl<SchedulingMapper, Scheduling> implements ISchedulingService {


    @Override
    public Scheduling get(Serializable msbid, Serializable slotid) throws Exception {
        Map<String, Object> map = Maps.newHashMap();
        map.put("msbid", msbid);
        map.put("slotid", slotid);
        List<Scheduling> res = baseMapper.selectByMap(map);
        return res.isEmpty() ? null : res.get(0);
    }

    @Override
    public List<Scheduling> selectListByMSBIds(List<? extends Serializable> msbid) throws Exception {
        Wrapper<Scheduling> w = Condition.create();
        w.orderBy("msbid_repeatcount");
        w.in("msbid", msbid);
        return baseMapper.selectList(w);
    }

}
