package com.tju.fast.ocs.service.impl;

import com.tju.fast.ocs.dao.DAOTemplate;
import com.tju.fast.ocs.service.IBaseService;
import com.tju.fast.ocs.util.Page;
import org.sormula.SormulaException;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public class BaseService<T> implements IBaseService<T> {


    DAOTemplate<T> baseDao;

    public BaseService(DAOTemplate<T> arg) {
        this.baseDao = arg;
    }

    @Override
    public void insert(T t) {
        try {
            baseDao.insert(t);
        } catch (SormulaException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(T t) {
        try {
            baseDao.update(t);
        } catch (SormulaException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean delete(Serializable id) {
        try {
            baseDao.delete(id);
            return true;
        } catch (SormulaException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<T> getList() {
        try {
            return baseDao.selectAll();
        } catch (SormulaException e) {
            e.printStackTrace();
        }
        return null;
    }


    @Override
    public int getCount(Map<String, String> map) {
        return 0;
    }

    @Override
    public T get(Serializable id) {
        try {
            return baseDao.select(id);
        } catch (SormulaException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public String insertGetPk(T t) {
        return null;
    }

    @Override
    public List<T> getList(String orderClause, String sql, Object... params) {
        try {
            return baseDao.query(orderClause, sql, params);
        } catch (SormulaException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Page<T> queryPage(int pageNo, int pageSize, String orderClause, String sql, Object... params) {
        try {
            return baseDao.queryPage(pageNo, pageSize, orderClause, sql, params);
        } catch (SormulaException e) {
            e.printStackTrace();
        }
        return null;
    }


}
