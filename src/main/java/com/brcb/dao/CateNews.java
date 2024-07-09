/*
 * Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.brcb.dao;

import com.brcb.entity.News;

import java.util.List;

public interface CateNews {

    public News getCateNewsById(String id);

    public int updateCateNewsById(News news) throws Exception;

    public List<News> getAllNewsByNewsType(String type);

    public int deleteByCateNewsId(String id) throws Exception;

    int insert(News news) throws Exception;

}
