<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站名称</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<script src="/touch/js/jquery-1.9.1.min.js"></script>
<script src="/touch/js/common.js"></script>

<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link href="/touch/css/front.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
  <div class="main">
    <p>商品分类</p>
    <a class="a1" href="javascript:history.go(-1);"><img src="images/back.png" height="22" /></a>
    <a class="a2" href="/touch"><img src="/touch/images/home2.png" height="25" /></a>
  </div>
</header>

<div class="main">
	<div class="clear30"></div>
	<#if top_cat_list??>
	    <#list top_cat_list as item>
	        <#if ("second_level_"+item_index+"_cat_list")?eval?? >
	        	<#list ("second_level_"+item_index+"_cat_list")?eval as secondLevelItem>
	        		<a class="menu_tit" href="/touch/list/${secondLevelItem.id?c}"><span>${secondLevelItem.title!''}</span></a>
		        		<#if ("third_level_"+item_index+secondLevelItem_index+"_cat_list")?eval?? >
		        			<#if ("third_level_"+item_index+secondLevelItem_index+"_cat_list")?eval?size gt 0>
					        	<div class="menu_a">
				        			<#list ("third_level_"+item_index+secondLevelItem_index+"_cat_list")?eval as thirdLevelItem>
			        					<a href="/touch/list/${thirdLevelItem.id?c}">${thirdLevelItem.title!''}</a>
				        			</#list>
	        					</div>
        					</#if>
		        		</#if>
	        	</#list>
	        </#if>        
	    </#list>
    </#if>
	<#--
  	<a class="menu_tit menu_tit_sel" href="#"><span>手机</span></a>
  	<table class="comtab menu_tab">
    	<tr>
	      <td><a href="#">名称哦</a></td>
	      <td><a href="#">名称哦</a></td>
	      <td><a href="#">名称哦</a></td>
    	</tr>
    	<tr>
	      <td><a href="#">名称哦</a></td>
	      <td><a href="#">名称哦</a></td>
	      <td><a href="#">名称哦</a></td>
    	</tr>
   	 	<tr>
      <td><a href="#">名称哦</a></td>
      <td><a href="#">名称哦</a></td>
      <td><a href="#">名称哦</a></td>
    </tr>
    <tr>
      <td><a href="#">名称哦</a></td>
      <td><a href="#">名称哦</a></td>
      <td><a href="#">名称哦</a></td>
    </tr>
  </table>
  <a class="menu_tit" href="#"><span>手机</span></a>
  <a class="menu_tit" href="#"><span>手机</span></a>
  <a class="menu_tit" href="#"><span>手机</span></a>
  -->
  <div class="clear20"></div>
</div><!--main END-->



</body>
</html>
