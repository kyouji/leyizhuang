<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>车有同盟</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<!--[if IE]>
   <script src="/client/js/html5.js"></script>
<![endif]-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/common.js"></script>
<script src="/client/js/ljs-v1.01.js"></script>

<link href="/client/style/common.css" rel="stylesheet" type="text/css" />
<link href="/client/style/cytm.css" rel="stylesheet" type="text/css" />
<link href="/client/style/cartoon.css" rel="stylesheet" type="text/css" />
<link href="/client/style/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
$(document).ready(function(){
    menuDownList("top_phone","#top_phonelist",".a1","sel");
    phoneListMore();//单独下拉
    menuDownList("top_order","#top_orderlist",".a4","sel");//顶部下拉
    navDownList("navdown","li",".nav_showbox");
    menuDownList("mainnavdown","#navdown",".a2","sel");
    checkNowHover("shopping_down","shopping_sel");
});

function showDialog()
{
    $("#checkDialog").css("display", "block");
}

function hideDialog()
{
    $("#checkDialog").css("display", "none");
}
</script>
</head>
<body>
<div id="checkDialog" class="mianfeilingqutanchu" style="display: none;">
    <div class="mianfeilingqutanchu_dl">
        <section class="loginbox">
            <form>
                <p>请输入姓名</p>
                <input class="text" type="text" />
                <p>请输入车牌</p>
                <input class="text" type="text" />
                  <p>请输入电话</p>
                <input class="text" type="text" />
                <p>请输入验证码</p>
                <div class="clear"></div>
                <input class="text fl" type="text" style="width:35%;" />
                <img src="/code" onclick="this.src = '/code?date='+Math.random();" id="yzm" height="37"/>
          
                <div class="clear h15"></div>
                <p class="pb10">
                    <span class="absolute-r"><a href="javascript:hideDialog();">关闭</a> | <a href="/reg">免费注册</a>| <a href="/login">账号登录</a></span>
                </p>
                <div class="clear h40"></div>
                <input type="submit" class="sub" value="免费领取" />
                <div class="clear h20"></div>
            </form>
        </section>
    </div>
</div>
<#include "/client/common_header.ftl" />

<div class="main">
    <#if coupon_list??>
        <#list coupon_list as item>
            <div class="mianfeilingqu">
                <div class="mianfeilingqu_left">
                    <img src="${item.typePicUri!''}" width="874" height="350">
                    <div class="mendian">
                        <span>同盟店:</span>
                        <select disabled="disabled">
                            <option value="">请选择</option>
                            <#if shop_list??>
                                <#list shop_list as shop>
                                    <option value="${shop.id}" <#if item.diySiteId==shop.id>selected="selected"</#if>>${shop.title!''}</option>
                                </#list>
                            </#if>
                        </select>
                        <div class="clear"></div>
                        <p class="mt5">剩余：<span class="red">${item.leftNumber?c!'0'}</span>张</p>
                    </div>
                    <div class="clear"></div>
                    <#--
                    <div class="zongshushengyu">
                        <p class="mt5">总数剩余：<span class="red">14855</span>张</p>
                    </div>
                    -->
                    <div class="clear"></div>
                    <div class="linquanniu">
                        <a href="javascript:showDialog();">点击领取</a> 
                    </div>
                </div>
                <div class="mianfeilingqu_right">
                    <h3>领取车友</h3>
                    <ul>
                        <#--
                        <li><span class="red">135****2922</span><span class="fr">2015.03.21</span></li>
                        <li><span class="red">135****2922</span><span class="fr">2015.03.21</span></li>
                        <li><span class="red">135****2922</span><span class="fr">2015.03.21</span></li>
                        <li><span class="red">135****2922</span><span class="fr">2015.03.21</span></li>
                        <li><span class="red">135****2922</span><span class="fr">2015.03.21</span></li>
                        -->
                    </ul>
                </div>
            </div>
        </#list>
    </#if>
    
    <div class="clear"></div>

</div>

<div class="clear h50"></div>

<#include "/client/common_footer.ftl" />
</body>
</html>
