<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>博大生活网——确认订单</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link href="/client/style/layout.css" rel="stylesheet" type="text/css" />
<link href="/client/style/master.css" rel="stylesheet" type="text/css" />
<link href="/client/style/cart.css" rel="stylesheet" type="text/css" />
<link href="/client/style/style.css" rel="stylesheet" type="text/css">
<!--<link href="/client/css/member.css" rel="stylesheet" type="text/css" />-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/client/js/html5.js"></script>
<script type="text/javascript" src="/client/js/Validform_v5.3.2_min.js"></script>
<script src="/client/js/mymember.js"></script>
<script type="text/javascript" src="/client/js/jquery.cityselect.js"></script>
<script src="/client/js/lhgdialog.js"></script>
<script src="/client/js/order_info.js"></script>
<!--[if IE]>
   <script src="/client/js/html5.js"></script>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="/client/js/DD_belatedPNG_0.0.8a.js" ></script>
<script>
DD_belatedPNG.fix('.,img,background');
</script>
<![endif]-->
<script type="text/javascript">
$(function () {
    $("#address").citySelect({
        nodata:"none",
        <#if address?? && address.province??>prov: "${address.province!''}",</#if>
        <#if address?? && address.city??>city: "${address.city!''}",</#if>
        <#if address?? && address.disctrict??>dist: "${address.disctrict!''}",</#if>
        required:false
    }); 
});
</script>  
</head>
<body>
<#include "/client/common_header.ftl" />
<!--header结束-->
<div class="gwcbg">
    <div id="main" class="mt12">
        <div class="place"> 
            <span>您现在的位置：</span>
            <a href="/">首页</a>&gt;
            <a href="javascript:void(0);">核对订单</a>
        </div>
        <div class="s_gwc2"><span>1、我的购物车</span><span id="colorfff">2、我的订单信息</span><span>3、支付成功</span></div>
    </div>
    <div id="main-form">
        <#include "/client/order_info_content.ftl" />
    </div>
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
