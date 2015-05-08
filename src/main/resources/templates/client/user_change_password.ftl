<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>博大生活网——修改密码</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link href="/client/style/layout.css" rel="stylesheet" type="text/css" />
<link href="/client/style/master.css" rel="stylesheet" type="text/css" />
<link href="/client/style/mymember.css" rel="stylesheet" type="text/css" />
<link href="/client/style/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/client/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/client/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="/client/js/html5.js"></script>
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

<script type="text/javascript">
$(function () {
    //初始化表单验证
    $("#form1").Validform({
        tiptype: 3
    });
});
</script>  

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
            <div class="usermain04">
                <div class="separationInfo sepBasic">
                 <h5>
                     修改密码
                     <span id="TellToUser"></span>
                 </h5>
                </div>
                <form id="form1" action="/user/password" method="post">
                    <input name="__STATE" type="hidden" value="${user.password}"/>
                    <div class="zhanghao_dlxx main2">
                        <ul>
                          <li class="title">原始密码：</li>
                          <li class="xxlr">
                            <input name="oldPassword" type="password"  class="xxinp" value="" datatype="*" errormsg="原始密码不正确" recheck="__STATE"/>
                            <span class="Validform_checktip"></span>
                          </li>
                          <li class="title">新密码：</li>
                          <li class="xxlr">
                            <input name="newPassword" type="password"  class="xxinp" value="" datatype="*6-18"/>
                            <span class="Validform_checktip"></span>
                          </li>
                          <li class="title">再次输入密码：</li>
                          <li class="xxlr">
                            <input type="password"  class="xxinp" value="" datatype="*" recheck="newPassword" />
                            <span class="Validform_checktip"></span>
                          </li>
                          <li class="xxlr3 main2"><span class="tijiaobox">
                            <input type="submit" value="确认"  class="btn_07 pulse-shrink"/>
                          </span></li>
                        </ul>
                        <div style="clear:both;"></div>
                    </div>
                </form>
          </div>
      </div>
      <!--mymember_info END-->
      
    </div>
    <!--mymember_center END-->
    <div class="myclear"></div>
  </div>
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