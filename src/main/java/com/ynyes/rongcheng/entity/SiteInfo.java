package com.ynyes.rongcheng.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


/**
 * 网站资料
 * 
 * @author Sharon
 *
 */

@Entity
public class SiteInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    // 类型
    @Column
    private String type;
    
    // 内容
    @Column
    private String content;
    
    // 排序号
    @Column
    private Long sortNumber;
    
    // 是否前台显示
    @Column
    private Boolean isShow;
}
