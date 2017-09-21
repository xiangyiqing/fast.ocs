package com.tju.fast.ocs.service.impl;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Condition;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.tju.fast.ocs.service.IBaseService;
import com.tju.fast.ocs.util.Page;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public abstract class BaseServiceImpl<M extends BaseMapper<E>, E> extends ServiceImpl<M, E> implements IBaseService<E> {

    @Override
    public Page<E> queryPage(int page, int pageSize) {
        return queryPage(page, pageSize, Condition.EMPTY);
    }

    @Override
    public Page<E> queryPage(int page, int pageSize, List<Page.Order> orders) {
        return queryPage(page, pageSize, null, orders);
    }

    @Override
    public Page<E> queryPage(int page, int pageSize, Wrapper<E> w) {
        return Page.build(baseMapper.selectCount(null),
                page,
                pageSize,
                baseMapper.selectPage(new RowBounds((page - 1) * pageSize, pageSize), w));
    }

    @Override
    public Page<E> queryPage(int page, int pageSize, Wrapper<E> conditions, List<Page.Order> orders) {
        if (conditions == null) {
            conditions = Condition.create();
        }
        if (orders != null) {
            for (Page.Order o : orders) {
                conditions = conditions.orderBy(o.getField(), Page.OrderEnum.asc.equals(o.getOrder()));
            }
        }
        return Page.build(baseMapper.selectCount(null),
                page,
                pageSize,
                baseMapper.selectPage(new RowBounds((page - 1) * pageSize, pageSize), conditions));
    }

}
