package com.cytm.payment.ceb;

import java.util.HashMap;
import java.util.Map;

public class CEBPayConfig {
    /*
     * 表单数据编码
     */
    public static final String CHARSET = "GBK";
    
    /*
     * 本行支付提交商户ID
     */
    public static final String INNER_MERCHANT_ID = "396010000031";
    
    /*
     * 跨行支付提交商户ID
     */
    public static final String INTER_MERCHANT_ID = "396010000030";
    
    /*
     * 本行支付提交URL
     */
    //public static final String INNER_B2C_URL = "https://111.205.51.141/per/preEpayLogin.do?_locale=zh_CN";
    public static final String INNER_B2C_URL = "https://www.cebbank.com/per/preEpayLogin.do?_locale=zh_CN";
    
    /*
     * 跨行支付提交URL
     */
    //public static final String INTER_B2C_URL = "https://111.205.51.141/per/preEpayLogin2.do?_locale=zh_CN";
    public static final String INTER_B2C_URL = "https://www.cebbank.com/per/preEpayLogin2.do?_locale=zh_CN";
    
    /*
     * 跨行支付行号以及名称对应关系
     */
    public static final Map<String, String[]> INTER_B2C_BANK_CONFIG = new HashMap<String, String[]>();

    static {
        INTER_B2C_BANK_CONFIG.put("CEB", new String [] {"36", "光大银行"});//光大银行
        INTER_B2C_BANK_CONFIG.put("CIB", new String [] {"09", "兴业银行"});//兴业银行
        INTER_B2C_BANK_CONFIG.put("CMBC", new String [] {"12", "民生银行"});//民生银行
        INTER_B2C_BANK_CONFIG.put("HXB", new String [] {"13", "华夏银行"});//华夏银行
        INTER_B2C_BANK_CONFIG.put("BOJ", new String [] {"15", "北京银行"});//北京银行
        INTER_B2C_BANK_CONFIG.put("SPDB", new String [] {"16", "浦发银行"});//浦发银行
        INTER_B2C_BANK_CONFIG.put("CGB", new String [] {"19", "广发银行"});//广发银行
        INTER_B2C_BANK_CONFIG.put("BCO", new String [] {"21", "交通银行"});//交通银行
        INTER_B2C_BANK_CONFIG.put("ICBC", new String [] {"25", "工商银行"});//工商银行
        INTER_B2C_BANK_CONFIG.put("CCB", new String [] {"27", "建设银行"});//建设银行
        INTER_B2C_BANK_CONFIG.put("CMB", new String [] {"28", "招商银行"});//招商银行
        INTER_B2C_BANK_CONFIG.put("ABC", new String [] {"29", "中国农业银行"});//农业银行
        INTER_B2C_BANK_CONFIG.put("CECB", new String [] {"33", "中信银行"});//中信银行
        INTER_B2C_BANK_CONFIG.put("BJRCB", new String [] {"40", "北京农村商业银行"});//北京农村商业银行
        INTER_B2C_BANK_CONFIG.put("BOC", new String [] {"45", "中国银行"});//中国银行
        INTER_B2C_BANK_CONFIG.put("PSBC", new String [] {"46", "邮储银行"});//邮储银行
        INTER_B2C_BANK_CONFIG.put("NJCB", new String [] {"49", "南京银行"});//南京银行
        INTER_B2C_BANK_CONFIG.put("SDB", new String [] {"50", "深圳发展银行"});//深圳发展银行
        INTER_B2C_BANK_CONFIG.put("HZB", new String [] {"51", "杭州银行"});//杭州银行
        INTER_B2C_BANK_CONFIG.put("CZB", new String [] {"53", "浙商银行"});//浙商银行
        INTER_B2C_BANK_CONFIG.put("BOSH", new String [] {"54", "上海银行"});//上海银行
        INTER_B2C_BANK_CONFIG.put("CBHB", new String [] {"55", "渤海银行"});//渤海银行
        INTER_B2C_BANK_CONFIG.put("SRCB", new String [] {"69", "上海农村商业银行"});//上海农村商业银行
    }
}
