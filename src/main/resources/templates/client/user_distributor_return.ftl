<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>博大生活网——分销商返现记录</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link href="/client/style/layout.css" rel="stylesheet" type="text/css" />
<link href="/client/style/master.css" rel="stylesheet" type="text/css" />
<link href="/client/style/mymember.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/client/js/html5.js"></script>
<!--<link href="/client/css/member.css" rel="stylesheet" type="text/css" />-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/mymember.js"></script>
<script src="/client/js/header.js"></script>
<!--[if IE]>
   <script src="/client/js/html5.js"></script>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="/client/js/DD_belatedPNG_0.0.8a.js" ></script>
<script>
DD_belatedPNG.fix('.,img,background');
</script>
<![endif]-->
<script type="text/javascript">
$(document).ready(function(){
    $("#id-money-get").click(function(){
        <#if !reward_page?? || !reward_page.content[0]?? || reward_page.content[0].totalCashReward < 10>
            alert("提现金额不足100元时不能进行提现");
        <#else>
            alert("提现申请提交成功，请耐心等待!");
        </#if>
    });
});
</script>
</head>
<body>
<!-- header开始 -->
<#include "/client/common_header.ftl" />
<!-- header结束 -->
<div class="mymember_out">
  <div class="mymember_main">
    <div class="myclear" style="height:20px;"></div>
    <#include "/client/common_user_menu.ftl" />
    <#-- 左侧菜单结束 -->
    <div class="mymember_mainbox">
    <div class="mymember_info mymember_info02">
              <div class="separationInfo sepBasic">
                    <h5> 我的返现记录 <span id="TellToUser"></span> </h5>
             </div>
    
            <div class="record">
                <div class="money fl">
                    <span>钱包总金额：<b>￥<#if reward_page?? && reward_page.content[0]??>${reward_page.content[0].totalCashReward?string("0.00")}<#else>0.00</#if></b></span>
                </div>
                <a id="id-money-get" href="javascript:;" class="apply pulse-shrink">申请提现</a>
            </div>
            <div class="clear"></div> 
             
        <div id="mypurse-content" class="mypurse-content">
            <div class="content-title">返现记录</div>
            <div class="content-bg-hd">
    
                <div class="content-bg-hd">
                	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th width="19%" height="35">编号</th>
                        <th width="17%">时间<span func="order_type" class="desc hidden"></span></th>
                        <th width="16%">下级用户</th>
                        <th width="22%">对应订单号/账号</th>
                        <th width="18%">订单总金额</th>
                        <th width="8%">返现金额</th>
                      </tr>
                    </table>
                </div>
            
                <div class="content-bg">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tbody class="normal-status">
                        <#if reward_page??>
                            <#list reward_page.content as reward>
                                <tr class="">
                                    <td width="19%" height="35">${reward.id!''}</td>
                                    <td width="17%">${reward.rewardTime!''}</td>
                                    <td width="16%">${reward.lowerUsername!''}</td>
                                    <td width="25%">${reward.orderNumber!''}</td>
                                    <td width="18%">${reward.orderPrice?string("#.##")}</td>
                                    <td width="8%"><#if reward.cashReward gt 0>+</#if>${reward.cashReward?string("#.##")}</td>
                                </tr>
                            </#list>
                        </#if>
                    </tbody>
                </table>
                </div>     
            </div>
            
            
        </div>  
        <div class="mymember_page">
          <#if reward_page??>
            <#assign continueEnter=false>
            <#if reward_page.totalPages gt 0>
                <#list 1..reward_page.totalPages as page>
                    <#if page <= 3 || (reward_page.totalPages-page) < 3 || (reward_page.number+1-page)?abs<3 >
                        <#if page == reward_page.number+1>
                            <a class="mysel" href="javascript:;">${page}</a>
                        <#else>
                            <a href="/user/distributor/return?page=${page-1}">${page}</a>
                        </#if>
                        <#assign continueEnter=false>
                    <#else>
                        <#if !continueEnter>
                            <b class="pn-break">&hellip;</b>
                            <#assign continueEnter=true>
                        </#if>
                    </#if>
                </#list>
            </#if>
          </#if>
      </div>
    </div>
    </div>
    <!--mymember_center END-->
    <div class="myclear"></div>
  </div>
  <!--mymember_main END-->
  <div class="myclear"></div>
</div>
<!--主体结束-->
<#include "/client/common_footer.ftl" />
<!--底部结束-->
<script type="text/javascript">
      $(document).ready(function(){
         mymemberMenuCheck("mymember_right_menu","a","mymember_right_check","li","mysel");
		 mymemberMenuCheck("mymember_likecheck","a","mymember_likelist","li","mysel");
		 mymemberRightMove("mymember_storybox",70,90,"mymember_story_next",15,3,"a");
		 mymemberRightMove("mymember_gzbox",205,241,"mymember_gznext",15,3,"a");
		 mymemberRightMove("mymember_shinebox",205,310,"mymember_shinenext",15,3,"div");
      });
</script>
</body>
</html>
<!--结束-->
