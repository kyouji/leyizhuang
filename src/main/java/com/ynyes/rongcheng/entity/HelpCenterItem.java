package com.ynyes.rongcheng.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


/**
 * 帮助中心
 * 
 * @author Sharon
 *
 */

@Entity
public class HelpCenterItem {
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
}
