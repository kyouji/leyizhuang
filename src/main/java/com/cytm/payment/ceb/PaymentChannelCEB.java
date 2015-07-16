package com.cytm.payment.ceb;

import static com.csii.payment.client.core.CebMerchantSignVerify.merchantSignData_ABA;
import static com.csii.payment.client.core.CebMerchantSignVerify.merchantVerifyPayGate_ABA;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.cytm.payment.PaymentChannel;
import com.cytm.payment.util.PaymentUtil;

public class PaymentChannelCEB implements PaymentChannel{
    /*
     * 
     */
    private static final Logger paymentLogger = Logger.getLogger("paymentApi");
    /*
     * 
     */
    private static final String FIELD_SEPARATOR = "~|~";
    /*
     * 
     */
    private static final String FIELD_SEPARATOR_REG = "~\\|~";
    /*
     * 
     */
    private static final String PAYMETHOD_CEB = "CEB";
    
    /*
     * 
     */
    private static final String SUCCESSED = "AAAAAAA";

    @Override
    public String getPayFormData(HttpServletRequest request) {
        //TODO:此处需要修改订单号以及订单金额取得方式.
        //订单ID取得方式需要修改建议当前支付的订单号+支付记录号。以区分同一个订单的重新支付和直接支付
        String orderId = (String) request.getAttribute("orderNumber");
        String orderAmount = (String) request.getAttribute("totalPrice");
        //支付银行
        String payMethod = (String) request.getAttribute("payMethod");
        String commitUrl = "";
        StringBuilder plainData = new StringBuilder();
        if(PAYMETHOD_CEB.equals(payMethod)) {
            plainData.append("transId=IPER~|~merchantId=")
            .append(CEBPayConfig.INNER_MERCHANT_ID)
            .append("~|~");
            commitUrl = CEBPayConfig.INNER_B2C_URL;
        } else {
            plainData.append("transId=IPER~|~merchantId=")
            .append(CEBPayConfig.INTER_MERCHANT_ID)
            .append("~|~payBankNo=")
            .append(CEBPayConfig.INTER_B2C_BANK_CONFIG.get(payMethod)[0])
            .append("~|~");
            commitUrl = CEBPayConfig.INTER_B2C_URL;
        }
        
        String serverURL = PaymentUtil.getServerPath(request);
        
        plainData.append("orderId=").append(orderId).append("~|~")
        .append("transAmt=").append(orderAmount).append("~|~")
        .append("transDateTime=")
        .append(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())).append("~|~")
        .append("currencyType=01~|~customerName=~|~customerEMail=~|~")
        .append("merURL=").append(serverURL).append("order/pay/notify").append("~|~")
        .append("merURL1=").append(serverURL).append("order/pay/success").append("~|~")
        //TODO:以下字段如有需要,请修改
        //二级商户
        //.append("merSecName=").append("北市区店").append("~|~")
        //TODO:以下字段如有需要,请修改
        //商品信息
        //.append("productInfo=").append("测试商品").append("~|~")
        .append("payIp=~|~").append("msgExt=").append("").append("|")
        .append(CEBPayConfig.INTER_B2C_BANK_CONFIG.get(payMethod)[0]);
        
        String plain = plainData.toString();
        String signature = merchantSignData_ABA(plain);
        paymentLogger.info("PaymentChannelCEB->>Send:Plain:" + plain);
        paymentLogger.info("PaymentChannelCEB->>Send:Signature:" + signature);
        StringBuilder formData = new StringBuilder();        
        formData.append("<form id=\"cebcommit\"  name=\"cebcommit\" action=\"").append(commitUrl).append("\" method=\"POST\">");
        formData.append("<input name = \"TransName\" type=\"hidden\" value=\"IPER\"/>");
        formData.append("<input name = \"Plain\" type=\"hidden\" value=\"").append(plain).append("\"/>");
        formData.append("<input name = \"Signature\" type=\"hidden\" value=\"").append(signature).append("\"/>");
        //formData.append("<input type=\"submit\" value=\"支付订单\"/>");
        formData.append("</form>");
        formData.append("<script>document.forms[\"cebcommit\"].submit();</script>");
        return formData.toString();
    }

    @Override
    public void doResponse(HttpServletRequest request, JspWriter out) {
        String plainData = request.getParameter("Plain");
        String signature = request.getParameter("Signature");
        String notifyObject = "";
        paymentLogger.info("PaymentChannelCEB->>Receive:Plain:" + plainData);
        paymentLogger.info("PaymentChannelCEB->>Receive:Signature:" + signature);
        if(merchantVerifyPayGate_ABA(signature, plainData)) {
            paymentLogger.info("PaymentChannelCEB->>Receive:Accepted!");
            if(plainData.endsWith(FIELD_SEPARATOR)) {
                notifyObject = plainData.substring(0, plainData.length() - 3);
            }
            notifyObject = notifyObject.replaceAll("=", "\":\"").replaceAll(FIELD_SEPARATOR_REG, "\",\"");
            notifyObject = "{\"" + notifyObject + "\"}";
            JSONObject paymentResult = JSONObject.fromObject(notifyObject);
            String merchantId = paymentResult.getString("merchantId");
            String orderId = paymentResult.getString("orderId");
            String transDateTime = paymentResult.getString("transDateTime");
            String procStatus = "1";
            String serverURL = PaymentUtil.getServerPath(request);
            StringBuilder responsePlainData = new StringBuilder();
            responsePlainData.append("merchantId=").append(merchantId).append(FIELD_SEPARATOR)
            .append("orderId=").append(orderId).append(FIELD_SEPARATOR)
            .append("transDateTime=").append(transDateTime).append(FIELD_SEPARATOR)
            .append("procStatus=").append(procStatus).append(FIELD_SEPARATOR)
            .append("merURL2=").append(serverURL).append("jsp/paymentResultCEB.jsp");
            
            String responsePlain = responsePlainData.toString();
            String responseSignature = merchantSignData_ABA(responsePlain);
            try {
                paymentLogger.info("PaymentChannelCEB->>Response:Plain:" + responsePlain);
                paymentLogger.info("PaymentChannelCEB->>Response:Signature:" + responseSignature);
                StringBuilder responseContents = new StringBuilder();
                responseContents.append("Plain=").append(responsePlain)
                .append("\n").append("Signature=").append(responseSignature);
                out.print(responseContents.toString());
            } catch (IOException e) {
                //
            }
            
            String payResult = paymentResult.getString("respCode");
            //TODO：此部分需要调用相应接口修改订单状态
            if(SUCCESSED.equals(payResult) || "".equals(payResult)) {
                //支付成功
            } else {
                //支付失败
            }
        } else {
            paymentLogger.info("PaymentChannelCEB->>Receive:Rejected!");
        }
    }

}
