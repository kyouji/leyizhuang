<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>正品惠客</title>
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/index.js"></script>
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link href="/client/css/list.css" rel="stylesheet" type="text/css" />

</head>

<body>
<!--顶部ad大小：1920 90-->
<div class="top_ad"><img src="/client/images/topad.png" /></div>

<!--顶部-->
<#include "/client/common_header.ftl" />

<!--面包屑导航-->
<div class="crumb">
    <a href="/" title="">首页</a>
    <#if category_tree_list??>
        <#list category_tree_list as item>
            &nbsp;&nbsp;&gt;&nbsp;&nbsp; 
            <a href="/list/${item.id}" title="${item.title!''}">${item.title!''}</a>
        </#list>
    </#if>
    </div>

<!--中部整体-->
<div class="wrapper">
	<!--中部左边-->
	<div class="c_l">
    	
       <!--排序
        <div class="sort">
            <a href="#" title="" class="sort_a sort_choiced">销量</a>
            <a href="#" title="" class="sort_a">价格</a>
            <a href="#" title="" class="sort_a">时间</a>
            <span class="sort_spangoods"><input type="checkbox"  />仅限有货</span>
            <div class="sort_pricesselect">
                <span>价格区间</span>
                <input type="text" /><span>-</span><input type="text" />
                <a href="#" title="">确定</a>
            </div>
            <div class="sort_page">
                <a href="#" title="">&lt;</a>
                <span>1/16</span>
                <a href="#" title="">&gt;</a>
            </div>
        </div>
        --> 
       <hr>
        <!--产品列表-->
         <div class="piclist">
            <#if goods_page?? && goods_page.content?size gt 0>
                <#list goods_page.content as item>
                    <dl>
                        <dt><img src="${item.coverImageUri!''}" with="210" height="210"/></dt>
                        <dd class="piclist_title">
                            <a href="/goods/${item.id}" title="${item.title!''}">${item.title!''}</a> 
                        </dd>
                        <dd class="money16">￥<#if item.salePrice??>${item.salePrice?string("0.00")}</#if>
                            <span class="moneydelete">￥<#if item.marketPrice??>${item.marketPrice?string("0.00")}</#if></span> </dd>
                        <dd class="piclist_ie">
                            <a href="/cart/init?id=${item.id}" title="加入购物车" target="_blank" class="piclist_cart">加入购物车</a>
                            <a href="javascript:addCollect(${item.id});" title="" class="piclist_like">关注</a>
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
                        <a class="a2" href="${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-${goods_page.number-1}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>"><span>上一页</span></a>
                    </#if>
                    
                    <#if goods_page.totalPages gt 0>
                        <#list 1..goods_page.totalPages as page>
                            <#if page <= 3 || (goods_page.totalPages-page) < 3 || (goods_page.number+1-page)?abs<3 >
                                <#if page == goods_page.number+1>
                                    <a class="sel" href="javascript:;">${page}</a>
                                <#else>
                                    <a href="${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-${page-1}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>">${page}</a> <#-- ${page} -->
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
                        <a class="a2" href="${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-${goods_page.number+1}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>"><span>下一页</span></a>
                    </#if>
                <span> 共<b>${goods_page.totalPages}</b>页 </span>
                </#if>
            </div>
            <div class="page">
                <input class="sub" type="submit" onclick="javascript:btnPageSubmit();" value="确定" />
                <span>页</span>
                <input class="text" type="text" value="${pageId + 1}" id="iPageNum"/>
                <span>到第</span>
            </div>
            <div class="clear"></div>
        </div> 
              
    </div>
    
    <!--中部右边-->
    <div class="c_r">
        <p>热销排行</p>
        <#if most_sold_list??>
           <#list most_sold_list as item>
           <dl>
                <dt><img src="${item.coverImageUri!''}" style="width:200px" /></dt>
                <dd class="c_r_title">
                    <a href="/goods/${item.id}" title="${item.title!''}">${item.title!''}</a> </dd>
                    <dd class="money16">￥<#if item.salePrice??>${item.salePrice?string("0.00")}</#if>
                    <span class="moneydelete">￥<#if item.marketPrice??>${item.marketPrice?string("0.00")}</#if></span> </dd>
                </dl>
           </#list>
        </#if>
    </div>
</div>


<!--底部footer-->
<#include "/client/common_footer.ftl" />

</body>
</html>
