<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title><#if site??>${site.seoTitle!''}-</#if>个人中心</title>
        <meta name="keywords" content="${site.seoKeywords!''}">
        <meta name="description" content="${site.seoDescription!''}">
        <meta name="copyright" content="${site.copyright!''}" />
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
        <link rel="shortcut icon" href="/root/images/goods/zphk_logo.ico">
        
        <script type="text/javascript">
            $(document).ready(function(){
                menuDownList("top_phone","#top_phonelist",".a1","sel");
                phoneListMore();//单独下拉
                searchTextClear(".bottext","查看所有门店","#fff","#fff");
                menuDownList("top_order","#top_orderlist",".a4","sel");//顶部下拉
                myLeftMunu();//左侧菜单
            });
            
            function fliter(check,type){
                page = <#if pageId??>${pageId}<#else>0</#if>;
                if(null!=type&&1==type){
                    page=page-1;
                }
                
                if(null!=type&&0==type){
                    page=page+1;
                }
                
                if(null != check){
                    page = document.getElementById("iPageNum").value;
                    if(""==page){
                        return;
                    }
                    if(!/^[0-9]*[1-9][0-9]*$/.test(page)){
                        return;
                    }
                    if(page > ${order_page.totalPages}){
                        return;
                    }
                    page = page-1
                }
                
                var keywords = document.getElementById("keywords").value;
                var time_limit = document.getElementById("time_limit").value;
                var order_status = document.getElementById("order_status").value;
                $.post("/user/myOrder",
                    {
                        "page":page,
                        "keywords":keywords,
                        "time_limit":time_limit,
                        "order_status":order_status
                    },function(data){
                        console.debug(document.getElementById("my_order"));
                        $("#my_order").html(data);
                });
            }
            function getOrder(order_status){
                $.post("/user/myOrder",
                    {
                        "page":0,
                        "keywords":"",
                        "time_limit":1,
                        "order_status":order_status
                    },function(data){
                        console.debug(document.getElementById("my_order"));
                        $("#my_order").html(data);
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
        <!--
        <aside class="floatbox">
            <a href="#" title="微信客服"><img src="images/float_ico01.png" width="42" height="42" alt="微信客服" /><span><img src="images/sys01.png" /></span></a>
            <a href="#" title="在线咨询"><img src="images/float_ico02.png" width="42" height="42" alt="在线咨询" /></a>
            <a href="#" title="新浪微博"><img src="images/float_ico03.png" width="42" height="42" alt="新浪微博" /></a>
            <a href="#" title="服务热线"><img src="images/float_ico04.png" width="42" height="42" alt="服务热线" /><span><img src="images/sys02.png" /></span></a>
            <a href="javascript:$('html,body').animate({scrollTop:0},500);" title="到顶部"><img src="images/float_ico05.png" width="42" height="42" alt="到顶部" /></a>
        </aside>
        -->
        <!--会员顶部-->
        <section class="member_top">
            <div class="main">
                <a class="logo" href="#"><img src="images/mymember/logo.png" /></a>
                <nav>
                    <a class="sel" href="/user">首页</a>
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
                            <div class="leftmenu">
                                <a href="/user/collect/list">关注的商品</a>
                                <a href="/user/recent/list">浏览历史</a>
                                <div class="clear h30"></div>
                            </div>
                        </div><!--mymember_menu_part END-->
                        <div class="mymember_menu_part">
                            <a class="mymember_menu_tit" href="javascript:void(0)"><img src="images/mymember/menu03.png" />资产中心</a>
                            <div class="leftmenu">
                                <a href="#">优惠券</a>
                                <a href="/user/point/list">积分</a>
                                <div class="clear h30"></div>
                            </div>
                        </div><!--mymember_menu_part END-->
                        <div class="mymember_menu_part">
                            <a class="mymember_menu_tit" href="javascript:void(0)"><img src="images/mymember/menu04.png" />客户服务</a>
                            <div class="leftmenu">
                                <a href="#">返修退换货</a>
                                <a href="#">我的投诉</a>
                                <a href="/user/consult/list">购买咨询</a>
                                <div class="clear h30"></div>
                            </div>
                        </div><!--mymember_menu_part END-->
                        <div class="mymember_menu_part">
                            <a class="mymember_menu_tit" href="javascript:void(0)"><img src="images/mymember/menu05.png" />设置</a>
                            <div class="leftmenu">
                                <a href="#">个人信息</a>
                                <a href="#">收货地址</a>
                                <div class="clear h30"></div>
                            </div>
                        </div><!--mymember_menu_part END-->
            
                        <!-- <a class="leftmenu_bot" href="#">
                        <span>丫丫会所</span>
                        </a> -->
                        </div><!--mymember_menu END-->
                        
                        <div class="mymember_mainbox">
                            <#if user??>
                                <menu class="member_check">
                                    <a class="head" href="#" style="background-image: url('${user.headImageUri!'../images/mymember/head.png'}')"></a>
                                    <section>
                                        <p class="fs18">${user.username!""}</p>
                                        <!--<p>安全等级：<span class="green">中</span></p>-->
                                    </section>
                                    <#if order_page??&&order_page.content??>
                                    
                                        <#assign finish_order=0>
                                        <#assign receiving_order=0>
                                        <#assign non_deliver_order=0>
                                        <#assign non_payed_order=0>
                                        
                                        <#list order_page.content as item>
                                            <#if item.statusId??>
                                                <#switch item.statusId>
                                                    <#case 2>
                                                        <#assign non_payed_order=non_payed_order+1>
                                                    <#break>
                                                    <#case 3>
                                                        <#assign non_deliver_order=non_deliver_order+1>
                                                    <#break>
                                                    <#case 4>
                                                        <#assign receiving_order=receiving_order+1>
                                                    <#break>
                                                    <#case 6>
                                                        <#assign finish_order=finish_order+1>
                                                    <#break>
                                                </#switch> 
                                            </#if>
                                        </#list>
                                        <div class="personlook">
                                            <a class="a1 a5" href="javascript:getOrder(6);">
                                                <span></span>已完成${finish_order!'0'}
                                            </a>
                                            <a class="a1 a6" href="javascript:getOrder(4);">
                                                <span></span>待收货${receiving_order!''}
                                            </a>
                                            <a class="a1 a7" href="javascript:getOrder(3);">
                                                <span></span>待发货${non_deliver_order!''}
                                            </a>
                                            <a class="a1 a8" href="javascript:getOrder(2);">
                                                <span></span>待付款${non_payed_order!''}
                                            </a>
                                        </div>   
                                    </#if>
                                    <div class="clear"></div>
                                </menu>
                            </#if>
                            <!--mymember_info END-->
                            <div id="my_order">
                                <#include "/client/user_order.ftl">
                            </div>
                            
                            <!--mymember_info END-->
                            <div class="mymember_info">
                                <h3 id="mymember_likecheck">
                                    <a class="mysel" href="#">&nbsp;</a>
                                    <a href="#">&nbsp;</a>
                                    <a href="#">&nbsp;</a>
                                    <span>猜你喜欢</span>
                                </h3>
                                
                                <ul id="mymember_likelist">
                                    <#assign li_num=0>
                                    <#if recommend_goods_page??>
                                        <#list recommend_goods_page.content as item>
                                            <#if item_index==0||item_index==6||item_index==12>
                                                <li>
                                            </#if>
                                                <#if item_index lt 6>
                                                    <a href="/goods/${item.id?c}">
                                                        <img src="${item.coverImageUri!''}" />
                                                        <p>${item.title!''}</p>
                                                        <p class="red">￥<span><#if item.totalPrice??>${item.totalPrice?string("0.00")}<#else>0.00</#if></span></p>
                                                    </a>
                                                </#if>
                                                <#if item_index gt 5&&item_index lt 12>
                                                    <a href="/goods/${item.id?c}">
                                                        <img src="${item.coverImageUri!''}" />
                                                        <p>${item.title!''}</p>
                                                        <p class="red">￥<span><#if item.totalPrice??>${item.totalPrice?string("0.00")}<#else>0.00</#if></span></p>
                                                    </a>
                                                </#if>
                                                <#if item_index gt 11&&item_index lt 18>
                                                    <a href="/goods/${item.id?c}">
                                                        <img src="${item.coverImageUri!''}" />
                                                        <p>${item.title!''}</p>
                                                        <p class="red">￥<span><#if item.totalPrice??>${item.totalPrice?string("0.00")}<#else>0.00</#if></span></p>
                                                    </a>
                                                </#if>
                                            <#if item_index==5||item_index==11||item_index==17>
                                                </li>
                                            </#if>
                                        </#list>
                                    </#if>
                                </ul>
                                <div class="clear h30"></div>
                            </div><!--mymember_info END-->
                            <script type="text/javascript">
                                $(document).ready(function(){
                                    mymemberMenuCheck("mymember_likecheck","a","mymember_likelist","li","mysel");
                                });
                            </script>
                        </div>
                        <!--mymember_center END-->
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
                            <p class="c9 w100">Copyright©2006-2015 All Rights Reserved 丫丫手机网 版权所有 滇ICP备07004173号</p>
                            <span><a title="云南网站建设" href="http://www.ynyes.com" target="_blank">网站建设</a><a>技术支持：</a><a title="云南网站建设" href="http://www.ynyes.com" target="_blank">昆明天度网络公司</a></span>
                        </section>
                    </footer><!--mainfoot END-->
    </body>
</html>




  











