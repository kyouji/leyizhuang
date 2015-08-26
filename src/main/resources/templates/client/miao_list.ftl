<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>正品惠客-惠客秒杀</title>
<!--css-->
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link href="/client/css/Spike.css" rel="stylesheet" type="text/css" />
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script>
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
<!--顶部ad大小：1920 90-->
<div class="top_ad"><img src="images/topad.png" /></div>

<!--顶部-->
<div class="top_all">
	<div class="top">
    	<div class="top_left">
        	<div class="top_left_welcome">欢迎光临正品惠客</div>
            <a href="#" title="" >请登录</a>
            
            <a href="#" title="" >免费注册</a>
        </div>
        <div class="top_right">
        	<a href="#" title="">我的惠客</a>
            <a class="top_right_like" href="#" title="">我的关注</a>
            <a class="top_right_hk" href="#" title="">我的惠客</a>
        </div>
    </div>
	
</div>

<!--头部-->
<div class="header">
	<!--logo大小：190 58-->
	<div class="header_logo"><img src="images/logo.png" /></div>
    <!--广告语大小：183 58-->
    <div class="header_ad"><img src="images/headerad.png" /></div>
    
    <div class="header_search">
    	<div class="header_search_top">
        	<input type="text" class="header_search_top_text">
            <input class="header_search_top_btn" value="搜索" />
        </div>
        <div class="header_search_bot">
        热门搜索：
        	<a href="#" title="">盖世6iPhone</a>
            <a href="#" title="">6苹果ipad</a>
            <a href="#" title="">三星Note4</a>
            <a href="#" title="">魅族魅蓝</a>
            <a href="#" title="">华硕K455LD4210</a>
            <a href="#" title="">OPPO R7</a>
  
        </div>
    </div>
   
   <!--购物车--> 
    <div id="shopping_down" class="shopping_box">
        <span class="sp1">
        	0
        </span>
        <a class="a9" href="/cart"><img src="images/liebiao_09.png" width="28" height="28" />购物车<i></i></a>
        <menu>
            <#if cart_goods_list?? && cart_goods_list?size gt 0>

                <#assign totalGoods=0>
                <#assign totalPrice=0>
                <h2>最新加入的商品</h2>
                <#list cart_goods_list as item>
                    <div class="shopping_list">
                        <div class="clear"></div>
                        <a class="a2" href="/goods/${item.goodsId}"><img src="${item.goodsCoverImageUri!''}" /></a>
                        <a class="a3" href="/goods/${item.goodsId}">${item.goodsTitle!''}</a>
                        <p>￥<#if item.price??>${item.price?string("0.00")} x ${item.quantity!''}</#if><a href="javascript:delItem(${item.id});">删除</a></p>
                        <div class="clear"></div>
                    </div>
                    <#if item.isSelected>
                        <#assign totalGoods=totalGoods+item.quantity>
                        <#if item.price??>
                            <#assign totalPrice=totalPrice+item.price*item.quantity>
                        </#if>
                    </#if>
                </#list>
                
                <h4 class="shopping_price">
                    共<#if cart_goods_list??>${cart_goods_list?size}<#else>0</#if>件商品 &nbsp;&nbsp;共计<span class="fw-b">￥<#if totalPrice??>${totalPrice?string(0.00)}</#if></span>
                    <a href="/cart">去结算</a>
                </h4>
            <#else>
                <h3 class="ta-c pa15 fs14 fw400">购物车中还没有商品，赶紧选购吧！</h3>
            </#if>
        </menu>
    </div>
    
</div>

<!--导航-->
<div class="navigation">
	<div class="nav">
        <div class="nav_submenu">全部商品分类</div>
        <div class="nav_nav">
        	<ul>
            	<li><a href="#" title="">首页</a></li>
                <li><a href="#" title="" class="nav_choiced">惠客秒杀</a></li>
                <li><a href="#" title="">惠客团购</a></li>
                <li><a href="#" title="">惠客众筹</a></li>
                <li><a href="#" title="">惠客积分</a></li>
                <li><a href="#" title="">生活服务</a></li>
                <li><a href="#" title="">售后服务</a></li>
            </ul>
        </div>        
        <div class="nav_num">全国服务热线：400-023-4567</div>
    </div>
</div>

<!--秒杀开始-->
<div class="hui_spike">
    <ul>
        <#if miao_goods_page??>
            <#list miao_goods_page.content as item>
<script>
$(document).ready(function(){
    setInterval("timer${item_index}()",1000);
});

function timer${item_index}()
{
<#if item.isFlashSale && item.flashSaleStartTime < .now && item.flashSaleStopTime gt .now>
    var ts = (new Date(${item.flashSaleStopTime?string("yyyy")}, 
                parseInt(${item.flashSaleStopTime?string("MM")}, 10)-1, 
                ${item.flashSaleStopTime?string("dd")}, 
                ${item.flashSaleStopTime?string("HH")}, 
                ${item.flashSaleStopTime?string("mm")}, 
                ${item.flashSaleStopTime?string("ss")})) - (new Date());//计算剩余的毫秒数
    
    var allts = (new Date(${item.flashSaleStopTime?string("yyyy")}, 
                parseInt(${item.flashSaleStopTime?string("MM")}, 10)-1, 
                ${item.flashSaleStopTime?string("dd")}, 
                ${item.flashSaleStopTime?string("HH")}, 
                ${item.flashSaleStopTime?string("mm")}, 
                ${item.flashSaleStopTime?string("ss")}))
               - (new Date(${item.flashSaleStartTime?string("yyyy")}, 
                parseInt(${item.flashSaleStartTime?string("MM")}, 10)-1, 
                ${item.flashSaleStartTime?string("dd")}, 
                ${item.flashSaleStartTime?string("HH")}, 
                ${item.flashSaleStartTime?string("mm")}, 
                ${item.flashSaleStartTime?string("ss")}));//总共的毫秒数
                
    if (0 >= ts)
    {
        window.location.reload();
    }
    
    var date = new Date();
    var dd = parseInt(ts / 1000 / 60 / 60 / 24, 10);//计算剩余的天数
    var hh = parseInt(ts / 1000 / 60 / 60 % 24, 10);//计算剩余的小时数
    var mm = parseInt(ts / 1000 / 60 % 60, 10);//计算剩余的分钟数
    var ss = parseInt(ts / 1000 % 60, 10);//计算剩余的秒数
    dd = checkTime(dd);
    hh = checkTime(hh);
    mm = checkTime(mm);
    ss = checkTime(ss);
    $("#timeLeft${item_index}").html("<span>"+dd+"</span>天<span>"+hh+"</span>时<span>"+mm+"</span>分<span>"+ss+"</span>秒");          
</#if>
}
</script>
                <li>
                    <a href="#" class="iPhone6">
                        <img width="300" height="300" src="${item.coverImageUri!''}" />
                    </a>
                    <div class="spike_right">
                        <a href="#" class="trait">${item.title!''}</a>                
                        <p class="special_offer">
                            <del>原价<br />￥<span><#if item.salePrice??>${item.salePrice?string("0.00")}</#if></span></del>
                            <b>节省<br /><span><#if item.salePrice?? && item.flashSalePrice??>${(item.salePrice-item.flashSalePrice)?string("0.00")}</#if></span></b>
                        </p>
                        <div class="time_left">
                            <div id="timeLeft${item_index}"><span>00</span>天<span>00</span>时<span>00</span>分<span>00</span>秒</div>
                            <div class="remaining">还剩<span>${item.flashSaleLeftNumber?c}</span>件</div>
                        </div>
                        
                    </div>
                    <div class="snapped_up">
                        <input type="submit" class="snapp" value="立即抢购">
                        <b class="snapp_price">￥<span><#if item.salePrice??>${item.flashSalePrice?string("0.00")}</#if></span></b>
                    </div>
                </li>
            </#list>
        </#if>
    </ul>
</div>
<!--秒杀结束-->

<!--底部footer-->
<div class="footerall">
    <div class="footer_iconsall">
        <div class="footer_icons">
            <dl>
                <dt><img src="images/icons-footer1.png" /></dt>
                <dd>闪电发货</dd>
            </dl>
            <dl>
                <dt><img src="images/icons-footer2.png" /></dt>
                <dd>全场正品</dd>
            </dl>
            <dl>
                <dt><img src="images/icons-footer3.png" /></dt>
                <dd>无理由退货</dd>
            </dl>
            <dl>
                <dt><img src="images/icons-footer4.png" /></dt>
                <dd>全场包邮</dd>
            </dl>
            <dl>
                <dt><img src="images/icons-footer5.png" /></dt>
                <dd>货到付款</dd>
            </dl>
            <dl>
                <dt><img src="images/icons-footer6.png" /></dt>
                <dd>正规发票</dd>
            </dl>
            <dl>
                <dt><img src="images/icons-footer7.png" /></dt>
                <dd>快速售后</dd>
            </dl>
        </div>    
    </div>

	<div class="footer_link">
    	<ul>
        	<li><a href="#" title="">关于我们</a></li>
            <li><a href="#" title="">关于惠客</a></li>
            <li><a href="#" title="">业务合作</a></li>
            <li><a href="#" title="">高薪诚聘</a></li>
            <li><a href="#" title="">惠客会员积分</a></li>
        </ul>
        <ul>
        	<li><a href="#" title="">特色服务</a></li>
            <li><a href="#" title="">免费上门取件维修</a></li>
            <li><a href="#" title="">自提点门店</a></li>
            <li><a href="#" title="">大宗客户直通车</a></li>
            <li><a href="#" title="">延保服务</a></li>
        </ul>
        <ul>
        	<li><a href="#" title="">支付方式</a></li>
            <li><a href="#" title="">分期付款</a></li>
            <li><a href="#" title="">货到付款</a></li>
        </ul>
        <ul>
        	<li><a href="#" title="">配送方式</a></li>
            <li><a href="#" title="">免费送货上门</a></li>
            <li><a href="#" title="">3小时及时达</a></li>
            <li><a href="#" title="">全国包邮</a></li>
            <li><a href="#" title="">全省次日达</a></li>
        </ul>
        <ul>
			<li><a href="#" title="">售后服务</a></li>
            <li><a href="#" title="">售后地址</a></li>
            <li><a href="#" title="">售后服务说明</a></li>
            <li><a href="#" title="">维修价格表</a></li>
            <li><a href="#" title="">刷机升级</a></li>
        </ul>
        <ul>
            <li><a href="#" title="">常见问题</a></li>
            <li><a href="#" title="">手机小百科</a></li>
            <li><a href="#" title="">如何咨询评价商品</a></li>
            <li><a href="#" title="">投诉建议</a></li>
            <li><a href="#" title="">购机流程</a></li>
        </ul>
    </div>
    
    <div class="footerall_copyall">
            <div class="footerall_copy">
                友情链接：<a href="#" title="">曲靖信息港</a><a href="#" title="">宝善街网</a> <br />
                <span>Copyright©2006-2014 All Rights Reserved 丫丫网 版权所有 滇ICP备07004173号</span>
            </div>
    </div>    
</div>
</body>
</html>
