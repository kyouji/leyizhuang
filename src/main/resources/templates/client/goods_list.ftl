<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><#if productCategory??>${productCategory.seoTitle!''}-</#if>正品惠客</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="<#if productCategory??>${productCategory.seoKeywords!''}</#if>" />
<meta name="description" content="<#if productCategory??>${productCategory.seoDescription!''}</#if>" />
<meta name="copyright" content="<#if site??>${site.copyright!''}</#if>" /> 

<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/index.js"></script>
<script src="/client/js/list.js"></script>
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link href="/client/css/list.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
function setprice() {
    var p1 = $.trim($('#ParamFiltern_price1').val()), p2 = $.trim($('#ParamFiltern_price2').val())
    if (isNaN(p1) || p1=="") { p1 = 0 }
    if (isNaN(p2) || p2== "") { p2 = 0 }
    var price = p1 + '-' + p2;
    var url = "/list/${categoryId!'0'}-${brandIndex!'0'}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-${pageId!'0'}-${leftId!'0'}";
    if (price != "0-0") { url += "_" + price; }
    location.href = url;
}
function btnPageSubmit() 
{
    window.location.href = "${categoryId!'0'}-${brandIndex!0}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-"
    + (parseInt($('#iPageNum').val()) - 1)
    + "-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string('#.##')}-${priceHigh?string('#.##')}</#if>";
}
</script>
</head>

<body>
<!--顶部ad大小：1920 90-->
<div class="top_ad"><img src="/client/images/topad.png" /></div>

<#include "/client/common_header.ftl" />

<!--面包屑导航-->
<div class="crumb">
	<a href="#" title="">首页</a>
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
    	<!--热卖推荐100*100-->
    	<#if hot_sale_list?? && hot_sale_list?size gt 0>       
    	<div class="c_l_hotsale">
        	<div class="c_l_hotsale_title">热卖推荐</div>
            <div class="c_l_hotsale_cont">
            <ul>
                <#list hot_sale_list as item>
                    <#if item_index < 4>
                        <li>
                            <a href="/goods/${item.id}" title="${item.title!''}" class="img100">
                                <img src="${item.coverImageUri!''}" height="100" width="100"/>
                            </a>
                            <a href="/goods/${item.id}" title="${item.title!''}">${item.title!''}</a>
                            <p  class="money16">￥<#if item.salePrice??>${item.salePrice?string("0.00")}</#if></p>
                            <a href="/cart/init?id=${item.id}" title="加入购物车" class="btn_cart23">加入购物车</a>
                        </li>
                    </#if>
                </#list>
            </ul>
            </div>
        </div>
        </#if>
        
        <!--属性选择-->
        <div class="select">
        	<div class="select_title">
            	<p class="select_title_p1">
                	<strong>${productCategory.title!''}</strong>
                    找到<b>2655</b>件相关产品
                </p>
                <a href="#" title="">重新筛选</a>
            </div>
            
            <div class="select_cont">
            	
                
                <#if brand_list??>
                    <dl>
                        <dt>品牌：</dt>
                        <dd style=" height:80px;" class="select_cont_brand">
                            <a <#if brandIndex==0>class="select_cont_choiced"</#if> href="${categoryId!'0'}-0<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>">全部</a>
                    
                            <#list brand_list as brand>
                                <a href="${categoryId!'0'}-${brand_index+1}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>" <#if brandIndex==brand_index+1>class="select_cont_choiced"</#if>>${brand.title?trim!''}</a>
                            </#list>
                        </dd>
                    </dl>
                </#if>
                
                <#-- 参数开始 -->
                <#if param_list??>
                    <#list param_list as param>
                        <dl>
                            <dt>${param.title!""}：</dt>
                            <dd class="select_cont_brand">
                                <a href="${categoryId!'0'}-${brandIndex!'0'}<#list param_index_list as pindex><#if param_index==pindex_index>-0<#else>-${pindex!'0'}</#if></#list>-${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>" <#if param_index_list[param_index]==0>class="select_cont_choiced"</#if>>全部</a>
                                <#if param.valueList??>
                                    <#list param.valueList?split(",") as value>
                                        <#if value!="">
                                            <a href="${categoryId!'0'}-${brandIndex!'0'}<#list param_index_list as pindex><#if param_index==pindex_index>-${value_index+1}<#else>-${pindex!'0'}</#if></#list>-${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>" <#if param_index_list[param_index]==value_index+1>class="select_cont_choiced"</#if>>${value?trim!""}</a>
                                        </#if>
                                    </#list>
                                </#if>
                            </dd>
                        </dl>
                    </#list>
                </#if>
                <#-- 参数结束 -->
            </div>
            <#if param_list?? && param_list?size gt 4>
                <div class="choose_more"><a href="javascript:chooseMoreDown();">下拉，更多选项<img src="/client/images/arrow01.png" /></a></div>
            </#if>
        </div>
        
        <!--排序-->
        <div class="sort">
        	<a href="${categoryId!'0'}-${brandIndex!'0'}<#list param_index_list as pindex>-${pindex!'0'}</#list>-0-<#if orderId!=0 || soldId==1>0<#else>1</#if>-${priceId!'0'}-${timeId!'0'}-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>" title="按销量排序" class="sort_a <#if orderId==0>sort_choiced</#if>">销量</a>
        	
        	<a href="${categoryId!'0'}-${brandIndex!'0'}<#list param_index_list as pindex>-${pindex!'0'}</#list>-1-${soldId!'0'}-<#if orderId!=1 || priceId==1>0<#else>1</#if>-${timeId!'0'}-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>" title="按价格排序" class="sort_a <#if orderId==1>sort_choiced</#if>">价格</a>
            <a href="${categoryId!'0'}-${brandIndex!'0'}<#list param_index_list as pindex>-${pindex!'0'}</#list>-2-${soldId!'0'}-${priceId!'0'}-<#if orderId!=2 || timeId==1>0<#else>1</#if>-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>" title="按上架时间排序" class="sort_a <#if orderId==2>sort_choiced</#if>">上架时间</a>
            
            <span class="sort_spangoods"><input type="checkbox"  />仅限有货</span>
            
            <div class="sort_pricesselect">
            	<span>价格区间</span>
                <input id="ParamFiltern_price1" type="text" value="<#if priceLow??>${priceLow?string("#.##")}</#if>"/>
                <span>-</span>
                <input id="ParamFiltern_price2" type="text" value="<#if priceHigh??>${priceHigh?string("#.##")}</#if>"/>
                <a href="javascript:setprice();" title="">确定</a>
            </div>
                
            <div class="sort_page">
            	<#if goods_page.number+1 == 1>
                    <a href="javascript:;" title="上一页">&lt;</a>
                <#else>
                    <a href="${categoryId!'0'}-${brandIndex!0}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-${goods_page.number-1}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>" title="上一页">&lt;</a>
                </#if>
                
                <span><#if goods_page.totalPages==0>0<#else>${goods_page.number+1}</#if>/${goods_page.totalPages!"0"}</span>
                
                <#if goods_page.number+1 == goods_page.totalPages || goods_page.totalPages==0>
                    <a href="javascript:;" title="下一页">&gt;</a>
                <#else>
                    <a href="${categoryId!'0'}-${brandIndex!0}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-${goods_page.number+1}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>" title="下一页">&gt;</a>
                </#if>
            </div>
        </div>
        
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
                        <a class="a2" href="${categoryId!'0'}-${brandIndex!0}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-${goods_page.number-1}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>"><span>上一页</span></a>
                    </#if>
                    
                    <#if goods_page.totalPages gt 0>
                        <#list 1..goods_page.totalPages as page>
                            <#if page <= 3 || (goods_page.totalPages-page) < 3 || (goods_page.number+1-page)?abs<3 >
                                <#if page == goods_page.number+1>
                                    <a class="sel" href="javascript:;">${page}</a>
                                <#else>
                                    <a href="${categoryId!'0'}-${brandIndex!0}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-${page-1}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>">${page}</a> <#-- ${page} -->
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
                        <a class="a2" href="${categoryId!'0'}-${brandIndex!0}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-${goods_page.number+1}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>"><span>下一页</span></a>
                    </#if>
                </#if>
                <span> 共<b>${goods_page.totalPages}</b>页 </span>
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
                    <dt><img src="${item.coverImageUri!''}" /></dt>
                    <dd class="c_r_title">
                        <a href="/goods/${item.id}" title="${item.title!''}">${item.title!''}</a> 
                    </dd>
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
