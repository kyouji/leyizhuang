<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客-购物车</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />

<link href="/client/css/Order_information.css" rel="stylesheet" type="text/css" />
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/root/images/goods/zphk_logo.ico">
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/order_info.js"></script>
<script src="/client/js/Validform_v5.3.2_min.js"></script>
<script src="/client/js/jquery.cityselect.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    <!--初始化表单验证-->
    $("#form2").Validform({
        tiptype: 3
    });
    
    $("#address").citySelect({
        nodata:"none",
        <#if address?? && address.province??>prov: "${address.province!''}",</#if>
        <#if address?? && address.city??>city: "${address.city!''}",</#if>
        <#if address?? && address.disctrict??>dist: "${address.disctrict!''}",</#if>
        required:false
    }); 
});
</script>
</head>

<body>


<!--顶部-->
<#include "/client/common_header.ftl" />

<!--购物车进度条-->
<div class="progress_bar">
	<div class="bar_1">1、购物车</div>
    <div class="bar_2">2、订单信息</div>
    <div class="bar_3">3、支付完成</div>
</div>

    <!--收货地址-->
    <form id="form1" name="form1" action="/order/submit" method="post">
        <div class="shipping_address">
            <h3>收货地址</h3>
            <div class="address">
                <input id="input-address-id" type="hidden" name="addressId" value="1" datatype="n" nullmsg="请选择收货地址!"/>
                <#if user.shippingAddressList?? && user.shippingAddressList?size gt 0>
                    <#list user.shippingAddressList as address>
        	           <a class="address_1" href="javascript:;" onclick="javascript:selectAddress(this, ${address.id?c});">
                           <p>收货人：${address.receiverName!''}</p>
                           <p>收货地址：${address.province!''}${address.city!''}${address.disctrict!''}${address.detailAddress!''}</p>
                           <p>电话：${address.receiverMobile!''}</p>
                       </a>
                    </#list>
                </#if>
                <a href="/user/address/list" class="m_address">管理收货地址</a>
            </div>
        </div>
    
        <!--配送/支付方式-->
        <div class="delivery_payment">
            <h3>配送/支付方式</h3>
            <div class="delivery">配送方式：
                <input name="" type="radio" value="1" checked="checked" />普通配送
                <#if delivery_type_list?? && delivery_type_list?size gt 0 >
                    <select class="s1_text1_italic" name="deliveryTypeId" id="deliveryTypeId">
                        <#list delivery_type_list as item>
                        	<option value="${item.id?c}" selected="">${item.title}</option>
                        </#list>
                   </select>
                </#if>
            </div>
            <div class="payment_method">支付方式：
            <#if pay_type_list_third?? && (pay_type_list_third?size > 0)>
                <#list pay_type_list_third as pay_type>
                    <#assign onlineBank=false/>
                    <input class="pay_type_chk" name="payTypeId" checked="" type="radio" datatype="n" value="${pay_type.id?c!''}" fee="${pay_type.fee!'0'}" nullmsg="请选择支付方式!" />支付宝支付
                </#list>
            </#if>
                <div class="wechat">
                    <input name="payTypeId" type="radio" value="2"  class="pay"/>微信支付
                </div>
                <div class="online_banking">
    	           <#if pay_type_list_bank??>
            	       <input name="payTypeId" type="radio" value=""  />网银支付
            	       <ul class="online_banking_right">
                            <#list pay_type_list_bank as pay_type>
                                <#assign onlineBank=false/>
                                <li>
                                <input name="payTypeId" type="radio" value="${pay_type.id?c}" class="pay"/>
                                <img src="${pay_type.coverImageUri}" width="118px"/>
                                </li>
                            </#list>
                        </ul>
                    </#if>
                </div>
            </div>
        </div>
    
        <!--订单详情-->
        <div class="order_details">
            <h3>订单详情</h3>
            <div class="product_information">
                <a class="merchandise">商品</a>
                <a class="unit_price">单价（元）</a>
                <a class="quantity">数量</a>
                <a class="total_price">运费（元）</a>
                <a class="operating">合计（元）</a>
            </div>
        </div>
        <!--购物车详情-->
        <div class="cart_details">
        <#--
        <#assign totalQuantity=0>
        <#assign totalPrice=0>
        -->
            <#if selected_goods_list??>
                <#list selected_goods_list as sg>
                    <div class="category">
                        <ul>
                            <li class="picture_information">
                            	<img class="ss" src="${sg.goodsCoverImageUri}" width="108px"/>
                                <a href="/goods/${sg.goodsId}">${sg.goodsTitle}</a>
                            </li>
                            <li class="commodity_price">￥${sg.price?string("0.00")}</li>
                            <li class="commodity_price">${sg.quantity!''}</li>
                            <li class="commodity_price" id="payTypeFee">0</li>
                            <li class="operating_text">￥<span class="price">${(sg.price*sg.quantity)?string("0.00")}</span></li>
                        </ul>
                    </div>
                </#list>
            </#if>
               
            <!--积分-->
            <div class="integration">
                <div class="product_remarks">商品备注<br />
                    <input type="text" id="userMessage"/>
                </div>
                <div class="available_points">
            	   <input id="" type="checkbox" value="" /> 使用我的积分<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;（可用积分${total_point_limit!'0'}点）
                </div>
                <div class="points_800">
                	<input value="${total_point_limit!'0'}" id="pointUse" onchange="pointChange(this, $(this).val(), ${total_point_limit!'0'});"/>
                </div>
                <div class="integral_value">0</div>
            </div>
        </div>
        
        <!--实付款-->
        <div class="actual_payments">
            <div class="payments_1">实付款：￥<span id="totalPrice">${totalPrice?string('0.00')}</span></div>
        </div>
        
        <!--提交订单-->
        <div class="clear_num">
            <input class="clearing_num" type="submit" value="提交订单" style="margin-left: 90%;"/>
        </div>
    </form>
    <!--底部footer-->
    <#include "/client/common_footer.ftl" />
</body>
</html>
