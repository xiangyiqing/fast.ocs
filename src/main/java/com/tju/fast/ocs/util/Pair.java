package com.tju.fast.ocs.util;

/**
 * <p>Title: Pair</p>
 * <p>Description: 两个元素的元组，用于在一个方法里返回两种类型的值</p>
 *
 * @param <A>
 * @param <B>
 * @version 2012-3-21 上午11:15:03
 */
public class Pair<A, B> implements Cloneable {

    public A first;
    public B second;

    public Pair(A a, B b) {
        this.first = a;
        this.second = b;
    }

    @Override
    public String toString() {
        return "(" + first + ", " + second + ")";
    }

    @Override
    public Pair<A, B> clone() throws CloneNotSupportedException {
        return new Pair<A, B>(first, second);
    }

}
