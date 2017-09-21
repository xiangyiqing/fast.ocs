package com.tju.fast.ocs.service.impl;

import com.baomidou.mybatisplus.mapper.Condition;
import com.tju.fast.ocs.mapper.ObservationMapper;
import com.tju.fast.ocs.po.Observation;
import com.tju.fast.ocs.service.IObservationService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ObservationService extends BaseServiceImpl<ObservationMapper, Observation> implements IObservationService {

    @Override
    public List<Observation> selectListByMSBId(String msbid) {
        return baseMapper.selectList(Condition.create().eq("msbid", msbid));
    }
}
