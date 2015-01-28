package com.ynyes.rongcheng.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.springframework.format.annotation.DateTimeFormat;


/**
 * 商品咨询
 * 
 * @author Sharon
 *
 */

@Entity
public class ProductConsult {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    // 咨询内容
    @Column
    private String content;
    
    // 咨询时间
    @Column
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date consultTime;
    
    // 咨询用户
    @Column
    private String username;
    
    // 咨询回复
    @OneToOne
    private String reply;
    
    // 咨询的商品ID
    @Column
    private Long pid;

}
