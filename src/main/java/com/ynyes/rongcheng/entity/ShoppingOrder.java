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
 * 订单
 *
 * 记录了订单详情
 * 
 * @author Sharon
 *
 */

@Entity
public class ShoppingOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    // 订单号
    @Column(unique=true)
    private String orderNumber;
    
    // 订单商品
    @OneToMany(orphanRemoval=true)
    @JoinColumn(name="shoppingOrderId")
    private List<OrderItem> orderItemList;
    
    // 收货地址
    @Column
    private String shippingAddress;
    
    // 收货人
    @Column
    private String shippingName;
    
    // 收货电话
    @Column
    private String shippingPhone;
    
    // 支付方式
    @Column
    private String paymentType;
    
    // 配送方式
    @Column
    private String shippingType;
    
    // 配送日期
    @Column
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date deliveryDate;
    
    // 发票抬头
    @Column
    private String invoiceTitle;
    
    // 发票内容
    @Column
    private String invoiceContent;
    
    // 发票类型
    @Column
    private String invoiceType;
    
    // 下单时间
    @Column
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date orderTime;
    
    // 订单状态
    @Column
    private Long stateCode;
    
    // 订单取消原因
    @Column
    private String cancelReason;
    
    // 用户
    @Column
    private String username;
    
    // 快递公司
    @Column
    private String expressCampany;
    
    // 快递单号
    @Column
    private String expressNumber;
    
    // 快递详情查询接口
    @Column
    private String expressUri;
    
    // 发货时间
    @Column
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date sendTime;
    
    // 配货人
    @Column
    private String deliveryPerson;
    
    // 配送人
    @Column
    private String distributionPerson;
    
    // 收款
    @Column
    private String moneyReceivePersion;
    
    // 订单总额
    @Column
    private Double totalPrice;
    
    // 排序号
    @Column
    private Long sortNumber;
}
