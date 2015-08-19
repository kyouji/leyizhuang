<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>收货地址</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<script src="/touch/js/jquery-1.9.1.min.js"></script>
<script src="/touch/js/common.js"></script>

<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/touch/css/address.css"/>
</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
  <div class="main">
    <p>收货地址</p>
    <a class="a1" href="javascript:history.go(-1);"><img src="/touch/images/back.png" height="22" /></a>
    <a class="a2" href="/touch"><img src="/touch/images/home.png" height="22" /></a>  </div>
</header>

<div class="main">
    <#if address_list??>
    <#list address_list as item>
        <div class="clear15"></div>
        <div class="member_check member_check11"  >
             <div class="member_1"><label>姓名：${item.receiverName!''}</label><span>电话：${item.receiverMobile!''}</span></div>
             <div class="member_2">地址：${item.detailAddress!''}</div>
        </div>
        <div class="member_check" >
            <ul>
              <li><a href="/touch/order/address/default?id=${item.id?c}"><img src="<#if item.isDefaultAddress>/touch/images/img1/icon_13.png<#else>/touch/images/img1/icon_13_1.png</#if>" width="20" /></a></li>
              <li class="l_1 l_2"><a href="/touch/order/address/default?id=${item.id?c}">默认地址</a></li>
              <li><a href="/touch/order/address/update?id=${item.id?c}"><img src="/touch/images/img1/icon_10.png" width="20"  /></a></li>
              <li class="l_1 l_2"><a href="/touch/order/address/update?id=${item.id?c}">编辑</a></li>
              <li><a href="/touch/order/address/delete?id=${item.id?c}"><img src="/touch/images/img1/icon_14.png" width="15" height="18"/></a></li>
              <li class="l_2"><a href="/touch//order/address/delete?id=${item.id?c}">删除</a></li>
            </ul>
         </div>
    </#list>
    </#if>
  
</div><!--main END-->

<div class="ok_mainbox">
    <p><a href="/touch/user/address/update">新增地址</a></p>
  </div>
</body>
</html>
