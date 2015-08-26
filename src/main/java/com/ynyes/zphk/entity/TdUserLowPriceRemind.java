package com.ynyes.zphk.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;


/**
 * 用户低价提醒表
 * 
 * @author Sharon
 *
 */

@Entity
public class TdUserLowPriceRemind {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
	// 用户名
	@Column
	private String username;
	
	// 商品Id
	@Column
	private Long goodsId;
	
	// 商品标题
    @Column
    private String goodsTitle;
    
    // 商品封面图片
    @Column
    private String goodsCoverImageUri;
    
    // 添加时间
    @Column
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date addTime;
	
	// 排序号
    @Column
    private Long sortId;

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

	public Long getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Long goodsId) {
		this.goodsId = goodsId;
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

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public Long getSortId() {
		return sortId;
	}

	public void setSortId(Long sortId) {
		this.sortId = sortId;
	}
 
}
