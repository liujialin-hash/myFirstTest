package com.brcb.service;

import com.brcb.entity.UserInfo;

public interface UserService {

    public UserInfo login(String username) throws Exception;

}
