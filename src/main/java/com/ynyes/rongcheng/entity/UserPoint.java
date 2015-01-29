package com.ynyes.rongcheng.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;


/**
 * 用户积分
 * 
 * @author Sharon
 *
 */

@Entity
public class UserPoint {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
	// 积分
	@Column
	private Long points;
	
	// 积分改变时间
	@Column
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date time;
	
	// 涉及订单
	@Column
	private String shoppingOrderNumber;
	
	// 详情
	@Column
	private String detail;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPoints() {
        return points;
    }

    public void setPoints(Long points) {
        this.points = points;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getShoppingOrderNumber() {
        return shoppingOrderNumber;
    }

    public void setShoppingOrderNumber(String shoppingOrderNumber) {
        this.shoppingOrderNumber = shoppingOrderNumber;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
