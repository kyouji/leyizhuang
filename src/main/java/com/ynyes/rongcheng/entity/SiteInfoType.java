package com.ynyes.rongcheng.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


/**
 * 网站资料类型
 * 
 * @author Sharon
 *
 */

@Entity
public class SiteInfoType {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    // 类型名称
    @Column(unique=true)
    private String name;
    
    // 父类型
    @Column
    private String parent;
    
    // 排序号
    @Column
    private Long sortNumber;
    
    // 是否前台显示
    @Column
    private Boolean isShow;
}
