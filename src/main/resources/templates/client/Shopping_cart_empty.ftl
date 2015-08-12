<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客-购物车</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />

<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link href="/client/css/Shopping_cart_empty.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--顶部-->
<#include "/client/common_user_header.ftl" />

<!--购物车进度条-->
<div class="progress_bar">
	<div class="bar_1">1、购物车</div>
    <div class="bar_2">2、订单信息</div>
    <div class="bar_3">3、支付完成</div>
</div>
<div class="product_information">
	<a class="merchandise">商品</a>
    <a class="unit_price">单价（元）</a>
    <a class="quantity">数量</a>
    <a class="total_price">总价（元）</a>
    <a class="operating">操作</a>
</div>


<!--空购物车-->
<div class="empty">
	<img src="images/empty_shopcar.png" />
    <div class="right">
        <p class="pay">您的购物车还是空的，<br />
			赶快去选购心怡的商品吧！
        </p>
        <p class="acceptable"><a href="#">立即去购物 >></a></p>
    </div>
</div>


<!--底部footer-->
<div class="footerall">
<div class="footer_iconsall">
	<div class="footer_icons">
    	<dl>
        	<dt><img src="images/icons-footer1.png" /></dt>
            <dd>闪电发货</dd>
        </dl>
        <dl>
        	<dt><img src="images/icons-footer2.png" /></dt>
            <dd>全场正品</dd>
        </dl>
        <dl>
        	<dt><img src="images/icons-footer3.png" /></dt>
            <dd>无理由退货</dd>
        </dl>
        <dl>
        	<dt><img src="images/icons-footer4.png" /></dt>
            <dd>全场包邮</dd>
        </dl>
        <dl>
        	<dt><img src="images/icons-footer5.png" /></dt>
            <dd>货到付款</dd>
        </dl>
        <dl>
        	<dt><img src="images/icons-footer6.png" /></dt>
            <dd>正规发票</dd>
        </dl>
        <dl>
        	<dt><img src="images/icons-footer7.png" /></dt>
            <dd>快速售后</dd>
        </dl>
    </div>    
</div>

<div class="footer_link">
    	<ul>
        	<li><a href="#" title="">关于我们</a></li>
            <li><a href="#" title="">关于惠客</a></li>
            <li><a href="#" title="">业务合作</a></li>
            <li><a href="#" title="">高薪诚聘</a></li>
            <li><a href="#" title="">惠客会员积分</a></li>
        </ul>
        <ul>
        	<li><a href="#" title="">特色服务</a></li>
            <li><a href="#" title="">免费上门取件维修</a></li>
            <li><a href="#" title="">自提点门店</a></li>
            <li><a href="#" title="">大宗客户直通车</a></li>
            <li><a href="#" title="">延保服务</a></li>
        </ul>
        <ul>
        	<li><a href="#" title="">支付方式</a></li>
            <li><a href="#" title="">分期付款</a></li>
            <li><a href="#" title="">货到付款</a></li>
        </ul>
        <ul>
        	<li><a href="#" title="">配送方式</a></li>
            <li><a href="#" title="">免费送货上门</a></li>
            <li><a href="#" title="">3小时及时达</a></li>
            <li><a href="#" title="">全国包邮</a></li>
            <li><a href="#" title="">全省次日达</a></li>
        </ul>
        <ul>
			<li><a href="#" title="">售后服务</a></li>
            <li><a href="#" title="">售后地址</a></li>
            <li><a href="#" title="">售后服务说明</a></li>
            <li><a href="#" title="">维修价格表</a></li>
            <li><a href="#" title="">刷机升级</a></li>
        </ul>
        <ul>
            <li><a href="#" title="">常见问题</a></li>
            <li><a href="#" title="">手机小百科</a></li>
            <li><a href="#" title="">如何咨询评价商品</a></li>
            <li><a href="#" title="">投诉建议</a></li>
            <li><a href="#" title="">购机流程</a></li>
        </ul>
    </div>
    

<div class="footerall_copyall">
    	<div class="footerall_copy">
        	友情链接：<a href="#" title="">曲靖信息港</a><a href="#" title="">宝善街网</a> <br />
            <span>Copyright©2006-2014 All Rights Reserved 丫丫网 版权所有 滇ICP备07004173号</span>
		</div>
</div>    
    
    
</div>

</body>
</html>
