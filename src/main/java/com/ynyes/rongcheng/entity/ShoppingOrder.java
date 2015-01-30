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
    private Long statusCode;
    
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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public List<OrderItem> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public String getShippingName() {
        return shippingName;
    }

    public void setShippingName(String shippingName) {
        this.shippingName = shippingName;
    }

    public String getShippingPhone() {
        return shippingPhone;
    }

    public void setShippingPhone(String shippingPhone) {
        this.shippingPhone = shippingPhone;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public String getShippingType() {
        return shippingType;
    }

    public void setShippingType(String shippingType) {
        this.shippingType = shippingType;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public String getInvoiceTitle() {
        return invoiceTitle;
    }

    public void setInvoiceTitle(String invoiceTitle) {
        this.invoiceTitle = invoiceTitle;
    }

    public String getInvoiceContent() {
        return invoiceContent;
    }

    public void setInvoiceContent(String invoiceContent) {
        this.invoiceContent = invoiceContent;
    }

    public String getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(String invoiceType) {
        this.invoiceType = invoiceType;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Long getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(Long statusCode) {
        this.statusCode = statusCode;
    }

    public String getCancelReason() {
        return cancelReason;
    }

    public void setCancelReason(String cancelReason) {
        this.cancelReason = cancelReason;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getExpressCampany() {
        return expressCampany;
    }

    public void setExpressCampany(String expressCampany) {
        this.expressCampany = expressCampany;
    }

    public String getExpressNumber() {
        return expressNumber;
    }

    public void setExpressNumber(String expressNumber) {
        this.expressNumber = expressNumber;
    }

    public String getExpressUri() {
        return expressUri;
    }

    public void setExpressUri(String expressUri) {
        this.expressUri = expressUri;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public String getDeliveryPerson() {
        return deliveryPerson;
    }

    public void setDeliveryPerson(String deliveryPerson) {
        this.deliveryPerson = deliveryPerson;
    }

    public String getDistributionPerson() {
        return distributionPerson;
    }

    public void setDistributionPerson(String distributionPerson) {
        this.distributionPerson = distributionPerson;
    }

    public String getMoneyReceivePersion() {
        return moneyReceivePersion;
    }

    public void setMoneyReceivePersion(String moneyReceivePersion) {
        this.moneyReceivePersion = moneyReceivePersion;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Long getSortNumber() {
        return sortNumber;
    }

    public void setSortNumber(Long sortNumber) {
        this.sortNumber = sortNumber;
    }
}
