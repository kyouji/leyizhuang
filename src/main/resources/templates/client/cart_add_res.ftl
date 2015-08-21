<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>正品惠客-购物车</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />

<link rel="stylesheet" type="text/css" href="/client/css/Successfully_joined.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
</head>

<body>
<!--顶部-->
<#include "/client/common_header.ftl" />


<!--完成支付-->
<div class="complete_payment">
    <div class="success_join">
        <img src="/client/images/correct.png" />
        <p class="pay"> 商品加入购物车成功</p>
    </div>
    <div class="acceptable">
        <p><a href="javascript:history.go(-1);">继续购物</a></p>
    </div>
    <div class="now_settlement">
        <a href="/cart">立即去结算</a>
    </div>
</div>

<!--底部footer-->
<#include "/client/common_footer.ftl" />
</body>
</html>
