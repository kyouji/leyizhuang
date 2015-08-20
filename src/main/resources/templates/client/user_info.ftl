<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>个人信息</title>
<meta name="keywords" content="${site.seoKeywords!''}" />
<meta name="description" content="${site.seoDescription!''}" />
<meta name="copyright" content="正品惠客" />
<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/mycenter_base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/news.css"/>

<!--<link href="/client/css/member.css" rel="stylesheet" type="text/css" />-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/Validform_v5.3.2_min.js"></script>

<!--[if IE]>
   <script src="/client/js/html5.js"></script>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="/client/js/DD_belatedPNG_0.0.8a.js" ></script>
<script>
DD_belatedPNG.fix('.,img,background');
</script>
<![endif]-->

<script>
//提交个人信息
function submitInfo()
{
    var nickname = $("#nickname").val();     
    var checkresult = $("input:radio[name='sex']:checked").val();
    var y = $("#year").val();     
    var m = $("#month").val(); 
    var d = $("#day").val(); 
    var detailAddress = $("#detailAddress").val();
    var birthday = y+"/"+m+"/"+d;


    if (undefined == nickname || "" == nickname)
    {
        alert("昵称不能为空");
        $("#nickname").focus();
        return;
    }
 
    if (undefined == y || "" == y||undefined == m || "" == m||undefined == d || "" == d)
    {
        alert("请选择生日");        
        return;
    }
    if (undefined == detailAddress || "" == detailAddress)
    {
        alert("所在地不能为空");
        $("#detailAddress").focus();
        return;
    }
    
    $.ajax({
        type:"post",
        url:"/user/info/ajax/save",
        data:{
            "nickname": nickname, 
            "sex": checkresult, 
            "birthday":birthday,     
            "detailAddress":detailAddress     
        },
        
        
        success:function(res) {
            if (0 == res.code)
            {
                
                window.location.reload();
                alert("个人信息已修改！")
            }
            else
            {
                alert(res.message);
            }
        }
    });
}
</script>



</head>
<body onload="YearMonthDay();">
<!-- header开始 -->
<#include "/client/common_header.ftl" />
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
          女</li>
          <#-- 生日的初始化未实现！！ zhangji -->
          <form id="form1" name="form1">
		        <li><span>&emsp;生日：</span>
					<select id="year" name="YYYY" onchange="YYYYMM(this.value)">
					   <option value="<#if user.birthday?? >${user.birthday?string("yyyy")!''}</#if>"></option> 
					</select>年  
					<select id="month" name="MM"onchange="MMDD(this.value)">  
					   <option value="<#if user.birthday?? >${user.birthday?string("MM")!''}</#if>"></option>  
					</select>月  
					<select id="day" name="DD">  
					   <option value="<#if user.birthday?? >${user.birthday?string("dd")!''}</#if>" ></option>  
					</select>日 
		        </li>
          </form>
          <#-- 生日的初始化未实现！！ zhangji  end-->
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

<script language="JavaScript">  
window.onload = function(){  
strYYYY = document.form1.YYYY.outerHTML;  
strMM = document.form1.MM.outerHTML;  
strDD = document.form1.DD.outerHTML;  
MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];  
  
//先给年下拉框赋内容  
var y = new Date().getFullYear();  
var str = strYYYY.substring(0, strYYYY.length - 9);  
for (var i = (y-30); i < (y+30); i++) //以今年为准，前30年，后30年  
{  
str += "<option value='" + i + "'> " + i + "</option>\r\n";  
}  
document.form1.YYYY.outerHTML = str +"</select>";  
  
//赋月份的下拉框  
var str = strMM.substring(0, strMM.length - 9);  
for (var i = 1; i < 13; i++)  
{  
str += "<option value='" + i + "'> " + i + "</option>\r\n";  
}  
document.form1.MM.outerHTML = str +"</select>";  
  
document.form1.YYYY.value = y;  
document.form1.MM.value = new Date().getMonth() + 1;  
var n = MonHead[new Date().getMonth()];  
if (new Date().getMonth() ==1 && IsPinYear(YYYYvalue)) n++;  
writeDay(n); //赋日期下拉框  
document.form1.DD.value = new Date().getDate();  
}  
function YYYYMM(str) //年发生变化时日期发生变化(主要是判断闰平年)  
{  
var MMvalue = document.form1.MM.options[document.form1.MM.selectedIndex].value;  
if (MMvalue == ""){DD.outerHTML = strDD; return;}  
var n = MonHead[MMvalue - 1];  
if (MMvalue ==2 && IsPinYear(str)) n++;  
writeDay(n)  
}  
function MMDD(str) //月发生变化时日期联动  
{  
var YYYYvalue = document.form1.YYYY.options[document.form1.YYYY.selectedIndex].value;  
if (str == ""){DD.outerHTML = strDD; return;}  
var n = MonHead[str - 1];  
if (str ==2 && IsPinYear(YYYYvalue)) n++;  
writeDay(n)  
}  
function writeDay(n) //据条件写日期的下拉框  
{  
var s = strDD.substring(0, strDD.length - 9);  
for (var i=1; i<(n+1); i++)  
s += "<option value='" + i + "'> " + i + "</option>\r\n";  
document.form1.DD.outerHTML = s +"</select>";  
}  
function IsPinYear(year)//判断是否闰平年  
{ return(0 == year%4 && (year%100 !=0 || year%400 == 0))}   
</script> 

<!--主体结束-->
<#include "/client/common_footer.ftl" />
</body>
</html>
<!--结束-->
