package com.ynyes.rongcheng.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * 商品信息表
 * 
 * @author Sharon
 *
 */

@Entity
public class ProductVersion {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    // 版本名称
    @Column
    private String name;
    
    // 版本颜色
    @Column
    private String color;
    
    // 版本容量
    @Column
    private String capacity;
    
    // 版本图片URI
    @Column
    private String picUri;
    
    // 该版本的市场价
    @Column(nullable=false, scale=2)
    private Double marketPrice;
    
    // 该版本的价格
    @Column(nullable=false, scale=2)
    private Double salePrice;

    // 该版本剩余数量
    @Column
    private Long leftNumber;
 
    // 该版本的已售数量
    @Column
    private Long soldNumber;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public String getPicUri() {
        return picUri;
    }

    public void setPicUri(String picUri) {
        this.picUri = picUri;
    }

    public Double getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(Double marketPrice) {
        this.marketPrice = marketPrice;
    }

    public Double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(Double salePrice) {
        this.salePrice = salePrice;
    }

    public Long getLeftNumber() {
        return leftNumber;
    }

    public void setLeftNumber(Long leftNumber) {
        this.leftNumber = leftNumber;
    }

    public Long getSoldNumber() {
        return soldNumber;
    }

    public void setSoldNumber(Long soldNumber) {
        this.soldNumber = soldNumber;
    }
}
