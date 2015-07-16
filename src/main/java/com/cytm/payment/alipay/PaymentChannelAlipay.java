package com.cytm.payment.alipay;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.apache.http.client.ClientProtocolException;
import org.apache.log4j.Logger;

import com.cytm.payment.PaymentChannel;
import com.cytm.payment.alipay.core.AlipayConfirmGoods;
import com.cytm.payment.alipay.core.AlipayConfirmGoodsHandler;
import com.cytm.payment.alipay.core.AlipayNotify;
import com.cytm.payment.alipay.core.AlipaySubmit;
import com.cytm.payment.util.PaymentUtil;

public class PaymentChannelAlipay implements PaymentChannel {
    private static final String ORDER_NO_PARA = "out_trade_no";
    private static final String ORDER_NO_TB_PARA = "trade_no";
    private static final String ORDER_STATUS_PARA = "trade_status";
    private static final String ISO_ENCODING = "ISO-8859-1";
    private static final int FIRST_TIME = 0;
    private static final int MAX_TIME = 10;

    private static final String NEW_LINE = System.getProperty("line.seperator",
            "\n");

    /*
     * 
     */
    private static final Logger paymentLogger = Logger.getLogger("paymentApi");

    @Override
    public String getPayFormData(HttpServletRequest request) {
        Map<String, String> requestParameters = new HashMap<String, String>();
        requestParameters.put(Constants.KEY_SERVICE,
                AlipayConfig.CREATE_TRADE_SERVICE);
        requestParameters.put(Constants.KEY_PARTNER, AlipayConfig.PARTNER);
        requestParameters.put(Constants.KEY_CHARSET, AlipayConfig.CHARSET);
        String serverPath = PaymentUtil.getServerPath(request);
        requestParameters.put(Constants.KEY_NOTIFY_URL, serverPath
                + "order/pay/notify");
        requestParameters.put(Constants.KEY_RETURN_URL, serverPath
                + "order/pay/success");

        // 订单ID取得方式需要修改建议当前支付的订单号+支付记录号。以区分同一个订单的重新支付和直接支付String orderId =
        requestParameters.put(Constants.KEY_OUT_TRADE_NO, (String) request.getAttribute("orderNumber"));

        requestParameters.put(Constants.KEY_SUBJECT, AlipayConfig.SUBJECT);
        requestParameters.put(Constants.KEY_PAYMENT_TYPE,
                AlipayConfig.PAYMENT_TYPE);
        requestParameters.put(Constants.KEY_LOGISTICS_TYPE,
                AlipayConfig.DEFAULT_EXPRESS);
        requestParameters.put(Constants.KEY_LOGISTICS_FEE,
                AlipayConfig.LOGISTICS_FREE);
        requestParameters.put(Constants.KEY_LOGISTICS_PAYMENT,
                AlipayConfig.SELLER_PAY);

        // 订单金额取得
        String orderAmount = (String) request.getAttribute("totalPrice");
        requestParameters.put(Constants.KEY_PRICE, orderAmount);
        requestParameters.put(Constants.KEY_QUANTITY,
                AlipayConfig.DEFAULT_QUANTITY);
        requestParameters.put(Constants.KEY_SELLER_EMAIL,
                AlipayConfig.SELLER_EMAIL);
        requestParameters.put(Constants.KEY_SELLER_ID, AlipayConfig.SELLER_ID);
        requestParameters.put(Constants.KEY_SELLER_ACCOUNT_NAME,
                AlipayConfig.SELLER_EMAIL);
        
        // TODO：
        // 此字段要修改
        requestParameters.put(Constants.KEY_BODY, "支付测试");
        requestParameters.put(Constants.KEY_TOTAL_FEE, orderAmount);
                // requestParameters.put(Constants.KEY_TBREC_POST,
                // AlipayConfig.RECORD_POST);
                // requestParameters.put(Constants.KEY_ITB_PAY, AlipayConfig.PAY_POST);
        return AlipaySubmit.buildRequestForm(requestParameters,
                Constants.METHOD_POST, Constants.PAY_BUTTON_NAME);
    }

    @Override
    public void doResponse(HttpServletRequest request, JspWriter out) {
        // 获取支付宝POST过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        StringBuilder loggeMessage = new StringBuilder();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter
                .hasNext();) {
            String name = iter.next();
            String[] values = requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
            // valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
            loggeMessage.append(name).append("=").append(valueStr).append("&");
            params.put(name, valueStr);
        }
        // 消息记录处理
        loggeMessage.setLength(loggeMessage.length() - 1);

        // 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
        // 商户订单号
        String out_trade_no = null;

        // 支付宝交易号
        String trade_no = null;

        // 交易状态
        String trade_status = null;
        try {
            out_trade_no = new String(request.getParameter(ORDER_NO_PARA)
                    .getBytes(ISO_ENCODING), AlipayConfig.CHARSET);
            trade_no = new String(request.getParameter(ORDER_NO_TB_PARA)
                    .getBytes(ISO_ENCODING), AlipayConfig.CHARSET);
            trade_status = new String(request.getParameter(ORDER_STATUS_PARA)
                    .getBytes(ISO_ENCODING), AlipayConfig.CHARSET);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return;
        }

        try {
            paymentLogger.info(String.format("AlipayNotify:{%s}.",
                    loggeMessage.toString()));
            // TODO:此部分需要根据状态调用何时接口操作订单状态
            // 获取支付宝的通知返回参数
            if (AlipayNotify.verify(params)) {// 验证成功
                paymentLogger.info("AlipayNotify:Accepted!");
                if (OrderStatus.WAIT_PAY.equals(trade_status)) {
                    // 该判断表示买家已在支付宝交易管理中产生了交易记录，但没有付款

                    // 判断该笔订单是否在商户网站中已经做过处理
                    // 如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                    // 如果有做过处理，不执行商户的业务程序
                    paymentLogger.info(String.format(
                            "AlipayNotify:{%s}֧�����Ѿ���¼֧������,���δ����!",
                            out_trade_no));
                } else if (OrderStatus.WAIT_SEND_GOODS.equals(trade_status)) {
                    // 该判断表示买家已在支付宝交易管理中产生了交易记录且付款成功，但卖家没有发货

                    // 判断该笔订单是否在商户网站中已经做过处理
                    // 如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                    // 如果有做过处理，不执行商户的业务程序
                    paymentLogger.info(String.format(
                            "AlipayNotify:{%s}����Ѹ���,ϵͳ�Զ�����!",
                            out_trade_no));
                    sendConfirmGoods(FIRST_TIME, trade_no);
                } else if (OrderStatus.WAIT_ONFIRM_GOODS.equals(trade_status)) {
                    // 该判断表示卖家已经发了货，但买家还没有做确认收货的操作

                    // 判断该笔订单是否在商户网站中已经做过处理
                    // 如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                    // 如果有做过处理，不执行商户的业务程序
                    paymentLogger.info(String.format(
                            "AlipayNotify:{%s}�ȴ����ȷ���ջ�!", out_trade_no));
                } else if (OrderStatus.FINISHED.equals(trade_status)) {
                    // 该判断表示买家已经确认收货，这笔交易完成

                    // 判断该笔订单是否在商户网站中已经做过处理
                    // 如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                    // 如果有做过处理，不执行商户的业务程序
                    paymentLogger
                            .info(String
                                    .format("AlipayNotify:{%s}�������������,�����ɹ�����,֧������ɻ���!",
                                            out_trade_no));
                } else {
                    // 交易中途结束
                    paymentLogger.info(String.format(
                            "AlipayNotify:{%s}������;����!", out_trade_no));
                }
                out.println("success");// 请不要修改或删除
            } else {// 验证失败
                paymentLogger.info("AlipayNotify:Rejected!");
                out.println("fail");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private boolean sendConfirmGoods(int timeCount, String trade_no) {
        try {
            @SuppressWarnings({ "unchecked", "rawtypes" })
            String result = PaymentUtil.post(AlipayConfig.REAUESTURL,
                    AlipayConfirmGoods.generatNameValuePair(trade_no),
                    new AlipayConfirmGoodsHandler(), AlipayConfig.CHARSET);
            paymentLogger.info(String.format("AlipayConfirmGoods:%s%s!",
                    NEW_LINE, result));

        } catch (ClientProtocolException e) {
            e.printStackTrace();
            if (timeCount < MAX_TIME) {
                sendConfirmGoods(timeCount++, trade_no);
            }
        } catch (IOException e) {
            e.printStackTrace();
            if (timeCount < MAX_TIME) {
                sendConfirmGoods(timeCount++, trade_no);
            }
        }
        return false;
    }

    static class OrderStatus {
        // 买家已在支付宝交易管理中产生了交易记录，但没有付款
        public static String WAIT_PAY = "WAIT_BUYER_PAY";
        // 买家已在支付宝交易管理中产生了交易记录且付款成功，但卖家没有发货
        public static String WAIT_SEND_GOODS = "WAIT_SELLER_SEND_GOODS";
        // 卖家已经发了货，但买家还没有做确认收货的操作
        public static String WAIT_ONFIRM_GOODS = "WAIT_BUYER_CONFIRM_GOODS";
        // 买家已经确认收货，这笔交易完成
        public static String FINISHED = "TRADE_FINISHED";
    }
}
