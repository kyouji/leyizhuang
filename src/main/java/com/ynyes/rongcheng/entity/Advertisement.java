package com.ynyes.rongcheng.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;


/**
 * 广告列表
 *
 * 记录了所有广告信息
 * 
 * @author Sharon
 *
 */

@Entity
public class Advertisement {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    // 广告名称
    @Column
    private String name;
    
    // 广告类型
    @Column
    private String type;
    
    // 广告链接地址
    @Column
    private String destinationUri;
    
    // 排序号
    @Column
    private Long orderNumber;
    
    // 点击量
    @Column
    private Long clickNumber;
    
    // 浏览量
    @Column
    private Long viewNumber;
    
    // 图片
    @Column
    private String imageUri;
    
    // 广告结束时间
    @Column
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date endTime;
    
    // 广告创建时间
    @Column
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    
    // 排序号
    @Column
    private Long sortNumber;

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDestinationUri() {
        return destinationUri;
    }

    public void setDestinationUri(String destinationUri) {
        this.destinationUri = destinationUri;
    }

    public Long getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(Long orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Long getClickNumber() {
        return clickNumber;
    }

    public void setClickNumber(Long clickNumber) {
        this.clickNumber = clickNumber;
    }

    public Long getViewNumber() {
        return viewNumber;
    }

    public void setViewNumber(Long viewNumber) {
        this.viewNumber = viewNumber;
    }

    public String getImageUri() {
        return imageUri;
    }

    public void setImageUri(String imageUri) {
        this.imageUri = imageUri;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getSortNumber() {
        return sortNumber;
    }

    public void setSortNumber(Long sortNumber) {
        this.sortNumber = sortNumber;
    }
}
