<!DOCTYPE html>
<html>
	<head>
		<meta name="keywords" content="">
		<meta name="description" content="">
		<meta name="copyright" content="" />
		<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta charset="utf-8">
		<title>乐易装首页</title>
		
		<link rel="stylesheet" type="text/css" href="/client/css/my_base.css"/>
		<link rel="stylesheet" type="text/css" href="/client/css/main.css"/>
		<link rel="stylesheet" type="text/css" href="/client/css/other.css"/>
		
		<script src="/client/js/jquery-1.11.0.js" type="text/javascript"></script>
		<script src="/client/js/rich_lee.js" type="text/javascript"></script>
	</head>

	<body>
		<div style="background:#fafafa;">
			<div class="sec_header">
				<a></a>
				<p>活动促销</p>
				<span></span>
			</div>
			<#if ad_list??>
    			<div class="index_banner">
    				<div class="scroll_box">
    				    <#list ad_list as item>
    					   <img src="${item.fileUri!''}"  onclick="window.location.href='${item.linkUri!''}'" />
    					</#list>
    				</div>
    				<div class="scroll_btn">
    					<ul>
    						<#list ad_list as item>
    						  <li></li>
    						</#list>
    					</ul>
    				</div>				
    			</div>
			</#if>
			<#if promotion_list??&&promotion_list?size gt 0>
    			<section class="activ_content">
			        <#list promotion_list as item>
			            <#if item??>
		                    <#list item?keys as key>
            					<a href="/goods/detail/${key.id?c}">
            						<dl>
            							<dt>
            								<p>${key.title!''}</p>
            								<p>${key.subTitle!''}</p>
            							</dt>
            							<dt>
            								<img src="${key.coverImageUri!''}"/>
            							</dt>
            							<dd>
            								<span>促销</span>
            								<#if item.get(key)??>
            								    <div>￥${item.get(key)?string("0.00")}</div>
            								<#else>
            								    <div>￥0.00</div>
            								</#if>
            							</dd>
            						</dl>
            					</a>
        					</#list>
    					</#if>
					</#list>
    			</section>
			</#if>
			<div class="index_test_box02"></div>
			<#include "/client/common_footer.ftl">
		</div>		
	</body>
</html>
