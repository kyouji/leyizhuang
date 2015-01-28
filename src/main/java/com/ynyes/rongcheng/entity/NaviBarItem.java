package com.ynyes.rongcheng.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


/**
 * 首页顶部导航栏栏目
 * 
 * @author Sharon
 *
 */

@Entity
public class NaviBarItem {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    // 栏目名称
    @Column
    private String name;
    
    // 点击跳转地址
    @Column
    private String uri;
    
    // 排序号
    @Column
    private Long sortNumber;
}
