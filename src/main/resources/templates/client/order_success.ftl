<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>博大生活网——订单提交成功</title>
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
<article id="main" class="mt20">
      <div class="order bor fl">
            <div class="o-left">
                <b style="float:left; margin:10px 15px 0 0"><img src="/client/images/ok.png" width="32" height="32" /></b>
                <h3 class="o-title">
                  感谢您，订单提交成功！订单号：<#if order??>${order.orderNumber!''}</#if>
                </h3>
                <p class="o-tips">
                    博大生活网提供
                        <span class="pay-safeguard j_uiPop">
                        <em class="ps-title j_uiBaozhangPop">在线支付保障</em>
                        </span>
                        请您放心购买。
                </p>
            </div>
            <div class="o-right">
                <div class="o-price">
                    <em>货到付款</em><strong><#if order??>${order.totalPrice?string("0.00")}<#else>0</#if></strong><em>元</em>
                </div>
                <div class="o-detail" id="orderDetail"><a href="/user/order?id=<#if order??>${order.id}</#if>">订单详情 ></a></div>
                
            </div>
            <div class="clr"></div>
        </div>
</article>
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
