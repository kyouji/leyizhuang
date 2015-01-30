package com.ynyes.rongcheng.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * 商品组合表
 * 
 * @author Sharon
 *
 */

@Entity
public class ProductCombination {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    // 组合商品ID
    @Column
    private Long pid;
    
    // 组合商品版本id
    @Column
    private Long vid;
    
    // 组合价
    @Column(nullable=false, scale=2)
    private Double combinationPrice;
    
    /*
     * 以下字段由pid取出商品信息后临时填充，不存储到数据库
     */
    // 商品名称
    private String productName;
    
    // 商品简介
    private String productBrief;
    
    // 商品类型
    private String productType;
    
    // 单卖价
    private Double productPrice;
    
    // 封面图片uri
    private String productCoverImageUri;

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

    public Double getCombinationPrice() {
        return combinationPrice;
    }

    public void setCombinationPrice(Double combinationPrice) {
        this.combinationPrice = combinationPrice;
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

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public Double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductCoverImageUri() {
        return productCoverImageUri;
    }

    public void setProductCoverImageUri(String productCoverImageUri) {
        this.productCoverImageUri = productCoverImageUri;
    }
}
