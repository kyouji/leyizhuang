package com.ynyes.rongcheng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.ProductCombination;
import com.ynyes.rongcheng.repository.ProductCombinationRepo;

/**
 * 商品组合服务类
 * 
 * @author Sharon
 */

@Service
@Transactional
public class ProductCombinationService {
    @Autowired
    ProductCombinationRepo repository;
    
    /**
     * 保存商品组合列表
     * 
     * @param combiList 商品组合列表
     * 
     * @return
     */
    public void save(List<ProductCombination> combiList)
    {
        repository.save(combiList);
    }
    
    /**
     * 删除商品组合列表
     * 
     * @param combiList 商品组合列表
     * 
     * @return
     */
    public void delete(List<ProductCombination> combiList)
    {
        repository.delete(combiList);
    }
    
    /**
     * 删除商品组合
     * 
     * @param productCombination
     */
    public void delete(ProductCombination productCombination)
    {
        repository.delete(productCombination);
    }
}
