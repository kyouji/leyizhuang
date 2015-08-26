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

<script src="/client/js/jquery-1.9.1.min.js"></script>

<link type="text/css" rel="stylesheet" href="/client/css/calendar.css" >
<script type="text/javascript" src="/client/js/calendar.js" ></script>  
<script type="text/javascript" src="/client/js/calendar-zh.js" ></script>
<script type="text/javascript" src="/client/js/calendar-setup.js"></script>

<script type="text/javascript">
//提交个人信息
function submitInfo()
{
    var nickname = $("#nickname").val();     
    var checkresult = $("input:radio[name='sex']:checked").val();
    var detailAddress = $("#detailAddress").val();
    var birthday = $("#EntTime").val();
    console.debug(nickname);
    console.debug(checkresult);
    console.debug(detailAddress);
    console.debug(birthday);
   
    if (undefined == nickname || "" == nickname){
        alert("昵称不能为空！");
        $("#nickname").focus();
        return;
    }
    
    if(nickname.length>16||nickname.length<1){
        alert("昵称长度为1-16位！");
        return;
    }
 
    if(!birthday.match(/^((?:19|20)\d\d)-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/)){
        alert("请选择正确的日期！");
        return;
    }
    
    
    if (undefined == detailAddress || "" == detailAddress){
        alert("所在地不能为空！");
        $("#detailAddress").focus();
        return;
    }
    
    $.ajax({
        type:"post",
        url:"/user/editInfo",
        async:true,
        data:{
            "nickname":nickname, 
            "sex":checkresult, 
            "birthday":birthday,     
            "detailAddress":detailAddress     
        },
        success:function(res) {
                if (0 == res.code){
                    alert("个人信息修改成功！")
                    window.location.reload();
                }else{
                    alert(res.message);
                }
        }
    });
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
           <span>&emsp; 生日：</span><input type="text" style="width:160px;height:30px;" id="EntTime" name="EntTime" onclick="return showCalendar('EntTime', 'y-mm-dd');"  />
        </li>
        <li><span>所在地：</span>
          <input id="detailAddress" type="text" name="detailAddress" datatype="*" class="Input" value="${user.detailAddress!''}" />
        </li>
        
        <li>
          <input type="button" value="保存" onclick="javascript:submitInfo();" id="button" name="btnChange" />
        </li>
        
      </ul>

    </div>
  </div>
</div>


<!--主体结束-->
<#include "/client/common_footer.ftl" />
</body>
</html>
<!--结束-->
