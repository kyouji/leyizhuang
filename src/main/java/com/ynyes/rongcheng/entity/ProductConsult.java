package com.ynyes.rongcheng.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;


/**
 * 商品咨询
 * 
 * @author Sharon
 *
 */

@Entity
public class ProductConsult {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    // 咨询内容
    @Column
    private String content;
    
    // 咨询时间
    @Column
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date consultTime;
    
    // 咨询用户
    @Column
    private String username;
    
    // 咨询回复
    @Column
    private String reply;
    
    // 咨询的商品ID
    @Column
    private Long pid;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getConsultTime() {
        return consultTime;
    }

    public void setConsultTime(Date consultTime) {
        this.consultTime = consultTime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

}
