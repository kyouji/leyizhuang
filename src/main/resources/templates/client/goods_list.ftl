<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if productCategory??>${productCategory.seoTitle!''}-</#if>正品惠客</title>
<meta name="keywords" content="<#if productCategory??>${productCategory.seoKeywords!''}</#if>">
<meta name="description" content="<#if productCategory??>${productCategory.seoDescription!''}</#if>">
<meta name="copyright" content="<#if site??>${site.copyright!''}</#if>" />
<!--[if IE]>
   <script src="js/html5.js"></script>
<![endif]-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/common.js"></script>
<script src="/client/js/ljs-v1.01.js"></script>
<script type="text/javascript" src="/client/js/list.js"></script>

<link rel="stylesheet" type="text/css" href="/client/css/list.css"/>
<link href="/client/css/common.css" rel="stylesheet" type="text/css" />
<link href="/client/css/cartoon.css" rel="stylesheet" type="text/css" />
<link href="/client/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
  $(document).ready(function(){
    menuDownList("top_phone","#top_phonelist",".a1","sel");
    phoneListMore();//单独下拉
    menuDownList("top_order","#top_orderlist",".a4","sel");//顶部下拉
    searchTextClear(".toptext","请输入品牌或商品名称","#999","#666");
    searchTextClear(".bottext","查看所有门店","#fff","#fff");
    checkNowHover("shopping_down","shopping_sel");
    navDownList("navdown","li",".nav_showbox");
    menuDownList("mainnavdown","#navdown",".a2","sel");
    
    chooseMoreShow();
        
});

function setprice() {
    var p1 = $.trim($('#ParamFiltern_price1').val()), p2 = $.trim($('#ParamFiltern_price2').val())
    if (isNaN(p1) || p1=="") { p1 = 0 }
    if (isNaN(p2) || p2== "") { p2 = 0 }
    var price = p1 + '-' + p2;
    var url = "/list/${categoryId!'0'}-${brandIndex!'0'}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}<#if sort_id_list??><#list sort_id_list as sortId>-${sortId!'0'}</#list></#if>-${pageId!'0'}-${leftId!'0'}";
    if (price != "0-0") { url += "_" + price; }
    location.href = url;
}

function btnPageSubmit() 
{
    var page = $('#iPageNum').val();
    if (isNaN(page) || page=="" ){ page = 1 }
    window.location.href = "${categoryId!'0'}-${brandIndex!0}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}<#if sort_id_list??><#list sort_id_list as sortId>-${sortId!'0'}</#list></#if>-"
    + (page - 1)
    + "-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string('#.##')}-${priceHigh?string('#.##')}</#if>";
}

function deleterecent()
{
     $.ajax({
            type: "post",
            url: "/user/recent/deleteAll",
            data: { },
            dataType: "json",
            success: function (data) { 
             if (data.code == 0) {
                   window.location.reload();
                } else {
                    alert(data.msg);
                }
            }
        });
}
</script>
</head>

<body>
<header class="maintop">
  <section class="main">
    <h1>亲，欢迎来到丫丫手机网</h1>
    <p class="p1">昆明热线：0871-67996799</p>
    <p class="p2">4009-955-966</p>
    <p class="p3">服务热线：</p>
    <menu id="top_phone">
      <a class="a1" href="#">手机丫丫</a>
      <div class="clear"></div>
      <ul class="phone_sum" id="top_phonelist">
        <li style="padding-top:10px;"><a href="#"><span class="phoneico01">触屏版</span></a></li>
        <li><a href="#"><span class="phoneico02">丫丫微信</span></a>
  
        </li>
        <li><a href="#"><span class="phoneico03">iPhone</span></a></li>
        <li style="border-bottom:1px solid #eee; padding-bottom:10px;"><a href="#"><span class="phoneico04">Android</span></a></li>
        <li class="phone_sum_more">
          <p>
            <span>客户端抓侧即送10元豪礼</span>
            <span class="mt5"><img src="images/sys01.png" /></span>
          </p>
          <p>
            <span>客户端抓侧即送10元豪礼</span>
            <span class="mt5"><img src="images/sys02.png" /></span>
          </p>
          <p>
            <span>客户端抓侧即送10元豪礼</span>
            <span class="mt5"><img src="images/sys01.png" /></span>
          </p>
        </li>
      </ul>
    </menu>
    
    
    <a class="a2" href="#">在线咨询</a>
    <a class="a3" href="#">会员俱乐部</a>
    <a class="z-in10" href="#">帮助中心</a>
    <menu id="top_order">
      <a class="a4" href="#">我的订单<i></i></a>
      <div class="clear"></div>
      <div id="top_orderlist">
        <p class="p_box">
        <a href="#"><img src="images/t_order01.png" />我的信息</a>
        <a href="#"><img src="images/t_order02.png" />我的收藏</a>
        <a href="#"><img src="images/t_order03.png" />报修/退换货</a>
        <a href="#"><img src="images/t_order04.png" />我拍到的宝贝</a>
        <a href="#"><img src="images/t_order05.png" />我的商品咨询</a>
        </p>
      </div>
    </menu>
    <div class="clear"></div>
  </section>
</header><!--maintop-->

<!-- 浮动 -->
<aside class="floatbox">
  <a href="#" title="微信客服"><img src="images/float_ico01.png" width="42" height="42" alt="微信客服" /><span><img src="images/sys01.png" /></span></a>
  <a href="#" title="在线咨询"><img src="images/float_ico02.png" width="42" height="42" alt="在线咨询" /></a>
  <a href="#" title="新浪微博"><img src="images/float_ico03.png" width="42" height="42" alt="新浪微博" /></a>
  <a href="#" title="服务热线"><img src="images/float_ico04.png" width="42" height="42" alt="服务热线" /><span><img src="images/sys02.png" /></span></a>
  <a href="javascript:$('html,body').animate({scrollTop:0},500);" title="到顶部"><img src="images/float_ico05.png" width="42" height="42" alt="到顶部" /></a>
</aside>

<section class="main pt20 pb20 z-in10">
  <a class="fl" href="#"><img src="images/logo.png" /></a>
  <div class="index_place">
    <h2 class="fc fs26 lh30 fw400">昆明市区</h2>
    <p class="pt5">三小时急速送达</p>
  </div>
  <div class="searchbox">
    <div>
      <input class="text toptext" type="text" value="请输入品牌或商品名称" />
      <p class="clear"></p>
      <input class="sub" type="submit" value="搜 索" />
    </div>
    <p>
      <a href="#">三星</a>
      <a href="#">索尼</a>
      <a href="#">苹果ipad</a>
      <a href="#">Note4</a>
      <a href="#">小米4</a>
      <a href="#">魅族MX4</a>
    </p>
  </div>
  <div id="shopping_down" class="shopping_box">
    <span class="sp1">5</span>
    <a class="a1" href="#">去购物车结算<i></i></a>
    <menu>
      <!--<h3 class="ta-c pa15 fs14 fw400">购物车中还没有商品，赶紧选购吧！</h3>-->
      <h2>最新加入的商品</h2>
      <h3 class="tit">
        <span>满减</span>
        购满1999元，即可享受满减优惠 小计：￥2888.00
      </h3>
      <div class="shopping_list">
        <div class="clear"></div>
        <a class="a2" href="#"><img src="images/photo/img02.png" /></a>
        <a class="a3" href="#">三星A700 超薄金属机身三星时尚新机 潮流品牌</a>
        <p>￥2888.00 x1<a href="#">删除</a></p>
        <div class="clear"></div>
      </div>
      <div class="shopping_list">
        <div class="clear"></div>
        <a class="a2" href="#"><img src="images/photo/img02.png" /></a>
        <a class="a3" href="#">三星A700 超薄金属机身三星时尚新机 潮流品牌</a>
        <p>￥2888.00 x1<a href="#">删除</a></p>
        <div class="clear"></div>
      </div>
      <div class="shopping_list">
        <div class="clear"></div>
        <a class="a2" href="#"><img src="images/photo/img02.png" /></a>
        <a class="a3" href="#">三星A700 超薄金属机身三星时尚新机 潮流品牌</a>
        <p>￥2888.00 x1<a href="#">删除</a></p>
        <div class="clear"></div>
      </div><!--shopping_list END-->
      <h3 class="tit">
        <span>满减</span>
        购满1999元，即可享受满减优惠 小计：￥2888.00
      </h3>
      <div class="shopping_list">
        <div class="clear"></div>
        <a class="a2" href="#"><img src="images/photo/img02.png" /></a>
        <a class="a3" href="#">三星A700 超薄金属机身三星时尚新机 潮流品牌</a>
        <p>￥2888.00 x1<a href="#">删除</a></p>
        <div class="clear"></div>
      </div><!--shopping_list END-->
      <h4 class="shopping_price">
        共1件商品 &nbsp;&nbsp;共计<span class="fw-b">￥2288.00</span>
        <a href="#">去结算</a>
      </h4>
    </menu>
  </div>
  <div class="clear"></div>
</section>

<nav class="navbox">
  <section class="navlist" id="mainnavdown">
    <a href="#" class="a2">全部商品分类</a>
    <ul class="navlistout" id="navdown" style="display:none;">
      <li>
        <h3>手机大全</h3>
        <p class="p_box">
          <a href="#">苹果</a>
          <a href="#">三星</a>
          <a href="#">索尼</a>
          <a href="#">小米</a>
          <a href="#">华为</a>
          <a href="#">魅族</a>
          <a href="#">苹果</a>
          <a href="#">三星</a>
          <a href="#">索尼</a>
          <a href="#">小米</a>
          <a href="#">华为</a>
        </p>
        <div class="nav_showbox">
          <i class="bg"></i>
          <div class="clear"></div>
          <table class="nav_right">
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td colspan="2" class="pt10"><a href="#"><img src="images/photo/img06.png" /></a></td>
            </tr>
            <tr>
              <td colspan="2"><a href="#"><img src="images/photo/img06.png" /></a></td>
            </tr>
          </table>
          <table class="nav_more">
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
          </table>
          <div class="clear"></div>
        </div>
      </li>
      <li>
        <h3>家具用品</h3>
        <p class="p_box">
          <a href="#">苹果</a>
          <a href="#">三星</a>
          <a href="#">索尼</a>
        </p>
        <div class="nav_showbox">
          <i class="bg"></i>
          <div class="clear"></div>
          <table class="nav_right">
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td colspan="2" class="pt10"><a href="#"><img src="images/photo/img06.png" /></a></td>
            </tr>
            <tr>
              <td colspan="2"><a href="#"><img src="images/photo/img06.png" /></a></td>
            </tr>
          </table>
          <table class="nav_more">
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
          </table>
          <div class="clear"></div>
        </div>
      </li>
      <li>
        <h3>平板电脑</h3>
        <p class="p_box">
          <a href="#">苹果</a>
          <a href="#">三星</a>
          <a href="#">索尼</a>
          <a href="#">小米</a>
          <a href="#">华为</a>
          <a href="#">魅族</a>
          <a href="#">苹果</a>
          <a href="#">三星</a>
          <a href="#">索尼</a>
          <a href="#">小米</a>
          <a href="#">华为</a>
        </p>
        <div class="nav_showbox">
          <i class="bg"></i>
          <div class="clear"></div>
          <table class="nav_right">
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td colspan="2" class="pt10"><a href="#"><img src="images/photo/img06.png" /></a></td>
            </tr>
            <tr>
              <td colspan="2"><a href="#"><img src="images/photo/img06.png" /></a></td>
            </tr>
          </table>
          <table class="nav_more">
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
          </table>
          <div class="clear"></div>
        </div>
      </li>
      <li>
        <h3>手机配件</h3>
        <p class="p_box">
          <a href="#">苹果</a>
          <a href="#">三星</a>
          <a href="#">索尼</a>
          <a href="#">小米</a>
          <a href="#">华为</a>
          <a href="#">魅族</a>
          <a href="#">苹果</a>
          <a href="#">三星</a>
          <a href="#">索尼</a>
          <a href="#">小米</a>
          <a href="#">华为</a>
        </p>
        <div class="nav_showbox">
          <i class="bg"></i>
          <div class="clear"></div>
          <table class="nav_right">
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td colspan="2" class="pt10"><a href="#"><img src="images/photo/img06.png" /></a></td>
            </tr>
            <tr>
              <td colspan="2"><a href="#"><img src="images/photo/img06.png" /></a></td>
            </tr>
          </table>
          <table class="nav_more">
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
          </table>
          <div class="clear"></div>
        </div>
      </li>
      <li>
        <h3>电脑办公</h3>
        <p class="p_box">
          <a href="#">苹果</a>
          <a href="#">三星</a>
          <a href="#">索尼</a>
          <a href="#">小米</a>
          <a href="#">华为</a>
          <a href="#">魅族</a>
          <a href="#">苹果</a>
          <a href="#">三星</a>
        </p>
        <div class="nav_showbox">
          <i class="bg"></i>
          <div class="clear"></div>
          <table class="nav_right">
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td colspan="2" class="pt10"><a href="#"><img src="images/photo/img06.png" /></a></td>
            </tr>
            <tr>
              <td colspan="2"><a href="#"><img src="images/photo/img06.png" /></a></td>
            </tr>
          </table>
          <table class="nav_more">
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
          </table>
          <div class="clear"></div>
        </div>
      </li>
      <li>
        <h3>网络外设</h3>
        <p class="p_box">
          <a href="#">苹果</a>
          <a href="#">三星</a>
          <a href="#">索尼</a>
          <a href="#">小米</a>
          <a href="#">华为</a>
          <a href="#">魅族</a>
        </p>
        <div class="nav_showbox">
          <i class="bg"></i>
          <div class="clear"></div>
          <table class="nav_right">
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
              <td><a href="#"><img src="newimg/img05.png" /></a></td>
            </tr>
            <tr>
              <td colspan="2" class="pt10"><a href="#"><img src="images/photo/img06.png" /></a></td>
            </tr>
            <tr>
              <td colspan="2"><a href="#"><img src="images/photo/img06.png" /></a></td>
            </tr>
          </table>
          <table class="nav_more">
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
            <tr>
              <th width="90"><span>品牌</span></th>
              <td>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
                <a href="#">苹果</a>
              </td>
            </tr>
          </table>
          <div class="clear"></div>
        </div>
      </li>
    </ul><!--navlistout END-->
  </section>
  <a class="a1" href="#">手机</a>
  <a class="a1" href="#">笔记本</a>
  <a class="a1" href="#">配件</a>
  <a class="a1" href="#">摄影</a>
  <a class="a1" href="#">闪购</a>
  <a class="a1" href="#">团购</a>
  <a class="a1" href="#">母婴</a>
  <a class="a1" href="#">选号</a>
  <a class="a1" href="#">资讯</a>
  <a class="a1" href="#">会员专区</a>
  <a class="a1" href="#">门店</a>
</nav>
<div class="clear h10"></div>

<menu class="column_qg main border-df">
<span class="hot_sale">热销推荐</span>
    <#if most_sold_list??>
        <#list most_sold_list as item>
            <#if item_index < 4>
                <a class="list" href="/goods/${item.id?c}">
                    <img src="${item.coverImageUri!''}" width="120" height="120"/>
                    <p class="pt10 pb10" style="overflow: hidden;height: 60px;">${item.title!''}</p>
                    <p class="red fs16">￥<#if item.salePrice??>${item.salePrice?string("0.00")}</#if></p>
                    <span>立即抢购</span>
                </a>
            </#if>
        </#list>
    </#if>  
  <div class="clear"></div>
  
</menu><!--column_qg END-->
<div class="clear h20"></div>


<div class="main">
  <section class="column_left">
    <menu class="border-df">
      <h3 class="tit">新品推荐</h3>
      <#if newest_list??>
           <#list newest_list as item>
                <#if item_index < 8>
                      <li>
                        <a href="/goods/${item.id?c}"><img src="${item.coverImageUri!''}" width="177" height="177"/></a>
                        <a href="/goods/${item.id?c}" style="overflow: hidden;height: 40px;">${item.title!''}</a>
                        <p class="fs18 red ta-c">￥<#if item.salePrice??>${item.salePrice?string("0.00")}</#if></p>
                        <p class="fs12">已有<span class="blue">${item.totalCollects!''}</span>人关注</p>
                      </li>
                </#if>
           </#list>
      </#if>    
    </menu>

    <menu class="border-df mt20">
      <h3 class="tit">浏览记录</h3>
      <#if recent_page??>
        <#list recent_page.content as item>
            <#if item_index < 9>
                <a class="scan" href="/goods/${item.goodsId?c}">
                    <img src="${item.goodsCoverImageUri!''}" width="80" height="80"/>
                    <p style="overflow: hidden;height: 60px;">${item.goodsTitle!''}</p>
                    <p class="red">￥<#if item.goodsSalePrice??>${item.goodsSalePrice?string("0.00")}</#if></p>
                </a>
            </#if>
        </#list>
      </#if>     
      <div class="ta-r" style="border-top:1px dotted #ddd;"><a class="blue fs12 lh30" href="javascript:deleterecent();">清空浏览记录</a></div>
    </menu>
  </section><!--column_left END-->
  
  <div class="column_right">
    <h3 class="screen_clear">
      商品筛选
      <a class="a1" href="${categoryId!'0'}-0<#list param_index_list as pindex>-0</#list>-${orderId!'0'}<#if sort_id_list??><#list sort_id_list as sortId>-${sortId!'0'}</#list></#if>-${pageId!'0'}-0">清空筛选条件</a>
    </h3>
    <table class="screen_tab">
     <#if brand_list??>
        <tr>
            <td><a href="${categoryId!'0'}-0<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}<#if sort_id_list??><#list sort_id_list as sortId>-${sortId!'0'}</#list></#if>-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>" <#if brandIndex==0>class="sel"</#if>>全部品牌</a></td>
            <#list brand_list as brand>
                <#if brand_index < 13>
                    <#if brand_index%7 ==5>
                        <td><a href="${categoryId!'0'}-${brand_index+1}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}<#if sort_id_list??><#list sort_id_list as sortId>-${sortId!'0'}</#list></#if>-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>" <#if brandIndex==brand_index+1>class="flhover"</#if>><img src="${brand.logoUri!''}"  height="34" width="96" title="${brand.title?trim!''}" alt="${brand.title?trim!''}"/></a></td>
                        </tr>
                    <#elseif brand_index%7 ==6>
                        <tr>
                        <td><a href="${categoryId!'0'}-${brand_index+1}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}<#if sort_id_list??><#list sort_id_list as sortId>-${sortId!'0'}</#list></#if>-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>" <#if brandIndex==brand_index+1>class="flhover"</#if>><img src="${brand.logoUri!''}"  height="34" width="96" title="${brand.title?trim!''}" alt="${brand.title?trim!''}"/></a></td>                    
                    <#else>
                        <td><a href="${categoryId!'0'}-${brand_index+1}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}<#if sort_id_list??><#list sort_id_list as sortId>-${sortId!'0'}</#list></#if>-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>" <#if brandIndex==brand_index+1>class="flhover"</#if>><img src="${brand.logoUri!''}"  height="34" width="96" title="${brand.title?trim!''}" alt="${brand.title?trim!''}"/></a></td> 
                    </#if>
                </#if>
            </#list>
        
    </#if>
    </table>
    <section class="choose_box">
        <#-- 参数开始 -->
        <#if param_list??>
            <#list param_list as param>
                <menu>
                    <h4 style="height:20px;overflow:hidden">${param.title!""}：</h4>
                    <a href="${categoryId!'0'}-${brandIndex!'0'}<#list param_index_list as pindex><#if param_index==pindex_index>-0<#else>-${pindex!'0'}</#if></#list>-${orderId!'0'}<#if sort_id_list??><#list sort_id_list as sortId>-${sortId!'0'}</#list></#if>-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>" <#if param_index_list[param_index]==0>class="sel"</#if>>全部</a>
                    <#if param.valueList??>
                        <#list param.valueList?split(",") as value>
                            <#if value!="">
                                <a href="${categoryId!'0'}-${brandIndex!'0'}<#list param_index_list as pindex><#if param_index==pindex_index>-${value_index+1}<#else>-${pindex!'0'}</#if></#list>-${orderId!'0'}<#if sort_id_list??><#list sort_id_list as sortId>-${sortId!'0'}</#list></#if>-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>" <#if param_index_list[param_index]==value_index+1>class="sel"</#if>>${value?trim!""}</a>
                            </#if>
                        </#list>
                    </#if>
                </menu>
            </#list>
        </#if>
        <#-- 参数结束 -->
        
        <#if param_list?? && param_list?size gt 4>
            <div class="choose_more"><a href="javascript:chooseMoreDown();">下拉，更多选项<img src="/client/images/content/arrow01.png" /></a></div>
        </#if>
    </section><!--choose_box-->
    <div class="clear h20"></div>
    
    <section class="column_px">
      <menu>
        <a <#if orderId==0><#if sort_id_list[0]==0>class="sel01"<#else>class="sel02"</#if></#if> href="${categoryId!'0'}-${brandIndex!'0'}<#list param_index_list as pindex>-${pindex!'0'}</#list>-0<#if sort_id_list??><#list sort_id_list as sortId><#if sortId_index==0><#if sortId==0>-1<#else>-0</#if><#else>-${sortId!'0'}</#if></#list></#if>-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>"><span>销量</span></a>
        <a <#if orderId==1><#if sort_id_list[1]==0>class="sel01"<#else>class="sel02"</#if></#if> href="${categoryId!'0'}-${brandIndex!'0'}<#list param_index_list as pindex>-${pindex!'0'}</#list>-1<#if sort_id_list??><#list sort_id_list as sortId><#if sortId_index==1><#if sortId==0>-1<#else>-0</#if><#else>-${sortId!'0'}</#if></#list></#if>-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>"><span>价格</span></a>
        <a <#if orderId==2><#if sort_id_list[2]==0>class="sel01"<#else>class="sel02"</#if></#if> href="${categoryId!'0'}-${brandIndex!'0'}<#list param_index_list as pindex>-${pindex!'0'}</#list>-2<#if sort_id_list??><#list sort_id_list as sortId><#if sortId_index==2><#if sortId==0>-1<#else>-0</#if><#else>-${sortId!'0'}</#if></#list></#if>-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>"><span>上架时间</span></a>  
        <a <#if orderId==3><#if sort_id_list[3]==0>class="sel01"<#else>class="sel02"</#if></#if> href="${categoryId!'0'}-${brandIndex!'0'}<#list param_index_list as pindex>-${pindex!'0'}</#list>-3<#if sort_id_list??><#list sort_id_list as sortId><#if sortId_index==3><#if sortId==0>-1<#else>-0</#if><#else>-${sortId!'0'}</#if></#list></#if>-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>"><span>人气</span></a> 
        <a <#if orderId==4><#if sort_id_list[4]==0>class="sel01"<#else>class="sel02"</#if></#if> href="${categoryId!'0'}-${brandIndex!'0'}<#list param_index_list as pindex>-${pindex!'0'}</#list>-4<#if sort_id_list??><#list sort_id_list as sortId><#if sortId_index==4><#if sortId==0>-1<#else>-0</#if><#else>-${sortId!'0'}</#if></#list></#if>-${pageId!'0'}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>"><span>评价</span></a>  
        <div class="sxtjBox">
                    <span>价格范围：</span>
                    <input type="text" id="ParamFiltern_price1" class="jgqj_txt" value="<#if priceLow??>${priceLow?string("#.##")}</#if>"/>
                    <span>--</span>
                    <input type="text" id="ParamFiltern_price2" class="jgqj_txt" value="<#if priceHigh??>${priceHigh?string("#.##")}</#if>"/>
                    <input type="submit" class="jgqj_btn" onclick="setprice()" value="确定" />
        </div>      
      </menu>
      <a href="${categoryId!'0'}-${brandIndex!'0'}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}<#if sort_id_list??><#list sort_id_list as sortId>-${sortId!'0'}</#list></#if>-${pageId!'0'}-<#if !leftId?? || leftId==0>1<#else>0</#if><#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>"><b <#if leftId?? && leftId==1>class="zyon"<#else>class="zy"</#if> ></b></a>
      <div class="dd">仅显示有货</div>
      <div class="fr">
        <#if goods_page.number+1 == goods_page.totalPages || goods_page.totalPages==0>
            <a href="javascript:;"><img src="/client/images/content/page_n.png" height="11" /></a>
        <#else>
            <a href="${categoryId!'0'}-${brandIndex!0}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}<#if sort_id_list??><#list sort_id_list as sortId>-${sortId!'0'}</#list></#if>-${goods_page.number+1}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>"><img src="/client/images/content/page_n.png" height="11" /></a> <#-- goods_page.number+1 -->
        </#if>
                
        <#if goods_page.number+1 == 1>
            <a href="javascript:;"><img src="/client/images/content/page_l.png" height="11" /></a>
        <#else>
            <a href="${categoryId!'0'}-${brandIndex!0}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}<#if sort_id_list??><#list sort_id_list as sortId>-${sortId!'0'}</#list></#if>-${goods_page.number-1}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>"><img src="/client/images/content/page_l.png" height="11" /></a> <#-- goods_page.number-1 -->
        </#if>
        <span><font class="fc"><#if goods_page.totalPages==0>0<#else>${goods_page.number+1}</#if></font>/${goods_page.totalPages!"0"}页</span>
      </div>
      <div class="clear"></div>
    </section>
    
    <ul class="column_sum">
    <#if goods_page?? && goods_page.content?size gt 0>
            <#list goods_page.content as goods>
                <li>
                    <i><img src="/client/images/content/part_hot.png" /></i>
                    <a class="a1" href="/goods/${goods.id?c}"><img src="${goods.coverImageUri!''}" height="210" width="210" title="${goods.title!''} ${goods.subTitle!''}"/></a>
                    <a class="block h40" href="/goods/${goods.id?c}" style="overflow: hidden;height: 40px;">${goods.title!""} ${goods.version!""} ${goods.color!""} ${goods.capacity!""}</a>
                    <p class="fs26 lh35 red">￥<#if goods.salePrice??>${goods.salePrice?string("0.00")}</#if></p>
                    <p class="fs12">已有<span class="blue">${goods.totalCollects!'0'}</span>人关注</p>
                    <div>
                     
                      <a class="a3" href="/cart/init?id=${goods.id?c}" target="_blank">加入购物车</a>
                      <a class="a4" href="javascript:addCollect(${goods.id?c});">收藏</a>
                     
                    </div>
                </li>
            </#list>
    <#else>
             <div style="text-align: center; padding: 15px;">此类商品正在扩充中，敬请期待！</div>
    </#if>  
     
    </ul>
    <div class="clear h20"></div>
    
    <div class="pagebox">
      <div class="num">
        <#if goods_page??>
            <#assign continueEnter=false>
            <#if goods_page.number+1 == 1>
                <a class="a1 a0" href="javascript:;"><span>上一页</span></a>
            <#else>
                <a class="a1 a0" href="${categoryId!'0'}-${brandIndex!0}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}<#if sort_id_list??><#list sort_id_list as sortId>-${sortId!'0'}</#list></#if>-${goods_page.number-1}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>"><span>上一页</span></a>
            </#if>
            
            <#if goods_page.totalPages gt 0>
                <#list 1..goods_page.totalPages as page>
                    <#if page <= 3 || (goods_page.totalPages-page) < 3 || (goods_page.number+1-page)?abs<3 >
                        <#if page == goods_page.number+1>
                            <a class="sel" href="javascript:;">${page}</a>
                        <#else>
                            <a href="${categoryId!'0'}-${brandIndex!0}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}<#if sort_id_list??><#list sort_id_list as sortId>-${sortId!'0'}</#list></#if>-${page-1}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>">${page}</a> <#-- ${page} -->
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
                <a class="a2" href="javascript:;"><span>下一页</span></a>
            <#else>
                <a class="a2" href="${categoryId!'0'}-${brandIndex!0}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}<#if sort_id_list??><#list sort_id_list as sortId>-${sortId!'0'}</#list></#if>-${goods_page.number+1}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>"><span>下一页</span></a>
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
    </div><!--pagebox END-->
    
  </div><!--column_right END-->
  
  <div class="clear"></div>
</div><!--main END-->

<div class="clear h40"></div>
<section class="index_center">
  <table>
    <tr>
      <td>
        <a href="#"><img src="images/bot_ico01.png" />品牌连锁 实体体验</a>
      </td>
      <td>
        <a href="#"><img src="images/bot_ico02.png" />货到付款 安全放心</a>
      </td>
      <td>
        <a href="#"><img src="images/bot_ico03.png" />市区内免费送货</a>
      </td>
      <td>
        <a href="#"><img src="images/bot_ico04.png" />七天包换 后顾无忧</a>
      </td>
      <td>
        <a href="#"><img src="images/bot_ico05.png" />两年延保 诚信满意</a>
      </td>
      <td>
        <a href="#"><img src="images/bot_ico06.png" />软件终身免费维护</a>
      </td>
    </tr>
  </table>
</section><!--index_center END-->
<div class="clear h20"></div>
<section class="bot_help main">
  <menu>
    <h3>关于我们</h3>
    <a href="#">关于丫丫</a>
    <a href="#">业务合作</a>
    <a href="#">高薪诚聘</a>
    <a href="#">丫丫会员积分</a>
  </menu>
  <menu>
    <h3>关于我们</h3>
    <a href="#">关于丫丫</a>
    <a href="#">业务合作</a>
    <a href="#">高薪诚聘</a>
    <a href="#">丫丫会员积分</a>
  </menu>
  <menu>
    <h3>关于我们</h3>
    <a href="#">关于丫丫</a>
    <a href="#">业务合作</a>
    <a href="#">高薪诚聘</a>
    <a href="#">丫丫会员积分</a>
  </menu>
  <menu>
    <h3>关于我们</h3>
    <a href="#">关于丫丫</a>
    <a href="#">业务合作</a>
    <a href="#">高薪诚聘</a>
    <a href="#">丫丫会员积分</a>
  </menu>
  <menu>
    <h3>关于我们</h3>
    <a href="#">关于丫丫</a>
    <a href="#">业务合作</a>
    <a href="#">高薪诚聘</a>
    <a href="#">丫丫会员积分</a>
  </menu>
  <menu>
    <h3>关于我们</h3>
    <a href="#">关于丫丫</a>
    <a href="#">业务合作</a>
    <a href="#">高薪诚聘</a>
    <a href="#">丫丫会员积分</a>
  </menu>
  <div class="bot_work">
    <p>
      <img src="images/bot_ico08.png" />
      <span class="lh40 fs26 fc block">4009-955-966</span>
      <span class="c7">工作时间：每天09:00-21:30</span>
    </p>
    <p class="mt20">
      <img src="images/bot_ico09.png" />
      <a href="#">点击进行在线咨询</a>
    </p>
  </div>
  <div class="clear h20"></div>
</section>
<footer class="foot_sys">
  <section class="main">
    <div class="sys">
      <img src="images/sys01.png" />
      <p class="lh30 fs20 pb5">微信平台</p>
      <p>微信二维码</p>
      <p>扫一扫更多惊喜带给您</p>
    </div>
    <div class="sys">
      <img src="images/sys01.png" />
      <p class="lh30 fs20 pb5">微信平台</p>
      <p>微信二维码</p>
      <p>扫一扫更多惊喜带给您</p>
    </div>
    <div class="sys">
      <img src="images/sys01.png" />
      <p class="lh30 fs20 pb5">微信平台</p>
      <p>微信二维码</p>
      <p>扫一扫更多惊喜带给您</p>
    </div>
    <div class="bot_search">
      <p class="fs18">您身边的丫丫</p>
      <p class="fs12">丫丫网实体店和服务店为您提供最贴心的体验服务</p>
      <div>
        <input type="submit" class="sub" value=" " />
        <input type="text" class="text bottext" value="查看所有门店" />
      </div>
    </div><!--bot_search END-->
    <div class="clear"></div>
  </section>
</footer><!--bot_search END-->

<footer class="mainfoot">
  <section class="main">
    <nav>
      <a class="a1" href="#"><img src="images/footer.png" /></a>
      <a href="#">关于丫丫</a>|
      <a href="#">团队介绍</a>|
      <a href="#">高薪诚聘</a>|
      <a href="#">业务合作</a>|
      <a href="#">会员积分</a>|
      <a href="#">投诉建议</a>|
      <a href="#">友情链接</a>
    </nav>
    <p class="c9 w100">
      Copyright©2006-2015 All Rights Reserved 丫丫手机网 版权所有 滇ICP备07004173号
      <span><a title="云南网站建设" href="http://www.ynyes.com" target="_blank">网站建设</a>技术支持：<a title="云南网站建设" href="http://www.ynyes.com" target="_blank">昆明天度网络公司</a></span>
    </p>
  </section>
</footer><!--mainfoot END-->
</body>
</html>
