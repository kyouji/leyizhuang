package com.cytm.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

public interface PaymentChannel {
    public String getPayFormData(HttpServletRequest request);
    
    public void doResponse(HttpServletRequest request, JspWriter out);
}
