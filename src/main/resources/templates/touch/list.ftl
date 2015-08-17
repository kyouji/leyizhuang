<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if productCategory??>${productCategory.seoTitle!''}-</#if>正品惠客</title>
<meta name="keywords" content="<#if productCategory??>${productCategory.seoKeywords!''}</#if>">
<meta name="description" content="<#if productCategory??>${productCategory.seoDescription!''}</#if>">
<meta name="copyright" content="<#if site??>${site.copyright!''}</#if>" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<script src="/touch/js/jquery-1.9.1.min.js"></script>
<script src="/touch/js/common.js"></script>
<script src="/touch/js/search.js"></script>

<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link href="/touch/css/front.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
$(document).ready(function(){
  
});

var pageIdx = 1;
function loadMore()
{
    $.ajax({
        type:"post",
        url:"/touch/list/more/${categoryId!'1'}-${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-" + pageIdx,
        success:function(data){
            if ("" == data)
            {
                $("#a-more").css("display", "none");
            }
            else
            {
                $("#goods-menu").append(data);
                pageIdx++;
            }
        }
    });
}
</script>
</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
  <div class="main">
  	<#-- 以下为搜索功能的输入框 -->
    <label class="list_search_all">
	    <form action="/touch/search" method="get" id="search_form" >
	    	<#if keywords??>
		    	<input type="text" name="keywords" class="list_search" value="${keywords}" />
		    <#else>
		   		<input type="text" name="keywords" class="list_search" />
		    </#if>
		    <a href="javascript:submitSearch()" class="list_search_a"></a>
   		</form>
   	</label>
    <a class="a1" href="javascript:history.go(-1)"><img src="/touch/images/back.png" height="22" /></a>
    <a class="a2" href="/touch"><img src="/touch/images/home2.png" height="25" /></a>
  </div>
</header>

<div class="list_top">
<table class="main">
  <tr>
    <td <#if orderId==0>class="sel"</#if>><a href="/touch/list/${categoryId!'1'}-0-<#if soldId?? && soldId==0>1<#else>0</#if>-${priceId!'0'}-${timeId!'0'}-${pageId!'0'}">销量</a></td>
    <td <#if orderId==1>class="sel"</#if>><a href="/touch/list/${categoryId!'1'}-1-${soldId!'0'}-<#if priceId?? && priceId==0>1<#else>0</#if>-${timeId!'0'}-${pageId!'0'}">价格</a></td>
    <td <#if orderId==2>class="sel"</#if>><a href="/touch/list/${categoryId!'1'}-2-${soldId!'0'}-${priceId!'0'}-<#if timeId?? && timeId==0>1<#else>0</#if>-${pageId!'0'}">上架时间</a></td>
  </tr>
</table>
</div>
<div class="clear50"></div>
<div id="main" class="main">
	
 	<#if goods_page??>
	 	<#list goods_page as item>
		<a class="phone_list" href="/touch/goods/${item.id?c}">
			<b><img src="${item.coverImageUri!''}" /></b>
		   	<p class="p1">${item.title!''}</p>
		   	<p>${item.subTitle!''}</p>
		   	<p class="p2"><label class="p2_l1">￥<span>5${item.marketPrice}</span></label><label class="p2_l2">￥<span>${item.salePrice}</span></label></p>
		   	<div class="clear"></div>
		   	<h6><span>已售 </span>${item.soldNumber}</h6>
		</a>
		<div class="clear20"></div>
	  </#list>
  </#if>
  
  <#--
  <#if goods_page??>
  	<#if goods_page.totalPages!=1>
  		<a href="javascript:loadMore()" style="display:block; width:100%; height:40px;background:#3b93de;color:#fff;float:left; text-align:center;line-height:40px;">显示更多</a>
  	</#if>
  </#if>
  -->
</div>
<!--main END-->



</body>
</html>
