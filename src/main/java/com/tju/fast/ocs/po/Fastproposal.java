package com.tju.fast.ocs.po;

import com.baomidou.mybatisplus.annotations.TableId;

public class Fastproposal {

    @TableId
    private String id;
    private String title;
    private String proposer;
    private Double rate;
    private String note;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getProposer() {
        return proposer;
    }

    public void setProposer(String proposer) {
        this.proposer = proposer;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Double getRate() {
        return rate;
    }

    public void setRate(Double rate) {
        this.rate = rate;
    }

    @Override
    public String toString() {
        return "Fastproposal [id=" + id + ", title=" + title + ", proposer=" + proposer + ", note=" + note + "]";
    }


}
