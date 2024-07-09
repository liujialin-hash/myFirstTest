/*
 * Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.brcb.service.impl;

import com.brcb.dao.CateAllNewsType;
import com.brcb.dao.impl.CateAllNewsTypeImpl;
import com.brcb.entity.NewsType;
import com.brcb.service.CateAllNewsTypeService;


import java.util.List;

public class CateAllNewsTypesServiceImpl implements CateAllNewsTypeService {

    CateAllNewsType cateAllNewsType;

    public CateAllNewsTypesServiceImpl() {
        cateAllNewsType = new CateAllNewsTypeImpl();
    }

    @Override
    public List<NewsType> getCateAllNewsType() {
        return cateAllNewsType.getAllCateAllNewsType();
    }


}
