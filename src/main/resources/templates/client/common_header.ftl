<script>
function move()
{
    $('html,body').animate({scrollTop:0},500);
}
</script> 
<header class="maintop">
  <section class="main">
    <h1>亲，欢迎来到正品惠客</h1>   
    <p class="p2"><#if site??>${site.telephone!''}</#if></p>
    <p class="p3">服务热线：</p>
    
    
    
    <a class="a2" href="http://wpa.qq.com/msgrd?v=3&uin=${site.qq!''}&site=qq&menu=yes">在线咨询</a>
    <a class="a3" href="/user">会员俱乐部</a>
    <a class="z-in10" href="#">帮助中心</a>
    <menu id="top_order">
      <a class="a4" href="/user/order/list/0">我的订单<i></i></a>
      <div class="clear"></div>
      <div id="top_orderlist">
        <p class="p_box">
        <a href="/user"><img src="/client/images/t_order01.png" />我的信息</a>
        <a href="/user/collect/list"><img src="/client/images/t_order02.png" />我的收藏</a>
        <a href="/user/return/list"><img src="/client/images/t_order03.png" />报修/退换货</a>
        <a href="/user/comment/list"><img src="/client/images/t_order04.png" />我拍到的宝贝</a>
        <a href="/user/consult/list"><img src="/client/images/t_order05.png" />我的商品咨询</a>
        </p>
      </div>
    </menu>
    <div class="clear"></div>
  </section>
</header><!--maintop-->

<!-- 浮动 -->
<aside class="floatbox">
  <a href="#" title="微信客服"><img src="/client/images/float_ico01.png" width="42" height="42" alt="微信客服" /><span><img src="<#if site??>${site.wxQrCode!''}</#if>" /></span></a>
  <a href="http://wpa.qq.com/msgrd?v=3&uin=${site.qq!''}&site=qq&menu=yes" title="在线咨询"><img src="/client/images/float_ico02.png" width="42" height="42" alt="在线咨询" /></a>
  <a href="#" title="新浪微博"><img src="/client/images/float_ico03.png" width="42" height="42" alt="新浪微博" /></a>
  <a href="#" title="服务热线"><img src="/client/images/float_ico04.png" width="42" height="42" alt="服务热线" /><span><#if site??>${site.telephone!''}</#if></span></a>
  <a href="javascript:$('html,body').animate({scrollTop:0},500);" title="到顶部"><img src="/client/images/float_ico05.png" width="42" height="42" alt="到顶部" /></a>
</aside>

<section class="main pt20 pb20 z-in10">
  <a class="fl" href="/"><img src="<#if site??>${site.logoUri!''}</#if>" /></a>
  <div class="index_place">
    <h2 class="fc fs26 lh30 fw400">重庆市区</h2>
    <p class="pt5">急速送达</p>
  </div>
  <div class="searchbox">
    <div>
    <form action="/search" method="get">
      <input class="text toptext" type="text" name="keywords" value="请输入品牌或商品名称" />
      <p class="clear"></p>
      <input class="sub" type="submit" value="搜 索" />
    </form>
    </div>
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
<script>
function delItem(id)
{
    if (null == id)
    {
        return;
    }
    
    $.ajax({
        type:"post",
        url:"/cart/del",
        data:{"id": id},
        success:function(data){
            location.reload();
        }
    });
}

</script>
          <#assign totalGoods=0>
          <#assign totalPrice=0>
          <h2>最新加入的商品</h2>
          <!-- lc-->
          <#list cart_goods_list as item>
                    <div class="shopping_list">

                        <div class="clear"></div>
                        <a class="a2" href="/goods/${item.goodsId?c}"><img src="${item.goodsCoverImageUri!''}" /></a>
                        <a class="a3" href="/goods/${item.goodsId?c}">${item.goodsTitle!''}</a>
                        <p>￥<#if item.price??>${item.price?string("0.00")} x ${item.quantity!''}</#if><a href="javascript:delItem(${item.id?c});">删除</a></p>
                        <div class="clear"></div>
                    </div>                  
                        <#if item.price??>
                            <#assign totalPrice=totalPrice+item.price*item.quantity>
                        </#if>                 
          </#list>
                  <h4 class="shopping_price">
                                                                             共<#if cart_goods_list??>${cart_goods_list?size}<#else>0</#if>件商品 &nbsp;&nbsp;共计<span class="fw-b">￥${totalPrice?string("0.00")}</span>
                    <a href="/cart">去结算</a>
                  </h4>
      <#else>
        <h3 class="ta-c pa15 fs14 fw400">购物车中还没有商品，赶紧选购吧！</h3>
      </#if>
    </menu>
  </div>
  <div class="clear"></div>
</section>

<nav class="navbox">
  <section class="navlist" id="mainnavdown">
    <a href="#" class="a2">全部商品分类</a>
    <ul class="navlistout" id="navdown" style="display:none;">
     <#if top_cat_list??>
            <#list top_cat_list as item>
            <#if item_index < 9>
            <li>
                <h3 class="${item.callIndex}"><img src="${item.imgUrl}" /><a href="/list/${item.id?c}">${item.title!''}</a></h3>
                    <p class="p_box">
                      <#if ("brand_list_" + item_index)?eval??>
                            <#list  ("brand_list_" + item_index)?eval as brand>
                                 <a href="/list/${item.id!'0'}-${brand_index+1}">${brand.title?trim!''}</a>                                
                            </#list>
                      </#if>
                    </p>   
                    <div class="nav_showbox">
                    <i class="bg"></i>
                    <div class="clear"></div>
                          <#if ("nav_"+item_index+"_ad_list")?eval??> 
                             <table class="nav_right"> 
                                  <#list ("nav_"+item_index+"_ad_list")?eval as aditem> 
                                        <#if aditem_index < 4 >                                                           
                                              <tr>
                                                   <td colspan="2" class="pt10"><a href="${aditem.linkUri!''}"><img src="${aditem.fileUri!''}" width="166" height="129"/></a></td>
                                              </tr>
                                        </#if>
                                  </#list>                                                    
                             </table>
                           </#if>
                    <#if ("second_level_"+item_index+"_cat_list")?eval?? >
                        <table class="nav_more">
                            <#list ("second_level_"+item_index+"_cat_list")?eval as secondLevelItem>
                                <tr>
                                    <th width="90"><span><a href="/list/${secondLevelItem.id?c}">${secondLevelItem.title!''}</a></span></th>
                                    <td>
                                        <#if ("third_level_"+item_index+secondLevelItem_index+"_cat_list")?eval?? >
                                            <#list ("third_level_"+item_index+secondLevelItem_index+"_cat_list")?eval as thirdLevelItem>
                                                <a href="/list/${thirdLevelItem.id?c}">${thirdLevelItem.title!''}</a>
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
            </#if>
           </#list>
        </#if>    
    </ul><!--navlistout END-->
  </section>
   <#if navi_item_list??>
        <#list navi_item_list as item>
          <#if item_index < 11>
            <a class="a1" href="${item.linkUri!''}">${item.title!''}</a>
          </#if>
        </#list>
    </#if> 
</nav>
<div class="clear"></div>