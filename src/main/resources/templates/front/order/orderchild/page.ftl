<#list shopping_order_list as order>
    <#assign total = 0>
        <#list order.orderItemList as item>
            <#assign total = total + item.quantity * item.price>
        </#list>
   <!-- <input type="hidden" id="goods-order-total" value=""/>-->
    <tr class="member_ddhe" style="border-bottom:1px solid #ddd; height:30px; line-height:30px; background:#f2f2f2 ;">
        <td width="331" class="member_dd_a"><em id="changebackground" style="width:55px;text-align:center;font-size:12px;float:left;color:#fff;height:40px;line-height:40px;background:#2881D5;display:block;">${status_all}</em><div class="fl" style="line-height:40px;">&nbsp;&nbsp;&nbsp;&nbsp;${order.orderTime}&nbsp;&nbsp;&nbsp;&nbsp;订单号：<i><#if order.orderNumber??>${order.orderNumber}</#if></i></div></td>
        <td colspan="4" class="member_dd_b"><div class="fr"><span style="color:#f60">￥${total?string("#.##")}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="/order/delorder?id=${order.id}">删除订单</a>&nbsp;|&nbsp;
            <a href="/order/cartstep?id=${order.id}">立即支付</a>&nbsp;|&nbsp;
        <#if order.id??><a href="/order/order_detail?id=${order.id}">订单详情</a></#if>&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
        <div class="clear"></div>
    </tr>
    <tr class="member_ddhe">
        <td width="331" class="member_dd_a" height="10">&nbsp;</td>
        <td width="81" class="member_dd_b" height="10">&nbsp;</td>
    </tr>
        <#list order.orderItemList as item>
          <tr ="member_ddhe">
            <td width="331" class="member_dd_a"><#if order.id??><span><a href="/product/${order.id}"></#if><#if item.productCoverImageUri??><img src="${item.productCoverImageUri}" width="76" height="76"></#if></a></span>
              <p><#if order.id??><a href="/product/${order.id}"></#if>
                 <#if item.productName??>${item.productName} </#if>
                 <#if item.productBrief??>${item.productBrief}</#if></p></td>
            <td width="81" class="member_dd_b" align="right">${item.price?string("#.##")}&nbsp;元</td>
            <td width="59" class="member_dd_b" align="right">X${item.quantity?c}</td>
            <td width="124" class="member_dd_b" align="right">总计:<span>￥${(item.quantity * item.price)?string("#.##")}</span>&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <div class="clear"></div>
          </tr>
        </#list>  
</#list>
           