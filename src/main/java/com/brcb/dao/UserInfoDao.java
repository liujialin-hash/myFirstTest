package com.brcb.dao;

import com.brcb.entity.UserInfo;

import java.util.List;

public interface UserInfoDao {

    public List<UserInfo> getUsers(int id);

    public UserInfo login(String username);

}
