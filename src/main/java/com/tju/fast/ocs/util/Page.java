package com.tju.fast.ocs.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 分页对象,包含当前页数据及分页信息如总记录数
 *
 * @param <T> 实体类的类型
 * @author liyue
 */
public class Page<T> {

    // 每页的记录数
    private int pageSize = 0;
    // 每页数据
    private List<T> result = Collections.<T>emptyList();
    // 总记录数
    private long totalCount = 0;
    // 当前页号
    private int pageNo = 0;
    // 总页数
    private int totalPageCount = 0;
    // 顺序
    private List<Order> orders;

    /**
     * 构造空页
     */
    public Page() {
    }

    /**
     * 带参数构造
     *
     * @param totalCount 总记录数
     * @param pageNo     当前页号
     * @param pageSize   每页记录数
     * @param result     每页数据
     */
    public Page(long totalCount, int pageNo, int pageSize, List<T> result, List<Order> orders) {
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        this.result = new ArrayList<>(result);
        this.pageNo = pageNo;

        long count = totalCount / pageSize;
        this.totalPageCount = (int) (totalCount % pageSize == 0 ? count : count + 1);
        this.orders = new ArrayList<>(orders);
    }

    public static <T> Page<T> build(long totalCount, int pageNo, int pageSize, List<T> result) {
        return new Page<>(totalCount, pageNo, pageSize, result, Collections.emptyList());
    }

    public static <T> Page<T> build(long totalCount, int pageNo, int pageSize, List<T> result, List<Order> orders) {
        return new Page<>(totalCount, pageNo, pageSize, result, orders);
    }

    /**
     * 取总记录数
     *
     * @return 总记录数
     */
    public long getTotalCount() {
        return this.totalCount;
    }

    /**
     * 取总页数
     *
     * @return 总页数
     */
    public int getTotalPageCount() {
        return this.totalPageCount;
    }

    /**
     * 取每页数据容量
     *
     * @return 每页数据数
     */
    public long getPageSize() {
        return this.pageSize;
    }

    /**
     * 取当前页中的记录
     *
     * @return 当前页数据
     */
    public List<T> getResult() {
        return this.result;
    }

    /**
     * 取该页当前页码,页码从1开始
     *
     * @return 当前页号
     */
    public int getPageNo() {
        return this.pageNo;
    }

    /**
     * 该页是否有下一页
     *
     * @return 是否有下一页
     */
    public boolean hasNextPage() {
        return this.pageNo < this.totalPageCount;
    }

    /**
     * @return 当前页后面还有几页
     */
    public long nextPageCount() {
        return this.totalPageCount - this.pageNo;
    }

    /**
     * 该页是否有上一页
     *
     * @return 是否有上一页
     */
    public boolean hasPreviousPage() {
        return this.pageNo > 1;
    }

    /**
     * @return 当前页前面有几页
     */
    public long previousPageCount() {
        return this.pageNo - 1;
    }


    public static class Order {
        private String field;
        private OrderEnum order;

        public Order(String field, OrderEnum order) {
            this.field = field;
            this.order = order;
        }

        public static Order build(String field) {
            return new Order(field, OrderEnum.asc);
        }

        public static Order build(String field, OrderEnum order) {
            return new Order(field, order);
        }

        public String getField() {
            return field;
        }

        public void setField(String field) {
            this.field = field;
        }

        public OrderEnum getOrder() {
            return order;
        }

        public void setOrder(OrderEnum order) {
            this.order = order;
        }
    }

    public enum OrderEnum {
        asc, desc;
    }
}
