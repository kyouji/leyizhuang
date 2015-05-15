<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>博大生活网——会员中心首页</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link href="/client/style/layout.css" rel="stylesheet" type="text/css" />
<link href="/client/style/master.css" rel="stylesheet" type="text/css" />
<link href="/client/style/mymember.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/html5.js"></script>
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/header.js"></script>
<script src="/client/js/mymember.js"></script>
<!--[if IE]>
   <script src="js/html5.js"></script>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="/client/js/DD_belatedPNG_0.0.8a.js" ></script>
<script>
DD_belatedPNG.fix('.,img,background');
</script>
<![endif]-->
</head>
<body>
<!-- header开始 -->
<#include "/client/common_header.ftl" />
<!-- header结束 -->
<!--mymember-->
<div class="myclear"></div>
<div class="mymember_out">
<div class="mymember_main">
  <div class="myclear" style="height:20px;"></div>
  
  <#-- 左侧菜单 -->
  <#include "/client/common_user_menu.ftl" />
  <#-- 左侧菜单结束 -->
  
  <div class="mymember_center">
    <div class="mymember_info mymember_info01">
      <table>
        <tr>
          <th width="150" rowspan="2"><a class="mymember_header" href="/user/info?id=${user.id}"><img src="${user.headImageUri!'/mag/style/user_avatar.png'}" /></a></th>
          <td><a href="/user/order/list/2"><img src="/client/images/mymember/buy01.png" />待付款：<span>${total_unpayed!'0'}</span></a></td>
          <td><a href="/user/order/list/3"><img src="/client/images/mymember/buy02.png" />待发货：<span>${total_undelivered!'0'}</span></a></td>
          <th rowspan="2" class="mymember_fen">
            <a href="/user/point/list"><img src="/client/images/mymember/buy05.png" /><p>积分：<span>${user.totalPoints!'0'}</span></p></a>
          </th>
          <th rowspan="2" class="mymember_fen1">
            <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt" target="_blank"><img src="/client/images/mymember/fx.png" width="46" height="54"><p>分享赚积分</p></a>
            <script type="text/javascript" >
                var jiathis_config={
                    data_track_clickback:true,
                    url:"http://${server_ip!'www.kmboda.com'}:${server_port?c!'80'}/reg?shareId=${user.id}",
                    summary:"",
                    shortUrl:false,
                    hideMore:false
                }
            </script>
            <script type="text/javascript" src="http://v3.jiathis.com/code_mini/jia.js" charset="utf-8"></script>
            
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
    </div><!--mymember_info END-->
    
    <div class="mymember_info mymember_info02">
	 <h3>我关注的商品</h3>
      <div id="mymember_gzbox">
        <ul>
            <li>
            <#if collect_page??>
                <#list collect_page.content as cgoods>
                <a class="mymember_gzlist" href="/goods/${cgoods.goodsId!''}">
                    <img src="${cgoods.goodsCoverImageUri!''}" alt="${cgoods.goodsTitle!''}" />
                    <p>${cgoods.goodsTitle!''}</p>
                    <h6>￥${cgoods.goodsSalePrice?string("#.##")}</h6>
                </a>
                </#list>
            </#if>
            </li>
        </ul>
        <div class="myclear"></div>
        <a id="mymember_gznext" href="javascript:;"><img src="/client/images/mymember/arrow02.jpg" /></a>
      </div>
    </div><!--mymember_info END-->
    
  </div><!--mymember_center END-->
  
  <div class="mymember_hot">
    <div class="mymember_hot_part">
      <h3>会员推荐</h3>
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
</div><!--mymember_main END-->
<div class="myclear"></div>
</div>
<!--mymember END-->

<div class="clear"></div>
<!--主体结束-->
<#include "/client/common_footer.ftl" />
<!--底部结束-->
<script type="text/javascript">
      $(document).ready(function(){
         mymemberMenuCheck("mymember_right_menu","a","mymember_right_check","li","mysel");
		 mymemberRightMove("mymember_storybox",70,90,"mymember_story_next",15,3,"a");
		 mymemberRightMove("mymember_gzbox",205,241,"mymember_gznext",15,3,"a");
		 mymemberRightMove("mymember_shinebox",205,310,"mymember_shinenext",15,3,"div");
      });
</script>
</body>
</html>
<!--结束-->
