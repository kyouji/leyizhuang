<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客</title>
<meta name="keywords" content="${site.seoKeywords!''}" />
<meta name="description" content="${site.seoDescription!''}" />
<meta name="copyright" content="${site.copyright!''}" />
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/client/css/mycenter_base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/address.css"/>
<link rel="shortcut icon" href="/root/images/goods/zphk_logo.ico">
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/Validform_v5.3.2_min.js"></script>
<script src="/client/js/jquery.cityselect.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    <!-- 初始化表单验证 -->
    $("#form1").Validform({
        tiptype: 3
    });
    
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
    <#include "/client/common_user_header.ftl" />
    <!-- 内容 -->
    <div class="content"> 
        <!-- 左侧 -->
        <#include "/client/common_user_menu.ftl" />
        <!-- 右侧 -->
        <div class="content_2">
            <div class="content_2_1"><span>已经保存的收货地址</span><label>您已创建${address_list?size}个收货地址，最多可创建10个</label></div>
            <div class="content_2_2"></div>
            <div class="content_2_3">
                <#if address_list??>
                    <#list address_list as address>            
                        <div class="dz_2 <#if address.isDefaultAddress> dz_1</#if>">
                            <div class="dz_1_1"><strong>${address.receiverName!''}</strong>
                                <span>
                                    <a href="/user/address/update?id=${address.id}" title="修改">修改</a> 
                                    <a href="/user/address/delete?id=${address.id}" title="删除">删除</a>  
                                    <a href="/user/address/default?id=${address.id}" title="默认">默认</a>  
                                </span>
                            </div>
                            <div class="dz_1_2">${address.province!''}${address.city!''}${address.disctrict!''}${address.detailAddress!''}</div>
                            <div class="dz_1_3">${address.receiverMobile!''}</div>
                        </div>
                    </#list>
                </#if>    
            </div>
            <div class="content_2_4">编辑收货地址 </div>
            <div class="content_2_5">
                <ul>
                    <form method="post" action="/user/address/save" id="form1">    
                        <input class="mytext" name="addressId" type="hidden" value="<#if address??>${address.id}</#if>">
                        <input class="mytext" name="isDefaultAddress" type="hidden" value="false">
                        <li><span>收货人：</span>
                            <input id="receiverName" type="text" name="receiverName"  datatype="*2-128" errormsg="最少两个字符！" value="<#if address??>${address.receiverName}</#if>" class="textInput" value="" />
                            <span style="float:none;" class="Validform_checktip">*收货人姓名</span>
                        </li> 
                        <li><span>所在地：</span>
                            <div id="address">
                                <select name="province" class="prov" style="width: 100px;" datatype="*"></select>
                                <select name="city" class="city" style="width: 100px;" datatype="*"></select>
                                <select name="disctrict" class="dist" style="width: 100px;" datatype="*0-10"></select>
                                <span style="float:none;" class="Validform_checktip">*收货人所在地</span>
                            </div>	         
                        </li>
                        <li class="li_a">
                            <span>详细地址：</span>
                            <input class="mytext" style="height:25px;" name="detailAddress" datatype="*2-128" errormsg="最少两个字符！" value="<#if address??>${address.detailAddress!''}</#if>" type="text">
                            <span style="float:none;" class="Validform_checktip">*详细地址</span> 
                        </li>
                        <li>
                            <span>联系电话：</span>
                            <input class="mytext" style="height:25px;" name="receiverMobile" datatype="m" errormsg="请输入正确的电话号码格式！" value="<#if address??>${address.receiverMobile!''}</#if>" type="text">
                            <span style="float:none;" class="Validform_checktip">*手机号码</span>
                        </li>
                        <li>
                            <span>邮编：</span>
                            <input class="mytext" style="height:25px;" name="postcode" datatype="p" errormsg="邮政编码为6位数字！" value="<#if address??>${address.postcode!''}</#if>" type="text">
                            <span style="float:none;" class="Validform_checktip">*邮政编码</span>
                        </li>
                        <li>
                          <input id="button" class="mysub" type="submit" value="保存">
                        </li>  
                    </form>
                </ul>
            </div>
        </div>
    </div>
    <!--主体结束-->
    <#include "/client/common_footer.ftl" />
</body>
</html>
<!--结束-->
