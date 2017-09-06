package com.tju.fast.ocs.service;

import com.tju.fast.ocs.util.Page;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface IBaseService<T> {

    public enum STATUS {
        DISABLE("0"), NORMAL("1");

        private STATUS(String arg) {
            this.str = arg;
        }

        public final String str;
    }

    ;

    /**
     * @function 新增记录
     */
    public void insert(T t);

    /**
     * @function 修改记录
     */
    public void update(T t);

    /**
     * @function 按主键删除
     */
    public boolean delete(Serializable id);

    /**
     * @function 查询记录
     */
    public List<T> getList();

    /**
     * @function 查询记录
     */
    public List<T> getList(final String orderClause, final String sql, final Object... params);

    /**
     * @function 查询记录数量
     */
    public int getCount(Map<String, String> map);

    /**
     * @function 按主键查询, 取一条记录
     */
    public T get(Serializable id);

    /**
     * @function 对刚插入的数据获得它的主键
     */
    public String insertGetPk(T t);

    /**
     * @function 查询记录
     */
    public Page<T> queryPage(final int pageNo, final int pageSize, final String orderClause,
                             final String sql, final Object... params);

}
