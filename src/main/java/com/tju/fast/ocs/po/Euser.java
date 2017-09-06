package com.tju.fast.ocs.po;

import org.sormula.annotation.Column;
import org.sormula.annotation.Row;

import java.sql.Timestamp;

@Row(tableName = "euser", inhertedFields = true)
public class Euser {

    @Column(name = "userid")
    private Integer userid;
    private String username;
    private String password;
    private Timestamp createtime;
    private Timestamp lastlogintime;
    private String status;
    private String role;


    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    public Timestamp getLastlogintime() {
        return lastlogintime;
    }

    public void setLastlogintime(Timestamp lastlogintime) {
        this.lastlogintime = lastlogintime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }


}
