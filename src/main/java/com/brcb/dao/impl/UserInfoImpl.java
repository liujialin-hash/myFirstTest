package com.brcb.dao.impl;

import com.brcb.dao.UserInfoDao;
import com.brcb.entity.UserInfo;

import com.brcb.service.CateAllNewsTypeService;
import com.brcb.service.impl.CateAllNewsTypesServiceImpl;
import com.brcb.util.databaseHelper;


import java.util.List;


public class UserInfoImpl extends databaseHelper implements UserInfoDao {


    CateAllNewsTypeService cateAllNewsTypeService;

    public UserInfoImpl() {
        cateAllNewsTypeService = new CateAllNewsTypesServiceImpl();
    }

    @Override
    public List<UserInfo> getUsers(int id) {
        String sql="select * from user_info";
        return selectAll(sql,UserInfo.class);
    }

    @Override
    public UserInfo login(UserInfo username) {
        String sql = "select * from user_info where username=?";
        return selectOne(sql, UserInfo.class, username.getUsername());
    }
}