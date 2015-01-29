package com.ynyes.rongcheng.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 价格生命周期表
 * 
 * @author Sharon
 *
 */

@Entity
public class PriceLifetime {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    // 商品ID
    @Column
    private Long pid;
    
    // 商品版本ID
    @Column
    private Long vid;
    
    // 价格
    @Column(nullable=false, scale=2)
    private Double price;
    
    // 价格开始时间
    @Column
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @Temporal(TemporalType.DATE)
    private Date priceStartTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public Long getVid() {
        return vid;
    }

    public void setVid(Long vid) {
        this.vid = vid;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getPriceStartTime() {
        return priceStartTime;
    }

    public void setPriceStartTime(Date priceStartTime) {
        this.priceStartTime = priceStartTime;
    }
}
