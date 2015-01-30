package com.ynyes.rongcheng.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * 属性表
 * 
 * @author Sharon
 *
 */

@Entity
public class Parameter {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	// 分类，方便进行查找
	@Column
	private String type;
	
	// 属性名称
	@Column(nullable=false)
	private String name;
	
	// 选择值或者用户手动输入值
    @Column
    private Boolean isValueInputByChoose;
    
    // 是否可检索
    @Column
    private Boolean isSearchable;
    
    // 单选还是复选
    @Column
    private Boolean isSingleValue;
    
    // 值列表，以逗号隔开
    @Column
    private String valueList;
    
    // 排序号
    @Column
    private Long sortNumber;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getIsValueInputByChoose() {
        return isValueInputByChoose;
    }

    public void setIsValueInputByChoose(Boolean isValueInputByChoose) {
        this.isValueInputByChoose = isValueInputByChoose;
    }

    public Boolean getIsSearchable() {
        return isSearchable;
    }

    public void setIsSearchable(Boolean isSearchable) {
        this.isSearchable = isSearchable;
    }

    public Boolean getIsSingleValue() {
        return isSingleValue;
    }

    public void setIsSingleValue(Boolean isSingleValue) {
        this.isSingleValue = isSingleValue;
    }

    public String getValueList() {
        return valueList;
    }

    public void setValueList(String valueList) {
        this.valueList = valueList;
    }

    public Long getSortNumber() {
        return sortNumber;
    }

    public void setSortNumber(Long sortNumber) {
        this.sortNumber = sortNumber;
    }
}
