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
<script src="/client/js/header.js"></script>
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

    <div class="mymember_info mymember_info02">
      <div class="mymember_order_search">
        <a class="a001" href="/user/consult/list">全部咨询</a>        
      
        <div class="clear"></div>
      </div>
      <table class="tb-void">
							
		<thead>
			<tr>
			<th>咨询商品</th>
			<th>商品名称</th>
			<th align="center">咨询回复</th>
			</tr>
		</thead>
	   <tbody>
		  <#if consult_page??>
		      <#list consult_page.content as consult>
		        <tr>
                    <td>
                       <a href="/goods/${consult.goodsId}">
                            <img src="${consult.goodsCoverImageUri!''}" width="50" height="50" title="${consult.goodsTitle!''}">                                             </a>                                        </td>
                    <td>
                       <a target="_blank" href="/goods/${consult.goodsId}">${consult.goodsTitle!''}</a>
                    </td>
                    <td>
                        我的咨询：${consult.content!''}
                        <br>
                        ${consult.consultTime!''}
                        <br>
                        <#if consult.isReplied>
                        ${consult.reply!''}
                        <#else>
                        （暂无回复）
                        </#if>    
                    </td>
                </tr>   
		      </#list>
		  </#if>									
			
	   </tbody>
	   </table>
      <div class="myclear" style="height:10px;"></div>
      <div class="mymember_page">
        <#if consult_page??>
            <#assign continueEnter=false>
            <#if consult_page.totalPages gt 0>
                <#list 1..consult_page.totalPages as page>
                    <#if page <= 3 || (consult_page.totalPages-page) < 3 || (consult_page.number+1-page)?abs<3 >
                        <#if page == consult_page.number+1>
                            <a class="mysel" href="javascript:;">${page}</a>
                        <#else>
                            <a href="/user/consult/list?page=${page-1}&keywords=${keywords!''}">${page}</a>
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
