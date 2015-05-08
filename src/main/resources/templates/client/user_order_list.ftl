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
<script type="text/javascript" src="/client/js/html5.js"></script>
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/mymember.js"></script>
<!--[if IE]>
   <script src="js/html5.js"></script>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="js/DD_belatedPNG_0.0.8a.js" ></script>
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
<div class="mymember_out">
<div class="mymember_main">
  <div class="myclear" style="height:20px;"></div>
  <#-- 左侧菜单 -->
  <#include "/client/common_user_menu.ftl" />
  <#-- 左侧菜单结束 -->
  
  <form name="form1" action="/user/order/list/${status_id}" method="POST">
    
<script type="text/javascript">
var theForm = document.forms['form1'];
if (!theForm) {
    theForm = document.form1;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.submit();
    }
}
</script>
  <div class="mymember_mainbox">
    
    <div class="mymember_info mymember_info02">
      <div class="mymember_order_search">
        <a class="a001" href="/user/order/list/${status_id}">
            <#if status_id==0>
                全部订单
            <#elseif status_id==1>
                待确认订单
            <#elseif status_id==2>
                待付款订单
            <#elseif status_id==3>
                待发货订单
            <#elseif status_id==4>
                待收货订单
            <#elseif status_id==6>
                已完成订单
            </#if>
        </a>
        <#--
        <input class="mysub" type="submit" value="查询">
        <input class="mytext" type="text" name="keywords" onfocus="if(value=='商品名称、订单编号') {value=''}" onblur="if (value=='') {value='商品名称、订单编号'}" value="${keywords!'商品名称、订单编号'}">
        <div class="clear"></div>
        -->
      </div>
      <table>
        <tbody>
        <tr class="mymember_infotab_tit01">
          <th>订单信息</th>
          <th width="70">收货人</th>
          <th width="80">订单金额</th>
          <th width="80">
            <select name="timeId" onchange="javascript:setTimeout(__doPostBack('statusId',''), 0)">
                <option value="0" <#if !time_id?? || time_id==0>selected="selected"</#if>>所有订单</option>
                <option value="1" <#if time_id==1>selected="selected"</#if>>最近一个月</option>
                <option value="3" <#if time_id==3>selected="selected"</#if>>最近三个月</option>
                <option value="6" <#if time_id==6>selected="selected"</#if>>最近半年</option>
                <option value="12" <#if time_id==12>selected="selected"</#if>>最近一年</option>                              
            </select>
          </th>
          <th width="80">
            
          </th>
          <th width="60">操作</th>
        </tr>  
        <#if order_page??>
            <#list order_page.content as order>
                <tr>
                  <th colspan="7">订单编号：<a href="/user/order?id=${order.id}">${order.orderNumber!''}</a></th>
                </tr>
                <tr>
                  <td class="td001">
                    <#list order.orderGoodsList as og>
                        <a href="/goods/${og.goodsId}"><img src="${og.goodsCoverImageUri}"></a>
                    </#list>
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
                        <#if order.statusId==1>
                            待确认
                        <#elseif order.statusId==2>
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
                    <p><a href="/user/order?id=${order.id}">查看</a></p>
                    <#if order.statusId==6>
                        <p><a href="/user/comment?orderId=${order.id}">评价晒单</a></p>
                        <p><a href="/user/return/${order.id}">申请返修/退换货</a></p>
                    </#if>
                  </td>
                </tr>
            </#list>
        </#if>
      </tbody>
      </table>
      <div class="myclear" style="height:10px;"></div>
      
      <div class="mymember_page">
      <#if order_page??>
        <#assign continueEnter=false>
        <#if order_page.totalPages gt 0>
            <#list 1..order_page.totalPages as page>
                <#if page <= 3 || (order_page.totalPages-page) < 3 || (order_page.number+1-page)?abs<3 >
                    <#if page == order_page.number+1>
                        <a class="mysel" href="javascript:;">${page}</a>
                    <#else>
                        <a href="/user/order/list/${statusId}?page=${page-1}&timeId=${time_id}&keywords=${keywords!''}">${page}</a>
                    </#if>
                    <#assign continueEnter=false>
                <#else>
                    <#if !continueEnter>
                        <b class="pn-break">&hellip;</b>
                        <#assign continueEnter=true>
                    </#if>
                </#if>
            </#list>
        </#if>
      </#if>
      </div>
    </div><!--mymember_info END-->
    
    
    <script type="text/javascript">
      $(document).ready(function(){
         mymemberMenuCheck("mymember_likecheck","a","mymember_likelist","li","mysel");
    });
    </script>
    
    
  </div><!--mymember_center END-->
  
  <div class="myclear"></div>  
  </form>
</div><!--mymember_main END-->

<div class="myclear"></div>
</div>
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
