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
        <a class="a001" href="/user/comment/list">全部评论</a>
        
        <#--
        <select>
          <option>待评价</option>
          <option>待晒单</option>
        </select>
        -->
        <div class="clear"></div>
      </div>
      
      <table class="mymember_evaluate">
        <tbody>
        <tr>
          <th colspan="2">商品信息</th>
          <th width="200">评价状态</th>
        </tr>
        <#if comment_page??>
              <#list comment_page.content as comment>
                <tr>
                    <td>
                       <a href="/goods/${comment.goodsId}">
                            <img src="${comment.goodsCoverImageUri!''}" width="50" height="50" title="${comment.goodsTitle!''}">                                             </a>                                        </td>
                    <td>
                       <a target="_blank" href="/goods/${comment.goodsId}">${comment.goodsTitle!''}</a>
                    </td>
                    <td>
                        我的评论：${comment.content!''}
                        <br>
                        ${comment.commentTime!''}
                        <br>
                        <#if comment.isReplied>
                        ${comment.reply!''}
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
        <#if comment_page??>
            <#assign continueEnter=false>
            <#if comment_page.totalPages gt 0>
                <#list 1..comment_page.totalPages as page>
                    <#if page <= 3 || (comment_page.totalPages-page) < 3 || (comment_page.number+1-page)?abs<3 >
                        <#if page == comment_page.number+1>
                            <a class="mysel" href="javascript:;">${page}</a>
                        <#else>
                            <a href="/user/comment/list?page=${page-1}&keywords=${keywords!''}">${page}</a>
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
