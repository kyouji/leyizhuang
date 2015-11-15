<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>浏览历史</title>
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/client/css/mycenter_base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/integral.css"/>
<link rel="shortcut icon" href="/root/images/goods/zphk_logo.ico">
<script src="/client/js/jquery-1.9.1.min.js"></script>
</head>

<body>
     <#--  分页       zhangji --> 
<form name="form1" method="post" action="/user/point/list" id="form1">
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
 <div class="content_2">
    <div class="content_2_1">
       <ul>
           <li class="jf_1">我的积分</li>
           <li class="jf_2">可用积分：<span><#if point_page?? && point_page.content?? && point_page.content[0]??>${point_page.content[0].totalPoint!'0'}<#else>0</#if></span>&nbsp;分</li>
           <#--
           <li class="jf_3">您有<b><#if point_page?? && point_page.content?? && point_page.content[0]??>${point_page.content[0].totalPoint!'0'}<#else>0</#if></b>积分，将在<i>2016年1月1日</i>过期！  <a href="#" title="">立即使用>></a></li>
           -->
       </ul>
    </div>
    <div class="content_2_2">
      <div class="content_2_2_1">
          <ul>
            <li class="dh_1">时间</li>
            <li class="dh_2"> 收入/支出</li>
            <li class="dh_3">备注</li>
            <li class="dh_1"> 详情</li>
          </ul>
      </div>
      <#if point_page??>
           <#list point_page.content as point>
		      <div class="content_2_2_2">
		          <ul>
		            <li class="dh_1">${point.pointTime!'&nbsp;'}</li>
		            <li class="dh_2"><#if point.point??><#if point.point gt 0>+</#if>${point.point}</#if></li>
		            <li class="dh_3">${point.detail!'&nbsp;'}</li>
		            <li class="dh_1">订单&nbsp; ${point.orderNumber!'&nbsp;'}</li>
		          </ul>
		      </div>
          </#list>
      </#if>
    </div>
    
</div>
  <!--分页-->
  <div class="pagebox">
    <div class="num">
        <#if point_page??>
            <#assign continueEnter=false>
            <#if point_page.number+1 == 1>
                <span class="a1 a0">上一页&nbsp;&nbsp;</span>
            <#else>
                <a class="a2" href="javascript:__doPostBack('btnPage','${point_page.number-1}')">上一页</a>
            </#if>
            <#if point_page.totalPages gt 0>
                <#list 1..point_page.totalPages as page>
                    <#if page <= 3 || (point_page.totalPages-page) < 3 || (point_page.number+1-page)?abs<3 >
                        <#if page == point_page.number+1>
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
                 
            <#if point_page.number+1 == point_page.totalPages || point_page.totalPages==0>
                <span class="a1 a0">&nbsp;&nbsp;下一页</span>
            <#else>
                <a class="a2" href="javascript:__doPostBack('btnPage','${point_page.number+1}')">下一页</a>
            </#if>
        </#if>
                 
        <span> 共&nbsp;<b><#if point_page??>${point_page.totalPages}</#if></b>&nbsp;页 
                <b><#if point_page??>${point_page.totalElements}</#if></b>条数据 
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
