package com.ynyes.rongcheng.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.Product;
import com.ynyes.rongcheng.repository.ProductRepo;

/**
 * 商品服务类
 * 
 * @author Sharon
 */

@Service
@Transactional
public class ProductService {
    @Autowired
    ProductRepo repository;
    
    /**
     * 根据类型获取商品，并进行分页
     * 
     * @param type 商品类型名
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向，不区分大小写，asc表示升序，desc表示降序，为NULL时不进行排序
     * @param property 排序的字段名，为NULL时不进行排序
     * @return 商品列表
     */
    public Page<Product> findByType(String type,
                                        int page,
                                        int size,
                                        String direction,
                                        String property)
    {
        Page<Product> productPage = null;
        PageRequest pageRequest = null;
        
        if (null == type)
        {
            return null;
        }
        
        if (page < 0 || size < 0)
        {
            return null;
        }
        
        if (null == direction || null == property)
        {
            pageRequest = new PageRequest(page, size);
        }
        else
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, 
                                 property);
            pageRequest = new PageRequest(page, size, sort);
        }
        
        productPage = repository.findByTypeAndIsOnSaleTrueOrFatherTypeAndIsOnSaleTrueOrGrandFatherTypeAndIsOnSaleTrue(type, type, type, pageRequest);
        
        return productPage;
    }
    
    /**
     * 获取限时抢购商品，并进行分页
     * 
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向，不区分大小写，asc表示升序，desc表示降序，为NULL时不进行排序
     * @param property 排序的字段名，为NULL时不进行排序
     * @return 商品列表
     */
    public Page<Product> findFlashSale(int page,
                                        int size,
                                        String direction,
                                        String property)
    {
        Page<Product> productPage = null;
        PageRequest pageRequest = null;
        
        if (page < 0 || size < 0)
        {
            return null;
        }
        
        if (null == direction || null == property)
        {
            pageRequest = new PageRequest(page, size);
        }
        else
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, 
                                 property);
            pageRequest = new PageRequest(page, size, sort);
        }
        
        Date current = new Date();
        
        productPage = repository.findByIsOnSaleTrueAndIsFlashSaleTrueAndFlashSaleStopTimeAfter(current, pageRequest);
        
        return productPage;
    }
    
    /**
     * 获取明星产品，并进行分页
     * 
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向，不区分大小写，asc表示升序，desc表示降序，为NULL时不进行排序
     * @param property 排序的字段名，为NULL时不进行排序
     * @return 商品列表
     */
    public Page<Product> findStar(int page,
                                        int size,
                                        String direction,
                                        String property)
    {
        Page<Product> productPage = null;
        PageRequest pageRequest = null;
        
        if (page < 0 || size < 0)
        {
            return null;
        }
        
        if (null == direction || null == property)
        {
            pageRequest = new PageRequest(page, size);
        }
        else
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, 
                                 property);
            pageRequest = new PageRequest(page, size, sort);
        }
        
        productPage = repository.findByIsOnSaleTrueAndIsStarProductTrue(pageRequest);
        
        return productPage;
    }
    
}
