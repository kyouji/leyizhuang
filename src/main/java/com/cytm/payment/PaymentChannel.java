package com.cytm.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 支付渠道封装相关接口。
 */
public interface PaymentChannel {
    /*
     * 生成表单数据
     */
    public String getPayFormData(HttpServletRequest request);
    
    /*
     * 通知接收处理
     */
    public void doResponse(HttpServletRequest request, HttpServletResponse resp);
}
