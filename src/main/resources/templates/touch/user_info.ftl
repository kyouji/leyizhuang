<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>修改昵称</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<script src="/touch/js/jquery-1.9.1.min.js"></script>
<script src="/touch/js/common.js"></script>
<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/touch/css/modify.css"/>
<script type="text/javascript">
   function editPassword(){
        $("#form1").submit();
   }
</script>
</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
  <div class="main">
    <p>修改信息</p>
    <a class="a1" href="javascript:history.go(-1);"><img src="/touch/images/back.png" height="22" /></a>
    <a class="a2" href="/touch"><img src="/touch/images/home.png" height="22" /></a>  
</header>

<div class="main">
    <form action="/touch/user/info" method="post" id="form1" style="width:100%;display:block;overflow:hidden;background:#fff;">

        <div class="member_check">
            <span>昵称：</span>
            <input type="text" name="nickname"  class="textInput" value="${user.nickname!''}" />
        </div>
        <div class="member_check"  >
            <span>电话：</span>

            <input type="datetime" name="mobile"  class="textInput" value="${user.mobile!''}" />
        </div>
        <div class="member_check"  >
            <span>邮箱：</span>
            <input type="text" name="email"  class="textInput" value="${user.email!''}" />
        </div>
        <div class="member_check"  >
             <span>性别：</span>
            <!--<input type="radio" name="sex"  value="男" <#if user.sex?? && user.sex=="男">checked="checked" </#if>/><label>男</label>
            <input type="radio" name="sex"  value="女"  <#if user.sex?? && user.sex=="女">checked="checked" </#if>/><label>男</label>-->
            <select name="sex">
                <option value="男" <#if user.sex?? && user.sex=="男">selected="selected"</#if>>男</option>
                <option value="女" <#if user.sex?? && user.sex=="女">selected="selected"</#if>>女</option>
            </select>
        </div>
        <div class="member_check"  >
            <span>生日：</span>
            <input type="date" name="birthday" class="textInput" value=${user.birthday?string("yyyy-MM-dd")}>
            <br/>
        </div>
        <div class="clear20"></div>

     </form>
     <div class="clear10"></div>
        <div class="ok_mainbox">
            <a href="javascript:editPassword();"  id="sub"><p>确 认</p></a>
         </div>
</div><!--main END-->
<!--
<#include "/touch/common_footer.ftl" />
-->
</body>
</html>
