package com.ynyes.rongcheng.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;


/**
 * 商品评论
 *
 * 记录了对商品的评论信息
 * 
 * @author Sharon
 *
 */

@Entity
public class ProductComment {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    // 评论标题
    @Column
    private String title;
    
    // 评论内容
    @Column
    private String content;
    
    // 评论星级
    @Column
    private Float stars;
    
    // 评论被点击“有用”的数量
    @Column
    private Long positiveNumber;
    
    // 评论时间
    @Column
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date commentTime;
    
    // 评论的商品ID或回复的评论ID
    @Column
    private Long pid;
    
    // 订单编号
    @Column
    private String orderNumber;
    
    // 发表评论的用户
    @Column
    private String username;
  

}
