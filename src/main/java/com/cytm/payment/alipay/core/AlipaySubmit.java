package com.cytm.payment.alipay.core;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cytm.payment.alipay.AlipayConfig;

public class AlipaySubmit {
    /**
     * 建立请求，以表单HTML形式构造（默认）
     * @param sParaTemp 请求参数数组
     * @param strMethod 提交方式。两个值可选：post、get
     * @param strButtonName 确认按钮显示文字
     * @return 提交表单HTML文本
     */
    public static String buildRequestForm(Map<String, String> sParaTemp, String strMethod, String strButtonName) {
        //待请求参数数组
        Map<String, String> sPara = AlipayRequest.buildRequestPara(sParaTemp);
        List<String> keys = new ArrayList<String>(sPara.keySet());

        StringBuffer sbHtml = new StringBuffer();

        sbHtml.append("<form id=\"alipaysubmit\" name=\"alipaysubmit\" action=\"" + AlipayConfig.REAUESTURL
                      + "\" method=\"" + strMethod + "\">");

        for (int i = 0; i < keys.size(); i++) {
            String name = keys.get(i);
            String value = sPara.get(name);

            sbHtml.append("<input type=\"hidden\" name=\"" + name + "\" value=\"" + value + "\"/>");
        }

        //submit按钮控件请不要含有name属性
        //sbHtml.append("<input type=\"submit\" value=\"" + strButtonName + "\" style=\"display:none;\"></form>");
        sbHtml.append("</form>");
        sbHtml.append("<script>document.forms[\"alipaysubmit\"].submit();</script>");

        return sbHtml.toString();
    }
}
