package com.ynyes.rongcheng.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

/**
 * 商品类型
 * 
 * @author Sharon
 *
 */

@Entity
public class ProductType {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	// 类型名称
	@Column(unique=true)
	private String name;
	
	// 类型名称
    @Column(unique=true)
    private String parent;
    
    // 排序号
    @Column
    private Long sortNumber;
    
    // 关联的属性
    @OneToMany(orphanRemoval=true)
    @JoinColumn(name="productTypeId")
    private List<ProductTypeParameter> typeParamList;

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

    public String getParent() {
        return parent;
    }

    public void setParent(String parent) {
        this.parent = parent;
    }

    public Long getSortNumber() {
        return sortNumber;
    }

    public void setSortNumber(Long sortNumber) {
        this.sortNumber = sortNumber;
    }

    public List<ProductTypeParameter> getTypeParamList() {
        return typeParamList;
    }

    public void setTypeParamList(List<ProductTypeParameter> typeParamList) {
        this.typeParamList = typeParamList;
    }
}
