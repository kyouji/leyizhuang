package com.ynyes.rongcheng.service;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.ProductTypeParameter;
import com.ynyes.rongcheng.repository.ProductTypeParameterRepo;

/**
 * 商品类型关联参数服务类
 * 
 * @author Sharon
 */

@Service
@Transactional
public class ProductTypeParameterService {
    @Autowired
    ProductTypeParameterRepo repository;
            
    /**
     * 保存商品类型参数
     * 
     * @return 保存的商品类型参数
     */
    public ProductTypeParameter save(ProductTypeParameter typeParameter) {

        return repository.save(typeParameter);
    }
    
    /**
     * 删除商品类型参数
     * 
     * @param typeParameter 商品类型参数
     * @return
     */
    public void delete(ProductTypeParameter typeParameter) {

        repository.delete(typeParameter);
    }
    
    /**
     * 删除商品类型参数
     * 
     * @param id 商品类型参数ID
     * @return
     */
    public void delete(Long id) {

        repository.delete(id);
    }
    
    /**
     * 根据ID查找类型参数
     * 
     * @param id 类型参数ID
     * @return 找到的类型参数，未找到时返回NULL
     */
    public ProductTypeParameter findOne(Long id) {

        ProductTypeParameter typeParameter = null;
        
        if (null != id)
        {
            typeParameter = repository.findOne(id);
        }
        return typeParameter;
    }
    
    /**
     * 根据ID查找类型参数
     * 
     * @param ids 类型参数ID列表
     * @return 找到的类型参数列表，未找到时返回NULL
     */
    public List<ProductTypeParameter> findByIdIn(Collection<Long> ids) {

        List<ProductTypeParameter> ptpList = null;
        
        if (null != ids)
        {
            ptpList = repository.findByIdIn(ids);
        }
        return ptpList;
    }
}
