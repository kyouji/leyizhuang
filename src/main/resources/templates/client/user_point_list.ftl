<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>博大生活网——会员中心首页</title>
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
<!--[if IE]>
   <script src="/client/js/html5.js"></script>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="/client/js/DD_belatedPNG_0.0.8a.js" ></script>
<script>
DD_belatedPNG.fix('.,img,background');
</script>
<![endif]-->
</head>
<body>
<!-- header开始 -->
<#include "/client/common_header.ftl" />
<!-- header结束 -->
<div class="mymember_out">
  <div class="mymember_main">
    <div class="myclear" style="height:20px;"></div>
    <#-- 左侧菜单 -->
      <#include "/client/common_user_menu.ftl" />
    <#-- 左侧菜单结束 -->
    <!--mymember_menu END-->
    <div class="mymember_mainbox">
      <div class="mymember_info mymember_info02">
        <div class="mymember_order_search"> 积分记录 可用积分<#if point_page?? && point_page.content?? && point_page.content[0]??>${point_page.content[0].totalPoint!'0'}<#else>0</#if>个 
          <div class="clear"></div>
        </div>
        
        <table class="tb-void">
		<tbody>
		<tr bgcolor="#CCCCCC">
			<td>日期</td>
			<td>收入/支出</td>
			<td>详细说明</td>
		</tr>
		<#if point_page??>
		  <#list point_page.content as point>
		      <tr>
                <td><span class="ftx03">${point.pointTime!''}</span></td>
                <td>
                    <span class="ftx-02"><#if point.point??><#if point.point gt 0>+</#if>${point.point}</#if></span>                                                            </td>
                <td>${point.detail!''}</td>
              </tr>
		  </#list>
		</#if>    
        </tbody>
        </table>
        <div class="myclear" style="height:10px;"></div>
        <div class="mymember_page">
            <#if point_page??>
                <#assign continueEnter=false>
                <#if point_page.totalPages gt 0>
                    <#list 1..point_page.totalPages as page>
                        <#if page <= 3 || (point_page.totalPages-page) < 3 || (point_page.number+1-page)?abs<3 >
                            <#if page == point_page.number+1>
                                <a class="mysel" href="javascript:;">${page}</a>
                            <#else>
                                <a href="/user/point/list?page=${page-1}">${page}</a>
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
      <!--mymember_info END-->
      <div class="mymember_info">
        <h3 id="mymember_likecheck"> <a class="mysel" href="#">&nbsp;</a> <a href="#">&nbsp;</a> <a href="#">&nbsp;</a> <span>积分兑换</span> </h3>
        <ul id="mymember_likelist">
          <li style="display: block;"> <a href="#"> <img src="/client/images/mymember/img01.jpg">
            <p>我1111111字哦我是商品的名字哦我是商品的名字哦</p>
            <p><span>2000</span></p>
            <i>已售 407 件</i> </a> <a href="#"> <img src="/client/images/mymember/img01.jpg">
            <p>我是商品的名字哦我是商品的名字哦我是商品的名字哦</p>
            <p><span>2000</span></p>
            <i>已售 407 件</i> </a> <a href="#"> <img src="/client/images/mymember/img01.jpg">
            <p>我是商品的名字哦我是商品的名字哦我是商品的名字哦</p>
            <p><span>2000</span></p>
            <i>已售 407 件</i> </a> <a href="#"> <img src="/client/images/mymember/img01.jpg">
            <p>我是商品的名字哦我是商品的名字哦我是商品的名字哦</p>
            <p><span>2000</span></p>
            <i>已售 407 件</i> </a> </li>
          <li> <a href="#"> <img src="images/mymember/img01.jpg">
            <p>我是商品的名字哦我是商品的名字哦我是商品的名字哦</p>
            <p><span>2999.00</span></p>
            <i>已售 407 件</i> </a> <a href="#"> <img src="images/mymember/img01.jpg">
            <p>我是商品的名字哦我是商品的名字哦我是商品的名字哦</p>
            <p><span>2999.00</span></p>
            <i>已售 407 件</i> </a> <a href="#"> <img src="images/mymember/img01.jpg">
            <p>我是商品的名字哦我是商品的名字哦我是商品的名字哦</p>
            <p><span>2999.00</span></p>
            <i>已售 407 件</i> </a> <a href="#"> <img src="images/mymember/img01.jpg">
            <p>我是商品的名字哦我是商品的名字哦我是商品的名字哦</p>
            <p><span>2999.00</span></p>
            <i>已售 407 件</i> </a> </li>
          <li> <a href="#"> <img src="images/mymember/img01.jpg">
            <p>我是商品的名字哦我是商品的名字哦我是商品的名字哦</p>
            <p><span>2999.00</span></p>
            <i>已售 407 件</i> </a> <a href="#"> <img src="images/mymember/img01.jpg">
            <p>我是商品的名字哦我是商品的名字哦我是商品的名字哦</p>
            <p><span>2999.00</span></p>
            <i>已售 407 件</i> </a> <a href="#"> <img src="images/mymember/img01.jpg">
            <p>我是商品的名字哦我是商品的名字哦我是商品的名字哦</p>
            <p><span>2999.00</span></p>
            <i>已售 407 件</i> </a> <a href="#"> <img src="images/mymember/img01.jpg">
            <p>我是商品的名字哦我是商品的名字哦我是商品的名字哦</p>
            <p><span>2999.00</span></p>
            <i>已售 407 件</i> </a> </li>
        </ul>
        <div class="myclear"></div>
      </div>
      <!--mymember_info END-->
      <script type="text/javascript">
      $(document).ready(function(){
         mymemberMenuCheck("mymember_likecheck","a","mymember_likelist","li","mysel");
    });
    </script>
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
		 mymemberRightMove("mymember_storybox",70,90,"mymember_story_next",15,3,"a");
		 mymemberRightMove("mymember_gzbox",205,241,"mymember_gznext",15,3,"a");
		 mymemberRightMove("mymember_shinebox",205,310,"mymember_shinenext",15,3,"div");
      });
</script>
</body>
</html>
<!--结束-->
