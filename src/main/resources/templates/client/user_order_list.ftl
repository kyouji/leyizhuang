<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客</title>
<meta name="keywords" content="${site.seoKeywords!''}" />
<meta name="description" content="${site.seoDescription!''}" />
<meta name="copyright" content="正品惠客" />

<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/mycenter_base.css"/>
<link href="/client/css/my_order.css" rel="stylesheet" type="text/css" />
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
<form name="form1" method="post" action="/user/order/list" id="form1">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="${__EVENTTARGET!""}">
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="${__EVENTARGUMENT!""}">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="${__VIEWSTATE!""}" >
</div>
<script type="text/javascript">
var theForm = document.forms['form1'];
    if (!theForm) {
        theForm = document.form1;
    }
    function __doPostBack(eventTarget, eventArgument) {
        if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
            theForm.__EVENTTARGET.value = eventTarget;
            theForm.__EVENTARGUMENT.value = eventArgument;
            theForm.submit();
        }
    }
</script>

<#include "/client/common_header.ftl" />
<!-- 内容 -->
<div class="content"> 
  <!-- 左侧 -->
 <#include "/client/common_user_menu.ftl" />
  <!-- 右侧 -->
 <div class="content_right">
    <div class="right_title"><a>我的订单</a></div> 
    <ul class="right_nav">
        <li class="right_nav_01"><a>商品</a></li>
        <li class="right_nav_02"><a>单价（元）</a></li>
        <li class="right_nav_02"><a>数量</a></li>
        <li class="right_nav_02"><a>商品操作</a></li>
        <li class="right_nav_02"><a>总价（元）</a></li>
        <li class="right_nav_02"><a>交易状态</a></li>
        <li class="right_nav_02"><a>交易操作</a></li>   
    </ul>
      <#if order_page??>
         <#list order_page.content as order>
                <div class="right_product">       
			        <ul class="right_product_nav">
			            <li class="product_nav_01"><a >订单编号：</a></li>
			            <li class="product_nav_02"><a>${order.orderNumber!''}</a></li>
			            <li class="product_nav_03"><a>收货人：${order.shippingName!''}</a></li>
			            <li class="product_nav_04"><a>下单时间： ${order.orderTime!''}</a></li>
			     <#--       <li class="product_nav_05"><img src="/client/images/order_01.png"></li>  -->
			        </ul>
			        
			        <div class="right_product_box">				    	            
				        <#list order.orderGoodsList as og>			                   
			               <div  class="right_box_01">		                   
			                   <img src="${og.goodsCoverImageUri!''}">
			                   <a href="/goods/${og.goodsId!''}" title="${goodsTitle!''}">${og.goodsTitle!''}</a>
			               </div>		
			               <ul class="right_box_02">	                   
			                   <li class="price01"><a>${og.price!''}</a></li>
			                   <li class="price02"><a>${og.quantity!''}</a></li>	
			                <#if !og.isReturnApplied >   		               				               				                                                      
				            <li class="price02"><a href="/user/return/${order.id}?id=${og.id}">退货</a></li>
				            <#else>
				             <li class="price02"><a href="/user/return/handling/${order.id}?id=${og.id}">查看退货状态</a></li>
				            </#if>
				           </ul>
				            			              
				              <ul class="right_box_03" > 
				            <li class="price01"><a>￥${order.totalPrice?string("#.##")}</a></li>
				            
				            <#if order.statusId = 1>     
						         <li class="price03"><div><a>待确认</a><br></div></li>
						         <li class="price04"><a href="#" title="">确认收货</a></li>
				            </#if>
				            <#if order.statusId = 2>
				                 <li class="price03"><div><a>待付款</a><br></div></li>
                                 <li class="price04"><a  href="#" title="">去付款</a></li>
                            </#if>
				            <#if order.statusId = 3>
				                 <li class="price03"><div><a>待发货</a><br></div></li>
                                <#-- <li class="price04"><a  href="#" title="">&nbsp;</a></li> -->
                             </#if>
				            <#if order.statusId = 4>
				                 <li class="price03"><div><a>待收货</a><br></div></li>
                                 <li class="price04"><a  href="#" title="">确认收货</a></li>
				            </#if>
				            <#if order.statusId = 5>
				                 <li class="price03"><div><a>待评价</a><br></div></li>
                                 <li class="price04"><a   href="/user/comment/edit/${order.id}?id=${og.id}" title="去评价">评价</a></li>
				            </#if>
				            <#if order.statusId = 6>
				                 <li class="price03"><div><a>已完成</a><br></div></li>
                                 <li class="price04"><a  href="#" title="">&nbsp;</a></li>
				            </#if>
				            <#if order.statusId = 7>
				                 <li class="price03"><div><a>已取消</a><br></div></li>
                             <#--    <li class="price04"><a  href="#" title="">&nbsp;</a></li> -->
				            </#if>
				            <#if order.statusId = 8>
				                 <li class="price03"><div><a>支付取消（失败）</a><br></div></li>
                             <#--    <li class="price04"><a  href="#" title="">&nbsp;</a></li>		-->		            
				            </#if> 			                
			             </ul>
			           </#list>    
			        </div>
	            </div> 
	       </#list>
	    </#if>
    
 
</div>
   
  <!--分页-->
  <div class="pagebox">
    <div class="num">
        <#if order_page??>
            <#assign continueEnter=false>
            <#if order_page.number+1 == 1>
                <span class="a1 a0">上一页&nbsp;&nbsp;</span>
            <#else>
                <a class="a2" href="javascript:__doPostBack('btnPage','${order_page.number-1}')">上一页</a>
            </#if>
            <#if order_page.totalPages gt 0>
                <#list 1..order_page.totalPages as page>
                    <#if page <= 3 || (order_page.totalPages-page) < 3 || (order_page.number+1-page)?abs<3 >
                        <#if page == order_page.number+1>
                            <span class="current">${page}</span>
                        <#else>
                            <a href="javascript:__doPostBack('btnPage','${page-1}')">${page}</a>
                        </#if>
                        <#assign continueEnter=false>
                    <#else>
                        <#if !continueEnter>
                            ...
                            <#assign continueEnter=true>
                        </#if>
                    </#if>
                </#list>
            </#if>
                 
            <#if order_page.number+1 == order_page.totalPages || order_page.totalPages==0>
                <span class="a1 a0">&nbsp;&nbsp;下一页</span>
            <#else>
                <a class="a2" href="javascript:__doPostBack('btnPage','${order_page.number+1}')">下一页</a>
            </#if>
        </#if>
                 
         <#--   
        <a class="sel" href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <span> ... </span>
        <a href="#">45</a>
        <a class="a2" href="#"><span>下一页</span></a>
        -->
        <span> 共&nbsp;<b><#if order_page??>${order_page.totalPages}</#if></b>&nbsp;页 
                <b><#if order_page??>${order_page.totalElements}</#if></b>条数据 
        </span>
    </div>
    <#-- 到第？页功能未实现  T.T zhangji -->   
    <#--      
    <div class="page">
        <input class="sub" type="submit" value="确定" style=" *+border:none;" onclick="javascript:__doPostBack('btnPage', 'parseInt($('#pageIndex').val())-1');" />
        <span>页</span>
        <input id="pageIndex" class="text" type="text" value="1" />
        <span>到第</span>
    </div>
    -->
   <#-- 到第？页功能未实现  T.T zhangji   end-->      
          

   </div>
</div>
<!--底部footer-->
<#include "/client/common_footer.ftl" />
</form>
</body>
</html>
