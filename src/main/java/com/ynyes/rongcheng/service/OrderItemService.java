package com.ynyes.rongcheng.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.OrderItem;
import com.ynyes.rongcheng.repository.OrderItemRepo;

/**
 * 订单商品服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class OrderItemService {
    @Autowired
    OrderItemRepo repository;
    
    
    /**
     * 获取订单商品项
     * 
     * @param id 订单ID
     * @return 获取到的订单商品项
     */
    public OrderItem findOne(Long id)
    {
        OrderItem item = null;
        
        if (null != id)
        {
            item = repository.findOne(id);
        }
        
        return item;
    }
    
    /**
     * 删除订单商品项
     * 
     * @param id 订单ID
     */
    public void delete(Long id)
    {
        if (null != id)
        {
            repository.delete(id);
        }
    }
    
    /**
     * 删除订单商品项
     * 
     * @param so 订单实体
     */
    public void delete(OrderItem oi)
    {
        if (null != oi)
        {
            repository.delete(oi);
        }
    }
    
    /**
     * 保存订单商品项
     * 
     * @param item 订单商品项
     * @return 保存的订单商品
     */
    public OrderItem save(OrderItem item)
    {
        if (null == item)
        {
            return null;
        }
        
        return repository.save(item);
    }
    
    /**
     * 新建订单商品项
     * 
     * @param productId (必选)商品ID
     * @param productName (必选)商品名称
     * @param productBrief (必选)商品简述
     * @param productCoverImageUri (必选)商品封面图片URI
     * @param productCode (必选)商品编码
     * @param productVerId (必选)版本ID
     * @param productVerColor 商品版本颜色
     * @param productVerCap 商品版本容量
     * @param productVerName 商品版本名称
     * @param productNumber (必选)商品数量
     * @param price (必选)成交价
     * @param quantity (必选)购买数量
     * @return 新建的订单商品项，错误时返回NULL
     */
    public OrderItem newOne(Long productId,
                            String productName,
                            String productBrief,
                            String productCoverImageUri,
                            String productCode,
                            Long productVerId,
                            String productVerColor,
                            String productVerCap,
                            String productVerName,
                            Long productNumber,
                            Double price,
                            Long quantity)
    {
        OrderItem oi = new OrderItem();
        
        // 商品ID
        oi.setPid(productId);
     
        // 商品名称
        oi.setProductName(productName);
        
        // 商品简介
        oi.setProductBrief(productBrief);
        
        // 商品封面
        oi.setProductCoverImageUri(productCoverImageUri);
        
        // 商品编号
        oi.setProductCode(productCode);
        
        // 版本ID
        oi.setVid(productVerId);
        
        // 版本颜色
        oi.setProductVerColor(productVerColor);
        
        // 商品版本容量
        oi.setProductVerCap(productVerCap);
        
        // 商品版本名称
        oi.setProductVerName(productVerName);
        
        // 商品库存
        oi.setProductNumber(productNumber);
        
        // 成交价
        oi.setPrice(price);
        
        // 商品数量
        oi.setQuantity(quantity);
        
        return oi;
    }
}
