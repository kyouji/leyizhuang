<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="<#if productCategory??>${productCategory.seoKeywords!''}</#if>" />
<meta name="description" content="<#if productCategory??>${productCategory.seoDescription!''}</#if>" />
<meta name="copyright" content="<#if site??>${site.copyright!''}</#if>" /> 
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客</title>
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/index.js"></script>
<script src="/client/js/goods.js"></script>
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link href="/client/css/list.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/root/images/goods/zphk_logo.ico">
<link rel="stylesheet" type="text/css" href="/client/css/lrtk.css" />
<script type="text/javascript">
    <!-- 跳转到下一页的方法 -->
    function nextPage(keywords){
        <!-- 赋值处理 -->
        <#if pageId??&&goods_page??>
            var currentPage = ${pageId};
            var totalPage = ${goods_page.totalPages};
            var nextPage = currentPage+1;
        <#else>
            return;
        </#if>
        
        window.location.href = "/search?keywords="+keywords+"&page="+nextPage;
    }

    <!-- 跳转到上一页的方法 -->
    function prePage(keywords){
        <!-- 赋值处理 -->
        <#if pageId??&&goods_page??>
            var currentPage = ${pageId};
            var totalPage = ${goods_page.totalPages};
            var previousPage = currentPage-1;
        <#else>
            return;
        </#if>
        
        window.location.href = "/search?keywords="+keywords+"&page="+previousPage;
    }

    <!-- 跳转到指定页数的方法 -->
    function changePage(${keywords}){
        <!-- 获取键入的值 -->
        var inputPage = document.getElementById("iPageNum").value;
        <!-- 定义一个变量用于存储总页数 -->
        var totalPage = 0
        <!-- 判断总页数是否存在，如果存在便进行赋值操作，如果不存在，直接返回 -->
        <#if goods_page??>
            totalPage = ${goods_page.totalPages};        
        <#else>
            return;
        </#if>

    <!-- 判断键入的是否为一个数字 -->
    if(isNaN(inputPage)){
        return;
    }
    <!-- 判断键入的值是否大于总页数 -->
    if(inputPage > totalPage){
        return;
    }
    <!-- 判断键入的值是否小于1 -->
    if(inputPage < 1){
        return;
    }
        
        window.location.href = "/search?keywords="+keywords+"&page="+(inputPage-1);
    }   
</script>
</head>

<body>

    <!-- qq and weixin -->
    <#include "/client/qq_and_weixin.ftl">

    <!--顶部ad大小：1920 90-->
    <div class="top_ad">
        <img src="/client/images/topad.png" />
    </div>
    
    <!--顶部-->
    <#include "/client/common_header.ftl" />
    
    <!--面包屑导航-->
    <div class="crumb">
        <a href="/" title="">首页></a> 
        <#if keywords??> 
            <a href="/search?keywords=${keywords}">搜索</a> 
        <#else> 
            <a href="/search?keywords=">搜索</a> 
        </#if>
    </div>
    
    <!--中部整体-->
    <div class="wrapper">
    <!--中部左边-->
    <div class="c_l">
    <!--产品列表-->
    <div class="piclist">
        <#if goods_page?? && goods_page.content?size gt 0> 
            <#list goods_page.content as item>
                <dl>
                    <dt>
                        <a href="/goods/${item.id}" title="${item.title!''}" target="_blank"><img src="${item.coverImageUri!''}" width="210" height="210" /></a>
                    </dt>
                    <dd class="piclist_title">
                        <a href="/goods/${item.id}" title="${item.title!''}" target="_blank">${item.title!''}</a>
                    </dd>
                    <dd class="money16"> ￥ <#if item.salePrice??>${item.salePrice?string("0.00")}</#if> <span class="moneydelete">￥ <#if item.marketPrice??>${item.marketPrice?string("0.00")}</#if> </span></dd>
                    <dd class="piclist_ie">
                        <a href="/cart/init?id=${item.id}" title="加入购物车" target="_blank" class="piclist_cart">加入购物车</a> <a href="javascript:addCollect(${item.id});" title="关注" class="piclist_like">关注</a>
                    </dd>
                </dl>
            </#list> 
        <#else>
            <div style="text-align: center; padding: 15px;">此类商品正在扩充中，敬请期待！</div>
        </#if>
    </div>
    
    <!--分页-->
    <div class="pagebox">
        <div class="num">
            <#if goods_page??> 
                <#assign continueEnter=false>
                <#if goods_page.number == 0> 
                    <a class="a1 a0" href="javascript:;"><span>上一页</span></a>
                <#else> 
                    <a class="a2" href="javascript:prePage(${keywords})"><span>上一页</span></a>
                </#if> 
                <#if goods_page.totalPages gt 0> 
                    <#list 1..goods_page.totalPages as page> 
                        <#if page <= 3 || (goods_page.totalPages-page) < 3 || (goods_page.number+1-page)?abs<3 > 
                            <#if page == goods_page.number+1> 
                                <a class="sel" href="javascript:;">${page}</a>
                            <#else> 
                                <a href="${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-${page-1}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>">${page}</a>
                            </#if> 
                            <#assign continueEnter=false> 
                        <#else> 
                            <#if !continueEnter> 
                                <span> ... </span> 
                                <#assign continueEnter=true>
                            </#if>
                        </#if> 
                    </#list> 
                </#if> 
                <#if goods_page.number+1 == goods_page.totalPages || goods_page.totalPages==0>
                    <a class="a2 a0" href="javascript:;"><span>下一页</span></a>
                <#else> 
                    <a class="a2" href="javascript:nextPage(${keywords});"><span>下一页</span></a>
                </#if> 
                <span> 共<b>${goods_page.totalPages}</b>页</span> 
            </#if>
        </div>
        <div class="page">
            <input class="sub" type="submit" onclick="javascript:changePage(${keywords});" value="确定" /> <span>页</span>
            <input class="text" type="text" value="${pageId + 1}" id="iPageNum" />
            <span>到第</span>
        </div>
        <div class="clear"></div>
    </div>
    
    </div><!--中部左边end-->
    
    <!--中部右边-->
    <div class="c_r">
        <p>热销排行</p>
            <#if most_sold_list??> 
                <#list most_sold_list as item> 
                    <#if item_index < 10 >
                        <dl>
                            <dt>
                                <a href="/goods/${item.id?c}" target="_blank"><img src="${item.coverImageUri!''}" style="width: 200px" /></a>
                            </dt>
                            <dd class="c_r_title">
                                <a href="/goods/${item.id}" title="${item.title!''}" target="_blank">${item.title!''}</a>
                            </dd>
                            <dd class="money16">￥<#if item.salePrice??>${item.salePrice?string("0.00")}</#if> <span class="moneydelete">￥<#if item.marketPrice??>${item.marketPrice?string("0.00")}</#if></span>
                            </dd>
                        </dl>
                    </#if> 
                </#list> 
            </#if>
     </div>
        
        
        
    </div><!--wrapper—end-->
    
    <!--底部footer-->
    <#include "/client/common_footer.ftl" />
</body>
</html>
