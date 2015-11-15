<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>浏览历史</title>
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/client/css/mycenter_base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/history.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/big.css"/>
<link rel="shortcut icon" href="/root/images/goods/zphk_logo.ico">
<script src="/client/js/jquery-1.9.1.min.js"></script>
</head>

<body>
     <#--  分页       zhangji --> 
<form name="form1" method="post" action="/user/recent/list" id="form1">
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

<#include "/client/common_user_header.ftl" />
<!-- 内容 -->
<div class="content"> 
  <!-- 左侧 -->
 <#include "/client/common_user_menu.ftl" />
  <!-- 右侧 -->
 <div class="content_2" style="overflow:visible;">
    <div class="content_2_1">浏览历史</div>
    <div class="content_2_2">
      <ul >
         <#if recent_page??>
            <#list recent_page.content as rp>  
             <dl class="dl_1 shadow_add"> 
                <li class="evenflow_scale">           
                <dt><a href="/goods/${rp.goodsId!'0'}" target="_blank" title="${rp.goodsTitle!''}"><img src="${rp.goodsCoverImageUri!''}" /></a></dt>
                <dd class="dd_1"><a href="/goods/${rp.goodsId!'0'}"  target="_blank" title="${rp.goodsTitle!''}">${rp.goodsTitle!''}</a></dd>
                <dd class="dd_2"><a href="/goods/${rp.goodsId!'0'}" title="${rp.goodsTitle!''}"  target="_blank">￥${rp.goodsSalePrice?string("#.##")}</a></dd>
                </li>
             </dl>
             </#list>
          </#if>   
       </ul> 
    </div>
</div>
          <div class="clear"></div>
  <!--分页-->
  <div class="pagebox">
    <div class="num">
        <#if recent_page??>
            <#assign continueEnter=false>
            <#if recent_page.number+1 == 1>
                <span class="a1 a0">上一页&nbsp;&nbsp;</span>
            <#else>
                <a class="a2" href="javascript:__doPostBack('btnPage','${recent_page.number-1}')">上一页</a>
            </#if>
            <#if recent_page.totalPages gt 0>
                <#list 1..recent_page.totalPages as page>
                    <#if page <= 3 || (recent_page.totalPages-page) < 3 || (recent_page.number+1-page)?abs<3 >
                        <#if page == recent_page.number+1>
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
                 
            <#if recent_page.number+1 == recent_page.totalPages || recent_page.totalPages==0>
                <span class="a1 a0">&nbsp;&nbsp;下一页</span>
            <#else>
                <a class="a2" href="javascript:__doPostBack('btnPage','${recent_page.number+1}')">下一页</a>
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
        <span> 共&nbsp;<b><#if recent_page??>${recent_page.totalPages}</#if></b>&nbsp;页 
                <b><#if recent_page??>${recent_page.totalElements}</#if></b>条数据 
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
