<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>荣诚手机超市--个人信息</title>
<meta name="keywords" content="荣诚手机超市" />
<meta name="description" content="荣诚手机超市" />
<meta name="copyright" content="荣诚手机超市 版权所有" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/rcindex.css" rel="stylesheet" type="text/css" />
<link href="/css/member.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/Tm/css/manhuaTip1.1.0.css" />
<script type="text/javascript" src="/Tm/js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/Tm/js/mainTip.js"></script>
<script type="text/javascript" src="/Tm/js/util.js"></script>
<script type="text/javascript" src="/Tm/js/front/info.js"></script>
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
<div class="member_lef fll"> <span class="sp55">新手入门</span>
      <ul class="haoh pt10">
       <li><a href="/order/list" >全部订单</a></li>
        <li><a href="/order/obligation" >待付款订单</a></li>
        <li><a href="/order/startorder">待收货订单</a></li>
        <li><a href="/order/orderok">已完成订单</a></li>
         <li><a href="/order/orderno" >已关闭订单</a></li>
      </ul>
      <span class="mt10 sp55">个人中心</span>
      <ul class="haoh pt10">
        <li><a href="/user/info" class="act">个人信息</a></li>
        <li><a href="/user/updatePassword">密码修改</a></li>
        <li><a href="/user/address">收货地址</a></li>
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

<div class="place1"> <span>您现在的位置：</span><a href="/">首页</a>&gt;<a href="#">用户中心</a>&gt;<a href="javascript:void()">个人信息</a>&gt; </div>
        
        
        
<div class="user_r_table pt25 ml20">
      <table width="440" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="user_r_tit">*昵称： </td>
          <td class="user_r_110"><input class="input" type="text" id="nickname" autofocus="autofocus" maxlength="20" placeholder="请输入用户名" value="<#if user.nickname??>${user.nickname}</#if>"></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="user_r_tit">真实姓名：</td>
          <td> <input class="input" type="text" id="name"  maxlength="20" placeholder="请输入姓名" value="<#if user.realName??>${user.realName}</#if>"></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="user_r_tit" >*性别：</td>
          <td>
              <p>
                <label >
                <input type="radio" name="sex" value="男" id="RadioGroup1_0" <#if user.sex?? && user.sex=="男">checked</#if>  />
                  男</label>
                <label>
                  <input type="radio" name="sex" value="女" id="RadioGroup1_1" <#if user.sex?? && user.sex=="女">checked</#if>/>
                  女</label>
                </p>
            </td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="user_r_tit">详细地址：</td>
          <td><input class="input" type="text" id="address"  maxlength="20" placeholder="请输入详细地址" value="<#if user.detailAddress??>${user.detailAddress}</#if>"></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="user_r_tit">电子邮件：</td>
          <td> <input class="input" type="text" id="email"  maxlength="20" placeholder="rongcheng@qq.com" value="<#if user.email??>${user.email}</#if>"></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="user_r_tit">手机号码：</td>
          <td><input class="input" type="text" id="mobile"  maxlength="11" placeholder="请输入手机号码" value="<#if user.mobile??>${user.mobile}</#if>"></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="user_r_tit">联系QQ：</td>
          <td><input class="input" type="text" id="qq"  maxlength="16" placeholder="请输入QQ" value="<#if user.qq??>${user.qq}</#if>"></td>
          <td>&nbsp;</td>
        </tr>
        <!--<tr>
            <td class="user_r_tit">验证码：</td>
            <td><input type="text" class="user_r_txt_input2" />
              <img src="images/codeImg.jpg" width="100" height="24" /></td>
            <td>&nbsp;</td>
          </tr>-->
        <tr>
          <td class="user_r_tit"></td>
          <td><input type="button" class="user_r_btn" value="确认修改" onclick="tm_update(this,${user.id})"/></td>
          <td>&nbsp;</td>
        </tr>
      </table>
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
	function tm_update(obj,id){
		var nickname=$("#nickname").val();
		var name=$("#name").val();
		var sex=$("input[name='sex']:checked").val();
		var address=$("#address").val();
		var email=$("#email").val();
		var mobile=$("#mobile").val();
		var qq=$("#qq").val();
		if(isEmpty(nickname)){
			 Tmtip({html:"您输入的用户名不能为空!!!",src:"Tm/images/24.PNG"});
			return;
		}
		var fromData={"nickname":nickname,"realName":name,"sex":sex,"detailAddress":address,"email":email,"mobile":mobile,"qq":qq,"id":id};
		$.ajax({
			type:"post",
			url:"/user/update",
			data:fromData,
			success:function(data){
				alert(data);
			}
		})
	}
	Tmtip({html:"您输入的用户名不能为空!!!",src:"Tm/images/24.PNG"});
</script>
</body>
</html>
