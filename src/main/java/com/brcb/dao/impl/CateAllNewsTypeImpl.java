/*
 * Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.brcb.dao.impl;

import com.brcb.dao.CateAllNewsType;
import com.brcb.entity.newsType;
import com.brcb.util.databaseHelper;

import java.util.List;

public class CateAllNewsTypeImpl extends databaseHelper implements CateAllNewsType {
    @Override
    public List<newsType> getAllCateAllNewsType() {
        String sql = "select * from news_type";
        List<newsType> newsTypeList ;
        newsTypeList = selectAll(sql, newsType.class);
        return newsTypeList;
    }
}
