package com.tju.fast.ocs.schedule;

import java.util.ArrayList;
import java.util.Iterator;

public class Ans {
    private String msbId = new String();
    private ArrayList<String> slotId = new ArrayList<String>();

    /**
     * 返回单向链表slotId的大小
     *
     * @return
     */
    public int size() {
        return slotId.size();
    }

    /**
     * 获取单向链表slotId中角标为pos的元素
     *
     * @param pos
     * @return
     */
    public String getSlotId(int pos) {
        return slotId.get(pos);
    }

    /**
     * 获取msbId
     *
     * @return msbId
     */
    public String getMsbId() {
        return msbId;
    }

    /**
     * 返回单向链表slotId的迭代器
     *
     * @return iterator
     */
    public Iterator<String> iterator() {
        return slotId.iterator();
    }

    /**
     * 修改msbId
     *
     * @param msbId
     */
    public void setMsbId(String msbId) {
        this.msbId = msbId;
    }

    /**
     * 添加分配的可用时间片
     *
     * @param slotId
     */
    public void addSlotId(String Id) {
        slotId.add(Id);
    }

    /**
     * 清空单向链表slotId
     */
    public void clear() {
        slotId.clear();
    }
}
