package com.tju.fast.ocs.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.tju.fast.ocs.util.Page;

import java.util.List;

public interface IBaseService<E> extends IService<E> {

    enum STATUS {
        DISABLE("0"), NORMAL("1");

        private STATUS(String arg) {
            this.str = arg;
        }

        public final String str;
    }

    Page<E> queryPage(int page, int pageSize);

    Page<E> queryPage(int page, int pageSize, List<Page.Order> orders);

    Page<E> queryPage(int page, int pageSize, Wrapper<E> w);

    Page<E> queryPage(int page, int pageSize, Wrapper<E> conditions, List<Page.Order> orders);

}
