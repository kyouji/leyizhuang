package com.ynyes.lyz.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * 门店库存实体类
 * 
 * @author dengxiao
 */

@Entity
public class TdDiySiteInventory {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	//门店id
	@Column
	private Long diySiteId;
	
	//门店名称
	@Column
	private String diySiteName;
	
	//商品id
	@Column
	private Long goodsId;
	
	//商品名称
	@Column
	private String username;
	
	//商品SKU
	@Column
	private String goodsCode;
	
	//库存量
	@Column
	private Long inventory;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getDiySiteId() {
		return diySiteId;
	}

	public void setDiySiteId(Long diySiteId) {
		this.diySiteId = diySiteId;
	}

	public String getDiySiteName() {
		return diySiteName;
	}

	public void setDiySiteName(String diySiteName) {
		this.diySiteName = diySiteName;
	}

	public Long getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Long goodsId) {
		this.goodsId = goodsId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}

	public Long getInventory() {
		return inventory;
	}

	public void setInventory(Long inventory) {
		this.inventory = inventory;
	}
}
