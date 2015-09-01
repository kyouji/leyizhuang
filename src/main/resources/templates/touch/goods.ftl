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

<script type="text/javascript">
	function showAndHide(type){
		if(type == 'img'){
			$("#a_img_by_dx").addClass("sel");
			$("#a_detail_by_dx").removeClass("sel");
			$("#a_comment_by_dx").removeClass("sel");
			
			$("#goods_img_by_dx").show();
			$("#goods_detail_by_dx").hide();
			$("#goods_comment_by_dx").hide();
		}
		
		if(type == 'detail'){
			$("#a_img_by_dx").removeClass("sel");
			$("#a_detail_by_dx").addClass("sel");
			$("#a_comment_by_dx").removeClass("sel");
			
			$("#goods_img_by_dx").hide();
			$("#goods_detail_by_dx").show();
			$("#goods_comment_by_dx").hide();
		}
		
		if(type == 'comment'){
			$("#a_img_by_dx").removeClass("sel");
			$("#a_detail_by_dx").removeClass("sel");
			$("#a_comment_by_dx").addClass("sel");
			
			$("#goods_img_by_dx").hide();
			$("#goods_detail_by_dx").hide();
			$("#goods_comment_by_dx").show();
		}
	}
	
	function addCollections(goodsId){
		if (undefined == goodsId)
	    {
	        return;
	    }
	
		//将goodsId通过异步请求发送至后台
		$.post("/user/collect/add",{"goodsId":goodsId},function(data){
	
			alert(data.message);
			
			//在没有用户登陆的情况下跳转到登陆页面
			if (data.code==1){
				setTimeout(function(){
					window.location.href = "/touch/login";
				}, 1000); 
			}
			  
		});
	}
	
	function addCart(id){
		window.location.href="/cart/init?id="+id;
	}
	
	function buyNow(id){
		window.location.href="/touch/order/buynow?goodsId="+id;
	}
	
	<!-- JiaThis参数设置 -->
    var jiathis_config = {
    url:"${basePath}",
    title:"${goods.title}",
    summary:"${goods.subTitle}"
};
</script>
</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
  <div class="main">
    <p>手机专区</p>
    <a class="a1" href="javascript:history.go(-1)"><img src="/touch/images/back.png" height="22" /></a>
    <a class="a2" href="/touch"><img src="/touch/images/home2.png" height="25" /></a>
  </div>
</header>

<div class="main">
  <section class="ta-c combg pt15 pb15" style="border:none;">
  	<img src="${goods.coverImageUri!''}" />
  </section>
  <div class="clear"></div>
  <section class="combg">
    
    <p class="pro_tit_sc">${goods.title!''}<a href="javascript:addCollections(${goods.id?c});">关注</a></p>
    <p class="fs08 c7 center pb10">${goods.subTitle!''}</p>
    <p class="center fs12 fc pb10">￥${goods.salePrice!'0'}</p>
    
    <div class="phone_kind">
      <table class="w100">
		<#if goods.giftList?? && goods.giftList?size gt 0>
        	<tr>
				<#if goods.giftList?? && goods.giftList?size gt 0>
        			<th width="50">赠品：</th>
        			<td class="sc">
        			<#list goods.giftList as gitem>
        				${gitem.goodsTitle!''}&emsp;
        			</#list>
        			</td>
        		</#if>
        	</tr>
        </#if>
        <#if goods.returnPoints gt 0>
	        <tr>
	          <th width="50">积分：</th>
	          <td class="sc">确认收货后赠送${goods.returnPoints}积分</td>
	        </tr>
	    </#if>
	    <#if goods.configuration??>
		    <tr>
		    	<th width="50">配置：</th>
		    	<td>${goods.configuration!''}</td>
		    </tr>
		</#if>
		<#if total_select??>
			<#if 1==total_select>
					<tr>
						<th>${select_one_name!''}</th>
						<#if select_one_goods_list??>
							<td id="param_one">
								<#list select_one_goods_list as item>
									<a <#if item.selectOneValue==one_selected>class="sel"</#if> href="/touch/goods/${item.id?c}">${item.selectOneValue}</a>
								</#list>
							</td>
						</#if>
					</tr>
			<#elseif 2==total_select>
				<tr>
					<th>${select_one_name!''}</th>
					<#if select_one_goods_list??>
						<td id="param_one">
							<#list select_one_goods_list as item>
								<a <#if item.selectOneValue==one_selected>class="sel"</#if> href="/touch/goods/${item.id?c}">${item.selectOneValue}</a>
							</#list>
						</td>
					</#if>
				</tr>
				<tr>
					<th>${select_two_name!''}</th>
					<#if select_two_goods_list??>
						<td id="param_one">
							<#list select_two_goods_list as item>
								<a <#if item.selectTwoValue==two_selected>class="sel01"</#if> href="/touch/goods/${item.id?c}">${item.selectTwoValue}</a>			
							</#list>
						</td>
					</#if>
				</tr>
			<#elseif 3==total_select>
				<tr>
					<th>${select_one_name!''}</th>
					<#if select_one_goods_list??>
						<td id="param_one">
							<#list select_one_goods_list as item>
								<a <#if item.selectOneValue==one_selected>class="sel"</#if> href="/touch/goods/${item.id?c}">${item.selectOneValue}</a>
							</#list>
						</td>
					</#if>
				</tr>
				<tr>
					<th>${select_two_name!''}</th>
					<#if select_two_goods_list??>
						<td id="param_one">
							<#list select_two_goods_list as item>
								<a <#if item.selectTwoValue==two_selected>class="sel01"</#if> href="/touch/goods/${item.id?c}">${item.selectTwoValue}</a>			
							</#list>
						</td>
					</#if>
				</tr>
				<tr>
					<th>${select_three_name!''}</th>
					<#if select_three_goods_list??>
						<td id="param_one">
							<#list select_three_goods_list as item>
								<a <#if item.selectThreeValue==three_selected>class="sel02"</#if> href="/touch/goods/${item.id?c}">${item.selectThreeValue}</a>			
							</#list>
						</td>
					</#if>
				</tr>
			</#if>
		</#if>
      </table>
    </div>
    <!--<div class="clear10"></div>
    <a class="blue_more" href="#">加入购物车</a>-->
    <div class="clear10"></div>
    <p class="fs11 pt15 pb5 center">商品介绍</p>
     <#if goods.paramList??>
	     <#list goods.paramList as param>
	     	<p class="pb5 center fs08">${param.paramName!''}: ${param.value!''} </p>
	     </#list>
     </#if>
    <div class="clear10"></div>

    <table class="comtab pro_check">
      <tr>
        <td><a id="a_img_by_dx" class="sel" href="javascript:showAndHide('img');">图片展示</a></td>
        <td><a id="a_detail_by_dx" href="javascript:showAndHide('detail');">详细参数</a></td>
        <#if comment_page??>
       		<td><a id="a_comment_by_dx" href="javascript:showAndHide('comment');">评价（<span>${comment_count!'0'}</span>）</a></td>
       	<#else>
       		<td><a id="a_comment_by_dx" href="javascript:showAndHide('comment');">评价（<span>0</span>）</a></td>
       	</#if>
      </tr>
    </table>
	<div id="goods_img_by_dx" style="display:block">
		<ul class="pro_sum">
		  <li style="display:block;">
			${goods.detail!''}
		  </li>
		  <li style=" width:90%; float:left;padding:5%;">${goods.afterMarketService!''}</li>
		</ul>
	</div>
	<div id="goods_detail_by_dx" style="display:none">
		<#if goods.paramList??>
			<ul class="detailed_parameters">
			  <#list goods.paramList as param>
				  <li>
					<span>${param.paramName!''}</span><label>${param.value!''}</label>
				  </li>
			  </#list>
			</ul>
		</#if>
	</div>
	<div id="goods_comment_by_dx" style="display:none">
		<dl class="detailed_comment">
			<#if comment_page??>
				<!-- <dt>好评度：<label><span>96</span>%</label></dt> -->
				<#list comment_page as item>
					<dd>
						<ul>
							<li class="detailed_comment_li1">
								<b>
								<#if item.goodsStar?? && item.goodsStar gt 0>
	                                <#list 1..item.goodsStar as starCount>
	                                    <a class="goodsStar fl" href="javascript:;"><img src="/touch/images/front/start.png" /></a>
	                                </#list>
                            		<#if 5-item.goodsStar gt 0>
		                                <#list 1..(5-item.goodsStar) as whiteCount>
		                                    <a class="goodsStar fl" href="javascript:;"><img src="/client/images/content/start03.png" /></a>
		                                </#list>
                            		</#if>
                             	<#else>
	                                <#list 1..5 as noUseCount>
	                                    <a class="goodsStar fl" href="javascript:;"><img src="/client/images/content/start03.png" /></a>
	                                </#list>
                             	</#if>
								</b>
								<label><span>用户：${item.username!''}</span><span>评价时间：${item.commentTime}</span></label>
							</li>
							<li>
								<p>${content!'好评'}</p>
							</li>
							<li class="detailed_comment_li2">
								<img src="/touch/images/front/img01.png" />
								<img src="/touch/images/front/img01.png" />
								<img src="/touch/images/front/img01.png" />
								<img src="/touch/images/front/img01.png" />
								<img src="/touch/images/front/img01.png" />
							</li>
						</ul>
					</dd>	
				</#list>
			</#if>
		</dl>
	<div>
  </section>
</div><!--main END-->


<div class="clear70"></div>
<footer class="profoot">
  <table>
    <tr>
      <td><input type="submit" onclick="buyNow(${goods.id?c})" value="立即购买" /></td>
      <td>&nbsp;</td>
      <td><input type="button" onclick="addCart(${goods.id?c})" value="加入购物车" /></td>
    </tr>
  </table>
</footer>
</body>
</html>
