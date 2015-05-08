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
    <!--mymember_head END-->
    <div class="myclear" style="height:20px;"></div>
    <#-- 左侧菜单 -->
      <#include "/client/common_user_menu.ftl" />
    <#-- 左侧菜单结束 -->
    <form name="form1" action="/user/collect/list" method="POST">
    
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
        <div class="mymember_order_search"> <a class="a001" href="/user/collect/list">关注商品</a>
          <input class="mysub" type="submit" value="查询">
          <input class="mytext" type="text" name="keywords" onfocus="if(value=='商品名称') {value=''}" onblur="if (value=='') {value='商品名称'}" value="${keywords!'商品名称'}">
          <div class="clear"></div>
        </div>
        <table>
          <tbody><tr class="mymember_infotab_tit01">
            <th colspan="2">商品</th>
            <th width="80">金额</th>
            <th width="70">操作</th>
          </tr>
          <#if collect_page??>
            <#list collect_page.content as cg>
                <tr id="tr_1424195166">
                    <td>
                        <a href="/goods/${cg.goodsId}" target="_blank">
                            <strong><img width="100" height="100" src="${cg.goodsCoverImageUri!''}"></strong>
                        </a>
                    </td>
                    <td class="tb01">
                        <a href="/goods/${cg.goodsId}" target="_blank">${cg.goodsTitle!''}</a>
                    </td>
                    <td class="tb02">￥${cg.goodsSalePrice?string("#.##")}</td>
                    <td>
                        <p><a href="/cart/init?id=${cg.goodsId!''}" target="_blank">加入购物车</a></p>
                        <p><a href="/user/collect/del?id=${cg.goodsId!''}">取消关注</a></p>
                    </td>
                  </tr>
            </#list>
          </#if>
        </tbody></table>
        <div class="myclear" style="height:10px;"></div>
        <div class="mymember_page">
          <#if collect_page??>
                <#assign continueEnter=false>
                <#if collect_page.totalPages gt 0>
                    <#list 1..collect_page.totalPages as page>
                        <#if page <= 3 || (collect_page.totalPages-page) < 3 || (collect_page.number+1-page)?abs<3 >
                            <#if page == collect_page.number+1>
                                <a class="mysel" href="javascript:;">${page}</a>
                            <#else>
                                <a href="/user/collect/list?page=${page-1}&keywords=${keywords!''}">${page}</a>
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
    </div>
    <div class="myclear"></div>
  </div>
  </form>
  <!--mymember_main END-->
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
