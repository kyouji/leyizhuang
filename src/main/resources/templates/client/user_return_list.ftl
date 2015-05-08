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
<!--<link href="/client/css/member.css" rel="stylesheet" type="text/css" />-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/mymember.js"></script>
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
<!-- header开始 -->
<#include "/client/common_header.ftl" />
<!-- header结束 -->
<div class="mymember_out">
<div class="mymember_main">
  <div class="myclear" style="height:20px;"></div>
  <#include "/client/common_user_menu.ftl" />
    <#-- 左侧菜单结束 -->
  
  <div class="mymember_mainbox">

    <div class="mymember_info">
      <div class="mymember_order_search">
        <a class="a001" href="/user/return/list">退换货列表</a>
        
        <#--
        <select>
          <option>全部</option>
          <option>已审核</option>
          <option>待审核</option>
        </select>
        -->
        <div class="clear"></div>
      </div>
      
      <table class="mymember_evaluate">
        <tbody>
        <tr>
          <th colspan="2">商品信息</th>
          <th width="60">退换数量</th>
          <th width="120">订单号</th>
          <th width="120">用户名</th>
          <th width="120">联系电话</th>
          <th width="120">申请时间</th>
          <th width="50">状态</th>
        </tr>
        <#if return_page??>
        <#list return_page.content as return>
            <tr>
              <td class="td001" width="70">
                <a href="/goods/${return.goodsId!''}"><img src="${return.goodsCoverImageUri!''}" width="60" height="60"></a>
              </td>
              <td class="td002">
                <a href="/goods/${return.goodsId!''}">${return.goodsTitle!''}</a>
              </td>
              <td>${return.returnNumber!''}</td>
              <td>${return.orderNumber!''}</td>
              <td class="td003">${return.username!''}</td>
              <td class="td003">${return.telephone!''}</td>
              <td class="td003">${return.returnTime!''}</td>
              <td class="td003"><#if return.statusId==0>待审核<#else>已审核</#if></td>
            </tr>
        </#list>
        </#if>
      </tbody>
      </table>
      
      <div class="myclear" style="height:10px;"></div>
      <div class="mymember_page">
          <#if return_page??>
            <#assign continueEnter=false>
            <#if return_page.totalPages gt 0>
                <#list 1..return_page.totalPages as page>
                    <#if page <= 3 || (return_page.totalPages-page) < 3 || (return_page.number+1-page)?abs<3 >
                        <#if page == return_page.number+1>
                            <a class="mysel" href="javascript:;">${page}</a>
                        <#else>
                            <a href="/user/distributor/return?page=${page-1}">${page}</a>
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

  </div><!--mymember_center END-->
  
  <div class="myclear"></div>
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
