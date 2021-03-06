<!DOCTYPE html>
<html lang="zh-CN" class="bgc-f3f4f6">
    <head>
        <meta charset="UTF-8">
        <meta name="keywords" content="">
        <meta name="copyright" content="" />
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        <title>乐易装</title>
        <!-- css -->
        <link rel="stylesheet" type="text/css" href="/client/css/my_base.css"/>
        <link rel="stylesheet" type="text/css" href="/client/css/x_common.css"/>
        <link rel="stylesheet" type="text/css" href="/client/css/x_order_manage.css"/>
        <!-- js -->
        <script type="text/javascript" src="/client/js/jquery-1.11.0.js"></script>
        <script type="text/javascript" src="/client/js/order_pay.js"></script>
    </head>
    <body class="bgc-f3f4f6">
        <#-- 引入警告提示样式 -->
        <#include "/client/common_warn.ftl">
        <#-- 引入等待提示样式 -->
        <#include "/client/common_wait.ftl"> 
        <!-- 头部 -->
        <header>
            <a class="back" href="/"></a>
            <p>填写订单</p>
        </header>
        <!-- 头部 END -->
        
        <!-- 填写订单 -->
        <article>
            <!-- 用户信息 -->
            <#if address??>
                <div class="receiver-info">    
                    <div class="div1">
                        <div class="div1-1">收货人：<span>${address.receiverName!''}</span></div>
                        <div class="div1-2">电话：
                            <span>
                                <#if address.receiverMobile??&&address.receiverMobile?length==11>
                                    ${address.receiverMobile[0..2]}****${address.receiverMobile[7..10]}
                                </#if>
                            </span>
                        </div>
                    </div>
                    <a class="go-target" href="选择收货地址.html">
                        <div class="div2">收货地址：<span>${address.city!''}${address.district!''}${address.subdistrict!''}${address.detail!''}</span></div>
                    </a>
                </div>
            <#else>
                <a href="/order/add/address">添加收货地址</a>
            </#if>
            <!-- 编辑订单 -->
            <article class="fill-order-list">
                <!-- 商品清单 -->
                <#if selected_list??>
                    <section class="pro-list">
                        <a class="div1" href="/order/selected">
                            <#list selected_list as item>
                                <#-- 此处实际只能放入3个已选的图片 -->
                                <#if item_index lt 3>
                                    <div class="img"><img src="${item.goodsCoverImageUri!''}" alt="产品图片"></div>
                                </#if>
                            </#list>
                            <div class="total">共${selected_list?size}件</div>
                        </a>
                    </section>
                </#if>
                <!-- 送货上门 -->
                <section class="delivery">
                    <div class="div1">
                        <label>配送方式</label>
                        <a class="delivery-method" href="/order/delivery"><#if deliveryId??&&deliveryId==1>送货上门<#else>门店自提</#if></a>
                    </div>
                    <div class="div2">${order_deliveryDate!''}  ${order_deliveryDetail!''}</div>
                </section>
                <!-- 支付方式 -->
                <section class="pay-method">
                    <label>支付方式</label>
                    <a class="target" href="/order/paytype"><#if pay_type??>${pay_type.title!''}</#if></a>
                </section>
                <!-- 发票信息 -->
                <section class="invoice-info">
                    <label>发票信息</label>
                    <div>联系门店<#if diySite??>（${diySite.serviceTele!''}）</#if></div>
                </section>
                <!-- 留言 -->
                <section class="leave-message">
                    <input id="remark" onblur="userRemark('${remark!''}');" type="text" maxlength="50" value="${remark!''}" placeholder="给商家留言">
                </section>
                <!-- 优惠劵 -->
                <section class="coupon">
                    <div class="div1">
                        <label>产品劵</label>
                        <a class="target" <#if !(isCoupon??&&isCoupon==false)>href="/order/coupon/1"</#if>>
                            <#if isCoupon??&&isCoupon==false>
                                                                                禁止使用
                            <#else>
                                <#if product_coupon_list??&&product_coupon_list?size gt 0>
                                    <#if product_used??&&product_used?size gt 0>
                                        ${product_used?size}张
                                    <#else>
                                                                                               未使用
                                    </#if>
                                <#else>
                                                                                    无可用
                                </#if>
                            </#if>
                        </a>
                    </div>
                    <div class="div1">
                        <label>现金劵</label>
                        <a class="target" <#if !(isCoupon??&&isCoupon==false)>href="/order/coupon/0"</#if>>
                            <#if isCoupon??&&isCoupon==false>
                                                                                禁止使用
                            <#else>
                                <#if no_product_coupon_list??&&no_product_coupon_list?size gt 0>
                                    <#if no_product_used??&&no_product_used?size gt 0>
                                        ${no_product_used?size}张
                                    <#else>
                                                                                               未使用
                                    </#if>
                                <#else>
                                                                                    无可用
                                </#if>
                            </#if>
                        </a>
                    </div>
                    <#--
                    <div class="div2">
                        <label>钱包余额</label>
                        <div class="wallet-balance">
                            <div class="first">共￥<span>20.00</span>，本单可用<strong>￥<span>20.00</span></strong></div>
                            <div class="checked"></div>
                        </div>
                    </div>
                    -->
                </section>
                <#--
                <script type="text/javascript">
                    $(document).ready(function(){
                        var onOff = true;
                        $(".checked").click(function(){
                            if(onOff){
                                $(this).addClass("active");
                            }else{
                                $(this).removeClass("active");
                            }
                            onOff = !onOff;
                        });
                    });
                </script>
                -->
                <!-- 商品费用 -->
                <section class="pro-price">
                    <div class="div1">
                        <label>商品金额</label>
                        <div>￥<#if totalPrice??>${totalPrice?string("0.00")}<#else>0.00</#if></div>
                    </div>
                    <div class="div1">
                        <label>运费</label>
                        <div>￥<#if deliveryFee??>${deliveryFee?string("0.00")}<#else>0.00</#if></div>
                    </div>
                </section>
            </article>
        </article>
        <!-- 填写订单 END -->
        
        <div class="clear h50"></div>
        
        <!-- 底部 -->
        <footer class="fill-order-foot">
            <div class="disbur">实付款：￥<span>${(totalPrice+deliveryFee)?string("0.00")}</span></div>
            <a class="btn-clearing" id="buyNow" href="javascript:orderPay();">去支付</a>
        </footer>
        <!-- 底部 END -->
        
    </body>
</html>