/*
 * Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.brcb.service.impl;

import com.brcb.dao.CateNews;
import com.brcb.dao.impl.CateNewsImpl;
import com.brcb.entity.News;
import com.brcb.service.CateAllNewsTypeService;
import com.brcb.service.CateNewsService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;

import java.util.List;


public class CateNewsServiceImpl implements CateNewsService {

    public static final Logger logger = LogManager.getLogger(CateNewsServiceImpl.class);

    CateNews cateNews;

    public CateNewsServiceImpl() {
        cateNews = new CateNewsImpl();
    }

    @Override
    public List<News> getAllNewsByType(String type,Integer beginPage,Integer pageSize ) {
        try {
            return cateNews.getAllNewsByNewsType(type,beginPage,pageSize);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public News getCateNewsById(String id) {
        return cateNews.getCateNewsById(id);
    }

    @Override
    public int updateById(News news) throws Exception {

        return cateNews.updateCateNewsById(news);
    }

    @Override
    public int deleteByCateNewsId(String id) {
        int count = 0;
        try {
            count = cateNews.deleteByCateNewsId(id);
        } catch (Exception e) {
            logger.error("error is {}", e.getMessage(), e);
        }
        return count;
    }

    @Override
    public int insert(News news) {
        int insert = 0;
        try {
            insert = cateNews.insert(news);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return insert;
    }

    @Override
    public Integer getCount(String typeId) {
        Integer count=0;
        try {
            count = cateNews.getCount(typeId);
            System.out.println(count);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return count;
    }
}
