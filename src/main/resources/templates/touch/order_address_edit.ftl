<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>编辑收货地址</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<script src="/touch/js/jquery-1.9.1.min.js"></script>
<script src="/touch/js/common.js"></script>
<script src="/client/js/Validform_v5.3.2_min.js"></script>
<script src="/client/js/jquery.cityselect.js"></script>

<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/touch/css/address.css"/>

<script type="text/javascript">
  $(document).ready(function(){
    
    //初始化表单验证
    $("#form1").Validform({
        tiptype: 2
    });
    $(".member").citySelect({
        nodata:"none",
        <#if address?? && address.province??>prov: "${address.province!''}",</#if>
        <#if address?? && address.city??>city: "${address.city!''}",</#if>
        <#if address?? && address.disctrict??>dist: "${address.disctrict!''}",</#if>
        required:false
    }); 
});

function subAddress(){
        $("#form1").submit();
}
</script>

</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
  <div class="main">
    <p>编辑收货地址</p>
    <a class="a1" href="javascript:history.go(-1);"><img src="/touch/images/back.png" height="22" /></a>
    <a class="a2" href="/touch"><img src="/touch/images/home.png" height="22" /></a>  </div>
</header>

<div class="main">
 <div class="clear15"></div>
  <div class="mem"  >
      <form action="/touch/order/address/save" method="get" id="form1">
          <input name="addressId" type="hidden" value="<#if address??>${address.id}</#if>">
          <div class="member"><label>姓名：</label><input class="input" value="<#if address??>${address.receiverName}</#if>" id="receiverName" type="text" name="receiverName"  datatype="*2-128" errormsg="最少两个字符！"/></div>
          <div class="member"><label>联系方式：</label><input class="input" name="receiverMobile" datatype="m" errormsg="请输入正确的电话号码格式！" value="<#if address??>${address.receiverMobile!''}</#if>"/></div>    
    	  <div class="member ber"><label>所在地：</label>
        	  <select name="province" class="prov" datatype="*"></select><br>
              <label>&emsp;&emsp;&emsp;&emsp;</label><select name="city" class="city"  datatype="*"></select><br>
              <label>&emsp;&emsp;&emsp;&emsp;</label><select name="disctrict" class="dist"  datatype="*0-10"></select>
           </div>
           <div class="member"><label>街道：</label>
               <input class="input" name="detailAddress" datatype="*2-128" errormsg="最少两个字符！" value="<#if address??>${address.detailAddress!''}</#if>"/>
           </div>
        </div>
    </form>
  
</div><!--main END-->

<div class="ok_mainbox">
    <p><a href="javascript:subAddress();">保存</a></p>
  </div>
</body>
</html>
