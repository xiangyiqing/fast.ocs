package com.tju.fast.ocs.service.impl;

import com.tju.fast.ocs.mapper.EUserMapper;
import com.tju.fast.ocs.po.Euser;
import com.tju.fast.ocs.service.IUserService;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

@Service
public class UserService extends BaseServiceImpl<EUserMapper, Euser> implements IUserService {


    @Override
    public Euser login(String username, String pwd) throws Exception {
        return baseMapper.login(username, pwd);
    }

    @Override
    public void setLastLoginTime(Euser user) throws Exception {
        user.setLastlogintime(new Timestamp(new Date().getTime()));
        baseMapper.updateById(user);
    }

    @Override
    public boolean isAvailable(String username) throws Exception {
        return baseMapper.isAvailable(username);
    }

    @Override
    public void createUser(Euser user) throws Exception {
        user.setRole(ROLE.OPERATOR.str);
        user.setCreatetime(new Timestamp(new Date().getTime()));
        user.setLastlogintime(null);
        user.setPassword(DEFAULTPASSWORD);
        user.setStatus(IUserService.STATUS.PWDCHANGE.str);
        baseMapper.insert(user);
    }

    @Override
    public void disableUser(Serializable id) throws Exception {
        Euser u = baseMapper.selectById(id);
        u.setStatus(IUserService.STATUS.DISABLE.str);
        baseMapper.updateById(u);
    }

    @Override
    public void enableUser(Serializable id) throws Exception {
        Euser u = baseMapper.selectById(id);
        u.setStatus(IUserService.STATUS.NORMAL.str);
        baseMapper.updateById(u);
    }

    @Override
    public void ChangePwd(Euser user, String newpwd) throws Exception {
        if (user.getStatus().equals(IUserService.STATUS.PWDCHANGE.str)) {
            user.setStatus(IUserService.STATUS.NORMAL.str);
        }
        user.setPassword(newpwd);
        baseMapper.updateById(user);
    }

}
