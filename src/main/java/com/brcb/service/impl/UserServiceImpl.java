package com.brcb.service.impl;

import com.brcb.dao.UserInfoDao;
import com.brcb.dao.impl.UserInfoImpl;
import com.brcb.entity.UserInfo;
import com.brcb.service.UserService;


public class UserServiceImpl implements UserService {

    UserInfoDao userInfoDao;

    public UserServiceImpl() {
        userInfoDao = new UserInfoImpl();
    }

    @Override
    public UserInfo login(String username) throws Exception {
        UserInfo userInfo = new UserInfo();
        userInfo.setUsername(username);
        return userInfoDao.login(userInfo);
    }
}
