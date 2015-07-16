package com.cytm.payment.alipay.core;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cytm.payment.alipay.AlipayConfig;
import com.cytm.payment.alipay.sign.MD5;

public class AlipayRequest {
    //
    public static final String KEY_SIGN = "sign";
    public static final String KEY_SIGN_TYPE = "sign_type";
    public static final String BLANK_STRING = "";
    //
    /** 
     * 除去数组中的空值和签名参数
     * @param sArray 签名参数组
     * @return 去掉空值与签名参数后的新签名参数组
     */
    public static Map<String, String> paraFilter(Map<String, String> sArray) {
        Map<String, String> result = new HashMap<String, String>();
        if (sArray == null || sArray.size() <= 0) {
            return result;
        }

        for (String key : sArray.keySet()) {
            String value = sArray.get(key);
            if (value == null || value.equals(BLANK_STRING) 
                || key.equalsIgnoreCase(KEY_SIGN)
                || key.equalsIgnoreCase(KEY_SIGN_TYPE)) {
                continue;
            }
            result.put(key, value);
        }

        return result;
    }
    
    /** 
     * 把数组所有元素排序，并按照“参数=参数值”的模式用“&”字符拼接成字符串
     * @param params 需要排序并参与字符拼接的参数组
     * @return 拼接后字符串
     */
    public static String createLinkString(Map<String, String> params) {

        List<String> keys = new ArrayList<String>(params.keySet());
        Collections.sort(keys);

        String prestr = "";

        for (int i = 0; i < keys.size(); i++) {
            String key = keys.get(i);
            String value = params.get(key);

            if (i == keys.size() - 1) {//拼接时，不包括最后一个&字符
                prestr = prestr + key + "=" + value;
            } else {
                prestr = prestr + key + "=" + value + "&";
            }
        }

        return prestr;
    }
    
    /**
     * 生成要请求给支付宝的参数数组
     * @param sParaTemp 请求前的参数数组
     * @return 要请求的参数数组
     */
    public static Map<String, String> buildRequestPara(Map<String, String> sParaTemp) {
        //除去数组中的空值和签名参数
        Map<String, String> sPara = paraFilter(sParaTemp);
        //生成签名结果
        String mysign = buildRequestSign(sPara);

        //签名结果与签名方式加入请求提交参数组中
        sPara.put("sign", mysign);
        sPara.put("sign_type", AlipayConfig.SIGN_TYPE);

        return sPara;
    }
    
    /**
     * 生成签名结果
     * @param sPara 要签名的数组
     * @return 签名结果字符串
     */
    private static String buildRequestSign(Map<String, String> sPara) {
        String prestr = createLinkString(sPara); //把数组所有元素，按照“参数=参数值”的模式用“&”字符拼接成字符串
        String mysign = "";
        if(AlipayConfig.SIGN_TYPE.equals("MD5") ) {
            mysign = MD5.sign(prestr, AlipayConfig.KEY, AlipayConfig.CHARSET);
        }
        return mysign;
    }
}
