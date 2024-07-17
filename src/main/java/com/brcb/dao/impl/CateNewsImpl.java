/*
 * Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.brcb.dao.impl;

import com.brcb.dao.CateNews;
import com.brcb.entity.News;
import com.brcb.util.databaseHelper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

public class CateNewsImpl extends databaseHelper implements CateNews {

    private final static Logger logger = LogManager.getLogger(CateNewsImpl.class);

    @Override
    public News getCateNewsById(String id) {
        String sql = "select * from news where id=?";
        return selectOne(sql, News.class, id);

    }

    @Override
    public int updateCateNewsById(News news) throws Exception {
        Integer count = 0;
        String sql = "UPDATE news" +
                " SET title = ?," +
                " author = ?," +
                " type_id = ?," +
                " digest = ?," +
                " text = ? " +
                " WHERE" +
                " id = ?;";
        Object[] params = new Object[]{news.getTitle(), news.getAuthor(), news.getType_id(), news.getDigest(), news.getText(), news.getId()};


        count = update(sql, params);

        logger.info("have influenced {} digit data", count);
        return 0;
    }

    @Override
    public List<News> getAllNewsByNewsType(String type,Integer curPage,Integer pageSize) throws Exception {
        StringBuilder sql = new StringBuilder("select * from news");
        List<News> news = null;
        if (type != null && !type.equals("0")&&!type.isEmpty()) {
            sql.append(" where type_id = ? order by date DESC limit ?,?");
            news = selectAll(sql.toString(), News.class, type ,curPage,pageSize);
        } else {
            sql.append(" order by date DESC limit  ?,?");
            news = selectAll(sql.toString(), News.class,curPage,pageSize);
        }
        logger.info("News date has been updated");
        return news;
    }

    @Override
    public int deleteByCateNewsId(String id) throws Exception {
        String sql = "delete from news where id =?";
        int count = 0;
        count = update(sql, id);
        return count;
    }

    @Override
    public int insert(News news) throws Exception {
        String sql = "INSERT INTO `icms`.`news` " +
                "(`id`, `title`, `author`, `type_id`, `digest`, `text`, `pig_path`) " +
                "VALUES (?, ?, ?, ?, ?, ?,?)";
        int count = 0;
        count = update(sql, news.getId(), news.getTitle(), news.getAuthor(), news.getType_id(), news.getDigest(), news.getText(),news.getPig_path());
        return count;
    }

    @Override
    public Integer getCount(String typeId) throws Exception {
        Integer count=0;
        StringBuffer sql=new StringBuffer("select count(1) from news");
        if (typeId!=null&&!typeId.isEmpty()&&!typeId.equals("0")){
            sql.append(" where type_id=?");
            count = selectOne(sql.toString(), Integer.class, typeId);
        }else {
            count=selectOne(sql.toString(), Integer.class);
        }
        return count;
    }
}
