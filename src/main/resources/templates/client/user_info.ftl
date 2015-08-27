<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><#if site??>${site.seoTitle!''}-</#if>个人信息</title>
<meta name="keywords" content="${site.seoKeywords!''}" />
<meta name="description" content="${site.seoDescription!''}" />
<meta name="copyright" content="正品惠客" />
<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/mycenter_base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/news.css"/>
<link rel="shortcut icon" href="/images/zphk_logo.ico">
<script src="/client/js/jquery-1.9.1.min.js"></script>

<link type="text/css" rel="stylesheet" href="/client/css/calendar.css" >
<script type="text/javascript" src="/client/js/calendar.js" ></script>  
<script type="text/javascript" src="/client/js/calendar-zh.js" ></script>
<script type="text/javascript" src="/client/js/calendar-setup.js"></script>

<script type="text/javascript">
//提交个人信息
function submitInfo()
{
    var form = document.getElementById("infoForm");
    alert("修改资料成功！")
    form.submit();
}
</script>



</head>
<body>
<!-- header开始 -->
<#include "/client/common_user_header.ftl" />
<!-- header结束 -->
<div class="content"> 
  <!-- 左侧 -->
  <#include "/client/common_user_menu.ftl" />
  <!-- 右侧 -->
  <div class="content_2">
    <div class="content_2_1">基本信息</div>
    <div class="content_2_2">     
      <form id="infoForm" action="/user/info/save" method="post">
          <ul>
            <li><span>&emsp;昵称：</span>
              <input id="nickname" type="text" name="nickname" datatype="*1-16" nullmsg="请输入昵称" errormsg="最多16个字符" class="textInput" value="${user.nickname!'' }" />
            </li>
            <li><span>&emsp;性别：</span>
              <input id="RadioGroup1_0" type="radio" checked="checked" value="男" name="sex" <#if user.sex?? && user.sex=="男">checked="checked" </#if>/>
                                    男
              <input id="RadioGroup1_1" type="radio" value="女" name="sex"<#if user.sex?? && user.sex=="女">checked="checked" </#if>/>
                                    女
            </li>
            <li>   
               <span>&emsp; 生日：</span><input type="text" value="${user.birthday?string("yyyy-MM-dd")}" style="width:160px;height:30px;" id="EntTime" name="EntTime" onclick="return showCalendar('EntTime', 'y-mm-dd');"  />
            </li>
            <li><span>所在地：</span>
              <input id="detailAddress" type="text" name="detailAddress" datatype="*" class="Input" value="${user.detailAddress!''}" />
            </li>
            
            <li>
              <input type="button" value="保存" onclick="javascript:submitInfo();" id="button" name="btnChange" />
            </li>
          </ul>
      </form>
    </div>
  </div>
</div>


<!--主体结束-->
<#include "/client/common_footer.ftl" />
</body>
</html>
<!--结束-->
