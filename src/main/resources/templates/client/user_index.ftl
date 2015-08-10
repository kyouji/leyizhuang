<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客</title>
<#--
<meta name="keywords" content="${site.seoKeywords!''}" />
<meta name="description" content="${site.seoDescription!''}" />
<meta name="copyright" content="${site.copyright!''}" />
-->
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/client/css/mycenter_base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/mycenter.css"/>
<!--<link href="/client/css/member.css" rel="stylesheet" type="text/css" />-->
<script src="/client/js/jquery-1.9.1.min.js"></script>


<!--[if IE]>
   <script src="/client/js/html5.js"></script>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="/client/js/DD_belatedPNG_0.0.8a.js" ></script>
<script>
DD_belatedPNG.fix('.,img,background');
</script>
<![endif]-->
  

</head>
<body>
<!--顶部-->
<#include "/client/common_header.ftl" />


<!-- 内容 -->
<div class="content"> 
  <!-- 左侧 -->
  <#include "/client/common_user_menu.ftl" />
  <!-- 中间 -->
  <div class="content_2"> 
    <!-- 中上 -->
    <div class="content_2_1">
      <div class="content_2_1_1"><a href="/user/info" title="编辑基本信息"><img src="${user.headImageUri!'/mag/style/user_avatar.png'}"  /></a></div>
      <div class="content_2_1_2">
        <div class="content_2_1_2_top">
          <dl>
            <dt><a href="/user/order/list/2"><img src="/client/images/icon-3.png" />
                <dd>待付款：</dd>
                <dd class="red" style="width:15px;">${total_unpayed!'0'}</dd>
                </a>
            </dt>
          </dl>
          <dl>
            <dt><a href="/user/order/list/3"><img src="/client/images/icon-4.png" />
                <dd>待发货：</dd>
                <dd class="red">${total_undelivered!'0'}</dd>
                <a/>
            </dt>
          </dl>
        </div>
        <div class="content_2_1_2_tobbon">
          <dl>
            <dt><a href="/user/order/list/4"><img src="/client/images/icon-5.png" width="33px;" height="32px;"/>
                <dd>待收货：</dd>
                <dd class="red">${total_unreceived!'0'}</dd>
                </a>
            </dt>
          </dl>
          <dl>
            <dt><a href="/user/order/list/6"><img src="/client/images/icon-6.png" />
                <dd>已完成：</dd>
                <dd class="red">${total_finished!'0'}</dd>
                </a>
            </dt>
          </dl>
        </div>
      </div>
      <div class="content_2_1_3">
        <dl>
          <dt><a href="/user/point/list"><img src="/client/images/icon-7.png" />
          <dd>积分：</dd>
          <dd class="red">${user.totalPoints!0}</dd>
          </a>
          </dt>
        </dl>
      </div>
    </div>
    <!-- 中中 -->
  <div class="content_2_2">
      <div class="content_2_2_1">
          <span>我的订单</span>
          <label> <a href="/user/order/list/0">查看全部订单</a> </label>
      </div>
      <div class="content_2_2_2">         
        <#if order_page??>
          <#list order_page.content as order>
             <#if order_index < 5>
                 <dl>
                     <dt>订单编号：<span><a href="/user/order?id=${order.id}">${order.orderNumber!''}</a></span></dt>
                     <dd>                                                      
                         <ul>
                             <li class="li_1">
                                 <#if order.orderGoodsList??>
                                    <#list order.orderGoodsList as og>  
                                    <a href="/goods/${og.goodsId}"><img src="${og.goodsCoverImageUri!''}" alt="${og.goodsTitle!''}" width="50" align="left" /></a>
                                    </#list>
                                 </#if>
                             </li>
                             <li class="li_2">${order.shippingName!''}</li>
                             <li class="li_3">￥${order.totalPrice?string("#.##")}</li>
                             <li class="li_4"> ${order.orderTime!''}</li>
                             <li class="li_7">
                                <#if order.statusId==2>
                                    待付款
                                <#elseif order.statusId==3>
                                    待发货
                                <#elseif order.statusId==4>
                                    待收货
                                <#elseif order.statusId==6>
                                    已完成
                                </#if>
                             </li>
                             <li class="li_5">
                                <#if order.statusId==2>
                                    <a href="#" title="">取消订单</a>
                                <#elseif order.statusId==3>
                                    <a href="#" title="">&nbsp;</a>                    
                                <#elseif order.statusId==4>
                                    <a href="#" title="">查看物流</a>
                                <#elseif order.statusId==6>
                                    <a href="#" title="">申请退货</a>
                                </#if>
                             </li>
                             <li class="li_6">
                                <#if order.statusId==2>
                                    <a href="#" title="">付款</a>
                                <#elseif order.statusId==3>
                                    <a href="#" title="">查看</a>                    
                                <#elseif order.statusId==4>
                                   <a href="#" title=""> 确认收货</a>
                                <#elseif order.statusId==6>
                                   <a href="#" title=""> 评价</a>
                                </#if>
                             </li>
                         </ul>
                     </dd>
                 </dl>
             </#if>
          </#list>
        </#if>        
     </div>
 </div>
    <!-- 中下 -->
    <div class="content_2_3">
       <div class="content_2_3_1"><a href="/user/collect/list" title="">我关注的商品</a></div>
       <div class="content_2_3_2">
           <div class="tb_1">
               <a href="javascript:reduceIndex;" title=""><img src="/client/images/icon-8.png" /><br/> </a>
           </div>
           <#if collect_page??>
               <#list collect_page.content as cgoods>
                    <#if cgoods_index lt 3>   
                       <div class="tp" > 
                           <a  href="/goods/${cgoods.goodsId!''}" title=""> <img src="${cgoods.goodsCoverImageUri!''}" alt="${cgoods.goodsTitle!''}" /> <span>${cgoods.goodsTitle!''} </span>
                           <label>￥${cgoods.goodsSalePrice?string("#.##")}</label>
                           </a> 
                       </div>
                    </#if> 
               </#list>
           </#if>          
           <div class="tb_2" style="float:right;">
               <a href="javascript:addIndex;" title=""><img src="/client/images/icon-9.png" /><br/></a>
           </div>
      </div>
    </div>
 </div>
  <!-- 右侧 -->
  <div class="content_3">
    <div class="content_3_1">小商品推荐</div>
    <div class="content_3_2">
     
          <#if recommend_goods_page??>
             <#list recommend_goods_page.content as item>
                <dl>
                <dt><a href="" title=""><img src="${item.coverImageUri!''}" /></a></dt>
                <dd><a href="" title=""><label>${item.title!''}</label></a><br/>
                <span class="red1">￥${item.salePrice?string("0.00")}</span></dd>
                <dd class="red"><a href="/goods/${item.id}" title="">购买</a></dd>
                </dl>
             </#list>
          </#if>   
    </div>
  </div>
</div>
<!--底部footer-->
<#include "/client/common_footer.ftl" />
</body>
</html>