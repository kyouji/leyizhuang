<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if goods??>${goods.seoTitle!''}-</#if>正品惠客</title>

<meta name="keywords" content="${goods.seoKeywords!''}">
<meta name="description" content="${goods.seoDescription!''}">


<script src="/client/js/jquery-1.9.1.min.js"></script>
<!--
<script type="text/javascript" src="/client/js/innerpage.js"></script>
-->
<script type="text/javascript" src="/client/js/jquery.jqzoom.js"></script>
<script type="text/javascript" src="/client/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="/client/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/client/js/goods_comment_consult.js"></script>
<script type="text/javascript" src="/client/js/goods.js"></script>
<script src="/client/js/list.js"></script>

<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link href="/client/css/innerpage.css" rel="stylesheet" type="text/css" />
</head>

<script type="text/javascript">
    $(document).ready(function(){
        $(".c_pop_boxbg").hide()
        
$("#id-minus").click(function(){
   var q = parseInt($("#quantity").val());
        
     if (q > 1)
     {
        $("#quantity").val(q-1);
     }
     $("#addCart").attr("href", "/cart/init?id=${goods.id}&quantity=" + $("#quantity").val() + "<#if qiang??>&qiang=${qiang}</#if>");
});
    
$("#id-plus").click(function(){
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
    $("#addCart").attr("href", "/cart/init?id=${goods.id}&quantity=" + $("#quantity").val() + "<#if qiang??>&qiang=${qiang}</#if>");
    
});         
       
        
$("#zhAddCart").click(function(){
     var str = "";
     $(".comboCheckBox:checked").each(function(){
         str += $(this).attr("zpid");
         str += ",";
     });
     var href = "/cart/init?id=" + ${goods.id} + "&zpid=" + str;
        
    window.location = href;
        
});   
        
 });  
<!-- 组合商品选择-->   
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
 
function btnPageSubmit() 
{
    window.location.href = "goods/${goods.id}/"+(parseInt($('#iPageNum').val()) - 1);
}   

 
</script>

<body>
<!--
<div class="c_pop_boxbg">
	<div class="c_pop_box">
    	<div class="c_pop_box_top">
        	<span>提 示</span>
            <a href="#"></a>
        </div>
        <div class="c_pop_box_success">
        	<p>您已成功关注该商品！</p>
            <a href="#" title="">查看我的关注>></a>
        </div>
        <div class="c_pop_box_notice">
        	<p>关注商品降价提醒：</p>
        	<ul>
            	<li><span>价格低于￥：</span><input type="text" class="c_pop_box_notice_input1" />时 提醒我</li>
                <li><span>*邮箱或手机号码：</span><input type="text" class="c_pop_box_notice_input2" /></li>
                <li><a href="#" title="" class="c_pop_box_notice_a1" >订阅提醒</a><a href="#" title="" class="c_pop_box_notice_a2" >暂不需要</a></li>
            </ul>
        </div>
    </div>
</div>
-->
<div class="w100">
<!--顶部ad大小：1920 90-->
<div class="top_ad"><img src="/client/images/topad.png" /></div>

<!--顶部-->
<#include "/client/common_header.ftl" />

<!--面包屑导航-->
<div class="crumb">
    <a href="#" title="">首页</a>
    <#if category_tree_list??>
        <#list category_tree_list as item>
            &nbsp;&nbsp;&gt;&nbsp;&nbsp; 
            <a href="/list/${item.id}" title="${item.title!''}">${item.title!''}</a>
        </#list>
    </#if>
</div>


<!--中上部参数-->
<div class="wrapper">
	<!--图片展示-->
	<div class="details_pic">
    	<div class="right-extra" style="margin:0px;">
        <!--产品参数开始-->
        <div>
		<div id="preview" class="spec-preview">
		  <#if goods??>
		      <span class="jqzoom"><img src="${goods.coverImageUri!''}" /></span>
		  </#if>
		</div>
        <!--缩图开始-->
        <div class="spec-scroll">
        	<a class="prev">&lt;</a>
            <a class="next">&gt;</a>
            <div class="items">
                 <ul>
                     <#if goods.showPictures??>
                          <#list goods.showPictures?split(",") as uri>
                             <#if ""!=uri && uri_index < 8>
                                <li><img  src="${uri!''}" onmousemove="preview(this);"></li>
                             </#if>
                         </#list>
                     </#if>
                </ul>
            </div>
        </div>
        <!--缩图结束-->
	</div>
    <!--产品参数结束-->
</div> 
		
        <div class="details_pic_wrapper">
        	<div class="details_pic_wrapper_share">分享</div>
            
            <a href="javascript:addCollect(${goods.id});" title="" class="details_pic_wrapper_like">关注</a>
            
            <a href="#" title="" class="details_pic_wrapper_remind">低价提醒</a>
        </div>
		
    
    </div>
    
    <!--中部信息-->
    <div class="details_details">
    	<div class="de_title">${goods.title!''}</div>
        
        <div class="de_describe">${goods.subTitle!''} </div>
        
        <div class="de_price">
        	<p>市 场 价<label>￥${goods.marketPrice?string("0.00")}</label></p>
            <p>惠 客 价<b>￥${goods.salePrice?string("0.00")}</b></p>
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
                       <a class="red ml20" title="点击查看详情" href="/goods/${gitem.goodsId!''}"><label>${gitem.goodsTitle!''}</label></a>
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
        	<div class="de_parameter_list">
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
                                <a <#if item.selectOneValue==one_selected>class="de_parameter_list_choiced"</#if> href="/goods/${item.id}">${item.selectOneValue}</a>
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
            <#elseif 3==total_select>324
                    <div class="de_parameter_list">
                    <span>${select_one_name!''}</span>
                       </p>
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
                        </p> </div> 
            </#if>
        </#if>
            
            
            
            
            <div class="de_parameter_num">
            	<span>购买数量</span>
            	<a id="id-minus" href="javascript:;" class="de_parameter_list_num_add">-</a> 
                <input type="text" id="quantity" value="1" class="text" />
                <a id="id-plus" class="down" href="javascript:;" class="de_parameter_list_num_subduction">+</a>
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
                    <li>
                    	<a href="#" title="">全国包邮</a>
                        <a href="#" title="">七天无理由退换货</a>
                        <a href="#" title="">全国联保</a>
                    </li>
                </ul>
            </div>
         </#if>
        </div>
        
        <span class="addcart"><a href="/cart/init?id=${goods.id}" title="" class="addcartorange">加入购物车</a></span>
    </div>
    
    <!--右部商品展示-->
    <div class="details_goods">
    	<span class="details_goods_title"><a href="#" title=""></a><span>看了又看</span><a href="#" title=""></a></span>

        <#if hot_list??>
            <#list hot_list as hot_good>
                <ul>
                    <li><img src="${hot_good.coverImageUri!''}" /></li>
                    <li class="details_goods_opacity"><a href="/goods/${hot_good.id?c}" title="">${hot_good.title!''}</a>￥${goods.salePrice?string("0.00")}</li>
                 </ul>
            </#list>
        </#if>
    </div>
    
</div>



<!--推荐组合-->
<div class="c_combination">
	<div class="c_combination_title">推荐组合</div>
    <div class="c_combination_btm">
    	<!--最多添加4个，第一个为默认产品-->
    	<div class="c_combination_btm_list">
        	<ul>
            	<li>
            	   <a href="/goods/${goods.id}" title="">
            	      <img src="${goods.coverImageUri!''}" />
            	   </a>
            	   <a href="#" title="">
            	      <span>${goods.name!''}</span>
            	   </a>
            	   <a href="#" title="">￥<#if goods.salePrice??>${goods.salePrice?string("0.00")}</#if></a>
                </li>
            </ul>
            
          <#if goods.combList?? && goods.combList?size gt 0>
            <#list goods.combList as item>
             <ul>
                <s></s>
                <li>
                    <a href="/goods/${item.goodsId}" title="">
                        <img src="${item.coverImageUri!''}" />
                    </a>
                    <a href="/goods/${item.goodsId}" title="">
                        <span>${item.title!''}</span>
                    </a>
                    <a href="/goods/${item.goodsId}" title="">￥${item.currentPrice?string("0.00")}</a>
                    <input type="checkbox" class="comboCheckBox" zpid="${item.id}" onclick="javascript:combSelect(this, ${item.currentPrice?string("0.00")}, ${item.goodsPrice?string("0.00")});"/>
                 </li>
             </ul>
          </#list>
       </#if>
     </div>
        
        <div class="c_combination_btm_all">
            <ul>
            	<li>已选择 <span class="red" id="combCount">0</span> 个配件</li>
                <li class="c_combination_btm_all_li3">套餐价：￥<b id="combCurrentPrice">${goods.salePrice?string("0.00")}</b></li>
                <li class="c_combination_btm_all_li1">原价：￥<label id="combOriginPrice">${goods.salePrice?string("0.00")}</label></li>
                <li class="c_combination_btm_all_li2">已节省：￥<strong id="combSave">0.00</strong></li>
                <li><a href="javascript:clearSelect();">全部清空</a></li>
            </ul>
            <a href="javascript:;"  id="zhAddCart" title="" class="addcartorange" style=" margin:10px 0 0 83px; background:#0e5baa; text-decoration:none;">加入购物车</a>
            
        </div>
    </div>
</div>


<!--中下部详情-->
<div class="wrapper top20">
	<!--左边-->
	<div class="c_L">
    	<!--同类其他品牌-->
    	<div class="c_L_frame">
        	<div class="c_L_frame_title">看看其他品牌</div>
            <div class="c_L_frame_line"></div>
            <div class="c_L_brand">
                <#if product_list??>
                    <#list product_list as item>
                        <a href="/search/${item.id}?keywords=${item.title}" title="">${item.title}</a>
                    </#list>
                </#if>
            </div>
        </div>
        
        <!--同类排行-->
        <div class="c_L_frame top20">
        	<div class="c_L_frame_title">同类排行榜</div>
            <div class="c_L_frame_line"></div>
            <div class="c_L_rank">
           
            <#if hot_list??>
                 <#list hot_list as item>
                    <#if item_index < 5>
                <dl>
                	<span class="c_L_rank_piao">${item_index+1}</span>
                    <dt><a href="/goods/${item.id}" title=""><img src="${item.coverImageUri!''}" /></a></dt>
                    
                    <dd>
                    	<a href="/goods/${item.id}" title="">${item.title!""}</a>
                        <b>惠客价：￥${item.salePrice?string("0.00")}</b>
                    </dd>
          
                </dl>
                </#if>
            </#list>
        </#if>  
                
            </div>
        </div>
        
        <!--看了还看-->
        <div class="c_L_frame top20">
        	<div class="c_L_frame_title">浏览记录</div>
            <div class="c_L_frame_line"></div>
            <div class="c_L_rank">
               <#if recent_page??>
                    <#list recent_page.content as item>
                <dl>
                    <dt><a href="/goods/${item.goodsId}" title=""><img src="${item.goodsCoverImageUri!''}" /></a></dt>
                    
                    <dd>
                    	<a href="/goods/${item.goodsId}" title="">${item.title!''}</a>
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
            	<li><a href="#detail_tit" tid="0" class="sel stab">商品介绍</a></li>
                <li><a href="#detail_tit" tid="1" class="stab">参数规格</a></li>
                <li><a href="#detail_tit" tid="2" class="stab">评价（${comment_page.content?size!'0'}）</a></li>
                <li><a href="#detail_tit" tid="3" class="stab">咨询（${consult_page.content?size!'0'}）</a></li>
                <li><a href="#detail_tit" tid="4" class="stab">售后保障</a></li>
            </ul>
            <a href="/cart/init?id=${goods.id}" title="" class="addcartorange" style="float:right; border-radius:0; text-decoration:none;">加入购物车</a>
        </div>
        
        <!--商品介绍 -->
        <div id="tab0" class="c_R_introduce php_z">
            <#if goods.paramList??>
        	<ul>
                <#list goods.paramList as param>
            	<li>${param.paramName!''}: ${param.value!''} </li>
                </#list>
            </ul>
           </#if> 
        </div>
       
        <!--产品详情-->
        <div id="tab5" class="c_R_info php_z">
        	<div class="c_R_info_title">
            	<span>产品详情</span>
                <label>买手机 就到正品惠客</label>
            </div>
            ${goods.detail!''}
            
        </div>
        
        <!--售后-->
        <div id="tab4" class="c_R_service php_z">
        	 ${goods.afterMarketService!''}
        </div>
        
        <!--参数-->
        <div id="tab1" class="c_R_parameter php_z">
        	<#if goods.paramList??>
        	<dl>
            	<dt>基本参数</dt>
            	<#list goods.paramList as param>
                <dd><span>${param.paramName!''}</span><label>${param.value!''}</label></dd>
                 </#list>
			</dl>
			 </#if> 
			 
        </div>
        
        <!--评价-->
        <div class="c_R_comment top20">
        <div class="c_R_comment_title">
            
                <a href="javascript:getCommentByStars(${goodsId}, 0, 0);" title="" class="c_R_comment_title_choiced">全部评价（${comment_page.content?size!'0'}）</a>
                <a href="javascript:getCommentByStars(${goodsId}, 3, 0);" title="">好评（${three_star_comment_count!'0'}）</a>
                <a href="javascript:getCommentByStars(${goodsId}, 2, 0);" title="">中评（${two_star_comment_count!'0'}）</a>
                <a href="javascript:getCommentByStars(${goodsId}, 1, 0);" title="">差评（${one_star_comment_count!'0'}）</a>
            </div>
        <#include "/client/goods_content_comment.ftl" />
        </div>
         
        <!--咨询-->
        <div id="tab3" class="c_R_consultation top20">
        	<div class="slideTxtBox">
			<div class="hd">
				<ul><li>全部咨询(${consult_page.content?size!'0'})</li></ul>
			</div>
			<div class="bd">
				<dl>
                    <dd>
                    <#if consult_page?? && consult_page.content?size gt 0>  
                        <#list consult_page.content as item>	
                    	<ul>
                        	<li><b>?</b><span>${item.username}</span><label>${item.content}</label></li>
                            <#if item.isReplied>
                            <li><strong>!</strong><span>店家回复</span><label>${item.reply}</label></li>
                            </#if>
                        </ul>
                         </#list>
                    </#if>      
                    </dd>
                </dl>
			</div>
         <div class="pagebox" style="float:left; padding:15px 0;">
          <div class="num">
            <#if consult_page??>
                <#assign continueEnter=false>
                <#if consult_page.number == 0>
                   <a class="a1 a0" href="javascript:;"><span>上一页</span></a>
                 <#else>
                   <a class="a2" href="#"><span>上一页</span></a>
                </#if>
                <#if consult_page.totalPages gt 0>
                    <#list 1..consult_page.totalPages as page>
                         <#if page <= 3 || (consult_page.totalPages-page) < 3 || (consult_page.number+1-page)?abs<3 >
                             <#if page == consult_page.number+1>
                                 <a class="sel" href="javascript:;">${page}</a>
                             <#else>
                                 <a href="">${page}</a> <#-- ${page} -->
                             </#if>
                                <#assign continueEnter=false>
                              <#else>
                              <#if !continueEnter>
                                  <span> ... </span>
                                  <#assign continueEnter=true>
                               </#if>
                           </#if>
                     </#list>
                 </#if>
                 <#if consult_page.number+1 == consult_page.totalPages || consult_page.totalPages==0>
                        <a class="a2 a0" href="javascript:;"><span>下一页</span></a>
                    <#else>
                        <a class="a2" href=""><span>下一页</span></a>
                    </#if>
                </#if>
            <span> 共<b>${consult_page.totalPages}</b>页 </span>
          </div>
          <div class="page">
            <input class="sub" type="submit" value="确定" onclick="javascript:btnPageSubmit();" style=" *+border:none;" />
            <span>页</span>
            <input class="text" type="text" value="${consult_page.number}" id="iPageNum"/>
            <span>到第</span>
          </div>
          <div class="clear"></div>
        </div>
		</div>
	<!--	<script type="text/javascript">jQuery(".slideTxtBox").slide();</script>     -->
        
        
        </div>
        
        <!--动态咨询-->
        <div id="tab3" class="c_R_consult top20">
        <input type="hidden" id="goodsId" name="goodsId" value=${goods.id} />
        	<h3>商品咨询</h3>
            <p>声明：您可在购买前对产品包装、颜色、运输、库存等方面进行咨询，我们有专人进行回复！因厂家随时会更改一些产品的包装、颜色、产地等参数，所以该回复仅在当时
对提问者有效，其他网友仅供参考！咨询回复的工作时间为：周一至周五，9:00至18:00，请耐心等待工作人员回复。</p>
			
            <ul>
            	<li>咨询内容</li>
                <li><textarea id="consult" name="" cols="" rows=""></textarea></li>
            </ul>
            <a href="javascript:submitConsult();" title="">提 交</a>
            
        </div>
        
         
        
    </div>
</div>





<!--底部footer-->
<#include "/client/common_footer.ftl" />
</body>
</html>





























