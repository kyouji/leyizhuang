<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<!--[if IE]>
   <script src="js/html5.js"></script>
<![endif]-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/common.js"></script>
<script src="/client/js/ljs-v1.01.js"></script>
<script src="/client/js/content.js"></script>
<script src="/client/js/scro-content.js"></script>
<script type="text/javascript" src="/client/js/goods.js"></script>


<link href="/client/css/common.css" rel="stylesheet" type="text/css" />
<link href="/client/css/cartoon.css" rel="stylesheet" type="text/css" />
<link href="/client/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/client/css/content_l.css" />

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
    
    productImgShow("proshowimg","li","proshowmenu","sel",396,396);
    checkBoxShow("assort_menu","a","assort_sum","li","sel");
    topTitFloat("detail_tit",1250,"detail_tit_sel");

    $("#id-minus").click(function(){
        var q = parseInt($("#quantity").val());
        
        if (q > 1)
        {
            $("#quantity").val(q-1);
        }
        
        $("#addCart").attr("href", "/cart/init?id=${goods.id?c}&quantity=" + $("#quantity").val()); 
    });
    
    $("#id-plus").click(function(){
        var q = parseInt($("#quantity").val());
        
        <#if goods.leftNumber??>
            if (q < ${goods.leftNumber!'0'})
            {
                $("#quantity").val(q+1);
            }
            else
            {
                alert("已达到库存最大值");
            }
        <#else>
            $("#quantity").val(q+1);
        </#if>
        $("#addCart").attr("href", "/cart/init?id=${goods.id?c}&quantity=" + $("#quantity").val()); 
    
    });
});

 function combSelect(self, price, originPrice)
    {
        var count = parseInt($("#combCount").html());
        var currentPrice = parseFloat($("#combCurrentPrice").html());
        var combOriginPrice = parseFloat($("#combOriginPrice").html());
        var combSavePrice = parseFloat($("#combSave").html());
        
        // 选中
        if (self.checked)
        {
            $("#combCount").html(count+1);
            $("#combCurrentPrice").html(currentPrice + price);
            $("#combOriginPrice").html(combOriginPrice + originPrice);
            $("#combSave").html(combSavePrice + originPrice - price);
        }
        // 取消选中
        else
        {
            $("#combCount").html(count-1);
            $("#combCurrentPrice").html(currentPrice - price);
            $("#combOriginPrice").html(combOriginPrice - originPrice);
            $("#combSave").html(combSavePrice - originPrice + price);
        }
    }
    
    function clearSelect()
    {
        $("#combCount").html(0);
        $("#combCurrentPrice").html(${goods.salePrice?string("0.00")});
        $("#combOriginPrice").html(${goods.salePrice?string("0.00")});
        $("#combSave").html(0);
        
        $(".comboCheckBox").attr("checked", false);
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
  <a href="#" title="微信客服"><img src="/client/images/float_ico01.png" width="42" height="42" alt="微信客服" /><span><img src="/client/images/sys01.png" /></span></a>
  <a href="#" title="在线咨询"><img src="/client/images/float_ico02.png" width="42" height="42" alt="在线咨询" /></a>
  <a href="#" title="新浪微博"><img src="/client/images/float_ico03.png" width="42" height="42" alt="新浪微博" /></a>
  <a href="#" title="服务热线"><img src="/client/images/float_ico04.png" width="42" height="42" alt="服务热线" /><span><img src="/client/images/sys02.png" /></span></a>
  <a href="javascript:$('html,body').animate({scrollTop:0},500);" title="到顶部"><img src="/client/images/float_ico05.png" width="42" height="42" alt="到顶部" /></a>
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
<div class="clear"></div>
<div class="pro_info">
  <h2 class="main pro_tit">
  <span><a href="/">首页</a></span>
   <#if category_tree_list??>
                <#list category_tree_list as category>
                    > <span><a href="/list/${category.id?c}">${category.title!""}</a></span>
                </#list>
    </#if>
    > <span>${goods.title!''}</span>
  </h2>
  
  <div class="pro_box">
    <section class="proinfo_left">
      <menu id="proshowimg">
          <#if goods.showPictures??>
                <#list goods.showPictures?split(",") as uri>
                    <#if ""!=uri && uri_index < 4>
                        <li><img src="${uri!''}" /></li>
                    </#if>
                </#list>
          </#if>
      </menu>
      <div class="clear h20"></div>
            <menu id="proshowmenu"></menu>
      <div class="clear h20"></div>
      
      <div class="pro_share">
        <div class="bdsharebuttonbox" style="float:left;">
                    <a href="#" class="bds_more" data-cmd="more"></a>
                    <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                    <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                    <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
                    <a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网">
                    </a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                  </div>
<script>
                window._bd_share_config={
                "common":{
                    "bdSnsKey":{},
                    "bdText":"正品惠客##${goods.title!''}", bdUrl:"http://116.55.230.207:8010/goods/${goods.id?c}", "bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},
                    "share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
</script>
                   
                    <span class="ml10" style="line-height:30px;">商品编码：${goods.code!''}</span> 
                    <a class="a1" href="javascript:addCollect(${goods.id?c});" style="line-height:30px;">关注该商品</a>
                    <div class="clear"></div>
      </div>
    </section><!--proinfo_left END-->
    
    <section class="proinfo_right">
      <h3>${goods.title!''}<!-- 删除<a href="#">对比</a> --></h3>
      <h4 class="red">${goods.subTitle!''}</h4>
      <div class="pro_price">
        <p class="p1">
          <span>惠客价格：</span>
          <span class="red fs24 lh30 mr20 l-weight">￥<#if goods.salePrice??>${goods.salePrice?string("0.00")}</#if></span>
          <a href="#"><img src="/client/images/content/pro_ico01.png" height="17" /><b>特惠</b></a>
         <!-- 删除 <a href="#"><img src="images/content/pro_ico02.png" height="17" /><b>对比</b></a>
          <a href="#"><img src="images/content/pro_ico03.png" height="17" /><b>走势</b></a> -->
        </p>
        <p class="p1">
          <span>促销信息：</span>
          <span class="l-gift">赠品</span>
          <span class="red">${goods.promotion!''}</span>
        </p>
        <p class="p1">
          <span style="display:block; width:500px">原装标配：${goods.configuration!''}</span>
        </p>
        <p class="p2">共有${goods.totalComments!'0'}人评论，${goods.totalCollects!'0'}人关注</p>
        <p class="p3">好评率：<span class="red fs26 lh30"><#if comment_count?? && three_star_comment_count?? && comment_count != 0>${three_star_comment_count/comment_count}<#else>100</#if>%</span></p>
      </div><!--pro_price END-->
      <table class="pro_choose">
        <#if total_select??>
            <#if 1==total_select>
                <tr>
                  <th>${select_one_name!''}：</th>
                  <td>
                    <#if select_one_goods_list??>
                    <#list select_one_goods_list as item>
                        <a <#if item.selectOneValue==one_selected>class="lchose""</#if> href="/goods/${item.id?c}">${item.selectOneValue}</a>
                    </#list>
                    </#if>
                  </td>
                </tr>
            <#elseif 2==total_select>
                <tr>
                    <th>${select_one_name!''}：</th>
                    <td>
                        <#if select_one_goods_list??>
                        <#list select_one_goods_list as item>
                            <a <#if item.selectOneValue==one_selected>class="lchose"</#if> href="/goods/${item.id?c}">${item.selectOneValue}</a>
                        </#list>
                        </#if>
                    </td>
                </tr>
                <tr>
                    <th>${select_two_name!''}：</th>
                    <td>
                        <#if select_two_goods_list??>
                        <#list select_two_goods_list as item>
                            <a <#if item.selectTwoValue==two_selected>class="lchose"</#if> href="/goods/${item.id?c}">${item.selectTwoValue}</a>
                        </#list>
                        </#if>
                    </td>
                </tr>
            <#elseif 3==total_select>
                <tr>
                    <th>${select_one_name!''}：</th>
                    <td>
                        <#if select_one_goods_list??>
                        <#list select_one_goods_list as item>
                            <a <#if item.selectOneValue==one_selected>class="lchose"</#if> href="/goods/${item.id?c}">${item.selectOneValue}</a>
                        </#list>
                        </#if>
                    </td>
                </tr>
                <tr>
                    <th>${select_two_name!''}：</th>
                    <td>
                        <#if select_two_goods_list??>
                        <#list select_two_goods_list as item>
                            <a <#if item.selectTwoValue==two_selected>class="lchose"</#if> href="/goods/${item.id?c}">${item.selectTwoValue}</a>
                        </#list>
                        </#if>
                    </td>
                </tr>
                <tr>
                    <th>${select_three_name!''}：</th>
                    <td>
                        <#if select_three_goods_list??>
                        <#list select_three_goods_list as item>
                            <a <#if item.selectThreeValue==three_selected>class="lchose"</#if> href="/goods/${item.id?c}">${item.selectThreeValue}</a>
                        </#list>
                        </#if>
                    </td>
                </tr>
            </#if>
        </#if>
        <tr>
          <th>服务支持：</th>
          <td>
            <#if GoodsService_item_list??>                                                       
            <#list GoodsService_item_list as item>      
              <#if item_index < 4 >             
                <img src="${item.logo!''}" width="26" height="26" style="vertical-align:middle;float: left;">                                                                  
                <div style="height: 26px;display: inline-block;line-height: 30px;color:#333333;float: left;margin-right: 40px;margin-left: 10px;">${item.title!''}</div>                                 
              </#if>
            </#list>
            </#if>
            <div class="clear"></div>
          </td>
        </tr>
        <tr>
          <th>数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量：</th>
          <td>

            <input name="quantity" class="text" id="quantity" type="text" value="1" />
             <div class="plus">
              <a href="javascript:;" id="id-plus">+</a>
              <a href="javascript:;" id="id-minus">-</a>
            </div>
            <div class="clear"></div>
          </td>
        </tr>
       <!-- <tr>
          <th>套&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;餐：</th>
          <td><a class="sel" href="###" onclick="lchose(this)">联通4G版</a><a href="###" onclick="lchose(this)">联通4G版</a><a href="###" onclick="lchose(this)">联通4G版</a></td>
        </tr> -->
        <tr>
          <th></th>
          <td>
            <input type="submit" class="sub" value="加入购物车" />
            <!-- 删除<input type="submit" class="sub sub01" value="分期付款" /> -->
            <div class="clear"></div>
          </td>
        </tr>
      </table>
      
      <div class="sys">
        <i><img src="/client/images/content/pro_sys.png" /></i>
        <p><img src="<#if site??>${site.wxQrCode!''}</#if>"  width="83" height="83"" /></p>
        <p class="pt5">关注官方微信<br /></p>
      </div>
    </section><!--proinfo_right END-->
    <div class="clear h20"></div>
  </div><!--pro_box END--> 
  <div class="clear h20"></div>
</div><!--pro_info END-->



<div class="main pt20">
  <#if goods.combList??>  
  <section class="pro_assort">
    <menu id="assort_menu">
      <a class="sel" href="#">全部推荐</a>      
      <div class="clear"></div>
    </menu>
    <ul id="assort_sum">
      <li>
        <div class="part">
          <a href="/goods/${goods.id?c}"><img src="${goods.coverImageUri!''}" width="140" height="140" /></a>
          <p style="height: 30px; overflow: hidden;">${goods.title!''}</p>
          <p class="p1"><span>￥<#if goods.salePrice??>${goods.salePrice?string("0.00")}</#if></span></p>
        </div>
        <p class="part"><img src="/client/images/content/pro_plus.png" /></p>
       <#if goods.combList?? && goods.combList?size gt 0>
                    <#list goods.combList as item>
                      <#if item_index < 4 >
                        <div class="part">
                            <a href="/goods/${item.goodsId?c}"><img src="${item.coverImageUri!''}" width="140" height="140"/></a>
                            <p style="height: 30px; overflow: hidden;">${item.goodsTitle!''}</p>
                            <p class="p2"><del>￥${item.goodsPrice?string("0.00")}</del></p>
                            <p class="p1">
                                <input type="checkbox" class="comboCheckBox" zpid="${item.id?c}" onclick="javascript:combSelect(this, ${item.currentPrice?string("0.00")}, ${item.goodsPrice?string("0.00")});"/>
                                <span>￥${item.currentPrice?string("0.00")}</span>
                            </p>
                        </div>
                        <#if item_index+1 < goods.combList?size> 
                            <p class="part"><img src="/client/images/images/spxq_36.png" /></p>                   
                        </#if>
                      </#if>
                    </#list>
                </#if>
        <p class="part"><img src="/client/images/content/pro_eq.png" /></p>
        <div class="part01">
          <p>搭配价：￥<span class="red" id="combCurrentPrice">${goods.salePrice?string("0.00")}</span></p>
          <p>参考价：￥<span class="unl-th" id="combOriginPrice">${goods.salePrice?string("0.00")}</span></p>
          <input id="zhAddCart" class="sub" type="submit" value="立即购买" />
        </div>
        <div class="clear"></div>
      </li>      
    </ul>
    <div class="clear"></div>
  </section><!--pro_assort END-->
  </#if>
  <div class="clear h20"></div>
  <section class="column_left">
     <menu class="border-df mb20">
      <h3 class="tit mb10" style="border-bottom:1px dotted #ddd;">关于手机，你可能在找</h3>
      <a class="greybox" href="#">合约机</a>
      <a class="greybox" href="#">非合约机</a>
      <a class="greybox" href="#">电信4G</a>
      <a class="greybox" href="#">移动3G</a>
      <a class="greybox" href="#">合约机</a>
      <a class="greybox" href="#">非合约机</a>
      <a class="greybox" href="#">电信4G</a>
      <a class="greybox" href="#">移动3G</a>
      <a class="greybox" href="#">合约机</a>
      <a class="greybox" href="#">非合约机</a>
      <a class="greybox" href="#">电信4G</a>
      <a class="greybox" href="#">移动3G</a>
     </menu>
    
    <menu class="border-df mb20">
      <h3 class="tit mb10" style="border-bottom:1px dotted #ddd;">其他品牌</h3>
      <a class="abox" href="#">苹果</a>
      <a class="abox" href="#">索尼</a>
      <a class="abox" href="#">小米</a>
      <a class="abox" href="#">诺基亚</a>
      <a class="abox" href="#">魅族</a>
      <a class="abox" href="#">苹果</a>
      <a class="abox" href="#">索尼</a>
      <a class="abox" href="#">小米</a>
      <a class="abox" href="#">诺基亚</a>
      <a class="abox" href="#">魅族</a>
     </menu>
    
    <menu class="border-df">
      <h3 class="tit">新品推荐</h3>
      <li>
        <a href="#"><img src="images/photo/img09.png" /></a>
        <a href="#">我是产品名字的标题文字我是产品名字的标题文字</a>
        <p class="fs18 red ta-c">￥5490.00</p>
        <p class="fs12">已有<span class="blue">58</span>人咨询</p>
      </li>
      <li>
        <a href="#"><img src="images/photo/img09.png" /></a>
        <a href="#">我是产品名字的标题文字我是产品名字的标题文字</a>
        <p class="fs18 red ta-c">￥5490.00</p>
        <p class="fs12">已有<span class="blue">58</span>人咨询</p>
      </li>
      <li>
        <a href="#"><img src="images/photo/img09.png" /></a>
        <a href="#">我是产品名字的标题文字我是产品名字的标题文字</a>
        <p class="fs18 red ta-c">￥5490.00</p>
        <p class="fs12">已有<span class="blue">58</span>人咨询</p>
      </li>
      <li>
        <a href="#"><img src="images/photo/img09.png" /></a>
        <a href="#">我是产品名字的标题文字我是产品名字的标题文字</a>
        <p class="fs18 red ta-c">￥5490.00</p>
        <p class="fs12">已有<span class="blue">58</span>人咨询</p>
      </li>
      <li>
        <a href="#"><img src="images/photo/img09.png" /></a>
        <a href="#">我是产品名字的标题文字我是产品名字的标题文字</a>
        <p class="fs18 red ta-c">￥5490.00</p>
        <p class="fs12">已有<span class="blue">58</span>人咨询</p>
      </li>
      <li>
        <a href="#"><img src="images/photo/img09.png" /></a>
        <a href="#">我是产品名字的标题文字我是产品名字的标题文字</a>
        <p class="fs18 red ta-c">￥5490.00</p>
        <p class="fs12">已有<span class="blue">58</span>人咨询</p>
      </li>
    </menu>

    <menu class="border-df mt20">
      <h3 class="tit">浏览记录</h3>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <div class="ta-r" style="border-top:1px dotted #ddd;"><a class="blue fs12 lh30" href="#">清空浏览记录</a></div>
    </menu>
    
    <menu class="border-df mt20">
      <h3 class="tit">猜你喜欢</h3>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      
    </menu>
    
    <menu class="border-df mt20">
      <h3 class="tit">相关配件</h3>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      
    </menu>
  </section><!--column_left END-->
  
  <div class="column_right">
    <div class="detail_tit" id="detail_tit">
      <div class="out">
        <menu id="product_show_div">
          <a class="sel" href="#item1">规格参数</a>
          <a href="#item2" class>商品介绍</a>
          <a href="#item3" class>价格走势</a>
          <a href="#item4" class>商品评价</a>
          <a href="#item5" class>商品咨询</a>
          <div class="clear"></div>
        </menu>
      </div>
    </div><!--detail_tit END-->
    <div id="item1"></div>
    <table class="detail_tab">
      <tr>
        <td>品牌：三星</td>
        <td>型号：三星SAMSUNG GALAXY S5</td>
        <td>颜色：黑色 白色 蓝色 金色</td>
      </tr>
      <tr>
        <td>品牌：三星</td>
        <td>型号：三星SAMSUNG GALAXY S5</td>
        <td>颜色：黑色 白色 蓝色 金色</td>
      </tr>
      <tr>
        <td>品牌：三星</td>
        <td>型号：三星SAMSUNG GALAXY S5</td>
        <td>颜色：黑色 白色 蓝色 金色</td>
      </tr>
      <tr>
        <td>品牌：三星</td>
        <td>型号：三星SAMSUNG GALAXY S5</td>
        <td>颜色：黑色 白色 蓝色 金色</td>
      </tr>
      <tr>
        <td>品牌：三星</td>
        <td>型号：三星SAMSUNG GALAXY S5</td>
        <td>颜色：黑色 白色 蓝色 金色</td>
      </tr>
    </table>
    <div id="item2"></div>
    <article class="detail_essay">
      <p class="ta-c"><img src="images/photo/img11.png" /></p>
    </article>
    <div class="clear h10"></div>
    <div id="item4"></div>
    <section class="detail_hp">
    <div class="part02">
        好评率
        <p class="red fs28 lh40">100%</p>
      </div>
      <div class="part01">
        <h3 class="fs16 fw400">商品评价</h3>
        <p>
          好评<span><b style=" width:100%;"></b></span>100%
        </p>
        <p>
          中评<span><b style=" width:0%;"></b></span>100%
        </p>
        <p>
          差评<span><b style=" width:0%;"></b></span>100%
        </p>
      </div>
      
      <div class="part03">
        <p class="fs16 pb10">综合评价</p>
        <span>照相不错（200）</span>
        <span>照相不错（200）</span>
        <span>外观漂亮（200）</span>
        <span>系统流畅（200）</span>
        <span>性价比高（200）</span>
      </div>
      <!-- 删除<div class="part04">
        <p class="pt20">写评价得优惠券</p>
        <a href="javascript:openMyWin('pro_mytext',300);">我要写评价</a>
      </div> -->
      <div class="clear"></div>
    </section>
    
    <section class="pro_mytext" id="pro_mytext">
      <div class="pb20">
        <span class="fs18 mr20">我要评价</span>
        <input class="ml20" type="radio" />
        <span class="mr20">好评</span>
        <input type="radio" />
        <span class="mr20">中评</span>
        <input type="radio" />
        <span class="mr20">差评</span>
      </div>
      <div class="area">
        <textarea>请输入您的评价</textarea>
      </div>
      <div class="pt10 pb10">
        <div class="clear"></div>
        <p>
        <input type="checkbox" />
        <span>照相不错(500)</span>
        </p>
        <p>
        <input type="checkbox" />
        <span>照相不错</span>
        </p>
        <p>
        <input type="checkbox" />
        <span>照相不错</span>
        </p>
        <p>
        <input type="checkbox" />
        <span>照相不错</span>
        </p>
        <p>
        <input type="checkbox" />
        <span>照相不错</span>
        </p>
        <p>
        <input type="checkbox" />
        <span>照相不错</span>
        </p>
        <p>
        <input type="checkbox" />
        <span>照相不错</span>
        </p>
        <p>
        <input type="checkbox" />
        <span>照相不错</span>
        </p>
        <p>
        <input type="checkbox" />
        <span>照相不错</span>
        </p>
        <p>
        <input type="checkbox" />
        <span>照相不错</span>
        </p>
        <p>
        <input type="checkbox" />
        <span>照相不错</span>
        </p>
        <p>
        <input type="checkbox" />
        <span>照相不错</span>
        </p>
        <p>
        <input type="checkbox" />
        <span>照相不错</span>
        </p>
        <p>
        <input type="checkbox" />
        <span>照相不错</span>
        </p>
        <div class="clear"></div>
      </div>
      <input class="sub" type="submit" value="提交评价" />
    </section><!--pro_mytext END-->
    
    <div class="clear h20"></div>
    <menu class="pro_eval w100">
      <h3 class="tit"><input type="radio" /><span>全部</span><input type="radio" /><span>好评（10）</span><input type="radio" /><span>中评（5）</span><input type="radio" /><span>差评（5）</span></h3>
      <li>
        <a class="a1" href="#"><img src="newimg/img05.png" /><p>我是用户名</p></a>
        <a class="a1 a2 lparameter" href="#"><p>版本：4G无敌版</p><p>颜色：白色</p><p>参数：屏幕很大很光滑</p></a> 
        <p class="pb10">手机很好很强大，性价比非常不错，朋友看了都喜欢！</p>
        <p class="c9">屏幕大&nbsp;&nbsp;&nbsp;&nbsp;性价比高&nbsp;&nbsp;&nbsp;&nbsp;外观漂亮</p>
        <p class="ta-r red pt10">丫丫回复：谢谢光临丫丫网。<span class="c9 ml20">2015.03.15</span></p>
      </li>
      <li>
        <a class="a1" href="#"><img src="newimg/img05.png" /><p>我是用户名</p></a>
        <a class="a1 a2 lparameter" href="#"><p>版本：4G无敌版</p><p>颜色：白色</p><p>参数：屏幕很大很光滑</p></a> 
        <p class="pb10">手机很好很强大，性价比非常不错，朋友看了都喜欢！</p>
        <p class="c9">屏幕大&nbsp;&nbsp;&nbsp;&nbsp;性价比高&nbsp;&nbsp;&nbsp;&nbsp;外观漂亮</p>
        <p class="ta-r red pt10">丫丫回复：谢谢光临丫丫网。<span class="c9 ml20">2015.03.15</span></p>
      </li>
      <li>
        <a class="a1" href="#"><img src="newimg/img05.png" /><p>我是用户名</p></a>
        <a class="a1 a2 lparameter" href="#"><p>版本：4G无敌版</p><p>颜色：白色</p><p>参数：屏幕很大很光滑</p></a> 
        <p class="pb10">手机很好很强大，性价比非常不错，朋友看了都喜欢！</p>
        <p class="c9">屏幕大&nbsp;&nbsp;&nbsp;&nbsp;性价比高&nbsp;&nbsp;&nbsp;&nbsp;外观漂亮</p>
        <p class="ta-r red pt10">丫丫回复：谢谢光临丫丫网。<span class="c9 ml20">2015.03.15</span></p>
      </li>
      <li>
        <a class="a1" href="#"><img src="newimg/img05.png" /><p>我是用户名</p></a>
        <a class="a1 a2 lparameter" href="#"><p>版本：4G无敌版</p><p>颜色：白色</p><p>参数：屏幕很大很光滑</p></a> 
        <p class="pb10">手机很好很强大，性价比非常不错，朋友看了都喜欢！</p>
        <p class="c9">屏幕大&nbsp;&nbsp;&nbsp;&nbsp;性价比高&nbsp;&nbsp;&nbsp;&nbsp;外观漂亮</p>
        <p class="ta-r red pt10">丫丫回复：谢谢光临丫丫网。<span class="c9 ml20">2015.03.15</span></p>
      </li>
      <li>
        <a class="a1" href="#"><img src="newimg/img05.png" /><p>我是用户名</p></a>
        <a class="a1 a2 lparameter" href="#"><p>版本：4G无敌版</p><p>颜色：白色</p><p>参数：屏幕很大很光滑</p></a> 
        <p class="pb10">手机很好很强大，性价比非常不错，朋友看了都喜欢！</p>
        <p class="c9">屏幕大&nbsp;&nbsp;&nbsp;&nbsp;性价比高&nbsp;&nbsp;&nbsp;&nbsp;外观漂亮</p>
        <p class="ta-r red pt10">丫丫回复：谢谢光临丫丫网。<span class="c9 ml20">2015.03.15</span></p>
      </li>
    </menu><!--pro_eval END-->
    <div class="clear h20"></div>
      <div class="page-ldy">
        <a href="#"><</a>
        <a class="sel" href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">></a>
      </div>
    <div class="clear h20"></div>
    <div id="item3"></div>
    <div id="item5"></div>
    <section class="pro_myseek">
      <h3 class="lh30 fs18 fw400 pb10">购买咨询</h3>
      <menu>
        <textarea placeholder="请告诉我您的问题……"></textarea>
      </menu>
      <p>温馨提示：您可在购买前对产品包装、颜色、运输、库存等方面进行咨询，我们有专人进行回复！因厂家随时会更改一些产品的包装、颜色、产地等参数，所以该回复仅在当时对提问者有效，其他网友仅供参考！咨询回复的工作时间为：周一至周六，9:00至18:00，请耐心等待工作人员回复。</p>
      <div class="clear"></div>
      <input class="sub" type="submit" value="马上提问" />
    </section><!--pro_myseek END-->
    
    <ul class="pro_myseek_list w100">
      <li>
        <span class="sp1">2015.03.15</span>
        <p><b>我是用户名：</b>可以使用多张卡支付么？</p>
        <p class="red pt5">丫丫回复：可以的哦，亲。</p>
      </li>
      <li>
        <span class="sp1">2015.03.15</span>
        <p><b>我是用户名：</b>可以使用多张卡支付么？</p>
        <p class="red pt5">丫丫回复：可以的哦，亲。</p>
      </li>
      <li>
        <span class="sp1">2015.03.15</span>
        <p><b>我是用户名：</b>可以使用多张卡支付么？</p>
        <p class="red pt5">丫丫回复：可以的哦，亲。</p>
      </li>
      <li>
        <span class="sp1">2015.03.15</span>
        <p><b>我是用户名：</b>可以使用多张卡支付么？</p>
        <p class="red pt5">丫丫回复：可以的哦，亲。</p>
      </li>
      <li>
        <span class="sp1">2015.03.15</span>
        <p><b>我是用户名：</b>可以使用多张卡支付么？</p>
        <p class="red pt5">丫丫回复：可以的哦，亲。</p>
      </li>
    </ul>
    
    <div class="clear h20"></div>
     <div class="page-ldy">
        <a href="#"><</a>
        <a class="sel" href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">></a>
      </div>
    <div class="clear"></div>
    
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
