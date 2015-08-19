<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<script type="text/javascript" src="/client/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/client/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/client/js/jquery.jqzoom.js"></script>
<script type="text/javascript" src="/client/js/common.js"></script>
<script type="text/javascript" src="/client/js/goods.js"></script>
<script type="text/javascript" src="/client/js/innerpage.js"></script>
<#--
<script type="text/javascript" src="/client/js/goods_comment_consult.js"></script>

<script type="text/javascript" src="/client/js/base.js"></script>
<script type="text/javascript" src="/client/js/list.js"></script>
<script type="text/javascript" src="/client/js/cart.js"></script>
-->

<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link href="/client/css/innerpage.css" rel="stylesheet" type="text/css" />

<!--放大镜-->
<script type="text/javascript">
$(document).ready(function(){
	
	productImgShow("proshowimg","li","proshowmenu","sel",396,396);

});

<#-- 添加商品数量的方法 -->
function addNum(){
	var q = parseInt($("#quantity").val());
   	<#if goods.leftNumber??>
    	if (q < ${goods.leftNumber!'0'})
      	{
        	$("#quantity").val(q+1);
      	}
      	else
     	{
       		alert("已达到库存最大值");
     	}
   <#else>
        $("#quantity").val(q+1);
   </#if>
    $("#addCart").attr("href", "/cart/init?id=${goods.id?c}&quantity=" + $("#quantity").val());
}

<#-- 减少商品数量的方法 -->
function minusNum(){
	var q = parseInt($("#quantity").val());
        
	if (q > 1){
		$("#quantity").val(q-1);
	}
	$("#addCart").attr("href", "/cart/init?id=${goods.id?c}&quantity=" + $("#quantity").val());
}

function buyConbination(){
	var selectNum = document.getElementById("combCount").innerHTML;
	if(selectNum == 0){
		alert("请至少选择一件组合商品");
		return;
	}
	var str = "";
	$(".comboCheckBox:checked").each(function(){
		str += $(this).attr("zpid");
		str += ",";
	});
	
	if(${goods.id} == null||${goods.id} == ""||${goods.id} == 0){
		alert("商品信息有误");
		return;
	}
	var href = "/order/buyCombination?id=" + ${goods.id} + "&zpid=" + str;
	window.location.href=href;
}

<#-- 组合商品选择--> 
function combSelect(self, price, originPrice)
{
    var count = parseInt($("#combCount").html());
    var currentPrice = parseFloat($("#combCurrentPrice").html());
    var combOriginPrice = parseFloat($("#combOriginPrice").html());
    var combSavePrice = parseFloat($("#combSave").html());
    
    // 选中
    if (self.checked)
    {
        $("#combCount").html(count+1);
        $("#combCurrentPrice").html(currentPrice + price);
        $("#combOriginPrice").html(combOriginPrice + originPrice);
        $("#combSave").html(combSavePrice + originPrice - price);
    }
    // 取消选中
    else
    {
        $("#combCount").html(count-1);
        $("#combCurrentPrice").html(currentPrice - price);
        $("#combOriginPrice").html(combOriginPrice - originPrice);
        $("#combSave").html(combSavePrice - originPrice + price);
    }
} 

<!--商品组合取消全部选择 --> 
function clearSelect()
{
    $("#combCount").html(0);
    $("#combCurrentPrice").html(${goods.salePrice?string("0.00")});
    $("#combOriginPrice").html(${goods.salePrice?string("0.00")});
    $("#combSave").html(0);
    
    $(".comboCheckBox").attr("checked", false);
}

<!-- 跳转到指定页数评价或咨询的方法 -->
function btnPageSubmit(type) 
{
	<#--
    window.location.href = "goods/${goods.id}/"+(parseInt($('#iPageNum').val()) - 1);
    -->
    
    var pageNum = 0;<#-- 表示页数的变量 -->
    var totalPages = 0;<#-- 表示总页数的变量 -->
    
    if(type == "comment"){
    	pageNum = document.getElementById("commentPageNum").value;
    	<#if comment_page??>
    		totalPages = ${comment_page.totalPages}
    	</#if>
    }else{
    	pageNum = document.getElementById("consultPageNum").value;
    	<#if consult_page??>
    		totalPages = ${consult_page.totalPages!'0'}
    	</#if>
    }
    
    <#-- 判断是否为数字 -->
    if(isNaN(pageNum)){
    	return;
    }
    
    <#-- 判断是否大于最大页数 -->
    if(pageNum>(totalPages)){
    	return;
    }
    
    <#-- 判断是否小于1 -->
    if(pageNum<1){
    	return;
    }
    
    if(type == "comment"){
    	getCommentByStars(${goodsId},${stars!'0'},pageNum-1);
    }else{
    	getConsult(${goodsId},pageNum-1);
    }
}

<!-- 加入购物车的方法（原方法无法使购买数量生效，无论购买数量为多少，加入购物车的数量总是1） -->
function cartInit(){
	var quantity = document.getElementById("quantity").value;
	window.location.href = "/cart/init?id=${goods.id}&quantity="+quantity;
}
</script>
</head>
<body>
<div class="w100">
	<!--顶部-->
	<#include "/client/common_header.ftl" />

	<!--面包屑导航-->
	<div class="crumb">
		<a href="/" title="">首页</a> 
		<#if category_tree_list??>
			<#list category_tree_list as item> 
				&nbsp;&nbsp;&gt;&nbsp;&nbsp; 
				<a href="/list/${item.id}" title="${item.title!''}">${item.title!''}</a>
			</#list> 
		</#if> 
		<#if goods??> 
			&nbsp;&nbsp;&gt;&nbsp;&nbsp;
			<a href="/goods/${goods.id}" title="${goods.name!''}">${goods.name!''}</a>
		</#if>
	</div>
	
	<!--中上部参数-->
	<div class="wrapper">
		<!--图片展示-->
		<div class="details_pic">
			<div class="right-extra" style="margin: 0px;">
				<!--产品参数开始-->
				<div>
					<div id="preview" class="spec-preview">
						<span class="jqzoom">
                            <#if goods.showPictures??> 
                                <#list goods.showPictures?split(",") as uri>
                                    <img src="${uri!''}" />
                                    <#break>
                                </#list>
							</#if>
						</span>
					</div>
					<!--缩图开始-->
					<div class="spec-scroll">
						<div class="items">
							<ul>
								<#if goods.showPictures??> 
									<#list goods.showPictures?split(",") as uri>
										<li>
											<img src="${uri!''}" onmousemove="preview(this);">
										</li>
									</#list> 
								</#if>
							</ul>
						</div>
					</div>
				</div>
				<div class="details_pic_wrapper">
					<a href="javascript:userAddCollect(${goods.id})" title="关注" class="details_pic_wrapper_like">关注</a>
				</div>
			</div>
		</div>
			
		<!--中部信息-->
		<div class="details_details">
			<div class="de_title">${goods.title!''}</div>
			<div class="de_describe">${goods.subTitle!''}</div>
            <div class="de_price">
				<p>
					市 场 价<label>￥${goods.marketPrice?string("0.00")}</label>
				</p>
				<p>
					惠 客 价<b>￥${goods.salePrice?string("0.00")}</b>
				</p>
            </div>

			<!--促销信息-->
			<div class="de_promotion">
				<#if goods.giftList?? && goods.giftList?size gt 0>
					<div class="de_promotion_title">促销信息</div>
				</#if>
				<div class="de_promotion_info">
					<#if goods.giftList?? && goods.giftList?size gt 0>
						<ul>
							<li>
								<span>赠品</span> 
								<#list goods.giftList as gitem> 
									<a class="red ml20" title="点击查看详情" href="/goods/${gitem.goodsId!''}">
										<label>${gitem.goodsTitle!''}</label>
									</a>
								</#list>
							</li>
						</ul>
					</#if> 
					<#if goods.returnPoints gt 0>
						<ul>
							<li>
								<span>积分</span>
								<label>确认收货后赠送${goods.returnPoints}积分</label>
							</li>
						</ul>
					</#if>
				</div>
			</div>

			<!--参数设置-->
			<div class="de_parameter">
				<#if goods.configuration??>
					<div class="de_parameter_list_pz">
						<span>配 置</span> 
						<label>${goods.configuration}</label>
					</div>
				</#if> 
				<#if total_select??> 
					<#if 1==total_select>
						<div class="de_parameter_list">
							<span>${select_one_name!''}</span>
							<p>
								<#if select_one_goods_list??> 
									<#list select_one_goods_list as item> 
										<a <#if item.selectOneValue==one_selected>class="de_parameter_list_choiced"</#if>href="/goods/${item.id}">${item.selectOneValue}</a> 
									</#list>
								</#if>
							</p>
						</div>
					<#elseif 2==total_select>
						<div class="de_parameter_list">
							<span>${select_one_name!''}</span>
							<p>
								<#if select_one_goods_list??> 
									<#list select_one_goods_list as item> 
										<a <#if item.selectOneValue==one_selected>class="de_parameter_list_choiced"</#if>href="/goods/${item.id}">${item.selectOneValue}</a>
									</#list> 
								</#if>
							</p>
						</div>
						<div class="de_parameter_list">
							<span>${select_two_name!''}</span>
							<p>
								<#if select_two_goods_list??> 
									<#list select_two_goods_list as item> 
										<a <#if item.selectTwoValue==two_selected>class="de_parameter_list_choiced"</#if> href="/goods/${item.id}">${item.selectTwoValue}</a>
									</#list>
								</#if>
							</p>
						</div>
					<#elseif 3==total_select>
						<div class="de_parameter_list">
							<span>${select_one_name!''}</span>
							<p>
								<#if select_one_goods_list??>
									<#list select_one_goods_list as item> 
										<a <#if item.selectOneValue==one_selected>class="de_parameter_list_choiced"</#if> href="/goods/${item.id}">${item.selectOneValue}</a> 
									</#list>
								</#if>
							</p>
						</div>
						<div class="de_parameter_list">
							<span>${select_two_name!''}</span>
							<p>
								<#if select_two_goods_list??> 
									<#list select_two_goods_list as item> 
										<a <#if item.selectTwoValue==two_selected>class="de_parameter_list_choiced"</#if> href="/goods/${item.id}">${item.selectTwoValue}</a>
									</#list> 
								</#if>
							</p>
						</div>
						<div class="de_parameter_list">
							<span>${select_three_name!''}</span>
							<p>
								<#if select_three_goods_list??> 
									<#list select_three_goods_list as item> 
										<a <#if item.selectThreeValue==three_selected>class="de_parameter_list_choiced"</#if> href="/goods/${item.id}">${item.selectThreeValue}</a>
								 	</#list>
								</#if>
							</p>
						</div>
					</#if>
				</#if>
				<div class="de_parameter_num">
					<span>购买数量</span> 
					<a id="id-minus" href="javascript:minusNum();" class="de_parameter_list_num_add">-</a> 
					<input type="text" id="quantity" value="1" class="text" />
					<a id="id-plus" class="down" href="javascript:addNum();" class="de_parameter_list_num_subduction">+</a>
					<label>库存${goods.leftNumber!'0'}件</label>
				</div>
			</div>
				
			<!--服务-->
			<div class="de_service">
				<#if goods.service??>
					<div class="de_service_title">服 务</div>
					<div class="de_service_info">
						<ul>
							<li>${goods.service}</li>
						</ul>
					</div>
				</#if>
			</div>
			<span class="addcart">
				<a href="javascript:cartInit();" target="_blank" title="加入购物车" class="addcartorange">加入购物车</a>
			</span>
		</div>
			
		<!--右部商品展示-->
		<div class="details_goods">
			<span class="details_goods_title">
				<span>看了又看</span>
			</span> 
			<#if hot_sale_page??> 
				<#list hot_sale_page.content as hot_good> 
					<#if hot_good_index lt 3>
						<ul>
							<a href="/goods/${hot_good.id?c}" title="${hot_good.title!''}">
								<li><img src="${hot_good.coverImageUri!''}" /></li>
								<li class="details_goods_opacity">${hot_good.title!''}￥${goods.salePrice?string("0.00")}</li>
							</a>
						</ul>
					</#if> 
				</#list> 
			</#if>
		</div>
	</div>
	<!--推荐组合-->
	<#if goods.combList?? && goods.combList?size gt 0>
		<div class="c_combination">
			<div class="c_combination_title">推荐组合</div>
				<div class="c_combination_btm">
					<div class="c_combination_btm_list">
						<ul>
							<li><a href="/goods/${goods.id?c}" title="${goods.name!''}"> <img src="${goods.coverImageUri!''}" /></a> 
							<a href="#" title=""> <span>${goods.name!''}</span></a> 
							<a href="#" title="">￥<#if goods.salePrice??>${goods.salePrice?string("0.00")}</#if></a></li>
						</ul>
						<#list goods.combList as item>
							<ul>
								<s></s>
								<li>
									<a href="/goods/${item.goodsId}" title="${item.goodsId}"> 
										<img src="${item.coverImageUri!''}" />
										<span>${item.title!''}</span>
										￥${item.currentPrice?string("0.00")}
									</a>
									<input type="checkbox" class="comboCheckBox" zpid="${item.id}" onclick="javascript:combSelect(this, ${item.currentPrice?string(" 0.00")}, ${item.goodsPrice?string("0.00")});"/>
								</li>
							</ul>
						</#list>
					</div>
					<div class="c_combination_btm_all">
						<ul>
							<li>已选择 <span class="red" id="combCount">0</span> 个配件</li>
							<li class="c_combination_btm_all_li3">套餐价：￥<b id="combCurrentPrice">${goods.salePrice?string("0.00")}</b></li>
							<li class="c_combination_btm_all_li1">原价：￥<label id="combOriginPrice">${goods.salePrice?string("0.00")}</label></li>
							<li class="c_combination_btm_all_li2">已节省：￥<strong id="combSave">0.00</strong></li>
							<li><a href="javascript:clearSelect();">全部清空</a></li>
						</ul>
						<a href="javascript:buyConbination();" id="zhAddCart" title="" class="addcartorange" style="margin: 10px 0 0 83px; background: #0e5baa; text-decoration: none;">立即购买</a>
					</div>
				</div>
			</div>
		</div>
	</#if>
		
	<!--中下部详情-->
	<div class="wrapper top20">
		<!--左边-->
		<div class="c_L">
			<!--同类其他品牌-->
			<div class="c_L_frame">
				<div class="c_L_frame_title">看看其他品牌</div>
				<div class="c_L_frame_line"></div>
				<div class="c_L_brand">
					<#if brand_page??> 
						<#list brand_page.content as item> 
							<a href="${item.linkUri!''}" title="${item.title!''}">${item.title!''}</a>
						</#list> 
					</#if>
				</div>
			</div>
			<!--同类排行-->
			<div class="c_L_frame top20">
				<div class="c_L_frame_title">同类排行榜</div>
				<div class="c_L_frame_line"></div>
				<div class="c_L_rank">
					<#if hot_sale_page??> 
						<#list hot_sale_page.content as item> 
							<#if item_index < 5>
								<dl>
									<span class="c_L_rank_piao">${item_index+1}</span>
									<dt>
										<a href="/goods/${item.id}" title="${item.title!""}">
											<img src="${item.coverImageUri!''}" />
										</a>
									</dt>
									<dd>
										<a href="/goods/${item.id}" title="${item.title!""}">${item.title!""}</a> 
										<b>惠客价：￥${item.salePrice?string("0.00")}</b>
									</dd>
								</dl>
							</#if> 
						</#list> 
					</#if>
				</div>
			</div>
			<div class="c_L_frame top20">
				<div class="c_L_frame_title">浏览记录</div>
				<div class="c_L_frame_line"></div>
				<div class="c_L_rank">
					<#if recent_page??> 
						<#list recent_page.content as item>
						<dl>
							<dt>
								<a href="/goods/${item.goodsId}" title="${item.goodsTitle!''}">
									<img src="${item.goodsCoverImageUri!''}" />
								</a>
							</dt>
							<dd>
								<a href="/goods/${item.goodsId}" title="${item.goodsTitle!''}">${item.goodsTitle!''}</a>
								<b>惠客价：￥<#if item.goodsSalePrice??>${item.goodsSalePrice?string("0.00")}</#if></b>
							</dd>
						</dl>
						</#list>
					</#if>
				</div>
			</div>
		</div>
		<!--右边-->
		<div class="c_R">
			<!--tab-->
			<div class="c_R_tab">
				<ul>
					<li><a href="#detail_tit" tid="0" class="c_R_tab_choiced stab">商品介绍</a></li>
					<li><a href="#detail_tit" tid="1" class="stab">参数规格</a></li> 
					<li><a href="#detail_tit" tid="2" class="stab">评价（<#if comment_page??>${comment_page.content?size!'0'}<#else>0</#if>）</a></li> 
					<li><a href="#detail_tit" tid="3" class="stab">咨询（<#if consult_page??>${consult_page.content?size!'0'}<#else>0</#if>）</a></li> 
					<li><a href="#detail_tit" tid="4" class="stab">售后保障</a></li>
				</ul>
			</div>
			<!-- 详情 -->
			<div id="tab0" class="c_R_service top20 php_z">
                <dl>
                    ${goods.detail!''}
                </dl>
            </div>
			<!--产品参数情-->
			<div id="tab1" class="c_R_parameter top20 php_z" style="display:none;">
                <dl>
                    <dt>商品参数</dt>
                    <#if goods.paramList??>
                        <#list goods.paramList as param>
                            <dd>
                                <span>${param.paramName!''}</span><label>${param.value!''}</label>
                            </dd>
                        </#list>
                    </#if>
                </dl>
            </div>
			<!--售后-->
            <div id="tab4" class="c_R_service top20 php_z" style="display:none;">
                <dl>
                    ${goods.afterMarketService!''}
                </dl>
            </div>
            
            <#-- 评价 -->
            <div class="c_R_comment top20">
                <div class="c_R_comment_title">
                    <a href="#" title="" class="c_R_comment_title_choiced">全部评价（60）</a>
                    <a href="#" title="">好评（60）</a>
                    <a href="#" title="">中评（60）</a>
                    <a href="#" title="">差评（60）</a>
                </div>
                <!--评价详情-->
                <div class="c_R_comment_con">
                    <!--用户信息-->
                    <div class="c_R_comment_con_L">
                        <ul>
                            <li><img src="/client/images/u=2937378011,2167836267&amp;fm=21&amp;gp=0.jpg"></li>
                            <li><span>这里****八字八字八字</span></li>
                            <li>会员等级</li>
                        </ul>
                    </div>
                    <!--右部-->
                    <div class="c_R_comment_con_R">
                        <!--星 标签 规格 时间-->
                        <div class="c_R_comment_con_R_info">
                            <div class="c_R_comment_con_R_info_L">
                                <b><img src="images/star.png"><img src="images/star.png"><img src="images/star.png"><img src="images/star.png"></b>
                                <p>
                                    <a href="#" title="">外观漂亮</a><a href="#" title="">外观漂亮</a><a href="#" title="">外观漂亮</a><a href="#" title="">外观漂亮</a>
                                    <a href="#" title="">外观漂亮</a><a href="#" title="">外观漂亮外观漂亮</a><a href="#" title="">外观漂亮</a>
                                </p>
                                <span>不错，性价比高，服务态度也很好！不错，性价比高，服务态度也很好！不错，性价比高，服务态度也很好！不错，性价比高，服务态度也很好！不错，性价比高，服务态度也很好！</span>
                            </div>
                            <div class="c_R_comment_con_R_info_M">
                                <p>颜色：白</p>
                                <p>规格：移动联通双4G(16GB ROM)</p>
                            </div>
                            <div class="c_R_comment_con_R_info_R">2015-07-09 13:15</div>
                        </div>
                        
                        <div class="c_R_comment_con_R_reply">
                            <a href="#" title="">有用（0）</a>
                            <a href="#" title="">回复（0）</a>
                        </div>
                        
                        <!--有图片的-->
                        <div class="c_R_comment_con_R_pic">
                            <ul>
                                <li><img src="images/pic2.png"></li>
                                <li><img src="images/pic2.png"></li>
                                <li><img src="images/pic2.png"></li>
                                <li><img src="images/pic2.png"></li>
                                <li><img src="images/pic2.png"></li>
                            </ul>
                        </div>
                        
                        <!--已回复的-->
                        <div class="c_R_comment_con_R_reply2">
                            <span>xxx回复：嗯嗯嗯嗯嗯嗯呢恩嗯嗯嗯嗯嗯嗯呢恩嗯嗯嗯嗯嗯嗯呢恩嗯嗯嗯嗯嗯嗯呢恩嗯嗯嗯嗯嗯嗯呢恩嗯嗯嗯嗯嗯嗯呢恩嗯嗯嗯嗯嗯嗯呢恩嗯嗯嗯嗯嗯嗯呢恩嗯嗯嗯嗯嗯嗯呢恩嗯嗯嗯嗯嗯嗯呢恩嗯嗯嗯嗯嗯嗯呢恩嗯嗯嗯嗯嗯嗯呢恩</span>
                        </div>
                        
                        
                    </div>
                </div>
     
            </div>
            
			<!--评价-->
			<div class="c_R_comment top20">
				<div class="c_R_comment_title">
					<#if comment_page??>
						<a href="javascript:getCommentByStars(${goodsId}, 0, 0);" id="star0" title="全部评价" class="c_R_comment_title_choiced">全部评价（${comment_count!'0'}）</a>
						<a href="javascript:getCommentByStars(${goodsId}, 3, 0);" id="star3" title="好评">好评（${three_star_comment_count!'0'}）</a>
						<a href="javascript:getCommentByStars(${goodsId}, 2, 0);" id="star2" title="中评">中评（${two_star_comment_count!'0'}）</a>
						<a href="javascript:getCommentByStars(${goodsId}, 1, 0);" id="star1" title="差评">差评（${one_star_comment_count!'0'}）</a>
					<#else> 
						<a href="javascript:;" id="star0" title="全部评价" class="c_R_comment_title_choiced">全部评价（0）</a> 
						<a href="javascript:;" id="star3" title="好评">好评（0）</a>
						<a href="javascript:;" id="star2" title="中评">中评（0）</a>
						<a href="javascript:;" id="star1" title="差评">差评（0）</a>
					</#if>
				</div>
				<div id="the_comment">
					<#include "/client/goods_content_comment.ftl" />
				</div>
			</div>
			<!--咨询-->
			<div id="the_consult">
				<#include "/client/goods_content_consult.ftl">
			</div>
			<!--动态咨询-->
			<div id="tab3" class="c_R_consult top20">
				<form>
					<input type="hidden" id="goodsId" name="goodsId" value=${goods.id } />
					<h3>商品咨询</h3>
					<p>
						声明：您可在购买前对产品包装、颜色、运输、库存等方面进行咨询，我们有专人进行回复！因厂家随时会更改一些产品的包装、颜色、产地等参数，所以该回复仅在当时
						对提问者有效，其他网友仅供参考！咨询回复的工作时间为：周一至周五，9:00至18:00，请耐心等待工作人员回复。
					</p>
					<ul>
						<li>咨询内容</li>
						<li><textarea id="consult"></textarea></li>
					</ul>
					<a href="javascript:submitConsult();" title="提交咨询">提 交</a>
				</form>
			</div>
		</div>
	</div>
	
	<!--底部footer-->
	<#include "/client/common_footer.ftl" />
</div>
</body>
</html>
