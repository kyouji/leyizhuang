<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>丫丫手机网</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<!--[if IE]>
   <script src="js/html5.js"></script>
<![endif]-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/common.js"></script>
<script src="/client/js/ljs-v1.01.js"></script>
<script src="/client/js/mymember.js"></script>

<link href="/client/css/common.css" rel="stylesheet" type="text/css" />
<link href="/client/css/cartoon.css" rel="stylesheet" type="text/css" />
<link href="/client/css/mymember.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/content_l.css" />

<script type="text/javascript">
$(document).ready(function(){
    menuDownList("top_phone","#top_phonelist",".a1","sel");
    phoneListMore();//单独下拉
    searchTextClear(".bottext","查看所有门店","#fff","#fff");
    menuDownList("top_order","#top_orderlist",".a4","sel");//顶部下拉
    myLeftMunu();//左侧菜单
});

function changeCollection(page,operate){
    var keywords = $("#keywords").val();
    var pageId = page;
    if(0==operate){
        var input_page = $("#iPageNum").val();
        if(""==input_page){
            return;
        }
        if(!/^[0-9]*[1-9][0-9]*$/.test(input_page)){
            return;
        }
        if(input_page > ${collect_page.totalPages}){
            return;
        }
        pageId = input_page - 1;
    }
    if("商品名称"==keywords){
        keywords = "";
    }
    
    if(keywords!="${keywords!''}"){
        pageId = 0;
    }
    
    $.post("/user/collect/change",{
        "pageId":pageId,
        "keywords":keywords
    },function(data){
        $("#my_collect").html(data);
    });
    
}
</script>
</head>

<body>
    <header class="maintop">
        <section class="main">
            <h1>亲，欢迎来到丫丫手机网</h1>
                <p class="p1">昆明热线：0871-67996799</p>
                <p class="p2">4009-955-966</p>
                <p class="p3">服务热线：</p>
               
                <a class="a2" href="#">在线咨询</a>
                <a class="a3" href="#">会员俱乐部</a>
                <a class="z-in10" href="#">帮助中心</a>
                <menu id="top_order">
                <a class="a4" href="#">我的订单<i></i></a>
                    <div class="clear"></div>
                    <div id="top_orderlist">
                        <p class="p_box">
                            <a href="#"><img src="images/t_order01.png" />我的信息</a>
                            <a href="#"><img src="images/t_order02.png" />我的收藏</a>
                            <a href="#"><img src="images/t_order03.png" />报修/退换货</a>
                            <a href="#"><img src="images/t_order04.png" />我拍到的宝贝</a>
                            <a href="#"><img src="images/t_order05.png" />我的商品咨询</a>
                        </p>
                    </div>
                </menu>
            <div class="clear"></div>
        </section>
    </header><!--maintop-->
    
    <!-- 浮动 -->
    <aside class="floatbox">
        <a href="#" title="微信客服"><img src="images/float_ico01.png" width="42" height="42" alt="微信客服" /><span><img src="images/sys01.png" /></span></a>
        <a href="#" title="在线咨询"><img src="images/float_ico02.png" width="42" height="42" alt="在线咨询" /></a>
        <a href="#" title="新浪微博"><img src="images/float_ico03.png" width="42" height="42" alt="新浪微博" /></a>
        <a href="#" title="服务热线"><img src="images/float_ico04.png" width="42" height="42" alt="服务热线" /><span><img src="images/sys02.png" /></span></a>
        <a href="javascript:$('html,body').animate({scrollTop:0},500);" title="到顶部"><img src="images/float_ico05.png" width="42" height="42" alt="到顶部" /></a>
    </aside>
    
    <!--会员顶部-->
    <section class="member_top">
        <div class="main">
            <a class="logo" href="#"><img src="images/mymember/logo.png" /></a>
            <nav>
                <a class="sel" href="#">首页</a>
                <a href="#">个人主页</a>
                <a href="#">账户管理</a>
                <a href="#">消息</a>
            </nav>
            <div class="search">
                <input type="text" class="text" />
                <input type="submit" class="sub" value="搜索" />
            </div>
        </div>
    </section><!--member_top END-->
    
    <div class="clear"></div>
    
    <!--mymember-->
    <div class="myclear"></div>
    <div class="mymember_out">
        <div class="mymember_main">
            <div class="myclear" style="height:20px;"></div>
            <div class="mymember_menu">
                <div class="mymember_menu_part">
                    <a class="mymember_menu_tit sel01" href="javascript:void(0);"><img src="images/mymember/menu01.png" />订单中心</a>
                    <div class="leftmenu">
                        <a class="sel" href="#">我的订单</a>
                        <a href="#">评价结单</a>
                        <a href="#">取消订单记录</a>
                        <div class="clear h30"></div>
                    </div>
                </div><!--mymember_menu_part END-->
                <div class="mymember_menu_part">
                    <a class="mymember_menu_tit" href="javascript:void(0)"><img src="images/mymember/menu02.png" />关注中心</a>
                <div class="leftmenu" >
                    <a href="#">关注的商品</a>
                    <a href="#">浏览历史</a>
                    <div class="clear h30"></div>
                </div>
            </div><!--mymember_menu_part END-->
            <div class="mymember_menu_part">
                <a class="mymember_menu_tit" href="javascript:void(0)"><img src="images/mymember/menu03.png" />资产中心</a>
                <div class="leftmenu" >
                    <a href="#">优惠券</a>
                    <a href="#">积分</a>
                    <div class="clear h30"></div>
                </div>
            </div><!--mymember_menu_part END-->
            <div class="mymember_menu_part">
                <a class="mymember_menu_tit" href="javascript:void(0)"><img src="images/mymember/menu04.png" />客户服务</a>
                <div class="leftmenu" >
                    <a href="#">返修退换货</a>
                    <a href="#">我的投诉</a>
                    <a href="#">购买咨询</a>
                    <div class="clear h30"></div>
                </div>
            </div><!--mymember_menu_part END-->
            <div class="mymember_menu_part">
                <a class="mymember_menu_tit" href="javascript:void(0)"><img src="images/mymember/menu05.png" />设置</a>
                <div class="leftmenu" >
                    <a href="#">个人信息</a>
                    <a href="#">收货地址</a>
                    <div class="clear h30"></div>
                </div>
            </div><!--mymember_menu_part END-->
    
            <!-- <a class="leftmenu_bot" href="#">
            <span>丫丫会所</span>
            </a> -->
            </div><!--mymember_menu END-->
      
                    <div id="my_collect">
                        <#include "/client/user_collect.ftl">
                    </div>
          
                <div class="clear h10"></div>
            </div><!--mymember_info END-->
        </div><!--mymember_center END-->
      
        <div class="myclear"></div> 
    </div><!--mymember_main END-->
    <div class="myclear"></div>
    </div>
    <!--mymember END-->
    
    <div class="clear h20"></div>
    <section class="index_center">
    <table>
    <tr>
    <td>
    <a href="#"><img src="images/bot_ico01.png" /><span class="footer_sp01">品牌连锁 实体体验</span><span class="footer_sp02">品牌连锁 实体体验</span></a>
    </td>
    <td>
    <a href="#"><img src="images/bot_ico02.png" /><span class="footer_sp01">品牌连锁 实体体验</span><span class="footer_sp02">品牌连锁 实体体验</span></a>
    </td>
    <td>
    <a href="#"><img src="images/bot_ico03.png" /><span class="footer_sp01">品牌连锁 实体体验</span><span class="footer_sp02">品牌连锁 实体体验</span></a>
    </td>
    <td>
    <a href="#"><img src="images/bot_ico04.png" /><span class="footer_sp01">品牌连锁 实体体验</span><span class="footer_sp02">品牌连锁 实体体验</span></a>
    </td>
          
    </tr>
    </table>
    </section><!--index_center END-->
    <div class="clear h20"></div>
    <section class="bot_help main">
    <menu>
    <h3>关于我们</h3>
    <a href="#">关于丫丫</a>
    <a href="#">业务合作</a>
    <a href="#">高薪诚聘</a>
    <a href="#">丫丫会员积分</a>
    </menu>
    <menu>
    <h3>关于我们</h3>
    <a href="#">关于丫丫</a>
    <a href="#">业务合作</a>
    <a href="#">高薪诚聘</a>
    <a href="#">丫丫会员积分</a>
    </menu>
    <menu>
    <h3>关于我们</h3>
    <a href="#">关于丫丫</a>
    <a href="#">业务合作</a>
    <a href="#">高薪诚聘</a>
    <a href="#">丫丫会员积分</a>
    </menu>
    <menu>
    <h3>关于我们</h3>
    <a href="#">关于丫丫</a>
    <a href="#">业务合作</a>
    <a href="#">高薪诚聘</a>
    <a href="#">丫丫会员积分</a>
    </menu>
    <menu>
    <h3>关于我们</h3>
    <a href="#">关于丫丫</a>
    <a href="#">业务合作</a>
    <a href="#">高薪诚聘</a>
    <a href="#">丫丫会员积分</a>
    </menu>
    <menu>
    <h3>关于我们</h3>
    <a href="#">关于丫丫</a>
    <a href="#">业务合作</a>
    <a href="#">高薪诚聘</a>
    <a href="#">丫丫会员积分</a>
    </menu>
    <div class="bot_work">
    <div class="sys">
    <img src="images/sys01.png" style="margin-left:45px;" />
    <p class="lh30 fs20 pb5">微信平台</p>
    <p>微信二维码</p>
    <p>扫一扫更多惊喜带给您</p>
    </div>
    </div>
    <div class="clear h20"></div>
    </section>
    
    <footer class="mainfoot">
    <section class="main">
    <nav>
    <a href="#">关于丫丫</a>|
    <a href="#">团队介绍</a>|
    <a href="#">高薪诚聘</a>|
    <a href="#">业务合作</a>|
    <a href="#">会员积分</a>|
    <a href="#">投诉建议</a>|
    <a href="#">友情链接</a>
    </nav>
    <p class="c9 w100">
    Copyright©2006-2015 All Rights Reserved 丫丫手机网 版权所有 滇ICP备07004173号
    </p>
    <span><a title="云南网站建设" href="http://www.ynyes.com" target="_blank">网站建设</a><a>技术支持：</a><a title="云南网站建设" href="http://www.ynyes.com" target="_blank">昆明天度网络公司</a></span>
    </section>
    </footer><!--mainfoot END-->
</body>
</html>
