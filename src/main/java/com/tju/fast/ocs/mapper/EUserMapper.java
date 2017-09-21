package com.tju.fast.ocs.mapper;

import com.tju.fast.ocs.po.Euser;
import com.tju.fast.ocs.util.SuperMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


/**
 * User 表数据库控制层接口
 */
public interface EUserMapper extends SuperMapper<Euser> {


    @Select("select * from euser where username = #{username} and password = #{password} and status != '0'")
    Euser login(@Param("username") String username, @Param("password") String password);

    @Select("select count(1) < 1 from euser where username = #{username}")
    boolean isAvailable(@Param("username") String username);
}