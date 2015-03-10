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
    
    // 版本ID
    @Column
    private Long vid;
    
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
    
    // 成交价
    @Column
    private Double price;
    
    // 商品数量
    @Column
    private Long quantity;
    
    // 发货数量
    @Column
    private Long deliveryQuantity;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public Long getVid() {
        return vid;
    }

    public void setVid(Long vid) {
        this.vid = vid;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductBrief() {
        return productBrief;
    }

    public void setProductBrief(String productBrief) {
        this.productBrief = productBrief;
    }

    public String getProductCoverImageUri() {
        return productCoverImageUri;
    }

    public void setProductCoverImageUri(String productCoverImageUri) {
        this.productCoverImageUri = productCoverImageUri;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getProductVerColor() {
        return productVerColor;
    }

    public void setProductVerColor(String productVerColor) {
        this.productVerColor = productVerColor;
    }

    public String getProductVerCap() {
        return productVerCap;
    }

    public void setProductVerCap(String productVerCap) {
        this.productVerCap = productVerCap;
    }

    public String getProductVerName() {
        return productVerName;
    }

    public void setProductVerName(String productVerName) {
        this.productVerName = productVerName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public Long getDeliveryQuantity() {
        return deliveryQuantity;
    }

    public void setDeliveryQuantity(Long deliveryQuantity) {
        this.deliveryQuantity = deliveryQuantity;
    }
}
