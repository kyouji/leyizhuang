package com.ynyes.rongcheng.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


/**
 * 管理员角色
 * 
 * @author Sharon
 *
 */

@Entity
public class TdManagerRole {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    // 名称
    @Column
    private String name;
    
    // 类型
    @Column
    private String type;
    
    // 是否系统管理员
    @Column
    private Boolean isSys;

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

    public Boolean getIsSys() {
        return isSys;
    }

    public void setIsSys(Boolean isSys) {
        this.isSys = isSys;
    }
}
