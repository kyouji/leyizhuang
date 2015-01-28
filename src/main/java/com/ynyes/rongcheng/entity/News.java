package com.ynyes.rongcheng.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;


/**
 * 新闻
 *
 * 记录了品牌的相关信息
 * 
 * @author Sharon
 *
 */

@Entity
public class News {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    // 新闻类型
    @Column(nullable=false)
    private String type;
    
    // 类型排序号
    @Column
    private Long typeSortNumber;
    
    // 标题
    @Column(nullable=false)
    private String title;
    
    // 封面图片
    @Column
    private String coverImageUri;
    
    // 作者
    @Column
    private String author;
    
    // 创建的时间
    @Column
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    // 内容
    @Column
    private String content;
    
    // 点击量
    @Column
    private Long clickNumber;
    
    // 是否前台显示
    @Column
    private Boolean isShow;
    
}
