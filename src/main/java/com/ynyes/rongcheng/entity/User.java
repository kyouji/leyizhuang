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
	@OneToMany(orphanRemoval=true) 
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
	@Temporal(TemporalType.TIMESTAMP)
	private Date registerTime;
	
	// 最后登录时间
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@Temporal(TemporalType.TIMESTAMP)
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
	@Column
	private Long points;
	
	// 用户角色
	@Column
	private String role;

}
