<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客-首页</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta property="qc:admins" content="274143415163145116375" />
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link href="/client/css/main.css" rel="stylesheet" type="text/css" />

<script src="/client/js/jquery-1.9.1.min.js"></script>

<script type="text/javascript">
    $(function(){
        <!-- 检索start -->
        $("#search").click(function(){
            
            var keywords = $("#keywords").val();
            console.debug(keywords)
            $.get("/search",{keywords:keywords},
            function (data) { 
                <!-- 修改 -->
                    if (data.role == 2){
                        window.location.href="/";
                    }    
                    else if (data.code == 0) {
                        var url = document.referrer;          
                        if(undefined==url || ""==url){
                            window.location.href="/";
                        }else{
                            window.location.href = url; 
                        }
                    } else {
                        alert(data.msg);
                    }
                }
            );
        })；
    <!-- 检索end -->

    
})


</script>
</head>

<body>
<!--顶部ad大小：1920 90-->
<div class="top_ad">
<#if index_top_ad_list?? && index_top_ad_list?size gt 0>
    <#list index_top_ad_list as item>
        <a class="w100 block ta-c" <#if item.typeIsNewWindow?? && item.typeIsNewWindow>target="_blank"</#if> href="${item.linkUri!''}" style=" background:url(${item.fileUri!''}) no-repeat top center; height:100px;"></a>
    </#list>
</#if>
<img src="images/topad.png" />
</div>

<!--顶部-->
<div class="top_all">
	<div class="top">
    	<div class="top_left">
        	<div class="top_left_welcome">欢迎光临正品惠客</div>
        	 <#if username??>
                <a href="/user">${username}<i></i></a>
                <a href="/logout">退出<i></i></a>
            <#else>
                <a href="/login" target="_blank">登录<i></i></a>
                <a href="/reg" target="_blank">免费注册<i></i></a>
            </#if>
        </div>
        <div class="top_right">
        	<a href="/user" title="">我的惠客</a>
            <a class="top_right_like" href="/user/collect/list" title="">我的关注</a>
            <a class="top_right_hk" href="/user" title="">我的惠客</a>
        </div>
    </div>
	
</div>

<!--头部-->
<div class="header">
	<!--logo大小：190 58-->
	<div class="header_logo"><a href="/"><img src="<#if site??>${site.logoUri!''}</#if>" /></a></div>
    <!--广告语大小：183 58-->
    <div class="header_ad">
        <#if top_small_ad_list??>
            <#list top_small_ad_list as item>
                <a <#if item.typeIsNewWindow?? && item.typeIsNewWindow>target="_blank"</#if> href="${item.linkUri!''}">
                    <img src="${item.fileUri!''}" />
                </a>
                <#break>
            </#list>
        </#if>
    </div>
    
    <div class="header_search">
    	<div class="header_search_top">
        	<input type="text" class="header_search_top_text" id="keywords" name="keywords" value="${keywords!keywords_list[0].title}"/>
            <a href="#" title="" id="search" class="header_search_top_btn">搜 索</a>
        </div>
        <div class="header_search_bot">
        热门搜索：
            <#if keywords_list??>
                <#list keywords_list as item>
                    <#if item_index gt 0>
                    <a href="${item.linkUri!''}">${item.title}</a>
                    </#if>
                </#list>
            </#if>
        </div>
    </div>
    
    <div class="header_cart">
    	<a href="/cart" title="购物车" class="header_cart_btn">购物车（<#if cart_goods_list??>${cart_goods_list?size}<#else>0</#if>）</a>
    </div>
</div>

<!--导航-->
<div class="navigation">
	<div class="nav">
        <div class="nav_submenu">全部商品分类</div>
        <div class="nav_nav">
        	<ul>
            <#if navi_item_list??>
            <#list navi_item_list as item>
                <li><a class="a1" href="${item.linkUri!''}">${item.title!''}</a></li>
            </#list>
        </#if> 
            </ul>
        </div>        
        <div class="nav_num">全国服务热线：<#if site??>${site.telephone!''}</#if></div>
    </div>
</div>

<div class="contents_box">
<!--banner-->
<div class="advertising">
	<div class="advertising_content">
    	<!-- 分类-品牌  start-->
    	<div class="advertising_ifm adver_left">
    	<#if top_category_list??>
    	   <#list top_category_list as item>
    	       <#if item_index == 0>
               	<div class="product_categories phone_1">
    	           <h4>${item.title}</h4>
    	           <#if brand_list??>
    	               <#list brand_list as brand>
    	                   <#if brand.productCategoryId == item.id>
    	                       <a href="#">${brand.title}</a>
    	                   </#if>
    	               </#list>
    	           </#if>
    	         </div>  
    	       </#if>
    	       <#if item_index == 1>
                <div class="product_categories phone_2">
                   <h4>${item.title}</h4>
                   <#if brand_list??>
                       <#list brand_list as brand>
                           <#if brand.productCategoryId == item.id>
                               <a href="#">${brand.title}</a>
                           </#if>
                       </#list>
                   </#if>
                 </div>  
               </#if>
    	       <#if item_index == 2>
                <div class="product_categories phone_1">
                   <h4>${item.title}</h4>
                   <#if brand_list??>
                       <#list brand_list as brand>
                           <#if brand.productCategoryId == item.id>
                               <a href="#">${brand.title}</a>
                           </#if>
                       </#list>
                   </#if>
                 </div>  
               </#if>
               <#if item_index == 3>
                <div class="product_categories phone_2">
                   <h4>${item.title}</h4>
                   <#if brand_list??>
                       <#list brand_list as brand>
                           <#if brand.productCategoryId == item.id>
                               <a href="#">${brand.title}</a>
                           </#if>
                       </#list>
                   </#if>
                 </div>  
               </#if>
    	       
    	   </#list>
    	</#if>
      </div>
    	<!-- END  -->
    	<!-- 首页大广告    -->
        <div class="advertising_ifm adver_middle">
            <#if big_scroll_ad_list??>
                 <#list big_scroll_ad_list as item>
                     <a class="indexadpart" <#if item.typeIsNewWindow?? && item.typeIsNewWindow>target="_blank"</#if> href="${item.linkUri!''}">
                         <img src="${item.fileUri!''}" width="750" height="439" />
                     </a>
               </#list>
            </#if>
        </div>
        
        <div class="advertising_ifm adver_right">
        	<div class="dedication">竭诚服务</div>
            <ul class="special_service">
            	<li class="li_1">
                	<a class="icon_1" href="#">闪电发货</a>
                </li>
                <li>
                	<a class="icon_2" href="#">闪电发货</a>
                </li>
                <li class="li_3">
                	<a class="icon_3" href="#">无理由退货</a>
                </li>
                <li class="li_4">
                	<a class="icon_4" href="#">闪电发货</a>
                </li>
            </ul>
            
            
            <div class="announcement">公告</div>
            <div class="announcement_list">
             <#if news_page??>
            <#list news_page.content as item>
                <#if item_index < 7>
                <a class="block mt5" href="/info/content/${item.id}?mid=12" style="height:20px; overflow:hidden;">【公告】${item.title!''}</a>
                </#if>
            </#list>
        </#if>
            </div>
        </div>
    </div>
</div>

<!--团购-->
<div class="group_buy">
	<a class="tg_1" href="#"><img src="/client/images/tg_1.png" /></a>
    <a href="#"><img src="/client/images/tg_2.png" /></a>
    <a href="#"><img src="/client/images/tg_3.png" /></a>
    <a href="#"><img src="/client/images/tg_4.png" /></a>
    <a href="#"><img src="/client/images/tg_5.png" /></a>
    <a class="tg_6" href="#"><img src="/client/images/tg_6.png" /></a>
</div>

<!--今日特价-->
<div class="today_specials">
	<a class="tj_1" href="#"><img src="/client/images/tj_1.png" /></a>
    <a href="#"><img src="/client/images/tj_2.png" /></a>
    <a href="#"><img src="/client/images/tj_3.png" /></a>
    <a href="#"><img src="/client/images/tj_4.png" /></a>
    <a href="#"><img src="/client/images/tj_5.png" /></a>
    <a class="tj_6" href="#"><img src="/client/images/tj_6.png" /></a>
</div>

<!--1F手机大全-->
<div class="phone_encyclopedia">
	<div class="phones">
    	<div class="phones_left">
            1F手机大全
            <span>Phones</span>
        </div>
        <div class="phones_right">
        	<a href="#">热门:</a>&nbsp;&nbsp;
            <#if first_brand_list??>
                <#list first_brand_list as item >
                    <#if item_index lt 6>
                    |&nbsp;&nbsp;<a href="#">${item.title}</a>
                    </#if>
                </#list>
            </#if>
        </div>
    </div>
    <div class="phone_brand">
    	<ul class="phones_logo">
        	<div class="lg"></div>
            <div class="honor"></div>
            <div class="mi"></div>
            <div class="apple"></div>
            <div class="zte"></div>
        </ul>
        <ul class="phones_photo"></ul>
        <ul class="phones_details">
        	<li class="photo_1">
            	<dl>
            		<dt><img src="images/photo_1.png" /></dt>
                    <dd class="feature">性价比之王</dd>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
			<li class="photo_1">
            	<dl>
            		<dt><img src="images/photo_2.png" /></dt>
                    <dd class="feature">性价比之王</dd>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="photo_1">
            	<dl>
            		<dt><img src="images/photo_3.png" /></dt>
                    <dd class="feature">性价比之王</dd>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="photo_1 photo_4">
            	<dl>
            		<dt><img src="images/photo_4.png" /></dt>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="photo_1 photo_5">
            	<dl>
            		<dt><img src="images/photo_5.png" /></dt>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="photo_1 photo_6">
            	<dl>
            		<dt><img src="images/photo_6.png" /></dt>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
        </ul>
    </div>
</div>

<!--2F电脑/平板-->
<div class="phone_encyclopedia">
	<div class="phones">
    	<div class="phones_left">
            2F平板/笔记本
            <span>PC/Computer</span>
        </div>
        <div class="phones_right">
        	<a href="#">热门:</a>&nbsp;&nbsp;
            <#if second_brand_list??>
                <#list second_brand_list as item >
                    <#if item_index lt 6>
                    |&nbsp;&nbsp;<a href="#">${item.title}</a>
                    </#if>
                </#list>
            </#if>
        </div>
    </div>
    <div class="phone_brand pc_com">
    	<ul class="phones_logo pc_logo">
        	<div class="lg"></div>
            <div class="honor"></div>
            <div class="mi"></div>
            <div class="pc">
            	<h4>平板</h4>
                <a href="#">苹果</a>
                <a href="#">三星</a>
                <a href="#">联想</a>
                <a href="#">微软</a>
                <a href="#">索尼</a>
                <a href="#">华硕</a>
                <a href="#">戴尔</a>
            </div>
            <div class="computer">
            	<h4>笔记本</h4>
                <a href="#">苹果</a>
                <a href="#">三星</a>
                <a href="#">联想</a>
                <a href="#">微软</a>
                <a href="#">宏基</a>
                <a href="#">华硕</a>
                <a href="#">戴尔</a>
            </div>
        </ul>
        <ul class="pc_photo">
        	<li class="pc_photo_1">
            	<dl>
            		<dt><img src="images/photo_5.png" /></dt>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="pc_photo_2">
            	<dl>
            		<dt><img src="images/photo_6.png" /></dt>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
        </ul>
        <ul class="phones_details">
        	<li class="photo_1">
            	<dl>
            		<dt><img src="images/photo_1.png" /></dt>
                    <dd class="feature">性价比之王</dd>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
			<li class="photo_1">
            	<dl>
            		<dt><img src="images/photo_2.png" /></dt>
                    <dd class="feature">性价比之王</dd>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="photo_1">
            	<dl>
            		<dt><img src="images/photo_3.png" /></dt>
                    <dd class="feature">性价比之王</dd>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="photo_1 photo_4">
            	<dl>
            		<dt><img src="images/photo_4.png" /></dt>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="photo_1 photo_5">
            	<dl>
            		<dt><img src="images/photo_5.png" /></dt>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="photo_1 photo_6">
            	<dl>
            		<dt><img src="images/photo_6.png" /></dt>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
        </ul>
    </div>
</div>

<!--3F数码缠带设备-->
<div class="phone_encyclopedia">
	<div class="phones">
    	<div class="phones_left">
            3F数码缠带设备
            <span>Digital Wearable Device</span>
        </div>
        <div class="phones_right">
        	<a href="#">热门:</a>&nbsp;&nbsp;
            <#if third_brand_list??>
                <#list third_brand_list as item >
                    <#if item_index lt 6>
                    |&nbsp;&nbsp;<a href="#">${item.title}</a>
                    </#if>
                </#list>
            </#if>
        </div>
    </div>
    <div class="phone_brand">
    	<ul class="phones_logo">
        	<div class="lg"></div>
            <div class="honor"></div>
            <div class="mi"></div>
            <div class="apple"></div>
            <div class="zte"></div>
        </ul>
        <ul class="phones_photo"></ul>
        <ul class="phones_details">
        	<li class="photo_1">
            	<dl>
            		<dt><img src="images/photo_1.png" /></dt>
                    <dd class="feature">性价比之王</dd>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
			<li class="photo_1">
            	<dl>
            		<dt><img src="images/photo_2.png" /></dt>
                    <dd class="feature">性价比之王</dd>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="photo_1">
            	<dl>
            		<dt><img src="images/photo_3.png" /></dt>
                    <dd class="feature">性价比之王</dd>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="photo_1 photo_4">
            	<dl>
            		<dt><img src="images/photo_4.png" /></dt>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="photo_1 photo_5">
            	<dl>
            		<dt><img src="images/photo_5.png" /></dt>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="photo_1 photo_6">
            	<dl>
            		<dt><img src="images/photo_6.png" /></dt>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
        </ul>
    </div>
</div>

<!--4F数码配件-->
<div class="phone_encyclopedia">
	<div class="phones">
    	<div class="phones_left">
            4F数码配件
            <span>Digital Accessories</span>
        </div>
        <div class="phones_right">
        	<a href="#">热门:</a>&nbsp;&nbsp;
            <#if fourth_brand_list??>
                <#list fourth_brand_list as item >
                    <#if item_index lt 6>
                    |&nbsp;&nbsp;<a href="#">${item.title}</a>
                    </#if>
                </#list>
            </#if>
        </div>
    </div>
    <div class="phone_brand pc_com">
    	<ul class="phones_logo pc_logo">
        	<div class="lg"></div>
            <div class="honor"></div>
            <div class="mi"></div>
            <div class="pc">
            	<h4>平板</h4>
                <a href="#">苹果</a>
                <a href="#">三星</a>
                <a href="#">联想</a>
                <a href="#">微软</a>
                <a href="#">索尼</a>
                <a href="#">华硕</a>
                <a href="#">戴尔</a>
            </div>
            <div class="computer">
            	<h4>笔记本</h4>
                <a href="#">苹果</a>
                <a href="#">三星</a>
                <a href="#">联想</a>
                <a href="#">微软</a>
                <a href="#">宏基</a>
                <a href="#">华硕</a>
                <a href="#">戴尔</a>
            </div>
        </ul>
        <ul class="pc_photo">
        	<li class="pc_photo_1">
            	<dl>
            		<dt><img src="images/photo_5.png" /></dt>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="pc_photo_2">
            	<dl>
            		<dt><img src="images/photo_6.png" /></dt>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
        </ul>
        <ul class="phones_details">
        	<li class="photo_1">
            	<dl>
            		<dt><img src="images/photo_1.png" /></dt>
                    <dd class="feature">性价比之王</dd>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
			<li class="photo_1">
            	<dl>
            		<dt><img src="images/photo_2.png" /></dt>
                    <dd class="feature">性价比之王</dd>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="photo_1">
            	<dl>
            		<dt><img src="images/photo_3.png" /></dt>
                    <dd class="feature">性价比之王</dd>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="photo_1 photo_4">
            	<dl>
            		<dt><img src="images/photo_4.png" /></dt>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="photo_1 photo_5">
            	<dl>
            		<dt><img src="images/photo_5.png" /></dt>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
            <li class="photo_1 photo_6">
            	<dl>
            		<dt><img src="images/photo_6.png" /></dt>
                    <dd class="introduction">小米 红米2A 白色 移动4G手机 双卡双待</dd>
                    <dd class="discount">￥<span>499.00</span><del>￥<span>899.00</span></del></dd>
                </dl>
                <div class="gz_dh"><a href="#"><img src="images/dh_gz_1.png" /></a></div>
            </li>
        </ul>
    </div>
</div>

</div>
<!--底部footer-->
<#include "/client/common_footer.ftl" />
</body>
</html>
