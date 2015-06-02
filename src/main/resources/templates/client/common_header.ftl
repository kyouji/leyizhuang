<div class="maintop">
<section class="main">
    <h1>亲，欢迎来到惠之店网上商城</h1>
    <p class="p2"><#if site??>${site.telephone!''}</#if></p>
    <p class="p3">服务热线：</p>
    <menu id="top_phone">
      <a class="a1" href="javascript:;">手机惠之店</a>
      <div class="clear"></div>
      <ul class="phone_sum" id="top_phonelist">
        <li style="padding-top:10px;"><a href="<#if site??>${site.touchUri!'/'}</#if>"><span class="phoneico01">触屏版</span></a></li>
        <li><a href="javascript:;"><span class="phoneico03">iPhone</span></a></li>
        <li style="border-bottom:1px solid #eee; padding-bottom:10px;"><a href="javascript:;"><span class="phoneico04">Android</span></a></li>
        <li class="phone_sum_more">
          <p>
            <span>扫描二维码下载iPhone客户端</span>
            <span class="mt5"><img src="<#if site??>${site.iOsQrCode!''}</#if>" /></span>
          </p>
          <p>
            <span>扫描二维码下载Android客户端</span>
            <span class="mt5"><img src="<#if site??>${site.androidQrCode!''}</#if>" /></span>
          </p>
        </li>
      </ul>
    </menu>
    <#if username??>
        <a class="a" href="/user" style="float:left; color:#ff4040;">${username}<i></i></a>
        <a class="a" href="/logout" style="float:left;">退出<i></i></a>
    <#else>
        <a class="a" href="/login" style="float:left; color:#ff4040;" target="_blank">登陆<i></i></a>
        <a class="a" href="/reg" style="float:left;" target="_blank">注册<i></i></a>
    </#if>
    <a class="a2" href="#">在线咨询</a>
    <a class="a3" href="/user">会员俱乐部</a>
    <a class="z-in10" href="/info/list/12">帮助中心</a>
    <a class="a4" href="/user/order/list/0">我的订单<i></i></a>
    <div class="clear"></div>
</section>
</div>
<div class="top">
<div class="main top1">
<div class="logo"><a href="/"><img src="<#if site??>${site.logoUri!''}</#if>" border="0" /></a></div>
<div class="ssbox">
    <div class="clear"></div>
    <form action="/search" method="get">
        <input type="text" class="ss_txt" name="keywords"/>
        <input type="submit" class="ss_btn" value="" />
    </form>
    <div class="clear"></div>
    <p>
        <#if keywords_list??>
            <#list keywords_list as item>
                <a href="${item.linkUri!''}">${item.title}</a>
            </#list>
        </#if>
    </p>
</div>
        
<div id="shopping_down" class="shopping_box">
    <span class="sp1"><#if cart_goods_list??>${cart_goods_list?size}<#else>0</#if></span>
    <a class="a1" href="/cart">去购物车结算<i></i></a>
    <menu>
      <#if cart_goods_list?? && cart_goods_list?size gt 0>
          <h2>最新加入的商品</h2>
          <h3 class="tit">
            <span>满减</span>
            购满1999元，即可享受满减优惠 小计：￥2888.00
          </h3>
          <div class="shopping_list">
            <div class="clear"></div>
            <a class="a2" href="#"><img src="images/hzd_28.png" /></a>
            <a class="a3" href="#">索尼KDL-50W700B50英寸 全高清 网络智能WIFI液晶电视</a>
            <p>￥2888.00 x1<a href="#">删除</a></p>
            <div class="clear"></div>
          </div>
          <div class="shopping_list">
            <div class="clear"></div>
            <a class="a2" href="#"><img src="images/hzd_28.png" /></a>
            <a class="a3" href="#">索尼KDL-50W700B50英寸 全高清 网络智能WIFI液晶电视</a>
            <p>￥2888.00 x1<a href="#">删除</a></p>
            <div class="clear"></div>
          </div><!--shopping_list END-->
          <h3 class="tit">
            <span>满减</span>
            购满1999元，即可享受满减优惠 小计：￥2888.00
          </h3>
          <div class="shopping_list">
            <div class="clear"></div>
            <a class="a2" href="#"><img src="images/hzd_28.png" /></a>
            <a class="a3" href="#">索尼KDL-50W700B50英寸 全高清 网络智能WIFI液晶电视</a>
            <p>￥2888.00 x1<a href="#">删除</a></p>
            <div class="clear"></div>
          </div><!--shopping_list END-->
          <h4 class="shopping_price">
            共1件商品 &nbsp;&nbsp;共计<span class="fw-b">￥2288.00</span>
            <a href="#">去结算</a>
          </h4>
      <#else>
        <h3 class="ta-c pa15 fs14 fw400">购物车中还没有商品，赶紧选购吧！</h3>
      </#if>
    </menu>
  </div>
</div>
</div>
<div class="daohang">

<nav class="navbox">
  <section class="navlist" id="mainnavdown">
    <a href="javascript:;" class="a2">全部商品分类</a>
    <ul class="navlistout" id="navdown" style="display:none;">
        <#if top_cat_list??>
            <#list top_cat_list as item>
            <li>
                <h3 class="shouji"><a href="/list/${item.id}"><img src="${item.imgUrl!''}" />${item.title!''}</a></h3>
                    <div class="nav_showbox">
                    <i class="bg"></i>
                    <div class="clear"></div>
                    <#--
                      <table class="nav_right">
                        <tr>
                          <td><a href="#"><img src="/client/images/hzd_19.png" /></a></td>
                          <td><a href="#"><img src="/client/images/hzd_19.png" /></a></td>
                        </tr>
                        <tr>
                          <td><a href="#"><img src="/client/images/hzd_19.png" /></a></td>
                          <td><a href="#"><img src="/client/images/hzd_19.png" /></a></td>
                        </tr>
                        <tr>
                          <td colspan="2" class="pt10"><a href="#"><img src="/client/images/hzd_19.png" /></a></td>
                        </tr>
                        <tr>
                          <td colspan="2"><a href="#"><img src="/client/images/hzd_19.png" /></a></td>
                        </tr>
                    </table>
                    -->
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
    </ul><!--navlistout END-->
    </section>
    <#if navi_item_list??>
        <#list navi_item_list as item>
            <a class="a1" href="${item.linkUri!''}">${item.title!''}</a>
        </#list>
    </#if> 
</nav>
</div>
<!-- 浮动 -->
<aside class="floatbox">
  <a href="#" title="微信客服"><img src="/client/images/float_ico01.png" width="42" height="42" alt="微信客服" /><span><img src="/client/images/hzd_55.png" /></span></a>
  <a href="#" title="在线咨询"><img src="/client/images/float_ico02.png" width="42" height="42" alt="在线咨询" /></a>
  <a href="#" title="新浪微博"><img src="/client/images/float_ico03.png" width="42" height="42" alt="新浪微博" /></a>
  <a href="#" title="服务热线"><img src="/client/images/float_ico04.png" width="42" height="42" alt="服务热线" /><span><img src="/client/images/hzd_55.png" /></span></a>
  <a href="#" title="到顶部"><img src="/client/images/float_ico05.png" width="42" height="42" alt="到顶部" /></a>
</aside>