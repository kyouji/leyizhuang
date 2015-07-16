package com.cytm.payment.alipay;

public class AlipayConfig {
    // ISO-8859-1编码
    public static final String ISO_8859_1 = "ISO-8859-1";
    
    // 编码方式
//    public static final String CHARSET = "GBK";
    public static final String CHARSET = "UTF-8";
    
    // 合作身份者ID
    public static final String PARTNER = "2088711810860604";

    // 收款支付宝账号
    public static String SELLER_EMAIL = "2309643626@qq.com";
    
    // 收款支付宝ID
    public static String SELLER_ID = PARTNER;

    // 商户的私钥
    public static String KEY = "1sfhrsrza6k9hwy0y07c902lc9ayhpvs";

    // 签名方式
    public static String SIGN_TYPE = "MD5";
    
    // 纯担保交易
    public static final String CREATE_TRADE_SERVICE = "create_partner_trade_by_buyer";
    
    // 商品购买
    public static final String PAYMENT_TYPE = "1";
    
    // 合作伙伴名称
    public static final String SUBJECT = "云南车有同盟商贸有限公司";
    
    // 发货快递
    public static final String DEFAULT_EXPRESS = "EXPRESS";
    
    // 快递费用承担方,卖家承担
    public static final String SELLER_PAY = "SELLER_PAY";
    
    // 快递费用,线下经营免快递费
    public static final String LOGISTICS_FREE = "0";
    
    // 货物数量
    public static final String DEFAULT_QUANTITY = "1";
    
    // 用户确认收货过期自动确认收货时间
    public static final String RECORD_POST = "1d";
    
    // 支付超时时间
    public static final String PAY_POST = "1d";
    
    // 确认收货
    public static final String CONFIRM_GOODS_SERVICE = "send_goods_confirm_by_platform";
    
    // 发货快递
    public static final String DEFAULT_TRANSPORT_TYPE = "EXPRESS";
    
    /*
     * 支付请求地址
     */
    public static final String REAUESTURL = "https://mapi.alipay.com/gateway.do";
    
    /*
     * 支付宝消息验证地址
     */
    public static final String HTTPS_VERIFY_URL = REAUESTURL + "?service=notify_verify&";
}
