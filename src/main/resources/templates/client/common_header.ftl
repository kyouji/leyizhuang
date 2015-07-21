<div class="top">
    <div class="w1200 top1">
        <p class="huanyin">商城访问量：<span class="blue">${site.totalVisits!'0'}</span></p>
        <p class="huanyin">在线人数：<span class="blue">${site.totalOnlines!'1'}</span></p>
    
        <div class="wdbgg">
            <#if username??>
                <a href="/user">${username}<i></i></a>
                <a href="/logout">退出<i></i></a>
            <#else>
                <a href="/login" target="_blank">登录<i></i></a>
                <a href="/reg" target="_blank">免费注册<i></i></a>
            </#if>
            <a href="/user/order/list/0">我的订单</a>
            <a href="/user">会员中心</a>
            <a href="#">在线咨询</a>
            服务热线：<#if site??>${site.telephone!''}</#if>
        </div>
    </div>
</div>
<div class="w1200 top2">
    <div class="logo"><a href="/"><img src="<#if site??>${site.logoUri!''}</#if>" width="200" height="100"/></a></div>
    <div class="tpgg">
        <#if top_small_ad_list??>
            <#list top_small_ad_list as item>
                <a <#if item.typeIsNewWindow?? && item.typeIsNewWindow>target="_blank"</#if> href="${item.linkUri!''}">
                    <img src="${item.fileUri!''}" width="70" height="38"/>
                </a>
            </#list>
        </#if>
    </div>
    <div class="ssbox">
        <div class="clear"></div>
        <form action="/search" method="get">
            <input type="text" class="ss_txt" name="keywords" value="${keywords!keywords_list[0].title}"/>
            <input type="submit" class="ss_btn" value="" />
        </form>
        <div class="clear"></div>
        <p class="sousuohuise" style="margin-top: 5px;">
            <#if keywords_list??>
                <#list keywords_list as item>
                    <#if item_index gt 0>
                    <a href="${item.linkUri!''}">${item.title}</a>
                    </#if>
                </#list>
            </#if>
        </p>
    </div>
    <div id="shopping_down" class="shopping_box">
        <span class="sp1"><#if cart_goods_list??>${cart_goods_list?size}<#else>0</#if></span>
        <a class="a9" href="/cart"><img src="/client/images/liebiao_09.png" width="28" height="28" />购物车<i></i></a>
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
                <#list cart_goods_list as item>
                    <div class="shopping_list">
                        <div class="clear"></div>
                        <a class="a2" href="/goods/${item.goodsId}"><img src="${item.goodsCoverImageUri!''}" /></a>
                        <a class="a3" href="/goods/${item.goodsId}">${item.goodsTitle!''}</a>
                        <p>￥<#if item.price??>${item.price?string("0.00")} x ${item.quantity!'0'}</#if><a href="javascript:delItem(${item.id});">删除</a></p>
                        <div class="clear"></div>
                    </div>
                    <#if item.isSelected>
                        <#assign totalGoods=totalGoods+item.quantity>
                        <#assign totalPrice=totalPrice+item.price*item.quantity>
                    </#if>
                </#list>
                
                <h4 class="shopping_price">
                    共<#if cart_goods_list??>${cart_goods_list?size}<#else>0</#if>件商品 &nbsp;&nbsp;共计<span class="fw-b">￥<#if totalPrice??>${totalPrice?string(0.00)}</#if></span>
                    <a href="/cart">去结算</a>
                </h4>
            <#else>
                <h3 class="ta-c pa15 fs14 fw400">购物车中还没有商品，赶紧选购吧！</h3>
            </#if>
        </menu>
    </div>
</div>
<nav class="navbox">
    <div class="w1200">
        <section class="navlist" id="mainnavdown">
            <a href="javascript:;" class="a2">全部商品分类</a>
            <ul class="navlistout" id="navdown" style="display:none;">
                <#if top_cat_list??>
                    <#list top_cat_list as item>
                        <li>
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
            </ul><!--navlistout END-->
        </section>
        <#if navi_item_list??>
            <#list navi_item_list as item>
                <a class="a1" href="${item.linkUri!''}">${item.title!''}</a>
            </#list>
        </#if> 
    </div> 
</nav>
<div class="clear20"></div>

<aside class="floatbox">
    <a href="javascript:;" title="微信客服"><img src="/client/images/float_ico01.png" width="42" height="42" alt="微信客服" /><span><img src="${site.wxQrCode!''}" width="84" height="84"/></span></a>
    <a href="http://wpa.qq.com/msgrd?v=3&uin=${site.qq!''}&site=qq&menu=yes" target="_blank" title="在线咨询"><img src="/client/images/float_ico02.png" width="42" height="42" alt="在线咨询" /></a>
    <a href="javascript:;" title="新浪微博"><img src="/client/images/float_ico03.png" width="42" height="42" alt="新浪微博" /><span><img src="${site.weiboQrCode!''}" width="84" height="84"/></span></a>
    <a href="javascript:;" title="服务热线"><img src="/client/images/float_ico04.png" width="42" height="42" alt="服务热线" /><span><img src="/client/images/sys02.png" width="84" height="84"/></span></a>
    <a href="javascript:$('html,body').animate({scrollTop:0},500);" title="到顶部"><img src="/client/images/float_ico05.png" width="42" height="42" alt="到顶部" /></a>
</aside>