<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>荣诚手机超市--订单信息填写</title>
<meta name="keywords" content="荣诚手机超市" />
<meta name="description" content="荣诚手机超市" />
<meta name="copyright" content="荣诚手机超市 版权所有" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/rcindex.css" rel="stylesheet" type="text/css" />
<link href="/css/gwc.css" rel="stylesheet" type="text/css" />
<!--[if IE]>
   <script src="/js/html5.js"></script>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="/js/DD_belatedPNG_0.0.8a.js" ></script>
<script>
DD_belatedPNG.fix('.,img,background');
</script>
<![endif]-->
<script type="text/javascript" src="/Tm/js/jquery-1.11.1.min.js"></script>
</head>
<body>
<header>
<div class="main">
<#include "/front/comment/header.ftl">
</div>
</header>

<div class="header1 main">
<div class="fll logo"><a href="/" title="荣诚手机超市"><img src="/img/rc_logo.png" width="177" height="69"></a></div>
<div class="fll city"><a href="#">城市切换</a><span></span>
<!--<div class="cityqh"><ul>
<li><a href="#">昆明市</a></li>
<li><a href="#">曲靖市</a></li>
<li><a href="#">大理州</a></li>
<li><a href="#">西双版纳</a></li>
<li><a href="#">德宏州</a></li>
<li><a href="#">丽江市</a></li>
</ul></div>-->
</div>
<div class="sercha fll">
<input class="topnews1_serch" type="text" onfocus="if(value=='热搜机型： iphone 6   MX4 Pro   HTC M8') {value=''}" onblur="if (value=='') {value='热搜机型： iphone 6   MX4 Pro   HTC M8'}"  value="热搜机型： iphone 6   MX4 Pro   HTC M8">
<input type="submit" class="search-btn" title="搜索" value="  ">
<div class="rc_newsgg"><span>新闻公告:</span><a href="#">>>黄章：魅蓝Note有电信版，一月还将发新品</a></div>
</div>
<div class="fll rc_phone"><span>客服电话：400-888-8888</span></div>
<div class="flr rc_gwc"><a href="/cart">购物车（1）</a></div>
</div>



<div class="gwcbg">
<div class="main mt10">
<div class="place"> <span>您现在的位置：</span><a href="/">首页</a>&gt;<a href="#">手机产品</a>&gt;<a href="#">手机筛选</a>&gt; </div>
<div class="s_gwc2"><span >1、我的购物车</span><span id="colorfff">2、我的订单信息</span><span>3、支付成功</span></div>
</div>

<div class="main mt15">
<div class="s_gwc2_1">
<div class="s_gwc2_1_a"><p><span>收货地址</span></p><p><a href="#">新增收货地址</a></p></div>
<div class="gwc2_psfs555">
<div class="s_gwc2_1_b">
<#if shippingAddresses??>
<#list shippingAddresses as address>
<a href="/user/address" target="_blank">
<p>收货人：<#if address.receiverName??>${address.receiverName}</#if></p>
<p>收货地址：<#if address.detailAddress??>${address.detailAddress}</#if></p>
<p>联系方式：<#if address.receiverMobile??>${address.receiverMobile}</#if></p>
</a>
</#list>
</#if>
</div>
</div>
<div class="clear"></div>
</div>
</div>


<div class="main mt15">
<div class="s_gwc3_1">
<div class="s_gwc3_1_a"><p><span>支付方式</span></p></div>
<div class="gwc_3zf">
<ul>
<li><input name="" type="radio" value="" checked /><img src="img/zfb.png"></li>
<li><input name="" type="radio" value="" checked /><img src="img/zfb.png"></li>
<li><input name="" type="radio" value=""  /><img src="img/zfb.png"></li>
</ul>
</div>
</div>
</div>


<div class="main mt15">
<div class="s_gwc3_1">
<div class="s_gwc3_1_a"><p><span>发票信息</span></p></div>
<div class="invoice">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>是否开具发票：</span><input type="checkbox"><span>是</span>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox"><span>否</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>发票抬头：</span><input type="text" class="fapiaolan">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>发票内容：有荣诚手机直接开具</span></div>
</div>
</div>


<div class="main mt15">
<div class="s_gwc3_1">
<div class="s_gwc3_1_a"><p><span>配送方式</span></p></div>
<div class="invoice">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <select>
            <option>由荣诚手机配送</option>
            <option>申通快递</option>
            <option>顺丰快递</option>
          </select>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <span>说明：</span><input type="text" class="fapiaolan"></div>

</div>
</div>


<div class="main mt15">
<div class="s_gwc4_1">
<div class="s_gwc4_1_a"><p><span>商品信息</span></p></div>

<div class="gwc2_psfs">
<div class="gwc1_lm ">
<table>
<tr>
<td width="100">商品编号</td>
<td>商品信息</td>
<td>单价</td>
<td>数量</td>
<td>合计</td>
</tr>
</table>
</div>

<div class="gwc1_lm2">
<table>
<#list carts as cart>
<tr class="tr_td">
<input type="hidden" value="${cart.pid}" class="pid">
<input type="hidden" value="${cart.vid}" class="vid">
<td class="gwc1_lm2_a0">${cart.pid}</td>
<td class="gwc1_lm2_a1"><span><a href="#"><img src="${cart.productCoverImageUri}" width="76" height="76"></a></span>
<p><a href="" class="names"><p>${cart.productName}</p></a></td>
<td class="gwc1_lm2_b1">￥<span class="t_price">${cart.price?c}</span></td>
<td class="gwc1_lm2_c1"><div class="ds content_nr_3_jg2"><a href="#"><img src="img/slj.png" width="20" height="20"></a>
<input type="text" class="content_zj" value="${cart.quantity}"><a href="#"><img src="img/sljj.png" width="20" height="20"></a></div></td>
<td class="gwc1_lm2_b1">
<#assign total=0>
<#assign total=total+cart.price*cart.quantity>
<span>￥<b class="counts">${total?c}</b></span></td>
</tr>
</#list>
</table>
</div>
</div>
<div class="clear"></div>
</div>
</div>


<div class="main mt15">
<div class="s_gwc3_1">
<div class="s_gwc3_1_a"><p><span>我的优惠劵</span></p></div>
<div class="invoice">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <select>
            <option>优惠抵用券</option>
            <option>红包抵用</option>
            <option>优惠卡</option>
          </select>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <span class="orange">抵用金额：￥0.00元</span></div>
</div>
</div>
<div class="main mt15">
<div class="s_gwc3_1">
<div class="s_gwc3_1_a"><p><span>商品备注</span></p></div>
<div class="gwc_3zf11 fll">
 <textarea class="input12"  onfocus="if(value=='留言内容') {value=''}" onblur="if (value=='') {value='留言内容'}"  value="留言内容"  id="et_contact_message" name="et_contact_message">留言内容</textarea>
</div>
<div class="clear"></div>

</div>
</div>

<div class="main"><div class="s_gwc1zj flr"><p>商品<span> ${count} </span>件  总价：商品价格¥（<span id="sum"></span>元)+运费（￥<span class="freight">10</span>元）+优惠劵¥（<span class="pres">19</span>元）=商品总计(含运费)： ¥<span id="sumits">0.00</span> </p></div></div>
<div class="clear"></div>
<div class="main">
<div class="s_gwc1zja"><div class="flr s_gwc1zja_2"><a id="submit_order" href="javascript:void(0)" title="提交订单" onclick="tm_submit(this)">提交订单 </a></div></div>
</div>
</div>

<div class="clear"></div>

<div class="footallbg">
<#include "/front/comment/top1.ftl">

</div>
<script type="text/javascript">
	$(function(){
		var $this=$(".tr_td").find("td");
		var counts =$this.parents().find(".counts").text();
		var freight =$(".freight").text();
		var pres= $(".pres").text();
		var sum=$("#sum").text(counts);
		var coun=counts*1+pres*1+freight*1
		$("#sumits").text(coun)
	})

	function tm_submit(obj){
		var $this=$(".tr_td").find("td");
			var productName =$this.parents().find(".names").text();
			var producprice =$this.parents().find(".t_price").text();
			var producNumer =$this.parents().find(".content_zj").val();
			var pid =$this.parents().find(".pid").val();
			var vid =$this.parents().find(".vid").val();
			$.ajax({
				type:"post",
				url:"/addcartStep",
				data:{"productName":productName,"price":producprice,"deliveryQuantity":producNumer,"pid":pid,"vid":vid},
				success:function(data){
					if(data=="success"){
						window.location.href="/paysuccess";
					}else{
						alert(data)
					}
				}
			})
	}
</script>
</body>
</html>