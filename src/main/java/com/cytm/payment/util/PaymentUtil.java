package com.cytm.payment.util;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;

import com.cytm.payment.PaymentChannel;
import com.cytm.payment.alipay.PaymentChannelAlipay;
import com.cytm.payment.ceb.CEBPayConfig;
import com.cytm.payment.ceb.PaymentChannelCEB;

public class PaymentUtil {
    private static RequestConfig config = null;
    private static final String PAYMENT_ALI = "ALI";

    public static String getPayFormData(HttpServletRequest request, HttpServletResponse response) {
        String payMethod = request.getParameter("payMethod");
        if(null == payMethod || "".equals(payMethod.trim())) {
            throw new IllegalArgumentException();
        }
        PaymentChannel paymentChannel = null;
        if(PAYMENT_ALI.equals(payMethod)) {
            paymentChannel = new PaymentChannelAlipay();
        } else if(CEBPayConfig.INTER_B2C_BANK_CONFIG.keySet().contains(payMethod)) {
            paymentChannel = new PaymentChannelCEB();
        } else {
            throw new IllegalArgumentException();
        }

        return paymentChannel.getPayFormData(request);        
    }
    
    public static String getServerPath(HttpServletRequest request) {
        String serverURL = request.getScheme() + "://";
        serverURL += request.getServerName();
        int port = request.getServerPort();
        if((request.isSecure() && port != 443) || port != 80) {
            serverURL += ":" + port;
        }
        String contextPath = request.getContextPath();
        serverURL += contextPath.endsWith("/") ? contextPath : contextPath + "/";
        
        return serverURL;
    }
    
    public static <T> T post(String url, List<NameValuePair> formParams, ResponseHandler<T> responseHandler,String charset) throws ClientProtocolException , IOException{
        HttpPost httpRequest = new HttpPost(url);
        httpRequest.setConfig(getRequestConfig());
        httpRequest.setEntity(new UrlEncodedFormEntity(formParams, charset));
        CloseableHttpResponse httpResponse = null;
        try {
            httpResponse = getClient().execute(httpRequest);
            return responseHandler.handleResponse(httpResponse);
        } catch (ClientProtocolException e) {
            httpRequest.abort();
            throw e;
        } catch (IOException e) {
            httpRequest.abort();
            throw e;
        } finally{
            if(httpResponse!=null){
                httpResponse.close();
            }
        }
    }
    
    private static RequestConfig getRequestConfig(){
        //可添加一个RequestConfig属性，构造方法中去实例化，就不用每次都实例化了
        if(null == config) {
            config = RequestConfig.custom()
                    .setConnectTimeout(10 * 1000)
                    .setSocketTimeout(20 * 1000)
                    .setConnectionRequestTimeout(10 * 1000)
                    .build();
        }
        
        return config;
    }
    
    public static CloseableHttpClient getClient(){
        PoolingHttpClientConnectionManager cm = new PoolingHttpClientConnectionManager();
        cm.setMaxTotal(20);
        cm.setDefaultMaxPerRoute(100);
        return HttpClients.custom().setConnectionManager(cm).build();
    }
}