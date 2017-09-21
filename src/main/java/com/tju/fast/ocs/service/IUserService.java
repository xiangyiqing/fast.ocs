package com.tju.fast.ocs.service;

import com.tju.fast.ocs.po.Euser;

import java.io.Serializable;

public interface IUserService extends IBaseService<Euser> {

    enum STATUS {
        DISABLE("0"), NORMAL("1"), PWDCHANGE("2");

        private STATUS(String arg) {
            this.str = arg;
        }

        public final String str;
    }

    ;

    enum ROLE {
        ADMIN("0"), OPERATOR("1");

        private ROLE(String arg) {
            this.str = arg;
        }

        public final String str;
    }

    ;

    String DEFAULTPASSWORD = "123456";

    Euser login(String username, String pwd) throws Exception;

    void setLastLoginTime(Euser user) throws Exception;

    boolean isAvailable(String username) throws Exception;

    void createUser(Euser user) throws Exception;

    void disableUser(Serializable id) throws Exception;

    void enableUser(Serializable id) throws Exception;

    void ChangePwd(Euser user, String newpwd) throws Exception;

}
