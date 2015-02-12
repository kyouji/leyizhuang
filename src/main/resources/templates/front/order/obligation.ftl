<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>荣诚手机超市--我的订单</title>
<meta name="keywords" content="荣诚手机超市" />
<meta name="description" content="荣诚手机超市" />
<meta name="copyright" content="荣诚手机超市 版权所有" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/rcindex.css" rel="stylesheet" type="text/css" />
<!--<link href="/css/member.css" rel="stylesheet" type="text/css" />-->
<link rel="stylesheet" rel="stylesheet" href="/img/order/gao/style.css" />
<link rel="stylesheet" type="text/css" href="/img/order/gao/global.css" />
<link rel="stylesheet" type="text/css" href="/img/order/gao/buy.css" />
<link href="/img/order/gao/member.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/img/order/gao/pagination.css" />
<script src="/js/html5.js"></script>
<script type="text/javascript">
     window.jQuery || document.write("<script src='/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
   
<!--[if IE 6]>
<script type="text/javascript" src="/js/DD_belatedPNG_0.0.8a.js" ></script>
<script>
DD_belatedPNG.fix('.,img,background');
</script>
<![endif]-->
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
        <li><a href="/order/list">全部订单</a></li>
        <li><a href="/order/obligation?status=0" class="act">待付款订单</a></li>
        <li><a href="/order/startorder?status=1">待收货订单</a></li>
        <li><a href="/order/orderok?status=3">已完成订单</a></li>
        <li><a href="/order/orderno?status=4">已关闭订单</a></li>
      </ul>
      <span class="mt10 sp55">个人中心</span>
      <ul class="haoh pt10">
        <li><a href="/user/info" >个人信息</a></li>
        <li><a href="/user/updatePassword" >密码修改</a></li>
        <li><a href="/user/address">收货地址</a></li>
        <li><a href="/user/collect">我的收藏</a></li>
        <li><a href="/user/point" >我的积分</a></li>
      </ul>
      <span class="mt10 sp55">客户服务</span>
      <ul class="haoh pt10 pb10">
        <li><a href="/help/question/1">帮助中心</a></li>
  
      </ul>
    </div>

<div class="flr">
    <div class="list_banner1">
      <div class="list_banner_fj">
        <p>您当前的位置：<a href="/">首页</a> >> <a href="#">订单</a> >>所有订单</p>
      </div>
      
      <style>
      .data_s{overflow:hidden;padding:20px 0;}
      .data_s a,.data_s a:visited{margin-right:10px;padding:5px 10px;border:1px solid #ddd;border-radius:3px;-moz-border-radius:3px;-ms-border-radius:3px;-webkit-border-radius:3px;-o-border-radius:3px;
      transition:all .2s linear;-webkit-transition:all .2s linear;-o-transition:all .2s linear;-ms-transition:all .2s linear;-moz-transition:all .2s linear;
      }
      .data_s a.on,.data_s a:hover{ background:#2881D5; color:#fff;border:none;}
      
      </style>
      <div class="data_s">
        <a>近一个月</a>
        <a>近三个月</a>
        <a>近六个月</a>
        <a>近一年</a>
      </div>
      
      
      <div class="member_dd">
        <table width="720" border="0" cellpadding="0" cellspacing="0" id="table" >
        	<#include "/front/order/orderchild/page.ftl">	
        </table>
      
      <div id="id-pagination" style="margin-top: 0px;float: right;">
          <div class="pagination">
	          <span class="current prev"><a href="javascrpt:void(0)">上一页</a></span>
	          <span class="current next"><a href="javascrpt:void(0)">下一页</a></span>
          </div>
      </div>
      
    </div>
    <div class="clear"></div>
       <div class="page" style="margin-top: 5px;text-align: right;"></div>
  </div>
  <div class="clear"></div>
</div>

<div class="clear"></div>

<div class="main mt20">
<#include "/front/comment/top.ftl">
</div>

<div class="clear"></div>
<div class="footallbg">
<#include "/front/comment/top1.ftl">
</div>
<script src="/js/jquery.pagination.js"></script>
      // 分页
    <script type="text/javascript">
    
    // 每页数量
    var pageSize = 5;
    
     $(".data_s a").click(function(){
        $(this).siblings().removeClass("on");
        $(this).addClass("on");
        
        var search = window.location.search;
        var snew;
        
        if ("" == search)
        {
            snew="?";
        }
        else
        {
            snew=search + "&";
        }
        
        if ($(this).html()=="近一个月")
        {
            snew += "timeId=1";
        }
        else if ($(this).html()=="近三个月")
        {
            snew += "timeId=3";
        }
        else if ($(this).html()=="近六个月")
        {
            snew += "timeId=6";
        }
        else if ($(this).html()=="近一年")
        {
            snew += "timeId=12";
        }
        $.ajax({
            type : "post",
            url : "/order/otherorder_time"+snew,
            data : {"snew":snew,
                     "status":${status}
                     },
            success : function(data) {
                $("#table").html(data);
                var b=pageSize;
                // 重新初始化分页
            $("#id-pagination").pagination(parseInt($("#all_order_number").html()),
	                {
	                    num_display_entries : 3,
	                    num_edge_entries : 3,
	                    current_page : 0,
	                    items_per_page : pageSize,
	                    prev_text : "上一页",
	                    next_text : "下一页",
	                    showGo : true,
	                    showSelect : true,
	                    callback : function(pageNo) {
	                        $.ajax({
	                            type : "post",
	                            url : "/order/page_list_all_time"+snew,
	                            data : {
	                                "page" : pageNo,
	                                 "status":${status}
	                            },
	                            success : function(data) {
	                                $("#table").html(data);
	                            }
	                        });
	                    }
        
                });
            }
        });
    });
    
    
    
    // 分页
    $("#id-pagination").pagination(${goods_order_total},
    {
    
        num_display_entries : 3,
        num_edge_entries : 3,
        current_page : 0,
        items_per_page : pageSize,
        prev_text : "上一页",
        next_text : "下一页",
        showGo : true,
        showSelect : true,
        callback : function(pageNo) {
            $.ajax({
                type : "post",
                url : "/order/page_list",
                data : {
                    "page" : pageNo,
                    "status" : ${status}
                },
                success : function(data) {
                    $("#table").html(data);
                }
            });
        }
    });
    

</script>
</body>
</html>
