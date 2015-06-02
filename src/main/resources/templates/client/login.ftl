<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>惠资生活</title>
<meta name="keywords" content="${site.seoKeywords!''}" />
<meta name="description" content="${site.seoDescription!''}" />
<meta name="copyright" content="${site.copyright!''}" />
<link href="/client/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/client/css/style.css" rel="stylesheet" type="text/css" />
<link href="/client/css/common.css" rel="stylesheet" type="text/css" />
<link href="/client/css/mymember.css" rel="stylesheet" type="text/css" />
<!--<link href="css/member.css" rel="stylesheet" type="text/css" />-->
<script type="text/javascript" src="/client/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/client/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="/client/js/common.js"></script>
<script type="text/javascript" src="/client/js/ljs-v1.01.js"></script>
<script type="text/javascript" src="/client/js/mymember.js"></script>

<script type="text/javascript">
  $(document).ready(function(){
	menuDownList("top_phone","#top_phonelist",".a1","sel");
	phoneListMore();//单独下拉
    menuDownList("top_order","#top_orderlist",".a4","sel");//顶部下拉
	searchTextClear(".toptext","请输入品牌或商品名称","#999","#666");
	searchTextClear(".bottext","查看所有门店","#fff","#fff");
	checkNowHover("shopping_down","shopping_sel");
	navDownList("navdown","li",".nav_showbox");
	menuDownList("mainnavdown","#navdown",".a2","sel");
	
	chooseMoreShow();
	
	//初始化表单验证
    $("#form1").Validform({
        tiptype: 3
    });
    
    $("#btn_login").click(function(){
        var username = $("#txt_loginId").val();
        var password = $("#txt_loginPwd").val();
        
        if (username.length < 6 || password.length < 6)
        {
            alert("用户名或密码长度输入不足");
            return;
        }
        
        $.ajax({
                type: "post",
                url: "login",
                data: { "username": username, "password": password },
                dataType: "json",
                success: function (data) {
                    if (data.code == 0) {
                        var url = document.referrer;
                        if(undefined==url || ""==url){
                            window.location.href="/";
                        }else{
                            window.location.href = url; 
                        }
                    } else {
                        alert(data.msg);
                    }
                }
            });
    });
});
</script>
</head>
<body>
    <div class="w1065">
    <div class="denglutop">
<div class="denglulogo"><img src="<#if site??>${site.logoUri!''}</#if>"></div>
<section class="denglu_center">
  <table>
    <tr>
      <td>
        <a href="#"><img src="/client/images/dengluicon_03.png" />正品保障</a>
      </td>
      <td>
        <a href="#"><img src="/client/images/dengluicon_05.png" />极速物流</a>
      </td>
      <td>
        <a href="#"><img src="/client/images/dengluicon_07.png" />售后无忧</a>
      </td>
      <td>
        <a href="#"><img src="/client/images/dengluicon_09.png" />特色服务</a>
      </td>
    </tr>
  </table>
</section>
    </div>
    
    <div class="  dl">
    <div class="dllt"><img src="/client/images/denlu_03.png" width="546" height="328" /></div>
    <div class="dlrt">
    <div class="loginbox">
      <div class="login_r"> 
        <span>请输入用户名/邮箱/手机号码</span>
        <input id="txt_loginId" type="text" class="login_txt1" />
        <span>请输入密码</span>
        <input id="txt_loginPwd" type="password" class="login_txt2" />
        <p>
          <label>
            <input name="" type="checkbox" value="" />
            &nbsp;记住密码</label>
          &nbsp;&nbsp;<b class="wj"><a href="#">忘记密码？</a></b></p>
        <p class="mt15">还不是会员？<b class="zc"><a href="/reg">免费注册</a></b></p>
        <input type="submit" class="login_btn" id="btn_login" value="立即登录"/>
      </div>
    </div>
    </div>
    </div>
    
        <div class="clear"></div>
        <div class="h30"></div>
<div class="w1059 downbq">
    <div class="clear"></div>
    <#if site??>${site.copyright!''}</#if>
    <a style="color:#222222" href="#"><#if site??>${site.icpNumber!''}</#if></a>
    <span class="flr"><a title="云南网站建设" href="http://www.ynyes.com" target="_blank">网站建设</a>技术支持：<a title="云南网站建设" href="http://www.ynyes.com" target="_blank">昆明天度网络公司</a></span>
</div>
</div>
    </div>
</body>
</html>