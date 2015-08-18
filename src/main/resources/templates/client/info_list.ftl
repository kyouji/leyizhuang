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
<div class="content"> 
  <!-- 左侧 -->
  <div class="content_1">
    <div class="content_1_1"></div>
    <div class="content_1_2">
        <#if artice_Category_list??>
            <#list artice_Category_list as item>
                <ul style=" border:none;">
                    <li class="content_trade"><a href="/info/list/${help_id!'0'}?catId=${item.id!''}" title="">${item.title}</a></li>
                    <#if item.parentId?? && item.parentId == item.id>
                        <li><a href="/info/list/${help_id!'0'}?catId=${item.id!''}" title="">${item.title}</a></li>
                    </#if>
                 </ul>
            </#list>
        </#if>
    </div>
  </div>
  <!-- 右侧 -->
	<div class="article_box">
    <div class="crumb">
    <#if acticle_category??>
            &nbsp;&nbsp;&gt;&nbsp;&nbsp; 
            <#-- 不能正常跳转到指定的模块，因此调整了url地址——by dengxiao -->
            <a href="/info/list/${mid}?catId=${acticle_category.id}" title="">${acticle_category.title!''}</a>
    </#if>
    </div>
    <#if info_page??>
       <#list info_page.content as item>
            <a href="/info/content/${item.id?c}?mid=${mid}&catId=${catId}" title="" target="_blank">
                <div class="article_box_01">
                    <div>${item.title!''}</div>
                     <p>${item.brief!''}</p> 
                </div>
            </a>
        </#list>
    </#if>
	<div class="article_page">
    	
    	<div class="article_page_01">
    	   <#if info_page.first>
    	   
    	   <#else>
                <a href="/info/list/${mid}?catId=${catId!''}?page=${info_page.number-1}" title="">上一页</a>
            </#if>
        </div>
        
        <div class="article_page_02">
            <#if info_page.totalPages-1 == info_page.number>
            <#else>
                <a href="/info/list/${mid}?catId=${catId!''}?page=${info_page.number+1}" title="">下一页</a>
            </#if>
        </div>
        
    </div>


    
</div>
<!--底部footer-->
<#include "/client/common_footer.ftl" />
</body>
</html>
