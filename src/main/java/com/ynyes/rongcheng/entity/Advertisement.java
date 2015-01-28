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
    
}
