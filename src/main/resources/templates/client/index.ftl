<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>首页</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link href="/client/css/main.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/images/zphk_logo.ico">
<link rel="stylesheet" type="text/css" href="/client/css/lrtk.css" />

<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/jquery.SuperSlide.2.1.1.js"></script>
<script src="/client/js/common.js" type="text/javascript"></script>
<script src="/client/js/goods.js" type="text/javascript"></script>
<script type="text/javascript">

function submitSearch(){
    var search = document.getElementById("search_form");
    search.submit();
}

    
$(function(){
    /*广告滑动*/    
    function numUp(){

    $(".scroll_box").animate({marginLeft:-809},1000,
    function(){
        $(".scroll_box img:first").insertAfter($(".scroll_box img:last"));
        /*滚动框归位*/
        $(".scroll_box").css({marginLeft:0
        });
        });
      }
      setInterval(numUp,3000);
      /*下拉菜单*/
    $(".phone_1").mouseover(function(){
        $(".product_nav_01").show();/*fadeIn 淡入 fadeOut淡出*/
        })
    $(".phone_1").mouseleave(function(){
        $(".product_nav_01").hide();/*fadeIn 淡入 fadeOut淡出*/
        })
        
    $(".phone_2").mouseover(function(){
        $(".product_nav_02").show();/*fadeIn 淡入 fadeOut淡出*/
        })
    $(".phone_2").mouseleave(function(){
        $(".product_nav_02").hide();/*fadeIn 淡入 fadeOut淡出*/
        })
        
    $(".phone_3").mouseover(function(){
        $(".product_nav_03").show();/*fadeIn 淡入 fadeOut淡出*/
        })
    $(".phone_3").mouseleave(function(){
        $(".product_nav_03").hide();/*fadeIn 淡入 fadeOut淡出*/
        })
        
    $(".phone_4").mouseover(function(){
        $(".product_nav_04").show();/*fadeIn 淡入 fadeOut淡出*/
        })
    $(".phone_4").mouseleave(function(){
        $(".product_nav_04").hide();/*fadeIn 淡入 fadeOut淡出*/
        })

    $(".product_nav_01").mouseover(function(){
        $(".product_nav_01").show();
        })      
    $(".product_nav_01").mouseleave(function(){
        $(".product_nav_01").hide();
        })  
        
        $(".product_nav_02").mouseover(function(){
        $(".product_nav_02").show();
        })
    $(".product_nav_02").mouseleave(function(){
        $(".product_nav_02").hide();
        })
        
        $(".product_nav_03").mouseover(function(){
        $(".product_nav_03").show();
        })
    $(".product_nav_03").mouseleave(function(){
        $(".product_nav_03").hide();
        })
        
        $(".product_nav_04").mouseover(function(){
        $(".product_nav_04").show();
        })
    $(".product_nav_04").mouseleave(function(){
        $(".product_nav_04").hide();
        })

})

</script>
<script type="text/javascript">
  $(document).ready(function(){
    menuDownList("top_phone","#top_phonelist",".a1","sel");
    phoneListMore();//单独下拉
    menuDownList("top_order","#top_orderlist",".a4","sel");//顶部下拉
    navDownList("navdown","li",".nav_showbox");
    //menuDownList("mainnavdown","#navdown",".a2","sel");
    checkNowHover("shopping_down","shopping_sel");
    checkBoxShow("topcheck","a","topsum","li","sel");
    checkBoxShow("teamadmenu","a","teamadsum","a","sel");
    
    floatBoxQQ();
    <!-- 二四楼图片轮播 -->
   jQuery(".slideBox").slide({mainCell:".bd ul",autoPlay:true});
});
</script>
</head>

<body>
    
    <#if index_top_ad_list?? && index_top_ad_list?size gt 0>
        <div class="top_ad">
            <#list index_top_ad_list as item>
                <a <#if item.typeIsNewWindow?? && item.typeIsNewWindow>target="_blank"</#if> href="${item.linkUri!''}"><img src="${item.fileUri!''}" width="100%"/></a>
                <#break>
            </#list>
        </div>
    </#if>
    <#include "/client/qq_and_weixin.ftl">
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
                <a href="/user" title="我的惠客">我的惠客</a>
                <a class="top_right_like" href="/user/collect/list" title="我的关注">我的关注</a>
                <a class="top_right_hk" href="/touch" title="我的惠客">手机惠客</a>
            </div>
        </div>
    </div>
    
    <!--头部-->
    <div class="header">
        <!--logo大小：190 58-->
        <div class="header_logo">
           <a href="/"><img src="<#if site??>${site.logoUri!''}</#if>" /></a>
        </div>
        
        <!--广告语大小：183 58-->
        <div class="header_ad">
            <#if head_small_ad_list??>
                <#list head_small_ad_list as item>
                    <a <#if item.typeIsNewWindow?? && item.typeIsNewWindow>target="_blank"</#if> href="${item.linkUri!''}">
                        <img src="${item.fileUri!''}"/>
                    </a>
                    <#break>
                </#list>
            </#if>
        </div>
        
        <div class="header_search">
           <div class="header_search_top">
                <form action="/search" method="get" id="search_form" >
                    <input type="text" class="header_search_top_text" id="keywords" name="keywords" value="<#if keywords_list?? && keywords_list[0]??>${keywords_list[0].title!''}</#if>"/>
                    <a href="javascript:submitSearch()" title="搜索" class="header_search_top_btn">搜 索</a>
                </form>
            </div>
            <div class="header_search_bot">
                                热门搜索：
                <#if keywords_list??>
                    <#list keywords_list as item>
                        <#if item_index gt 0>
                            <a href="/search?keywords=${item.title}"  >${item.title}</a>
                        </#if>
                    </#list>
                </#if>
            </div>
        </div>
        
        <#-- 设计要改，增加下拉显示  -->
        <div class="header_cart">
            <a href="/cart" title="购物车" class="header_cart_btn">购物车（<#if cart_goods_list??>${cart_goods_list?size}<#else>0</#if>）</a>
        </div>
    </div>
    
    <!--导航-->
    <#-- 导航读3级分类 -->
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
            <div class="nav_num"><#if site??>全国服务热线：${site.telephone!''}</#if></div>
        </div>
    </div>
    
    <div class="contents_box">
    <!--banner-->
    <div class="advertising">
        <div class="advertising_content">
            <!-- 分类-品牌  start-->
            <ul class="navlistout" id="navdown">
                <#if top_cat_list??>
                    <#list top_cat_list as item>
                        <li class="product_categories phone_${item_index+1}">
                            <h3><a href="/list/${item.id}">${item.title!''}</a></h3>
                    
                            <div class="nav_showbox">
                                <div class="clear"></div>
                                <#if ("second_level_"+item_index+"_cat_list")?eval?? >
                                    <table class="nav_more">
                                        <#list ("second_level_"+item_index+"_cat_list")?eval as secondLevelItem>
                                            <tr>
                                                <th width="90"><span><a href="/list/${secondLevelItem.id}">${secondLevelItem.title!''}</a></span></th>
                                                <td>
                                                    <#if ("third_level_"+item_index+secondLevelItem_index+"_cat_list")?eval?? >
                                                        <#list ("third_level_"+item_index+secondLevelItem_index+"_cat_list")?eval as thirdLevelItem>
                                                            <a href="/list/${thirdLevelItem.id}">${thirdLevelItem.title!''}</a>
                                                        </#list>
                                                    </#if>
                                                </td>
                                            </tr>
                                        </#list>
                                    </table>
                                </#if>
                                <div class="clear"></div>
                            </div>
                        </li>
                    </#list>
                </#if>
            </ul>
            <!-- END  -->
            <!-- 首页大广告    -->
            <div class="advertising_ifm adver_middle">
                <div class="scroll">
                    <div class="adv_box">   
                        <div class="scroll_box">
                            <#if big_scroll_ad_list??>
                                 <#list big_scroll_ad_list as item>
                                    <#if item_index < 3 >
                                        <a href="${item.linkUri!''}" target="_blank">
                                            <img src="${item.fileUri!''}" />
                                        </a>
                                    </#if>
                                 </#list>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="advertising_ifm adver_right">
                <div class="dedication">竭诚服务</div>
                    <ul class="special_service">
                        <#if service_ad_list?? && service_ad_list?size gt 0>
                            <li class="li_1">
                                <img src="${service_ad_list[0].fileUri!''}" height="43px;" width="40px;"/>
                                <a class="icon_1">${service_ad_list[0].title!''}</a>
                            </li>
                            <li>
                                <img src="${service_ad_list[1].fileUri!''}" />
                                <a class="icon_2">${service_ad_list[1].title!''}</a>
                            </li>
                            <li class="li_3">
                                <img src="${service_ad_list[2].fileUri!''}" />
                                <a class="icon_3">${service_ad_list[2].title!''}</a>
                            </li>
                            <li class="li_4">
                                <img src="${service_ad_list[3].fileUri!''}" />
                                <a class="icon_4">${service_ad_list[3].title!''}</a>
                            </li> 
                         </#if>  
                    </ul>
                
                <div class="announcement">公告</div>
                <div class="announcement_list">
                 <#if news_page??>
                    <#list news_page.content as item>
                         <#if item_index < 6>
                         <a class="block mt5" target="_blank" href="/info/content/${item.id}?mid=12&catId=${item.categoryId}" style="height:20px; overflow:hidden;">${item.title!''}</a>
                         </#if>
                    </#list>
                </#if>
                </div>
            </div>
        </div>
    </div>
    
    <!--团购-->
    
    <div class="group_buy">
        <#if tuan_title_ad_list?? && tuan_title_ad_list?size gt 0>
            <a class="tg_1" target="_blank" href="${tuan_title_ad_list[0].linkUri!""}"><img src="${tuan_title_ad_list[0].fileUri!""}" /></a>
        </#if>
        <#if tuan_ad_list??>
           <#list tuan_ad_list as item>
               <#if item_index < 5>
                   <a href="${item.linkUri!""}" target="_blank"><img src="${item.fileUri!""}" /></a>
               </#if>
           </#list>
        </#if>
    </div>
    
    <!-- 首页推荐 -->
    <#if recommed_index_page?? && recommed_index_page.content?size gt 0 >
    <div class="today_specials">
        <#-- add by Sharon 这里的设计要调整，图片不能是非正方形的 -->
        <#list recommed_index_page.content as item>
            <#if item_index < 6>
                <a class="tj_1" href="/goods/${item.id?c}">
                    <div class="tj">
                        <h3>${item.title!""}</h3>
                        <img class="tj_left" src="${item.coverImageUri!""}" width="74px" height="131px" />
                        <div class="tj_right">
                            <div>店家推荐</div>
                            <p>${item.subTitle!""}</p>
                            <p class="price_1">￥<span>${item.salePrice?string('0.00')}</span></p>
                        </div>
                    </div>
                </a>
            </#if>
        </#list>
    </div>
    </#if>
    <!--1F展示 -->
    <div class="phone_encyclopedia">
        <div class="phones">
           <!-- 楼层 -->
            <#if top_category_list?? && top_category_list?size gt 0 >
            <div class="phones_left">
                <#list top_category_list as item>
                    <#if item_index == 0>
                        <a href="${item.linkUri!''}">1F${item.title!""}</a>
                    </#if>
                </#list>
            </div>
            </#if>
            <div class="phones_right">
                <#if first_brand_list??&&first_brand_list?size gt 0>
                    热门:&nbsp;&nbsp;
                    <#list first_brand_list as item >
                        <#if item_index < 6>
                        |&nbsp;&nbsp;<a href="${item.linkUri!''}">${item.title!''}</a>
                        </#if>
                    </#list>
                </#if>
            </div>
        </div>
        <div class="phone_brand">
            <ul class="phones_logo">
                <#if f0_brand_page??>
                    <#list f0_brand_page.content as item>
                        <#if item_index < 5>
                            <div class="lg">
                                <a href="${item.linkUri!''}">
                                    <img src="${item.logoUri!''}" width="120" height="60">
                                </a>
                            </div>
                        </#if>
                    </#list>
                </#if>
            </ul>
            <!-- 广告  -->
            <ul class="phones_photo">
                <#if index_1F_ad_list?? && index_1F_ad_list?size gt 0 >
                    <img src="${index_1F_ad_list[0].fileUri!""}" width="404px" height="470px"/>
                </#if>
            </ul>
            <ul class="phones_details">
               <#if top_cat_goods_page0?? && top_cat_goods_page0.content?size gt 0 >
                    <#list top_cat_goods_page0.content as item>
                        <#if item_index < 3 >
                            <li class="photo_1">
                                <dl>
                                    <dt><a href="/goods/${item.id?c!""}" target="_blank"><img src="${item.coverImageUri!""}" width="150px" height="150px" /></a></dt>
                                     <dd class="feature">性价比之王</dd>
                                     <dd class="introduction"><a href="/goods/${item.id?c!""}" target="_blank">${item.title!""}</a></dd>
                                     <dd class="discount">￥<span>${item.salePrice?string('0.00')}</span>
                                     <del>￥<span>${item.marketPrice?string('0.00')}</span></del></dd>
                                 </dl>
                                <div class="gz_dh"><a href="javascript:addCollect(${item.id?c});"><img src="/client/images/dh_gz_1.png" /></a></div>
                            </li>
                        </#if>
                    </#list>
               </#if>
               <#if top_cat_goods_page0?? && top_cat_goods_page0.content?size gt 0 >
                    <#list top_cat_goods_page0.content as item>
                        <#if item_index gt 2 && item_index < 6 >
                            <li class="photo_1 photo_4">
                                 <dl>
                                      <dt><a href="/goods/${item.id?c!""}" target="_blank"><img src="${item.coverImageUri!""}" width="120px" height="120px" /></a></dt>
                                      <dd class="introduction"><a href="/goods/${item.id?c!""}" target="_blank">${item.title!""}</a></dd>
                                      <dd class="discount">￥<span>${item.salePrice?string('0.00')}</span>
                                      <del>￥<span>${item.marketPrice?string('0.00')}</span></del></dd>
                                </dl>
                                <div class="gz_dh"><a href="javascript:addCollect(${item.id?c});"><img src="/client/images/dh_gz_1.png" /></a></div>
                             </li>
                        </#if>
                    </#list>
                </#if>
            </ul>
        </div>
    </div>
    
    <!--2F展示-->
    <div class="phone_encyclopedia">
        <div class="phones">
           <!-- 楼层 -->
            <#if top_category_list?? && top_category_list?size gt 0 >
            <div class="phones_left">
                <#list top_category_list as item>
                    <#if item_index == 1>
                        <a href="/list/${item.id}">2F${item.title!""}</a>
                    </#if>
                </#list>
            </div>
            </#if>
            <div class="phones_right">
                <#if second_brand_list??&&second_brand_list?size gt 0>
                    热门:&nbsp;&nbsp;
                    <#list second_brand_list as item >
                        <#if item_index lt 6>
                            |&nbsp;&nbsp;<a href="${item.linkUri!''}">${item.title!""}</a>
                        </#if>
                    </#list>
                </#if>
            </div>
        </div>
        <div class="phone_brand pc_com">
            <ul class="phones_logo pc_logo">
                <#if f1_brand_page??>
                    <#list f1_brand_page.content as item>
                        <#if item_index < 5>
                        <div class="lg">
                            <a href="${item.linkUri!''}">
                                <img src="${item.logoUri!''}" width="120" height="60">
                            </a>
                        </div>
                        </#if>
                    </#list>
                </#if>
            </ul>
            <ul class="pc_photo">
                <div id="slideBox" class="slideBox">
                    <div class="bd">
                        <ul>
                        <#if index_2F_ad_list?? >
                            <#list index_2F_ad_list as item>
                                <#if item_index < 3 >
                                    <li><a href="/" target="_blank"><img src="${item.fileUri!""}" /></a></li>
                                </#if>
                            </#list>
                        </#if>  
                       
                        </ul>
                    </div>
                    <a class="prev" href="javascript:void(0)"></a>
                    <a class="next" href="javascript:void(0)"></a>
                </div>
            
                <#if top_cat_goods_page1?? && top_cat_goods_page1.content?size gt 0 >
                    <#list top_cat_goods_page1.content as item>
                        <#if item_index < 2 >
                            <li class="photo_1">
                                <dl>
                                   <dt><a href="/goods/${item.id?c!""}" target="_blank"><img src="${item.coverImageUri!""}" width="120px" height="120px" /></a></dt>
                                   <dd class="introduction"><a href="/goods/${item.id?c!""}" target="_blank">${item.title!""}</a></dd>
                                   <dd class="discount">￥<span>${item.salePrice?string('0.00')}</span>
                                   <del>￥<span>${item.marketPrice?string('0.00')}</span></del></dd>
                                </dl>
                                <div class="gz_dh"><a href="javascript:addCollect(${item.id?c});"><img src="/client/images/dh_gz_1.png" /></a></div>
                            </li>
                        </#if>
                    </#list>
                </#if>
            </ul>
            <ul class="phones_details">
                <#if top_cat_goods_page1?? && top_cat_goods_page1.content?size gt 0 >
                    <#list top_cat_goods_page1.content as item>
                        <#if item_index gt 1 && item_index < 5 >
                            <li class="photo_1">
                                <dl>
                                  <dt><a href="/goods/${item.id?c!""}" target="_blank"><img src="${item.coverImageUri!""}" width="150px" height="150px" /></a></dt>
                                  <dd class="feature">性价比之王</dd>
                                  <dd class="introduction"><a href="/goods/${item.id?c!""}" target="_blank">${item.title!""}</a></dd>
                                  <dd class="discount">￥<span>${item.salePrice?string('0.00')}</span>
                                  <del>￥<span>${item.marketPrice?string('0.00')}</span></del></dd>
                                </dl>
                                <div class="gz_dh"><a href="javascript:addCollect(${item.id?c});"><img src="/client/images/dh_gz_1.png" /></a></div>
                            </li>
                        </#if>
                    </#list>
                </#if>
                <#if top_cat_goods_page1?? && top_cat_goods_page1.content?size gt 0 >
                    <#list top_cat_goods_page1.content as item>
                        <#if item_index gt 4 && item_index < 8 >
                            <li class="photo_1 photo_4">
                                <dl>
                                   <dt><a href="/goods/${item.id?c!""}" target="_blank"><img src="${item.coverImageUri!""}" width="120px" height="120px" /></a></dt>
                                   <dd class="introduction"><a href="/goods/${item.id?c!""}" target="_blank">${item.title!""}</a></dd>
                                   <dd class="discount">￥<span>${item.salePrice?string('0.00')}</span>
                                   <del>￥<span>${item.marketPrice?string('0.00')}</span></del></dd>
                                </dl>
                                <div class="gz_dh"><a href="javascript:addCollect(${item.id?c});"><img src="/client/images/dh_gz_1.png" /></a></div>
                            </li>
                        </#if>
                    </#list>
                </#if>
            </ul>
        </div>
    </div>
    
    <!--3F展示-->
    <div class="phone_encyclopedia">
        <div class="phones">
            <!-- 楼层 -->
            <#if top_category_list?? && top_category_list?size gt 0 >
                <div class="phones_left">
                    <#list top_category_list as item>
                        <#if item_index == 2>
                            <a href="/list/${item.id}">3F${item.title!""}</a>
                        </#if>
                    </#list>
                </div>
            </#if>
            <div class="phones_right">
                <#if third_brand_list?? && third_brand_list?size gt 0>
                    热门:&nbsp;&nbsp;
                    <#list third_brand_list as item >
                        <#if item_index lt 6>
                            |&nbsp;&nbsp;<a href="${item.linkUri!''}">${item.title!""}</a>
                        </#if>
                    </#list>
                </#if>
            </div>
        </div>
        <div class="phone_brand">
            <ul class="phones_logo">
                <#if f2_brand_page??>
                    <#list f2_brand_page.content as item>
                        <#if item_index < 5>
                            <div class="lg">
                                <a href="${item.linkUri!''}">
                                    <img src="${item.logoUri!''}" width="120" height="60">
                                </a>
                            </div>
                        </#if>
                    </#list>
                </#if>
            </ul>
            <ul class="phones_photo">
                <#if index_3F_ad_list?? && index_3F_ad_list?size gt 0 >
                     <img src="${index_3F_ad_list[0].fileUri!""}" width="404px" height="470px"/>
                </#if>
            </ul>
            <ul class="phones_details">
                <#if top_cat_goods_page2?? && top_cat_goods_page2.content?size gt 0 >
                    <#list top_cat_goods_page2.content as item>
                        <#if item_index < 3 >
                         <li class="photo_1">
                            <dl>
                                <dt><a href="/goods/${item.id?c!""}" target="_blank"><img src="${item.coverImageUri!""}" width="150px" height="150px"/></a></dt>
                                 <dd class="feature">性价比之王</dd>
                                 <dd class="introduction"><a href="/goods/${item.id?c!""}" target="_blank">${item.title!""}</a></dd>
                                 <dd class="discount">￥<span>${item.salePrice?string('0.00')}</span>
                                 <del>￥<span>${item.marketPrice?string('0.00')}</span></del></dd>
                             </dl>
                            <div class="gz_dh"><a href="javascript:addCollect(${item.id?c});"><img src="/client/images/dh_gz_1.png" /></a></div>
                        </li>
                        </#if>
                    </#list>
                </#if>
                <#if top_cat_goods_page2?? && top_cat_goods_page2.content?size gt 0 >
                    <#list top_cat_goods_page2.content as item>
                        <#if item_index gt 2 && item_index < 6 >
                            <li class="photo_1 photo_4">
                                 <dl>
                                  <dt><a href="/goods/${item.id?c!""}" target="_blank"><img src="${item.coverImageUri!""}" width="120px" height="120px"/></a></dt>
                                  <dd class="introduction"><a href="/goods/${item.id?c!""}" target="_blank">${item.title!""}</a></dd>
                                  <dd class="discount">￥<span>${item.salePrice?string('0.00')}</span>
                                  <del>￥<span>${item.marketPrice?string('0.00')}</span></del></dd>
                                </dl>
                                <div class="gz_dh"><a href="javascript:addCollect(${item.id?c});"><img src="/client/images/dh_gz_1.png" /></a></div>
                            </li>
                        </#if>
                    </#list>
                </#if>
            </ul>
        </div>
    </div>
    
    <!--4F展示-->
    <div class="phone_encyclopedia">
        <div class="phones">
            <div class="phones_left">
                 <#list top_category_list as item>
                    <#if item_index == 3>
                        <a href="/list/${item.id}">4F${item.title!""}</a>
                    </#if>
                </#list>
            </div>
            <div class="phones_right">
                <#if fourth_brand_list??&&fourth_brand_list?size gt 0>
                    热门:&nbsp;&nbsp;
                    <#list fourth_brand_list as item >
                        <#if item_index lt 6>
                            |&nbsp;&nbsp;<a href="${item.linkUri!''}">${item.title!""}</a>
                        </#if>
                    </#list>
                </#if>
            </div>
        </div>
        <div class="phone_brand pc_com">
            <ul class="phones_logo pc_logo">
                <#if f3_brand_page??>
                    <#list f3_brand_page.content as item>
                        <#if item_index < 5>
                            <div class="lg">
                                <a href="${item.linkUri!''}">
                                    <img src="${item.logoUri!''}" width="120" height="60">
                                </a>
                            </div>
                        </#if>
                    </#list>
                </#if>
            </ul>
            <ul class="pc_photo">
                 <div id="slideBox" class="slideBox">
                    <div class="bd">
                        <ul>
                            <#if index_4F_ad_list?? >
                                <#list index_4F_ad_list as item>
                                    <#if item_index < 3 >
                                        <li><a href="/" target="_blank"><img src="${item.fileUri!""}" /></a></li>
                                    </#if>
                                </#list>
                            </#if>  
                        </ul>
                    </div>
                    <a class="prev" href="javascript:void(0)"></a>
                    <a class="next" href="javascript:void(0)"></a>
                </div>
                <#if top_cat_goods_page3?? && top_cat_goods_page3.content?size gt 0 >
                    <#list top_cat_goods_page3.content as item>
                        <#if item_index < 2 >
                            <li class="photo_1">
                                <dl>
                                   <dt><a href="/goods/${item.id?c}" target="_blank"><img src="${item.coverImageUri!""}" width="120px" height="120px"/></a></dt>
                                   <dd class="introduction"><a href="/goods/${item.id?c}" target="_blank">${item.title!""}</a></dd>
                                   <dd class="discount">￥<span>${item.salePrice?string('0.00')}</span>
                                   <del>￥<span>${item.marketPrice?string('0.00')}</span></del></dd>
                                </dl>
                                <div class="gz_dh"><a href="javascript:addCollect(${item.id?c});"><img src="/client/images/dh_gz_1.png" /></a></div>
                            </li>
                        </#if>
                    </#list>
                </#if>
            </ul>
            <ul class="phones_details">
                <#if top_cat_goods_page3?? && top_cat_goods_page3.content?size gt 0 >
                    <#list top_cat_goods_page3.content as item>
                        <#if item_index gt 1 && item_index < 5 >
                            <li class="photo_1">
                                <dl>
                                  <dt><a href="/goods/${item.id?c}" target="_blank"><img src="${item.coverImageUri!""}" width="150px" height="150px"/></a></dt>
                                  <dd class="feature">性价比之王</dd>
                                  <dd class="introduction"><a href="/goods/${item.id?c!""}" target="_blank">${item.title!""}</a></dd>
                                  <dd class="discount">￥<span>${item.salePrice?string('0.00')}</span>
                                  <del>￥<span>${item.marketPrice?string('0.00')}</span></del></dd>
                                </dl>
                                <div class="gz_dh"><a href="javascript:addCollect(${item.id?c});"><img src="/client/images/dh_gz_1.png" /></a></div>
                            </li>
                        </#if>
                    </#list>
                </#if>
                 <#if top_cat_goods_page3?? && top_cat_goods_page3.content?size gt 0 >
                    <#list top_cat_goods_page3.content as item>
                        <#if item_index gt 4 && item_index < 8 >
                            <li class="photo_1 photo_4">
                                <dl>
                                   <dt><a href="/goods/${item.id?c!""}" target="_blank"><img src="${item.coverImageUri!""}" width="120px" height="120px"/></a></dt>
                                   <dd class="introduction"><a href="/goods/${item.id?c!""}" target="_blank">${item.title!""}</a></dd>
                                   <dd class="discount">￥<span>${item.salePrice?string('0.00')}</span>
                                   <del>￥<span>${item.marketPrice?string('0.00')}</span></del></dd>
                                </dl>
                                <div class="gz_dh"><a href="javascript:addCollect(${item.id?c});"><img src="/client/images/dh_gz_1.png" /></a></div>
                            </li>
                        </#if>
                    </#list>
                </#if>
            </ul>
        </div>
    </div>
    
    </div>
    <!--底部footer-->
    <#include "/client/common_footer.ftl" />
</body>
</html>
