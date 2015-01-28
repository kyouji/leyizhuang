package com.ynyes.rongcheng.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 商品信息表
 * 
 * @author Sharon
 *
 */

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	// 商品编码
	@Column
	private String code;
	
	// 商品名称
	@Column(nullable=false)
	private String name;
	
	// 封面图片
    @Column
    private String coverImageUri;
    
    // 封面图片宽度
    @Column
    private Long coverImageWidth;
    
    // 封面图片高度
    @Column
    private Long coverImageHeight;
    
    // 轮播展示图片，多张图片以,隔开
    @Column
    private String showPictures;
	
	// 商品简介
	@Column
	private String brief;
	
	// 商品参数
	@OneToMany(orphanRemoval=true)
	@JoinColumn(name="productId")
	private List<ProductParameter> paramList;

	// 市场价
    @Column(nullable=false, scale=2)
    private Double marketPrice;
    
    // 销售价
    @Column(nullable=false, scale=2)
    private Double salePrice;
    
    // 商品最低价，不存在多个版本时和销售价相同，存在多个版本时为版本最低价
    @Column(scale=2)
    private Double priceMinimum;
    
    // 包含价值，销售靓号时会包含话费
    @Column(nullable=false, scale=2)
    private Double includePrice;
    
    // 促销
    @Column
    private String promotion;
    
    // 评价平均分
    @Column
    private Double averagePoints;
    
    // 商品配置
    @Column
    private String configuration;
    
    // 商品服务
    @Column
    private String service;
    
    // 商品详情
    @Column
    private String detail;
    
    // 是否上架
    @Column
    private Boolean isOnSale;
    
    // 商品剩余数量
    @Column
    private Long leftNumber;
    
    // 已售数量
    @Column
    private Long soldNumber;
    
    // 支持类型的3级分类: 父父类型->父类型->类型
    // 商品父父类型
    @Column
    private String grandFatherType;
    
    // 商品父类型
    @Column
    private String fatherType;
    
    // 商品类型
    @Column
    private String type;
    
    // 是否分版本定价
    @Column
    private Boolean isUseVersionPrice;
    
    // 商品价格单位
    @Column
    private String priceUnit;
    
    // 上架时间
    @Column
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @Temporal(TemporalType.DATE)
    private Date onSaleTime;
    
    // 创建日期
    @Column
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;
    
    // 商品标签
    @Column
    private String tags;
    
    // 商品版本
    @OneToMany(orphanRemoval=true)
    @JoinColumn(name="productId")
    private List<ProductVersion> versionList;
    
    // 商品组合
    @OneToMany(orphanRemoval=true)
    @JoinColumn(name="combinatedPid")
    private List<ProductCombination> combinationList;
    
    // 排序号
    @Column
    private Long sortNumber;
    
    // 是否支持限时抢购
    @Column
    private Boolean isFlashSale;
    
    // 限时抢购开始时间
    @Column
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @Temporal(TemporalType.DATE)
    private Date flashSaleStartTime;
    
    // 限时抢购结束时间
    @Column
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @Temporal(TemporalType.DATE)
    private Date flashSaleStopTime;
    
    // 限时抢购价格
    @Column(nullable=false, scale=2)
    private Double flashSalePrice;
    
    // 限时抢购剩余数量
    @Column
    private Long flashSaleLeftNumber;
    
    // 限时抢购已售数量
    @Column
    private Long flashSaleSoldNumber;
    
    // 是否是明星产品
    @Column
    private Boolean isStarProduct;
    
    // 明星产品排序号
    @Column
    private Long starProductOrderNumber;

    // 周一关注度
    @Column
    private Long mondayVisitNumber;
    
    // 周二关注度
    @Column
    private Long tuesdayVisitNumber;
    
    // 周三关注度
    @Column
    private Long wednesdayVisitNumber;
    
    // 周四关注度
    @Column
    private Long thursdayVisitNumber;
    
    // 周五关注度
    @Column
    private Long fridayVisitNumber;
    
    // 周六关注度
    @Column
    private Long saturdayVisitNumber;
    
    // 周日关注度
    @Column
    private Long sundayVisitNumber;
    
    // 品牌
    @Column
    private String brandName;
}
