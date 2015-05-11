<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>博大生活网--文章列表</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link href="/client/style/layout.css" rel="stylesheet" type="text/css" />
<link href="/client/style/master.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/client/js/html5.js"></script>
<script src="/client/js/header.js"></script>
</head>
<body>
<!-- header开始 -->
<#include "/client/common_header.ftl" />
<!-- header结束 -->
<article id="main">
    <div class="ipp1 top">
            <dd>您当前位置：<a href="/">首页</a> > <a href="/info/list/${mid!''}" >${menu_name!''}</a> > <a href="javascrip:;" class="hover_zy">内容</a></dd>
    </div>
    <div class="clear"></div>
    <!--面包屑结束-->
    
	<div id="Content" class="mt20 fl">
        <div class="newlistL">
        <div class="newlistnav">
        <h1>${menu_name!''}</h1>
        <ul class="newlistnavS">
            <#if info_category_list??>
                <#list info_category_list as item>
                    <li><a href="/info/list/${mid}?catId=${item.id}"><#list 1..item.layerCount as x>&nbsp;&nbsp;</#list>${item.title!''}</a></li>
                </#list>
            </#if>
        </ul>
        </div>
        <#--
        <div class="newindexMRFT">
        <h1 class="newindexMRFTH3"><dl><dd>最近添加</dd><dt></dt></dl></h1>
        <ul class="newindexMRFTM3">
            <#if latest_info_page??>
                <#list latest_info_page.content as item>
                    <li>
                        <a href="/info/content/${item.id}?mid=${mid}"><img src="${item.imgUrl!''}" width="70" height="67" /></a>
                        <dl>
                            <dd>
                            <a href="/info/content/${item.id}?mid=${mid}">${item.title!''}</a>
                            </dd>
                            <dt>
                                <#if item.content??>
                                    ${item.content!''}
                                </#if>
                            </dt>
                        </dl>
                    </li>
                </#list>
            </#if>
        </ul>
        </div>
        -->
        
        
        </div>
        <div class="newlistR">
        <h1 class="newlistRT"><img src="/client/images/home.png" width="25" height="25" /> 内容</h1>

            <div class="newcontent">
            <h1 class="newcontentT">${info.title!''}</h1>
            <div class="newcontentINFO">${info.createTime!''}　 <#if info.source??>出处：${info.source}</#if></div>
            <div class="newcontentshow">
                ${info.content!''}
            </div>
            <dl class="newcontentBTN">
            <dd class="newcontentBTN1"><a href="#"><img src="/client/images/fenx.png" width="142" height="27" /></a></dd>
            </dl>
            <dl class="newcontentB">
            <#--
            <dd class="newcontentPRE">上一篇：<a href="#">不逊孤岛危机2 韩游《HOUNDS》前瞻</a></dd>
            <dd class="newcontentNEXT">下一篇：<a href="#">QQ西游40~50级如何快速升级</a></dd>
            -->
            </dl>
            <#--
            <div class="newComment mt15">
                <dl class="newCommentT">
                    <dd><img src="images/newicon5.gif" /> 网友评论</dd>
                    <dt>共<em>1</em>条评论 </dt>
                </dl>
                <textarea cols="12" rows="3" class="newcCommentTEX">请文明发言，发广告将被屏蔽IP</textarea>
                <div class="yzm_zy mt10 fl" style="margin-left:520px;">验证码：<input type="text" name="reg_rand" id="reg_rand"  class="txt_input"/> <a href="javascript:;"> <img src="code_num.php" id="getcode_num" title="看不清，点击换一张" align="absmiddle" onClick="checkcode($(this));"></a></div>
                <img class="Commentbtn" src="images/Commentbtn2.gif" />
                <div class="clearboth"></div>
                <ul class="newCommentlist fl">
                    <li>
                    <h1><em>1楼</em> 云南昆明市网友  <b>2012-05-23</b></h1>
                    <p>不知不知打算垃圾啊困死了</p>
                    </li>
                </ul>
            </div>
            -->
            
            </div>
         </div>
        </div>
        </div>
         <div class="cle"></div>
</article>
<!--主体结束-->
<#include "/client/common_footer.ftl" />
<!--底部结束-->
</body>
</html>
