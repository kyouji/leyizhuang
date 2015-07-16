package com.cytm.payment.alipay.core;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import com.cytm.payment.alipay.AlipayConfig;
import com.cytm.payment.alipay.Constants;

public class AlipayConfirmGoods {
    private static final String LOGISTICS_NAME = "EXPRESS";
    /**
     * MAP类型数组转换成NameValuePair类型
     * @param properties  MAP类型数组
     * @return NameValuePair类型数组
     */
    public static List<NameValuePair> generatNameValuePair(String trade_no) {
        Map<String, String> properties = new HashMap<String, String>();
        properties.put(Constants.KEY_SERVICE, AlipayConfig.CONFIRM_GOODS_SERVICE);
        properties.put(Constants.KEY_PARTNER, AlipayConfig.PARTNER);
        properties.put(Constants.KEY_CHARSET, AlipayConfig.CHARSET);
        properties.put(Constants.KEY_TRADE_NO, trade_no);
        properties.put(Constants.KEY_LOGISTICS_NAME, LOGISTICS_NAME);
        properties.put(Constants.KEY_INVOICE_NO, AlipayConfig.PARTNER + trade_no);
        properties.put(Constants.KEY_LOGISTICS_TYPE, AlipayConfig.DEFAULT_EXPRESS);
        properties.put(Constants.KEY_CREATE_TRANSPORT_TYPE, AlipayConfig.DEFAULT_TRANSPORT_TYPE);
        Map<String, String> realParameters = AlipayRequest.buildRequestPara(properties);
        List<NameValuePair> nameValuePair = new ArrayList<NameValuePair>(realParameters.size());
        int i = 0;
        for (Map.Entry<String, String> entry : realParameters.entrySet()) {
            nameValuePair.add(i, new BasicNameValuePair(entry.getKey(), entry.getValue()));
            i++;
        }

        return nameValuePair;
    }

}
