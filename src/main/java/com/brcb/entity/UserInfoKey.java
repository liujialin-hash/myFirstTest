package com.brcb.entity;

import java.io.Serializable;

public class UserInfoKey implements Serializable {
    private String username;

    private String id;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }
}