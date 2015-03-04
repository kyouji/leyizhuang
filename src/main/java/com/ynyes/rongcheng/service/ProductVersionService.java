package com.ynyes.rongcheng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.ProductVersion;
import com.ynyes.rongcheng.repository.ProductVersionRepo;

/**
 * 商品版本服务类
 * 
 * @author Sharon
 */

@Service
@Transactional
public class ProductVersionService {
    @Autowired
    ProductVersionRepo repository;
    
    /**
     * 保存商品版本列表
     * 
     * @param versionList 商品组合列表
     * 
     * @return
     */
    public void save(List<ProductVersion> versionList)
    {
        repository.save(versionList);
    }
}
