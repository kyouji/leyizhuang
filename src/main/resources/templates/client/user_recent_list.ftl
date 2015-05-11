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
  
  <div class="mymember_scan_check">
    <a class="mysel" href="javascript:;">全部分类</a>
  </div>
  
  <script type="text/javascript">
    $(document).ready(function(){
    memberScanList("scan_line",".mymember_scan");
});
  </script>
  <div class="mymember_scan">
    <span id="scan_line" style="height: 200px;"></span>
    <#if recent_page??>
        <#list recent_page.content as rg>
            <#if !lastTime?? || rg.visitTime?string("yyyy-MM-dd") != lastTime?string("yyyy-MM-dd")>
                <div class="myclear"></div>
                <#assign lastTime=rg.visitTime>
                <h3>${rg.visitTime?string("MM月dd日")}<span>${rg.visitTime?string("yyyy-MM-dd")}</span><i></i></h3>
                <div class="myclear"></div>
            </#if>
            <div class="mymember_scanpart">
              <#--
              <a class="a001" href="#">
                <img src="/client/images/mymember/delete.png">
              </a>
              -->
              <a href="/goods/${rg.goodsId!''}">
                <img src="${rg.goodsCoverImageUri!''}" width="220" height="220">
              </a>
              <p>￥${rg.goodsSalePrice?string("#.##")}</p>
            </div>
        </#list>
    </#if>
    <div class="myclear"></div>
  </div><!--mymember_scan END-->
  
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
