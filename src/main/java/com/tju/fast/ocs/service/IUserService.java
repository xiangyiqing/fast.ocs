package com.tju.fast.ocs.service;

import com.tju.fast.ocs.po.Euser;
import com.tju.fast.ocs.util.Page;

import java.io.Serializable;

public interface IUserService extends IBaseService<Euser> {

    public enum STATUS {
        DISABLE("0"), NORMAL("1"), PWDCHANGE("2");

        private STATUS(String arg) {
            this.str = arg;
        }

        public final String str;
    }

    ;

    public enum ROLE {
        ADMIN("0"), OPERATOR("1");

        private ROLE(String arg) {
            this.str = arg;
        }

        public final String str;
    }

    ;

    public String DEFAULTPASSWORD = "123456";

    public Euser login(String username, String pwd) throws Exception;

    public void setLastLoginTime(Euser user) throws Exception;

    public boolean isAvailable(String username) throws Exception;

    public void createUser(Euser user) throws Exception;

    public void disableUser(Serializable id) throws Exception;

    public void enableUser(Serializable id) throws Exception;

    public void ChangePwd(Euser user, String newpwd) throws Exception;

    public Page<Euser> queryUserList(final int page, final int pagesize) throws Exception;
}
