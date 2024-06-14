package com.brcb.service.impl;

import com.brcb.dao.UserInfoDao;
import com.brcb.dao.impl.userInfoImpl;
import com.brcb.entity.UserInfo;
import com.brcb.service.UserService;

public class UserServiceImpl implements UserService {

    UserInfoDao userInfoDao;

    public UserServiceImpl(){
        userInfoDao=new userInfoImpl();
    }
    @Override
    public UserInfo login(String username) throws Exception {
        return userInfoDao.login(username);
    }
}
