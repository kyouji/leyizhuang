<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/client/js/regist.js"></script>
<script type="text/javascript" src="/client/js/Validform_v5.3.2_min.js"></script>
<script>
$(document).ready(function(){
    changeYzm();
    $("#regist_form").Validform({
        tiptype: 3
     });
});
</script>

<aside class="winbox" id="register" style="display:none">
  <div class="register">
    <a class="closebox" href="javascript:void(0);" onclick="$(this).parent().parent().fadeOut(300);"><img src="/client/images/member/close.png" /></a>
    <p class="tit"><span>注册正品惠客</span></p>
    <form id="regist_form" action="/reg" method="post">
    <table>
      <tr>
        <th>用 户 名：</th>
        <td><input class="text" type="text" placeholder="用户名" name="username" datatype="*6-12"/></td>
        <span class="Validform_checktip Validform_wrong" class="red"></span>
      </tr>
      <tr>
        <th>设置密码：</th>
        <td><input class="text" type="text" placeholder="密码" name="password" type="password" datatype="*6-16"/></td>
        <span class="Validform_checktip Validform_wrong" class="red"></span>
      </tr>
      <tr>
        <th>确认密码：</th>
        <td><input class="text" type="text" placeholder="确认密码" name="repassword" type="password" datatype="*6-12" recheck="password"/></td>
      </tr>
      <tr>
        <th>手 机 号：</th>
        <td><input class="text" type="text" placeholder="手机号" name="mobile" datatype="m" ajaxurl="/reg/check/mobile"/></td>
        <span class="Validform_checktip Validform_wrong"></span>
      </tr>
      <tr>
        <th>验 证 码：</th>
        <td><input class="text fl" style="width:150px;" type="text" placeholder="验证码" name="code" datatype="s4-4" errormsg="请填写4位字符！" /><a class="fl ml10" href="javascript:changeYzm()"><img id="yzm_image" src="/client/images/member/yzm.png" /></a></td>
        <span class="Validform_checktip Validform_wrong"></span>
      </tr>
      <tr>
        <th></th>
        <td>点击注册表示同意正品惠客<a href="#">《用户协议》</a></td>
      </tr>
      <tr>
        <th></th>
        <td><input type="submit" class="sub" value="注册" /></td>
      </tr>
    </table>
    </form>
    <div class="clear"></div>
  </div>
</aside>