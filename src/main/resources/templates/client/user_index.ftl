<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>惠资生活</title>
<meta name="keywords" content="惠资生活" />
<meta name="description" content="惠资生活" />
<meta name="copyright" content="惠资生活 版权所有" />
<link href="/client/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/client/css/style.css" rel="stylesheet" type="text/css" />
<link href="/client/css/common.css" rel="stylesheet" type="text/css" />
<link href="/client/css/mymember.css" rel="stylesheet" type="text/css" />
<link href="/client/style/cartoon.css" rel="stylesheet" type="text/css" />
<!--<link href="/client/css/member.css" rel="stylesheet" type="text/css" />-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/common.js"></script>
<script src="/client/js/ljs-v1.01.js"></script>
<script src="/client/js/mymember.js"></script>

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
</script>
</head>
<body>
<#include "/client/common_header.ftl" />

<div class="myclear"></div>
<div class="mymember_out">
<div class="mymember_main">
  <!--mymember_head END-->
  <div class="myclear" style="height:20px;"></div>
  
  <#-- 左侧菜单 -->
  <#include "/client/common_user_menu.ftl" />
  <#-- 左侧菜单结束 -->
  
  <div class="mymember_center">
    <div class="mymember_info mymember_info01">
      <table>
        <tr>
          <th width="150" rowspan="2">
          <a class="mymember_header" href="#"><img src="${user.headImageUri!'/mag/style/user_avatar.png'}" /></a></th>
          <td><a href="/user/order/list/2"><img src="/client/images/mymember/buy01.png" />待付款：<span>${total_unpayed!0}</span></a></td>
          <td><a href="/user/order/list/3"><img src="/client/images/mymember/buy02.png" />待发货：<span>${total_undelivered!0}</span></a></td>
          <th rowspan="2" class="mymember_fen">
            <a href="/user/point/list"><img src="/client/images/mymember/buy05.png" /><p>积分：<span>${user.totalPoints!0}</span></p></a>
          </th>
        </tr>
        <tr>
          <td><a href="/user/order/list/4"><img src="/client/images/mymember/buy03.png" />待收货：<span>${total_unreceived!'0'}</span></a></td>
          <td><a href="/user/order/list/6"><img src="/client/images/mymember/buy04.png" />已完成：<span>${total_finished!'0'}</span></a></td>
        </tr>
      </table>
    </div>
    
    <div class="mymember_info mymember_info02">
    <h3>我的订单<a href="/user/order/list/0">查看全部订单</a></h3>
        <table width="100%">              
        <#if order_page??>
            <#list order_page.content as order>
                <#if order_index < 5>
                <tr>
                    <th colspan="7">订单编号：<a href="/user/order?id=${order.id}">${order.orderNumber!''}</a></th>
                </tr>
                <tr>
                    <td colspan="2" align="left" >
                        <#if order.orderGoodsList??>
                            <#list order.orderGoodsList as og>
                                <a href="/goods/${og.goodsId}"><img src="${og.goodsCoverImageUri!''}" alt="${og.goodsTitle!''}" width="50" align="left" /></a>
                            </#list>
                        </#if>
                    </td>
                  
                    <td>${order.shippingName!''}</td>
                    <td>
                        <p>￥${order.totalPrice?string("#.##")}</p>
                        <p>${order.payTypeTitle!''}</p>          
                    </td>
                    <td class="td003">
                        ${order.orderTime!''}      
                    </td>
                    <td>
                        <p>
                            <#if order.statusId==2>
                                待付款
                            <#elseif order.statusId==3>
                                待发货
                            <#elseif order.statusId==4>
                                待收货
                            <#elseif order.statusId==6>
                                已完成
                            </#if>
                        </p>          
                    </td>
                    <td class="td003">
                        <a href="/user/order?id=${order.id}">查看</a>          
                    </td>
                </tr>
                </#if>
            </#list>
        </#if> 
        </table>
    </div>
    
    <div class="mymember_info mymember_info02">
	 <h3>我关注的商品</h3>
      <div id="mymember_gzbox">
        <ul>
            <#if collect_page??>
                <#list collect_page.content as cgoods>
                <a class="mymember_gzlist" href="/goods/${cgoods.goodsId!''}">
                    <img src="${cgoods.goodsCoverImageUri!''}" alt="${cgoods.goodsTitle!''}" />
                    <p>${cgoods.goodsTitle!''}</p>
                    <h6>￥${cgoods.goodsSalePrice?string("#.##")}</h6>
                </a>
                </#list>
            </#if>
        </ul>
        <div class="myclear"></div>
        <a id="mymember_gznext" href="javascript:;"><img src="/client/images/mymember/arrow02.jpg" /></a>
      </div>
    </div>
  </div>
  
  <div class="mymember_hot">
    <div class="mymember_hot_part">
      <h3>会员推荐</h3>
      <h4 id="mymember_right_menu">
      </h4>
      <ul id="mymember_right_check">
        <#if recommend_goods_page??>
            <#list recommend_goods_page.content as item>
                <li>
                  <a class="mymember_hot_list" href="/goods/${item.id}">
                    <img src="${item.coverImageUri!''}" />
                    <p>${item.title!''}</p>
                    <b>￥${item.salePrice?string("0.00")}</b>
                  </a>
                </li>
            </#list>
        </#if>
      </ul>
    </div><!--mymember_hot_part END-->
    
    <div class="mymember_hot_part">
        <h3>浏览历史</h3>
        <div id="mymember_storybox">
            <ul>
                <li>
                <#if recent_page??>
                    <#list recent_page.content as rgoods>
                        <a class="mymember_hot_story" href="/goods/${rgoods.goodsId}">
                            <img src="${rgoods.goodsCoverImageUri!''}" />
                            <p>￥${rgoods.goodsSalePrice?string("#.##")}</p>
                        </a>
                    </#list>
                </#if>
                </li>
            </ul>
            <div class="myclear"></div>
            <a id="mymember_story_next" href="javascript:;"><img src="/client/images/mymember/arrow02.jpg" /></a>
        </div>
        <div class="myclear"></div>
    </div><!--mymember_hot_part END-->
</div><!--mymember_hot END-->
    
<div class="myclear"></div>
</div>
<script type="text/javascript">
      $(document).ready(function(){
         mymemberMenuCheck("mymember_right_menu","a","mymember_right_check","li","mysel");
		 mymemberRightMove("mymember_storybox",70,90,"mymember_story_next",15,3,"a");
		 mymemberRightMove("mymember_gzbox",205,241,"mymember_gznext",15,3,"a");
		 mymemberRightMove("mymember_shinebox",205,310,"mymember_shinenext",15,3,"div");
      });
</script>

<!--mymember END-->

<div class="clear h40"></div>
<#include "/client/common_footer.ftl" />
</div>
</body>
</html>




  











