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
    
    // 库存递减时机 分为下订单递减、支付完成递减、发货递减等
    @Column
    private Long numberDecType;
 
    // 商品类型
    @Column
    private String type;
  
    // 商品所有类型
    @Column
    private String typeAll;
    
    // 价格最小值
    @Column(nullable=false, scale=2)
    private Double priceMinimum;
    
    // 商品价格单位
    @Column
    private String priceUnit;
    
    // 上架时间
    @Column
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date onSaleTime;
    
    // 创建日期
    @Column
    @DateTimeFormat(pattern="yyyy-MM-dd")
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
    private Long starProductSortNumber;

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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCoverImageUri() {
        return coverImageUri;
    }

    public void setCoverImageUri(String coverImageUri) {
        this.coverImageUri = coverImageUri;
    }

    public Long getCoverImageWidth() {
        return coverImageWidth;
    }

    public void setCoverImageWidth(Long coverImageWidth) {
        this.coverImageWidth = coverImageWidth;
    }

    public Long getCoverImageHeight() {
        return coverImageHeight;
    }

    public void setCoverImageHeight(Long coverImageHeight) {
        this.coverImageHeight = coverImageHeight;
    }

    public String getShowPictures() {
        return showPictures;
    }

    public void setShowPictures(String showPictures) {
        this.showPictures = showPictures;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public List<ProductParameter> getParamList() {
        return paramList;
    }

    public void setParamList(List<ProductParameter> paramList) {
        this.paramList = paramList;
    }

    public Double getPriceMinimum() {
        return priceMinimum;
    }

    public void setPriceMinimum(Double priceMinimum) {
        this.priceMinimum = priceMinimum;
    }
    
    public String getPromotion() {
        return promotion;
    }

    public void setPromotion(String promotion) {
        this.promotion = promotion;
    }

    public Double getAveragePoints() {
        return averagePoints;
    }

    public void setAveragePoints(Double averagePoints) {
        this.averagePoints = averagePoints;
    }

    public String getConfiguration() {
        return configuration;
    }

    public void setConfiguration(String configuration) {
        this.configuration = configuration;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Boolean getIsOnSale() {
        return isOnSale;
    }

    public void setIsOnSale(Boolean isOnSale) {
        this.isOnSale = isOnSale;
    }

    public Long getNumberDecType() {
        return numberDecType;
    }

    public void setNumberDecType(Long numberDecType) {
        this.numberDecType = numberDecType;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    public String getTypeAll() {
        return typeAll;
    }

    public void setTypeAll(String typeAll) {
        this.typeAll = typeAll;
    }

    public String getPriceUnit() {
        return priceUnit;
    }

    public void setPriceUnit(String priceUnit) {
        this.priceUnit = priceUnit;
    }

    public Date getOnSaleTime() {
        return onSaleTime;
    }

    public void setOnSaleTime(Date onSaleTime) {
        this.onSaleTime = onSaleTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public List<ProductVersion> getVersionList() {
        return versionList;
    }

    public void setVersionList(List<ProductVersion> versionList) {
        this.versionList = versionList;
    }

    public List<ProductCombination> getCombinationList() {
        return combinationList;
    }

    public void setCombinationList(List<ProductCombination> combinationList) {
        this.combinationList = combinationList;
    }

    public Long getSortNumber() {
        return sortNumber;
    }

    public void setSortNumber(Long sortNumber) {
        this.sortNumber = sortNumber;
    }

    public Boolean getIsFlashSale() {
        return isFlashSale;
    }

    public void setIsFlashSale(Boolean isFlashSale) {
        this.isFlashSale = isFlashSale;
    }

    public Date getFlashSaleStartTime() {
        return flashSaleStartTime;
    }

    public void setFlashSaleStartTime(Date flashSaleStartTime) {
        this.flashSaleStartTime = flashSaleStartTime;
    }

    public Date getFlashSaleStopTime() {
        return flashSaleStopTime;
    }

    public void setFlashSaleStopTime(Date flashSaleStopTime) {
        this.flashSaleStopTime = flashSaleStopTime;
    }

    public Double getFlashSalePrice() {
        return flashSalePrice;
    }

    public void setFlashSalePrice(Double flashSalePrice) {
        this.flashSalePrice = flashSalePrice;
    }

    public Long getFlashSaleLeftNumber() {
        return flashSaleLeftNumber;
    }

    public void setFlashSaleLeftNumber(Long flashSaleLeftNumber) {
        this.flashSaleLeftNumber = flashSaleLeftNumber;
    }

    public Long getFlashSaleSoldNumber() {
        return flashSaleSoldNumber;
    }

    public void setFlashSaleSoldNumber(Long flashSaleSoldNumber) {
        this.flashSaleSoldNumber = flashSaleSoldNumber;
    }

    public Boolean getIsStarProduct() {
        return isStarProduct;
    }

    public void setIsStarProduct(Boolean isStarProduct) {
        this.isStarProduct = isStarProduct;
    }

    public Long getStarProductSortNumber() {
        return starProductSortNumber;
    }

    public void setStarProductSortNumber(Long starProductSortNumber) {
        this.starProductSortNumber = starProductSortNumber;
    }

    public Long getMondayVisitNumber() {
        return mondayVisitNumber;
    }

    public void setMondayVisitNumber(Long mondayVisitNumber) {
        this.mondayVisitNumber = mondayVisitNumber;
    }

    public Long getTuesdayVisitNumber() {
        return tuesdayVisitNumber;
    }

    public void setTuesdayVisitNumber(Long tuesdayVisitNumber) {
        this.tuesdayVisitNumber = tuesdayVisitNumber;
    }

    public Long getWednesdayVisitNumber() {
        return wednesdayVisitNumber;
    }

    public void setWednesdayVisitNumber(Long wednesdayVisitNumber) {
        this.wednesdayVisitNumber = wednesdayVisitNumber;
    }

    public Long getThursdayVisitNumber() {
        return thursdayVisitNumber;
    }

    public void setThursdayVisitNumber(Long thursdayVisitNumber) {
        this.thursdayVisitNumber = thursdayVisitNumber;
    }

    public Long getFridayVisitNumber() {
        return fridayVisitNumber;
    }

    public void setFridayVisitNumber(Long fridayVisitNumber) {
        this.fridayVisitNumber = fridayVisitNumber;
    }

    public Long getSaturdayVisitNumber() {
        return saturdayVisitNumber;
    }

    public void setSaturdayVisitNumber(Long saturdayVisitNumber) {
        this.saturdayVisitNumber = saturdayVisitNumber;
    }

    public Long getSundayVisitNumber() {
        return sundayVisitNumber;
    }

    public void setSundayVisitNumber(Long sundayVisitNumber) {
        this.sundayVisitNumber = sundayVisitNumber;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }
}
