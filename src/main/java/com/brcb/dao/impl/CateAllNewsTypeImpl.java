/*
 * Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.brcb.dao.impl;

import com.brcb.dao.CateAllNewsType;
import com.brcb.entity.NewsType;
import com.brcb.util.databaseHelper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class CateAllNewsTypeImpl extends databaseHelper implements CateAllNewsType {

    private final Logger logger = LogManager.getLogger(CateAllNewsTypeImpl.class);

    @Override
    public List<NewsType> getAllCateAllNewsType() {
        String sql = "select * from news_type";
        List<NewsType> newsTypeList;
        newsTypeList = selectAll(sql, NewsType.class);
        Stream<NewsType> stream = newsTypeList.stream();
        String stringStream = stream.map(type -> "name" + type.getName()).collect(Collectors.joining(","));
        logger.info(stringStream);
        return newsTypeList;
    }
}
