<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>荣诚手机超市--收货地址</title>
<meta name="keywords" content="荣诚手机超市" />
<meta name="description" content="荣诚手机超市" />
<meta name="copyright" content="荣诚手机超市 版权所有" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/rcindex.css" rel="stylesheet" type="text/css" />
<link href="/css/member.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/Tm/css/manhuaTip1.1.0.css" />
<style type="text/css">
	.table{height:34px;text-align:Center;line-height:34px;border:1px solid #e5e5e5;}
	.table .tb_tr{background:#e5e5e5}
	.table .tr_td:hover{background:#e4e4e4;}
</style>
<script type="text/javascript" src="/Tm/js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/Tm/js/data.js"></script>
<script type="text/javascript" src="/Tm/js/datajs.js"></script>
<script type="text/javascript" src="/Tm/js/mainTip.js"></script>
<script type="text/javascript" src="/Tm/js/util.js"></script>

</head>
<body>
<header>
<div class="main">
	<#include "/front/comment/header.ftl">
</div>
</header>

<div class="header1 main">
<#include "/front/comment/header1.ftl">

</div></nav>

<div class="gwcbg">
<div class="main mt12">
<div class="member_lef fll"> <span class="sp55">订单中心</span>
      <ul class="haoh pt10">
        <li><a href="/order/list" >全部订单</a></li>
        <li><a href="/order/obligation" >待付款订单</a></li>
        <li><a href="/order/startorder">待收货订单</a></li>
        <li><a href="/order/orderok">已完成订单</a></li>
         <li><a href="/order/orderno" >已关闭订单</a></li>
      </ul>
      <span class="mt10 sp55">个人中心</span>
      <ul class="haoh pt10">s
        <li><a href="/user/info" >个人信息</a></li>
        <li><a href="/user/updatePassword" >密码修改</a></li>
        <li><a href="/user/address" class="act">收货地址</a></li>
        <li><a href="/user/collect">我的收藏</a></li>
         <li><a href="/user/point" >我的积分</a></li>
      </ul>
      <span class="mt10 sp55">客户服务</span>
      <ul class="haoh pt10 pb10">
        <li><a href="/help/question/1">帮助中心</a></li>
  
      </ul>
    </div>

<div class="flr right">
<div class="list_banner1">
<div class="place1"> <span>您现在的位置：</span><a href="/">首页</a>&gt;<a href="/list/2">用户中心</a>&gt;<a href="#">收货地址</a>&gt; </div>
        
        
        
<div class="haoh pt15 geren_rig">
        <div class=" ha oh clear bod" style="border:1px solid #d4d4d4; ">
          <table width="100%" border="1" cellspacing="0" cellpadding="0" class="table">
			<thead>
				<tr class="tb_tr">
					<td></td>
					<td>收货人</td>
					<td>地区</td>
					<td>邮政编码</td>
					<td>电话</td>
					<td>地址</td>
					<td>操作</td>
				</tr>	  	
			</thead>
			<tbody id="tbody">
				<tr class="tr_td">
					<td width="8%"><input type="radio" name="rad"></td>
					<td width="10%">${address.detailAddress}</td>
					<td width="20%">云南省曲靖市麒麟区</td>
					<td width="8%">655000</td>
					<td width="18%">18817591257</td>
					<td width="20%">建宁街道小坡</td>
					<td width="8%" class="upda_del"><a href="javascript:void(0)">修改</a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)">删除</a></td>
				</tr>
			</tbody>
		</table>	  
        </div>
        <div class="h20"></div>
        <div class="ml20 ha oh">
          <form action="#" method="get">
            <div class="h50 black"><span class="fll mt5 fontsize">收货人姓名：</span>
              <input type="text" id="name"  class="inp ml10 gr_sz fll" style="width:320px;"/></div>
            <div class="h50 color666 clear"><span class="fll black fontsize">　　　地区：</span>
              <select class="ml10 " id="province">
              </select>
              <b class="black" style="margin-left:10px;margin-right:10px;">省</b>
              <select  style="width:90px;" id="city">
              </select >
              <b class="black" style="margin-left:10px;margin-right:10px;">市</b>
              <select style="width:90px;" id="town">
              </select>
              <b class="black" style="margin-left:10px;margin-right:10px;">区</b> </div>
            <div class="h50 black clear"><span class="fll mt5 fontsize">　　　地址：</span>
              <input type="text" id="address"  class="inp ml10 gr_sz fll" style="width:320px;"/>
              <span class=" ml10 fll mt5 black">（填写详细地址有助于快速配送）</span></div>
            <div class="h50 black clear"><span class="fll mt5 fontsize">　邮政编码：</span>
              <input type="text" id="postcode" class="inp ml10 gr_sz fll" style="width:320px;"/>
            </div>
            <div class="h50 color666 clear"><span class="fll mt5 black fontsize">　固定电话：</span>
              <input type="text" id="carts"  class="inp ml10 gr_sz fll" style="width:50px;"/>
              <b class="black" style="margin-left:8px;" >-</b>
              <input type="text" id="receiverTelephone" class="inp ml5 gr_sz fll" style="width:236px;"/>
            </div>
            <div class="h50 black clear"><span class="fll mt5 fontsize">　　　手机：</span>
              <input type="text" id="receiverMobile" class="inp ml10 gr_sz fll" style="width:320px;"/>
            </div>
            <div class=" ha oh ml68">
              <input type="button" value="提交" onclick="tm_save(this)" class="user_r_btn"/>
            </div>
          </form>
        </div>
      </div>
        
        
        
    
        
</div></div>
</div>
</div>





<div class="clear"></div>

<div class="main mt20">
<#include "/front/comment/top.ftl">
</div>

<div class="clear"></div>

<div class="footallbg">
<#include "/front/comment/top1.ftl">

</div>
<script type="text/javascript">
	$(function(){
		 $(document).ready(function(){init("province","","city","","town","");});
	})
	
	function tm_save(obj){
		var name=$("#name").val();
		var province=$("#province").val();
		var city=$("#city").val();
		var town=$("#town").val();
		var address=$("#address").val();
		var postcode=$("#postcode").val();
		var carts=$("#carts").val();
		var receiverTelephone=$("#receiverTelephone").val();
		var receiverMobile=$("#receiverMobile").val();
		var formDate={"receiverName":name,"province":province,"city":city,"disctrict":town,"detailAddress":address,"postcode":postcode,"receiverTelephone":carts+receiverTelephone,"receiverMobile":receiverMobile};
		$.ajax({
			type:"post",
			url:"/user/saveaddress",
			data:formDate,
			success:function(data){
				if(data=="success"){
					 Tmtip({html:"添加成功!",src:"/Tm/images/2_1.PNG"});
					$("#name").val("");
					$("#province").val("");
					$("#city").val("");
					$("#town").val("");
					$("#address").val("");
					$("#postcode").val("");
					$("#carts").val("");
					$("#receiverTelephone").val("");
					$("#receiverMobile").val("");
				}
			}
		})
	}

</script>
</body>
</html>
