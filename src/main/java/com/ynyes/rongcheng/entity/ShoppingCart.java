package com.ynyes.rongcheng.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


/**
 * 购物车
 *
 * 记录了购物车所有信息
 * 
 * @author Sharon
 *
 */

@Entity
public class ShoppingCart {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    // 用户
    @Column
    private String username;
    
    // 商品ID
    @Column
    private Long pid;
    
    // 商品版本ID
    @Column
    private Long vid;
    
    // 商品数量
    @Column
    private Long quantity;
    
    // 成交价
    @Column
    private Double price;
    
    // 是否选中，选中的商品将进行结算
    @Column
    private Boolean isSelected;
    
    /*
     * 以下字段根据pid取出商品信息进行填充，不保存在数据库
     */
    // 商品名称
    private String productName;
    
    // 商品简介
    private String productBrief;
    
    // 商品封面
    private String productCoverImageUri;
    
    // 商品编号
    private String productCode;
 
    // 商品版本颜色
    private String productVerColor;
    
    // 商品版本容量
    private String productVerCap;
    
    // 商品版本名称
    private String productVerName;
    
    // 商品库存
    private Long productNumber;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
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

    public Long getProductNumber() {
        return productNumber;
    }

    public void setProductNumber(Long productNumber) {
        this.productNumber = productNumber;
    }

    public Boolean getIsSelected() {
        return isSelected;
    }

    public void setIsSelected(Boolean isSelected) {
        this.isSelected = isSelected;
    }
}
