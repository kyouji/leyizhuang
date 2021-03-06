package com.ynyes.lyz.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * 已选商品
 * 
 * @author Sharon
 *
 */

@Entity
public class TdCartGoods {

	public TdCartGoods(Long goodsId, Long quantity) {
		super();
		this.goodsId = goodsId;
		this.quantity = quantity;
	}

	public TdCartGoods() {
		super();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	// 用户
	@Column
	private String username;

	// 商品ID
	@Column
	private Long goodsId;

	// 商品标题
	@Column
	private String goodsTitle;

	// 商品封面
	@Column
	private String goodsCoverImageUri;

	// 商品数量
	@Column
	private Long quantity;
	
	//商品SKU
	@Column
	private String sku;

	// 虚拟价格
	@Column
	private Double price;

	// 实际价格
	@Column
	private Double realPrice;

	// 销售类型 0：正常销售 1：抢购 2：团购
	@Column
	private Integer saleType;

	// 是否选中，选中的商品将进行结算
	@Column
	private Boolean isSelected;

	// 是否是登陆用户
	@Column
	private Boolean isLoggedIn;

	// 分享用户id
	@Column
	private Long shareId;

	// 表示已选类型（目前：0. 代表商品；1. 代表产品券）
	@Column
	private Long type;

	// 使用产品券的数量，默认为0
	@Column
	private Long couponNumber;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getSaleType() {
		return saleType;
	}

	public void setSaleType(Integer saleType) {
		this.saleType = saleType;
	}

	public Long getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Long goodsId) {
		this.goodsId = goodsId;
	}

	public Long getShareId() {
		return shareId;
	}

	public void setShareId(Long shareId) {
		this.shareId = shareId;
	}

	public String getGoodsTitle() {
		return goodsTitle;
	}

	public void setGoodsTitle(String goodsTitle) {
		this.goodsTitle = goodsTitle;
	}

	public String getGoodsCoverImageUri() {
		return goodsCoverImageUri;
	}

	public void setGoodsCoverImageUri(String goodsCoverImageUri) {
		this.goodsCoverImageUri = goodsCoverImageUri;
	}

	public Long getQuantity() {
		return quantity;
	}

	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Boolean getIsSelected() {
		return isSelected;
	}

	public void setIsSelected(Boolean isSelected) {
		this.isSelected = isSelected;
	}

	public Boolean getIsLoggedIn() {
		return isLoggedIn;
	}

	public void setIsLoggedIn(Boolean isLoggedIn) {
		this.isLoggedIn = isLoggedIn;
	}

	public Long getType() {
		return type;
	}

	public void setType(Long type) {
		this.type = type;
	}

	public Double getRealPrice() {
		return realPrice;
	}

	public void setRealPrice(Double realPrice) {
		this.realPrice = realPrice;
	}

	public Long getCouponNumber() {
		return couponNumber;
	}

	public void setCouponNumber(Long couponNumber) {
		this.couponNumber = couponNumber;
	}

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}
}
