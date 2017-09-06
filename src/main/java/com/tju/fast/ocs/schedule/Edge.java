package com.tju.fast.ocs.schedule;

public class Edge {

    /**
     * to:			边的终点
     * next:		下一条同一起点的边
     * capacity:	边的容量
     * cost:		边上单位流量的费用
     */
    private Integer to;
    private Integer next;
    private Integer capacity;
    private Double cost;

    public Edge(Integer to, Integer next, Integer capacity, Double cost) {
        this.to = to;
        this.next = next;
        this.capacity = capacity;
        this.cost = cost;
    }

    public void setTo(Integer to) {
        this.to = to;
    }

    public Integer getTo() {
        return to;
    }

    public void setNext(Integer next) {
        this.next = next;
    }

    public Integer getNext() {
        return next;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    /**
     * 给this.capacity增加capacity的容量
     *
     * @param capacity
     */
    public void addCapacity(Integer capacity) {
        this.capacity += capacity;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    public Double getCost() {
        return cost;
    }


}
