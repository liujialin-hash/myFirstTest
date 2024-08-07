/*
 * Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.brcb.service;

import com.brcb.entity.News;

import java.util.List;

public interface CateNewsService {


    public List<News> getAllNewsByType(String type,Integer beginPage,Integer pageSize );

    public News getCateNewsById(String id);

    public int updateById(News news)throws Exception;

    public int deleteByCateNewsId(String id);

    public int insert(News news);

    public Integer getCount(String typeId);
}
