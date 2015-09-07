<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="chinaz-site-verification" content="0571b99b-03be-45ff-b0b0-bc3be3aa6957" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1,user-scalable=0, minimal-ui">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">


<script type="text/javascript" src="/touch/js/search.js"></script>
<link rel="stylesheet" type="text/css" href="/touch/css/style.css"/>


<title>正品惠客-首页</title>
</head>

<body>
<!--Begin-->
<div class="zphk">
	<!--顶部标题与搜索框-->
	<div class="top">
    	<p class="title">
        	<a href="#"><img src="/touch/images/logo_1.png" /></a>
        </p>
        <p class="searchbox">
   			<form style="float:right;width: 70%;" action="/touch/search" method="get" id="search_form" >
   				<#if keywords??>
        			<input style="display:block;width:100%;height:40px;font-size:0.6em;position:relative;padding:1%;border-radius:10px;border:none;" type="text" class="search" name="keywords" value="${keywords}"  />
        			<a style="display:block;position:absolute;right:0;top:25%;" class="search_photo" href="javascript:submitSearch()"><img src="/touch/images/search.gif" /></a>
        		<#else>
        			<input style="display:block;width:100%;height:40px;font-size:0.6em;position:relative;padding:1%;border-radius:10px;border:none;" type="text" value="" name="keywords" class="search" />
        			<a style="display:block;position:absolute;right:0;top:25%;" class="search_photo" href="javascript:submitSearch()"><img src="/touch/images/search.gif" /></a>
        		</#if>
            </form>
        </p>
    </div>
    
	<!--banner图-->
	<!--
    <div class="banner">
    	<#if big_scroll_ad_list??>
    		<#list big_scroll_ad_list as item>
        		<img src="${item.fileUri!''}" />
        	</#list>
        </#if>
    </div>
    -->
    <div class="addWrap">
	    <div class="swipe" id="mySwipe">
		    <div class="swipe-wrap">
		    	<#if big_scroll_ad_list??>
		    		<#list big_scroll_ad_list as item>
			    		<div><a href="javascript:;"><img class="img-responsive" style="width:100%;" src="${item.fileUri!''}" /></a></div>
			    	</#list>
			    </#if>
		    </div>
	    </div>
        <#if big_scroll_ad_list??>
            <ul id="position">
                <#list big_scroll_ad_list as item>
                    <#if item_index==0>
                        <li class="cur"></li>
                    <#else>
                        <li></li>
                    </#if>
                </#list>
            </ul>
        </#if>
	</div>
	<script src="/touch/js/swipe.js"></script> 
<script type="text/javascript">
    var bullets = document.getElementById('position').getElementsByTagName('li');
    var banner = Swipe(document.getElementById('mySwipe'), {
        auto: 2000,
        continuous: true,
        disableScroll:false,
        callback: function(pos) {
            var i = bullets.length;
            while (i--) {
              bullets[i].className = ' ';
            }
            bullets[pos].className = 'cur';
        }
    });
</script>
	<!--导航菜单-->
    <#include "/touch/common_navi.ftl">
        
    <!--今日爆款-->
    <#if speciaPrice_list?? && speciaPrice_list?size gt 0 >
	    <div class="today_hot">
	    	<ul class="title">今日爆款</ul>
	        <ul>
				<#list speciaPrice_list as item>
					<#if item_index lt 4>
						<li>
							<a class="tj_1" href="/touch/goods/${item.id?c}">
								<p class="name">${item.title!""}</p>
								<p class="feature">${item.subTitle!""}</p>
								<p class="photo">
									<img src="${item.coverImageUri!""}" />
								</p>
							</a>
						</li>
					</#if>
				</#list>
			</ul>
        </div>
	</#if>
    
    <!--手机大全-->
    <div class="today_hot">
    	<#if top_category_list?? && top_category_list?size gt 0 >
    		<#list top_category_list as item>
    			<#if item_index == 0>
		    		<ul class="title">
			        	<li class="phone_daq"><a href="/touch/list/${item.id?c}">1F${item.title!""}</a></li>
			            <li class="more"><a href="/touch/list/${item.id?c}">更多>></a></li>
		        	</ul>
	        	</#if>
        	</#list>
    	</#if>
    	
    	<#if top_cat_goods_page0?? && top_cat_goods_page0.content?size gt 0 >
        <ul class="phone_details">
        	<#list top_cat_goods_page0.content as item>
        		<#if item_index lt 6>
		        	<li class="daquan_1">
		                <p class="photo">
		                	<a href="/touch/goods/${item.id?c}"><img src="${item.coverImageUri!""}" /></a>
		                </p>
		                <p class="name">性价比之王</p>
		                <p class="feature">${item.title!""}</p>
		                <p class="discount_price">
		                	<b><del>市场价￥<span>${item.marketPrice!"0.00"}</span></del><br />惠客价￥<span>${item.salePrice!"0.00"}</span></b>
		                </p>
		            </li>
            	</#if>
           	</#list>
        </ul>
        </#if>
    </div>
    <!--平板/电脑-->
    <div class="today_hot">
    	<#if top_category_list?? && top_category_list?size gt 0 >
    		<#list top_category_list as item>
    			<#if item_index == 1>
		    		<ul class="title">
			        	<li class="phone_daq"><a href="/touch/list/${item.id?c}">2F${item.title!""}</a></li>
			            <li class="more"><a href="/touch/list/${item.id?c}">更多>></a></li>
		        	</ul>
	        	</#if>
        	</#list>
    	</#if>
        <#if top_cat_goods_page0?? && top_cat_goods_page0.content?size gt 0 >
        <ul class="phone_details">
        	<#list top_cat_goods_page1.content as item>
        		<#if item_index lt 6>
		        	<li class="daquan_1">
		                <p class="photo">
		                	<a href="/touch/goods/${item.id?c}"><img src="${item.coverImageUri!""}" /></a>
		                </p>
		                <p class="name">性价比之王</p>
		                <p class="feature">${item.title!""}</p>
		                <p class="discount_price">
		                	<b><del>￥<span>${item.marketPrice!"0.00"}</span></del><br />￥<span>${item.salePrice!"0.00"}</span></b>
		                </p>
		            </li>
            	</#if>
           	</#list>
        </ul>
        </#if>
    </div>
    
    <!--数码穿戴设备-->
    <div class="today_hot">
    	<#if top_category_list?? && top_category_list?size gt 0 >
    		<#list top_category_list as item>
    			<#if item_index == 2>
		    		<ul class="title">
			        	<li class="phone_daq"><a href="/touch/list/${item.id?c}">3F${item.title!""}</a></li>
			            <li class="more"><a href="/touch/list/${item.id?c}">更多>></a></li>
		        	</ul>
	        	</#if>
        	</#list>
    	</#if>
        <#if top_cat_goods_page2?? && top_cat_goods_page2.content?size gt 0 >
        <ul class="phone_details">
        	<#list top_cat_goods_page2.content as item>
        		<#if item_index lt 6>
		        	<li class="daquan_1">
		                <p class="photo">
		                	<a href="/touch/goods/${item.id?c}"><img src="${item.coverImageUri!""}" /></a>
		                </p>
		                <p class="name">性价比之王</p>
		                <p class="feature">${item.title!""}</p>
		                <p class="discount_price">
		                	<b><del>￥<span>${item.marketPrice!"0.00"}</span></del><br />￥<span>${item.salePrice!"0.00"}</span></b>
		                </p>
		            </li>
            	</#if>
           	</#list>
        </ul>
        </#if>
    </div>
    
    <!--数码配件-->
    <div class="today_hot">
    	<#if top_category_list?? && top_category_list?size gt 0 >
    		<#list top_category_list as item>
    			<#if item_index == 3>
		    		<ul class="title">
			        	<li class="phone_daq"><a href="/touch/list/${item.id?c}">4F${item.title!""}</a></li>
			            <li class="more"><a href="/touch/list/${item.id?c}">更多>></a></li>
		        	</ul>
	        	</#if>
        	</#list>
    	</#if>
        <#if top_cat_goods_page3?? && top_cat_goods_page3.content?size gt 0 >
        <ul class="phone_details">
        	<#list top_cat_goods_page3.content as item>
        		<#if item_index lt 6>
		        	<li class="daquan_1">
		                <p class="photo">
		                	<a href="/touch/goods/${item.id?c}"><img src="${item.coverImageUri!""}" /></a>
		                </p>
		                <p class="name">性价比之王</p>
		                <p class="feature">${item.title!""}</p>
		                <p class="discount_price">
		                	<b><del>￥<span>${item.marketPrice!"0.00"}</span></del><br />￥<span>${item.salePrice!"0.00"}</span></b>
		                </p>
		            </li>
            	</#if>
           	</#list>
        </ul>
        </#if>
    </div>
    
    <!--底部导航-->
    <#include "/touch/common_footer.ftl">
    
    <!--版权备案-->
    <#include "/touch/common_touch_copyright.ftl">
    
    <!--底部-->
    <#include "/touch/common_touch_menu.ftl">
        
</div>
<!--END!-->
</body>
</html>
