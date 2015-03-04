<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>荣诚手机超市--购物车</title>
<meta name="keywords" content="荣诚手机超市" />
<meta name="description" content="荣诚手机超市" />
<meta name="copyright" content="荣诚手机超市 版权所有" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/rcindex.css" rel="stylesheet" type="text/css" />
<link href="/css/gwc.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/Tm/js/jquery-1.11.1.min.js"></script>
</head>
<body>
<header>
<div class="main">
<#include "/front/comment/header.ftl">
</div>
</header>

<div class="header1 main">
<div class="fll logo"><a href="javascript:void(0)" title="荣诚手机超市"><img src="img/rc_logo.png" width="177" height="69"></a></div>
<div class="fll city"><a href="javascript:void(0)">城市切换</a><span></span>
<!--<div class="cityqh"><ul>
<li><a href="javascript:void(0)">昆明市</a></li>
<li><a href="javascript:void(0)">曲靖市</a></li>
<li><a href="javascript:void(0)">大理州</a></li>
<li><a href="javascript:void(0)">西双版纳</a></li>
<li><a href="javascript:void(0)">德宏州</a></li>
<li><a href="javascript:void(0)">丽江市</a></li>
</ul></div>-->
</div>
<div class="sercha fll">
<input class="topnews1_serch" type="text" onfocus="if(value=='热搜机型： iphone 6   MX4 Pro   HTC M8') {value=''}" onblur="if (value=='') {value='热搜机型： iphone 6   MX4 Pro   HTC M8'}"  value="热搜机型： iphone 6   MX4 Pro   HTC M8">
<input type="submit" class="search-btn" title="搜索" value="  ">
<div class="rc_newsgg"><span>新闻公告:</span><a href="javascript:void(0)">>>黄章：魅蓝Note有电信版，一月还将发新品</a></div>
</div>
<div class="fll rc_phone"><span>客服电话：400-888-8888</span></div>
<div class="flr rc_gwc"><a href="/cart">购物车（1）</a></div>
</div>



<div class="gwcbg">
<div class="main mt10">
<div class="place"> <span>您现在的位置：</span><a href="/">首页</a>&gt;<a href="/list/2">手机产品</a>&gt;<a href="javascript:void(0)">手机筛选</a>&gt; </div>
<div class="s_gwc1"><span id="colorfff">1、我的购物车</span><span>2、我的订单信息</span><span>3、支付成功</span></div>
</div>

<div class="main">
<div class="gwc1_lm mt20">
<table>
<tr>
<td>商品信息</td>
<td>单价</td>
<td>数量</td>
<td>合计</td>
<td>操作</td>
</tr>
</table>
</div>

<div class="gwc1_lm2">
<table>
<#if carts??>
<#list carts as cartId>
<tr id="tr_list">
<td class="gwc1_lm2_a"><input type="checkbox" class="fll duoxuank"   name="coursename"><span><a href="javascript:void(0)" class="t_timg"><img src="${cartId.productCoverImageUri}" width="76" height="76"></a></span>
<p><a href="javascript:void(0)"> <p><#if cartId.productName??>${cartId.productName}</#if></p></a></td>
<td class="gwc1_lm2_b"><span class="money">￥<#if cartId.price??>${cartId.price?c}</#if></span></td>
<td class="gwc1_lm2_c"><div class="ds content_nr_3_jg2"><a href="javascript:void(0)" class="prev" data-sum="<#if cartId.productNumber??>${cartId.productNumber}</#if>"><img src="/img/slj.png" width="20" height="20" ></a><input type="text" class="content_zj" value="${cartId.pid}" id="count" ><a href="javascript:void(0)" class="next"  data-sum="<#if cartId.productNumber??>${cartId.productNumber}</#if>"><img src="/img/sljj.png" width="20" height="20" ></a></div></td>
<td class="gwc1_lm2_b"><span id="td_sum">￥0</span></td>
<td class="gwc1_lm2_d"><input type="button" class="gwc_delete" value="删除订单"></td>
</tr>
</#list>
</#if>
</table>
</div>
</div>

<div class="main">
<div class="s_gwc1zj_left fll mt12"><p><input type="checkbox" onclick="checkAll(this)" class="fll">全选</p></div>

<div class="s_gwc1zj flr"><p>商品<span id="code_su"> 3 </span>件  总价：<span>¥599.00</span>  商品总计(不含运费)： <span>¥599.00</span> </p></div>

</div>

<div class="clear"></div>

<div class="main">
<div class="s_gwc1zja"><div class="fll s_gwc1zja_1"><a href="javascript:void(0)"> << 继续购物 </a></div><div class="flr s_gwc1zja_2"><a href="/cartStep" title="去结算">去结算 </a></div></div>
</div>

</div>




<div class="clear"></div>

<div class="footallbg">
<#include "/front/comment/top1.ftl">
</div>


<script type="text/javascript">

			//分页---上一页(减1)  / 下一页(加1)
			
			var index = 1;
	
		
			//下一页功能
			$(".next").click(function(){
			var datasum=$(this).data("sum");
				index++;//相当于index = index +1;
				if(index > datasum)index = 1;
				$("#count").val(index);
			});

		
			//上一页功能
			$(".prev").click(function(){
			var datasum=$(this).data("sum");
				index--;//相当于index = index +1;
				if(index<1)index = datasum;
				$("#count").val(index);
			});
			
	/*全选*/
	function checkAll(obj){
		var courseName = document.getElementsByName("coursename");
		if(obj.checked){//判断当前全选选中
			for(var i=0;i<courseName.length;i++){
				courseName[i].checked = true;
			}
		}else{
			for(var i=0;i<courseName.length;i++){											courseName[i].checked = false;
			}	
		}
	};
			
</script>



</body>
</html>



