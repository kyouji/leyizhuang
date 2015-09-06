<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="chinaz-site-verification" content="0571b99b-03be-45ff-b0b0-bc3be3aa6957" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1,user-scalable=0, minimal-ui">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css" href="/touch/css/style.css"/>
<link rel="stylesheet" type="text/css" href="/touch/css/sales.css"/>
<title>团购</title>

<script src="/touch/js/swipe.js"></script>
<script src="/touch/js/ender.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        this.myScroll = $('#wrapper').iScroll({
            snap: true,
            momentum: false,
            hScrollbar: false,
            onScrollEnd: function () {
                document.querySelector('#indicator > li.active').className = '';
                document.querySelector('#indicator > li:nth-child(' + (this.currPageX+1) + ')').className = 'active';
            }
        })
    })
    
    function checkTime(i)  
    {  
        if (i < 10) {  
            i = "0" + i;  
        }  
        return i;  
    }
</script>
</head>

<body>
    <!--Begin-->
    <div class="zphk">
    
        <!--顶部标题与搜索框-->
        <header class="maintop">
            <div class="main">
                <p>团购</p>
                <a class="a1" href="javascript:history.go(-1)"><img src="/touch/images/back.png" height="22" /></a>
                <a class="a2" href="/touch"><img src="/touch/images/home2.png" height="22" /></a>
            </div>
        </header>   
        <div class="clear"></div>  
        <!--banner图
        <div class="banner">
        <img src="images/banner_1.gif" />
        </div>-->
    
        <!--Luara图片切换骨架begin-->
        <div class="addWrap">
            <div class="swipe" id="mySwipe">
                <div class="swipe-wrap">
                    <div><a href="javascript:;"><img class="img-responsive" src="images/1.jpg"/></a></div>
                    <div><a href="javascript:;"><img class="img-responsive" src="images/2.jpg"/></a></div>
                    <div><a href="javascript:;"><img class="img-responsive" src="images/3.jpg"/></a></div>
                </div>
            </div>
            <ul id="position">
                <li class="cur"></li>
                <li class=""></li>
                <li class=""></li>
            </ul>
        </div>
        <script type="text/javascript">
            var bullets = document.getElementById('position').getElementsByTagName('li');
            var banner = Swipe(document.getElementById('mySwipe'), {
                auto: 2000,
                continuous: true,
                disableScroll:false,
                callback: function(pos) {
                    var i = bullets.length;
                    while (i--) {
                        bullets[i].className = ' ';
                    }
                        bullets[pos].className = 'cur';
                    }
            });
        </script>
    
        <!--导航菜单-->
        <div class="nav">
            <ul class="listico"> 
                <li class="icon_1"><a href="#" class="ico1">商品分类</a></li> 
                <li class="icon_2"><a href="#" class="ico2">我的订单</a></li> 
                <li class="icon_3"><a href="#" class="ico3">个人中心</a></li> 
                <li class="icon_4"><a href="#" class="ico4">我的关注</a></li> 
                <li class="icon_5"><a href="#" class="ico5">我的积分</a></li> 
                <li class="icon_6"><a href="#" class="ico6">收货地址</a></li> 
                <li class="icon_7"><a href="#" class="ico7">购物车</a></li> 
                <li class="icon_8"><a href="#" class="ico8">我的评价</a></li> 
            </ul> 
        </div>
    
        <!--即将开团-->
        <#if going_goods_list??&&going_goods_list?size gt 0>
            <div class="all_hot">
                <div class="title">即将开团<!--<label>每天<span>9:30</span>上新</label>--></div>
        
                <!--滑动图片-->        
                <div class="box_163css">
                    <div id="wrapper" style="overflow: hidden;">
                        <div id="scroller" style="-webkit-transition-property: -webkit-transform; transition-property: -webkit-transform; -webkit-transform-origin: 0px 0px 0px; -webkit-transform: translate3d(0px, 0px, 0px);">
                            <ul id="thelist">
                            <#assign isLi=0>
                                <#list going_goods_list as item>
                                    <#if isLi==0>
                                        <li>
                                    </#if>
                                        <a href="#" title=""><span><img src="${item.groupSaleImage!''}"><em>￥${item.groupSalePrice?string("0.00")}</em></span></a>
                                        <#assign isLi=(isLi+1)>
                                        <#if isLi==2>
                                            </li>
                                            <#assign isLi=0>
                                        </#if>    
                                </#list>
                            </ul>
                        </div>
                    </div>
                    <div id="nav">
                        <div id="prev" onclick="myScroll.scrollToPage(&#39;prev&#39;, 0);return false">&nbsp;</div>
                        <#if going_goods_list?size%2==0>
                            <#assign totalPage=(going_goods_list?size/2)>
                        <#else>
                            <#assign totalPage=(going_goods_list?size/2+1)>
                        </#if>
                            <ul id="indicator">
                                <#list 1..totalPage as item>
                                    <#if item_index==0>
                                        <li class="active">${item}</li>
                                    <#else>
                                        <li>${item}</li>
                                    </#if>
                                </#list>
                            </ul>
                        <div id="next" onclick="myScroll.scrollToPage(&#39;next&#39;, 0);return false">&nbsp;</div>
                    </div>
                </div>
                <!--滑动图片end-->
                
            </div>
        </#if>
    
        <#if tuan_goods_list??&&tuan_goods_list?size gt 0>
            <div class="all_hot">
                <ul class="title">正在团购</ul>
                <#list tuan_goods_list as item>
                    <a class="phone_list" href="/touch/goods/${item.id?c}?promotion=nowTuan">
                        <b><img src="${item.groupSaleImage!''}" /></b>
                        <p class="p1">${item.title!''}</p>
                        <p class="p_1">${item.subTitle!''}</p>
                        <p class="p2"><label class="p2_l1">团购价:￥<span>${item.groupSalePrice?string("0.00")}</span></label></p>
                        <p class="p2"><label class="p2_l2">原价：￥<span>${item.salePrice?string("0.00")}</span></label></p>
                        <p id="tuan_time${item_index}" tyle="display:block;"></p>
                        <script type="text/javascript" src="/touch/js/jquery-1.9.1.min.js"></script>
                        <script type="text/javascript">
                            $(document).ready(function(){
                                tuanTimer${item_index}();
                                setInterval("tuanTimer${item_index}()",1000);
                            });
                    
                            function tuanTimer${item_index}(){
                                    var ts = (new Date(${item.groupSaleStopTime?string("yyyy")}, 
                                    parseInt(${item.groupSaleStopTime?string("MM")}, 10)-1, 
                                    ${item.groupSaleStopTime?string("dd")}, 
                                    ${item.groupSaleStopTime?string("HH")}, 
                                    ${item.groupSaleStopTime?string("mm")}, 
                                    ${item.groupSaleStopTime?string("ss")})) - (new Date());
                                    if (0 == ts)
                                    {
                                        window.location.reload();
                                    }
        
                                    var date = new Date();
                                    var dd = parseInt(ts / 1000 / 60 / 60 / 24, 10);
                                    var hh = parseInt(ts / 1000 / 60 / 60 % 24, 10);
                                    var mm = parseInt(ts / 1000 / 60 % 60, 10);
                                    var ss = parseInt(ts / 1000 % 60, 10);
                                    dd = checkTime(dd);
                                    hh = checkTime(hh);
                                    mm = checkTime(mm);
                                    ss = checkTime(ss);
                                    $("#tuan_time${item_index}").html("剩余时间：<span>"
                                    + dd + "</span>天<span>"
                                    + hh + "</span>时<span>"
                                    + mm + "</span>分<span>"
                                    + ss + "</span>秒");
                                }
                        </script>
                        <div class="clear2"></div>
                        <h6>
                            <#if item.groupSaleLeftNumber==0>
                                <span>已售完</span>
                            <#else>
                                <span>还剩： </span>${item.groupSaleLeftNumber!'0'}<span>件</span>
                            </#if>
                        </h6>
                    </a>
                </#list>
            </div>
        </#if>
        <!--底部导航-->
        <#include "/touch/common_footer.ftl">
        
        <!--版权备案-->
        <#include "/touch/common_touch_copyright.ftl">        
        <!--底部-->
        <#include "/touch/common_touch_menu.ftl">
    <!--END!-->
</body>
</html>
