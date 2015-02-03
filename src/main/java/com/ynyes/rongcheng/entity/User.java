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

import org.springframework.format.annotation.DateTimeFormat;


/**
 * 用户
 * 
 * 储存所有用户信息
 * 
 * @author Sharon
 *
 */

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
	// 收货地址
	@OneToMany
	@JoinColumn(name="userId")
	private List<ShippingAddress> shippingAddressList;
	
	// 用户头像
	@Column
	private String headImageUri;
	
	// 用户名
	@Column(nullable=false, unique=true)
	private String username;
	
	// 昵称
    @Column
    private String nickname;
	
	// 密码
	@Column(nullable=false)
	private String password;
	
	// 真实姓名
	@Column
	private String realName;
	
	// 性别
	@Column
	private String sex;
	
	// 生日
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	
	// 注册时间
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date registerTime;
	
	// 最后登录时间
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date lastLoginTime;
	
	// 身份证号码
	@Column
	private String identity;
	
	// 手机号码
	@Column
	private String mobile;
	
	// 手机是否已验证
	@Column
	private Boolean isMobileValidated;
	
	// 电话号码
	@Column
	private String telephone;
	
	// 电子邮箱
	@Column
	private String email;
	
	// 电子邮箱是否验证
	@Column
	private Boolean isEmailValidated;

	// 省
	@Column
	private String province;
	
	// 市
	@Column
	private String city;
	
	// 区
	@Column
	private String district;
	
	// 详细地址
    @Column
    private String detailAddress;
    
    // QQ
    @Column
    private String qq;
	
	// 账户是否使能
	@Column
	private Boolean isEnable;
	
	// 账户积分
	@OneToMany
	@JoinColumn(name="userId")
	private List<UserPoint> pointList;
	
	// 用户角色
	@Column
	private String role;

	// 收藏的商品
	@Column
    private String collectedProductIds;
	
	// 浏览记录
    @Column
    private String recentVisitedProductIds;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<ShippingAddress> getShippingAddressList() {
        return shippingAddressList;
    }

    public void setShippingAddressList(List<ShippingAddress> shippingAddressList) {
        this.shippingAddressList = shippingAddressList;
    }

    public String getHeadImageUri() {
        return headImageUri;
    }

    public void setHeadImageUri(String headImageUri) {
        this.headImageUri = headImageUri;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Boolean getIsMobileValidated() {
        return isMobileValidated;
    }

    public void setIsMobileValidated(Boolean isMobileValidated) {
        this.isMobileValidated = isMobileValidated;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getIsEmailValidated() {
        return isEmailValidated;
    }

    public void setIsEmailValidated(Boolean isEmailValidated) {
        this.isEmailValidated = isEmailValidated;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public Boolean getIsEnable() {
        return isEnable;
    }

    public void setIsEnable(Boolean isEnable) {
        this.isEnable = isEnable;
    }

    public List<UserPoint> getPointList() {
        return pointList;
    }

    public void setPointList(List<UserPoint> pointList) {
        this.pointList = pointList;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getCollectedProductIds() {
        return collectedProductIds;
    }

    public void setCollectedProductIds(String collectedProductIds) {
        this.collectedProductIds = collectedProductIds;
    }

    public String getRecentVisitedProductIds() {
        return recentVisitedProductIds;
    }

    public void setRecentVisitedProductIds(String recentVisitedProductIds) {
        this.recentVisitedProductIds = recentVisitedProductIds;
    }
}
