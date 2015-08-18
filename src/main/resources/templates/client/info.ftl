<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>基本信息</title>
<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/mycenter_base.css"/>
<link href="/client/css/article.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!--顶部-->
<#include "/client/common_header.ftl" />
<!-- 内容 -->
<div class="article_box">
	<div class="article_nav">
    	<img src="/client/images/article_icon_03.png" />
		<div>
			<span>我的位置&nbsp;&nbsp;：</span>
			<#if acticle_category??>
				<a href="/info/list/${mid}?catId=${acticle_category.id}" title="">${acticle_category.title!''}</a>
				<span>></span>
			</#if>
			<#if info??&&acticle_category??>
				<a href="/info/content/${info.id?c}?mid=${mid}&catId=${acticle_category.id}" title="">${info.title}</a>
			</#if>
		</div>	
	</div>
	<#if info??>
	<div class="article_cont top20">
		<h2>${info.title}</h2>
		<h5>${info.createTime}</h5>
		<p>${info.content}</p>
    </div>
    </#if> 
    
    <div class="article_page_01">
    	   <#if prev_info??>
    	   		<a href="/info/content/${prev_info.id?c}?mid=${mid}&catId=${acticle_category.id}" title="">上一篇：${prev_info.title}</a>
    	   <#else>
               	<a>上一篇：无</a> 
            </#if>
        </div>
        <div class="article_page_02">
            <#if next_info??>
                <a href="/info/content/${next_info.id?c}?mid=${mid}&catId=${acticle_category.id}" title="">下一篇：${next_info.title}</a>
            <#else>
            	<a>下一篇：无</a>
            </#if>
        </div>
	</div>
<!--底部footer-->
<#include "/client/common_footer.ftl" />
</body>
</html>
