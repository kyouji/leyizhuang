<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>博大生活网——团购首页</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link href="/client/style/layout.css" rel="stylesheet" type="text/css" />
<link href="/client/style/master.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/client/js/html5.js"></script>
</head>
<body>
<!-- header开始 -->
<#include "/client/common_header.ftl" />
<!-- header结束 -->
<#--
<div class="banner_ms">
    <a href="/" title="博大生活网"><img src="/client/images/banner1.jpg"/></a>
</div>
-->
<div class="main_wrap fixed mt20" id="sce_box">
	<ul class="sec">
	   <#if goods_page??>
	       <#list goods_page.content as goods>
	           <li class="fixed">
                    <div class="sec_l">
                        <a href="/goods/${goods.id}">
                        <img src="${goods.groupSaleImage!''}" width="770" height="340"></a></div>
                    <div class="sec_r">
                        <div class="sec_wrap">
                            <p class="name">
                                <a href="/goods/${goods.id}">${goods.title!''}</a>
                            </p>
                            <p class="info">${goods.subTitle!''}</p>
                            <ul class="tips fixed">
                                <li>每个ID限购一件</li>
                                <li>每个ID每场限购三款</li>
                            </ul>
                            <p class="price">
                                ￥ <em>${goods.groupSalePrice?string("0.00")}</em> <del>￥${goods.salePrice?string("0.00")}</del>
                            </p>
                        </div>
                        <#if goods.groupSaleStartTime?? && goods.groupSaleStopTime??>
                            <#if goods.groupSaleStartTime gt .now>
                                <a href="javascript:;" class="noStart_btn">立即抢购</a>
                            <#elseif goods.groupSaleStopTime < .now>
                                <a href="javascript:;" class="SoldOut_btn">立即抢购</a>
                            <#else>
                                <a href="/goods/${goods.id}" class="buy_btn">立即抢购</a>
                            </#if>
                        </#if>
                    </div>
                </li>
	       </#list>
	   </#if>
	</ul>
            
        <#-- 分页开始 -->
        <div class="page clearfix mt20 fr">
            <span class="p-skip">
                <#if goods_page??>
                <em>共<b>${goods_page.totalElements!'0'}</b>条记录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<#if goods_page.totalPages gt 0>${goods_page.number+1}<#else>0</#if>/${goods_page.totalPages}页</em>
                </#if>
            </span>
            <div id="J_bottomPage" class="p-wrap">
                <span class="p-num">
                <#if goods_page??>
                    <#assign continueEnter=false>
                    <#if goods_page.number+1 == 1>
                        <a class="pn-prev disabled"><i>&lt;</i><em>上一页</em></a>
                    <#else>
                        <a href="/promotion/tuan?page=${goods_page.number-1}" class="pn-prev disabled"><i>&lt;</i><em>上一页</em></a>
                    </#if>
                    
                    <#if goods_page.totalPages gt 0>
                        <#list 1..goods_page.totalPages as page>
                            <#if page <= 3 || (goods_page.totalPages-page) < 3 || (goods_page.number+1-page)?abs<3 >
                                <#if page == goods_page.number+1>
                                    <a href="javascript:;" class="curr">${page}</a>
                                <#else>
                                    <a href="/promotion/tuan?page=${page}" class="hide">${page}</a> <#-- ${page} -->
                                </#if>
                                <#assign continueEnter=false>
                            <#else>
                                <#if !continueEnter>
                                    <b class="pn-break">&hellip;</b>
                                    <#assign continueEnter=true>
                                </#if>
                            </#if>
                        </#list>
                    </#if>
                    
                    <#if goods_page.number+1 == goods_page.totalPages || goods_page.totalPages==0>
                        <a href="javascript:;" class="pn-next disabled"><em>下一页</em><i>&gt;</i></a>
                    <#else>
                        <a href="/promotion/tuan?page=${goods_page.number+1}" class="pn-next"><em>下一页</em><i>&gt;</i></a>
                    </#if>
                </#if>
                </span>
            </div>
        </div>  
        <#-- 分页结束 -->           
</div>
<!--主体结束-->
<#include "/client/common_footer.ftl" />
<!--底部结束-->
</body>
</html>
