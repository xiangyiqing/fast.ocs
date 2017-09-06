package com.tju.fast.ocs.service.impl;

import com.tju.fast.ocs.dao.UserDao;
import com.tju.fast.ocs.po.Euser;
import com.tju.fast.ocs.service.IUserService;
import com.tju.fast.ocs.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

@Service
public class UserService extends BaseService<Euser> implements IUserService {

    UserDao userDao;

    @Autowired
    public UserService(UserDao arg) {
        super(arg);
        this.userDao = arg;
    }

    @Override
    public Euser login(String username, String pwd) throws Exception {
        return userDao.login(username, pwd);
    }

    @Override
    public void setLastLoginTime(Euser user) throws Exception {
        user.setLastlogintime(new Timestamp(new Date().getTime()));
        userDao.update(user);
    }

    @Override
    public boolean isAvailable(String username) throws Exception {
        return userDao.isAvailable(username);
    }

    @Override
    public void createUser(Euser user) throws Exception {
        user.setRole(ROLE.OPERATOR.str);
        user.setCreatetime(new Timestamp(new Date().getTime()));
        user.setLastlogintime(null);
        user.setPassword(DEFAULTPASSWORD);
        user.setStatus(IUserService.STATUS.PWDCHANGE.str);
        userDao.save(user);
    }

    @Override
    public void disableUser(Serializable id) throws Exception {
        Euser u = userDao.select(id);
        u.setStatus(IUserService.STATUS.DISABLE.str);
        userDao.update(u);
    }

    @Override
    public void enableUser(Serializable id) throws Exception {
        Euser u = userDao.select(id);
        u.setStatus(IUserService.STATUS.NORMAL.str);
        userDao.update(u);
    }

    @Override
    public void ChangePwd(Euser user, String newpwd) throws Exception {
        if (user.getStatus().equals(IUserService.STATUS.PWDCHANGE.str)) {
            user.setStatus(IUserService.STATUS.NORMAL.str);
        }
        user.setPassword(newpwd);
        userDao.update(user);
    }

    @Override
    public Page<Euser> queryUserList(int page, int pagesize) throws Exception {
        return queryPage(page, pagesize, "ORDER BY userid asc ", null, (Object[]) null);
    }

}
