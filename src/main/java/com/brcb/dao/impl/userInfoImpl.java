package com.brcb.dao.impl;

import com.brcb.dao.UserInfoDao;
import com.brcb.entity.UserInfo;
import com.brcb.util.databaseHelper;

import java.sql.SQLException;
import java.util.List;


public class userInfoImpl extends databaseHelper implements UserInfoDao{


    @Override
    public List<UserInfo> getUsers(int id) {
        String sql="select * from user_info";
        return selectAll(sql,UserInfo.class);
    }

    @Override
    public UserInfo login(String username) {
        String sql="select * from user_info where username=?";
        return selectOne(sql, UserInfo.class, username);
    }
}
