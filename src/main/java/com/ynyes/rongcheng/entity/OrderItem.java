package com.ynyes.rongcheng.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


/**
 * 订单商品
 *
 * 记录了订单商品的相关信息
 * 
 * @author Sharon
 *
 */

@Entity
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    // 商品ID
    @Column
    private Long pid;
    
    // 商品名称
    @Column
    private String productName;
    
    // 商品简介
    @Column
    private String productBrief;
    
    // 商品封面
    @Column
    private String productCoverImageUri;
    
    // 商品编号
    @Column
    private String productCode;
 
    // 商品版本颜色
    @Column
    private String productVerColor;
    
    // 商品版本容量
    @Column
    private String productVerCap;
    
    // 商品版本名称
    @Column
    private String productVerName;
    
    // 商品库存
    @Column
    private Long productNumber;
    
    // 成交价
    @Column
    private Double price;
    
    // 商品数量
    @Column
    private Integer quantity;
    
    // 发货数量
    @Column
    private Integer deliveryQuantity;
    
}
