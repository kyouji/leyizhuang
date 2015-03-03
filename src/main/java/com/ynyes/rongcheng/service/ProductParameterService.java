package com.ynyes.rongcheng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.ProductParameter;
import com.ynyes.rongcheng.repository.ProductParameterRepo;

/**
 * 商品组合服务类
 * 
 * @author Sharon
 */

@Service
@Transactional
public class ProductParameterService {
    @Autowired
    ProductParameterRepo repository;
    
    /**
     * 保存商品参数列表
     * 
     * @param combiList 商品组合列表
     * 
     * @return
     */
    public void save(List<ProductParameter> paramList)
    {
        repository.save(paramList);
    }
}
