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
<link href="/client/css/record.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/images/zphk_logo.ico">
<script src="/client/js/jquery-1.9.1.min.js"></script>


</head>
<body>
<form name="form1" method="post" action="/user/return/list" id="form1">
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
    <div class="content_2_1">退货记录</div>
    <div class="content_2_2">
      <div class="content_2_2_1">
          <ul>
            <li class="dh_1">商品</li>
            <li class="dh_4">原因</li> 
            <li class="dh_2">退货时间</li>
            <li class="dh_3">退货状态</li>
          </ul>
      </div>
      <#if return_page??>
         <#list return_page.content as return>
		      <div class="content_2_2_2">
		        <dl>
			         <dt>订单编号：<span>${return.orderNumber!''}</span></dt>
			         <dd>
			            <ul>
			              <li class="li_1"><a href="/goods/${return.goodsId!''}" title="${return.goodsTitle!'' }"><img src="${return.goodsCoverImageUri!''}"  /></a><a style="display:block; line-height:38px;" href="/goods/${return.goodsId!''}" title="${return.goodsTitle!'' }">${return.goodsTitle!'' }</a></li>
			              <li class="li_4">${return.reason!'&nbsp;'}</li> 
			              <li class="li_2">${return.returnTime!''}</li>
			              <li class="li_3"><#if return.statusId==0>待审核<#else>已审核</#if>    <#--    <a href="/user/return/list/del/{${return.id!''}}" title=""><span>删除</span></a></li> -->
			              </ul>
			         </dd>
		        </dl>
		      </div>
          </#list>
      </#if>     
    </div>
    
</div>
 <!--分页-->
  <div class="pagebox">
    <div class="num">
        <#if return_page??>
            <#assign continueEnter=false>
            <#if return_page.number+1 == 1>
                <span class="a1 a0">上一页&nbsp;&nbsp;</span>
            <#else>
                <a class="a2" href="javascript:__doPostBack('btnPage','${return_page.number-1}')">上一页</a>
            </#if>
            <#if return_page.totalPages gt 0>
                <#list 1..return_page.totalPages as page>
                    <#if page <= 3 || (return_page.totalPages-page) < 3 || (return_page.number+1-page)?abs<3 >
                        <#if page == return_page.number+1>
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
                 
            <#if return_page.number+1 == return_page.totalPages || return_page.totalPages==0>
                <span class="a1 a0">&nbsp;&nbsp;下一页</span>
            <#else>
                <a class="a2" href="javascript:__doPostBack('btnPage','${return_page.number+1}')">下一页</a>
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
        <span> 共&nbsp;<b><#if return_page??>${return_page.totalPages}</#if></b>&nbsp;页 
                <b><#if return_page??>${return_page.totalElements}</#if></b>条数据 
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
<#--      
<script type="text/javascript">
$(document).ready(function(){
    mymemberMenuCheck("mymember_likecheck","a","mymember_likelist","li","mysel");
});
</script>
-->
    </div>
    <!--mymember_center END-->
  </div>
  <!--mymember_main END-->
  <div class="myclear"></div>
</div>
<!--mymember END-->

<#include "/client/common_footer.ftl" />

</div>
</body>
</html>