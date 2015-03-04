<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>荣诚手机超市</title>
<meta name="keywords" content="荣诚手机超市" />
<meta name="description" content="荣诚手机超市" />
<meta name="copyright" content="荣诚手机超市 版权所有" />
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/rcindex.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/Tm/js/jquery-1.11.2.js"></script>
</head>
<body>
<header>
<div class="main">
<div class="fll header_l"><#if user??><span>您好，<a href="/user/info" >${user.username}</a>欢迎来到荣诚手机超市！您的身份：${user.role}&nbsp;&nbsp;<a href="/logout" >退出</a></span><#else><span>您好，欢迎来到荣诚手机超市！<a href="/login" id="orange">登录</a>&nbsp;&nbsp;&nbsp;<a href="/reg">免费注册</a></span></#if></div>
<div class="flr header_r"><a href="/user/collect">我的收藏</a><a href="#">销售网点</a><a href="#">手机版切换</a><a href="/order/list">我的订单</a><a href="/help/question/1">帮助中心</a><a href="#">收藏本站</a></div>
</div>
</header>

<div class="header1 main">
<div class="fll logo"><a href="#" title="荣诚手机超市"><img src="img/rc_logo.png" width="177" height="69"></a></div>
<div class="fll city"><a href="#" id="city">城市切换</a><span></span>
<div class="cityqh" style="display:none" id="change"><ul>
<li><a href="javascript:void(0)" onclick="change_city(this.name)" name="昆明市">昆明市</a></li>
<li><a href="javascript:void(0)" onclick="change_city(this.name)" name="曲靖市">曲靖市</a></li>
<li><a href="javascript:void(0)" onclick="change_city(this.name)" name="大理州">大理州</a></li>
<li><a href="javascript:void(0)" onclick="change_city(this.name)" name="西双版纳">西双版纳</a></li>
<li><a href="javascript:void(0)" onclick="change_city(this.name)" name="德宏州">德宏州</a></li>
<li><a href="javascript:void(0)" onclick="change_city(this.name)" name="丽江市">丽江市</a></li>
</ul></div>


</div>
<div class="sercha fll">
<input class="topnews1_serch" type="text" onfocus="if(value=='热搜机型： iphone 6   MX4 Pro   HTC M8') {value=''}" onblur="if (value=='') {value='热搜机型： iphone 6   MX4 Pro   HTC M8'}"  value="热搜机型： iphone 6   MX4 Pro   HTC M8">
<input type="submit" class="search-btn" title="搜索" value="  ">
<div class="rc_newsgg"><span>新闻公告:</span><a href="#">>>黄章：魅蓝Note有电信版，一月还将发新品</a></div>
</div>
<div class="fll rc_phone"><span>客服电话：400-888-8888</span></div>
<div class="flr rc_gwc"><a href="/cart">购物车（1）</a></div>
</div>






<nav>
   <div class="main">
     <div class="nav_more fll"><div class="nav_more1"><a href="/type/list" title="全部商品分类" class="nav_more15" id="goods">全部商品分类</a></div>

<ul id="goods_style" style="display:none">
    <#if root_type_list??>
        <#list root_type_list as type>
            <li id="phone">
                <div class="mbj m1"></div>
                        
                    <div class="divshop">
                    <h4><a href="/list/${type.id}">${type.name}</a></h4>
                    <p><a href="#">小米</a><a href="#">苹果（Apple）</a><a href="#">联想</a><a href="#">电信4G</a></p>
                </div>
                        
                <div class="clear"></div>
                
                <div class="threeright">
                    <ul id="threeright1" style="display:none">
                    <li><span>品牌：</span><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a></li>
                    <li><span>品牌：</span><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a></li>
                    <li><span>品牌：</span><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a></li>
                    <li><span>品牌：</span><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a></li>
                    </ul>
                </div>
            </li>
        </#list>
    </#if>
    <li id="phone">
        <div class="mbj m1"></div>
                
            <div class="divshop">
    		<h4><a href="/list/2">手机产品</a></h4>
    		<p><a href="#">小米</a><a href="#">苹果（Apple）</a><a href="#">联想</a><a href="#">电信4G</a></p>
    	</div>
        		
        <div class="clear"></div>
        
        <div class="threeright">
            <ul id="threeright1" style="display:none">
            <li><span>品牌：</span><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a></li>
            <li><span>品牌：</span><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a></li>
            <li><span>品牌：</span><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a></li>
            <li><span>品牌：</span><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a></li>
            </ul>
        </div>
    </li>

    <li id="phone_body">
        <div class="mbj m2"></div>
			<div class="divshop">
			<h4><a href="/list/3">手机配件</a></h4>
			<p><a href="#">小米</a><a href="#">苹果（Apple）</a><a href="#">联想</a><a href="#">电信4G</a></p>
			</div>
        <div class="clear"></div>
    </li>
    
    <li id="phone_number">
        <div class="mbj m3"></div>
            <div class="divshop">
			<h4><a href="/list/4">手机靓号</a></h4>
			<p><a href="#">小米</a><a href="#">苹果（Apple）</a><a href="#">联想</a><a href="#">电信4G</a></p>
			</div>
        <div class="clear"></div>
    </li>
</ul>

</div>

<div class="nav_2 fll ml4">
	<ul>
		<li><a href="/" title="首页">首页</a></li>
		
		<li><a href="/list/1" title="明星产品">明星产品</a></li>
		<li><a href="/list/2" title="手机产品">手机产品</a></li>
		<li><a href="/list/3" title="手机配件">手机配件</a></li>
		<li><a href="/list/4" title="靓号选择">靓号选择</a></li>
		<li><a href="/list/5" title="新闻资讯">新闻资讯</a></li>
	</ul>
</div>

</div>
</nav>





<div class="main mt10 rc_ppfl">
<span class="fll">品牌分类：</span>
<ul>
<#if recommend_brand_list??>
<#list recommend_brand_list as brand>
    <#if brand_index < 9>
        <li><a href="javascript:;"><img src="${brand.logoUri}" width="90" height="45"></a></li>
    </#if>
</#list>
</#if>
</ul>
<a href="#">更多>></a>
</div>

<div class="clear h10"></div>

<div class="banner">
    <#if banner_ad??>
        <a href="${banner_ad.destinationUri}" title="${banner_ad.name}" style="background:url(${banner_ad.imageUri}) center no-repeat;"></a>
    </#if>
</div>

<div class="main mt20">
<div class="floor"><span>1F-限时抢购</span></div>
<div class="floor_1 mt10">
<table>
<tr>
<#if flash_sale_product_list??>
    <#list flash_sale_product_list as product>
        <td class="fubox">
            <div class="daojishi">
                <span id="clock"></span><a href="#">立即抢购</a>
            </div>
            <div class="fupic">
                <a href="#"><img src="${product.coverImageUri}" width="360" height="326"></a>
            </div>
            <div class="fuzi">
                <a href="#">
                    <h2>${product.name}</h2>
                    <h3>${product.brief}</h3>
                    <h4>${product.flashSalePrice?string("#.##")}元<span>原价：${product.versionList[0].salePrice?string("#.##")}元</span></h4>
                </a>
            </div>
        </td>
    </#list>
</#if>
</tr>
</table>
</div>
</div>


<div class="main mt20">
<div class="floor"><span>2F-明星产品</span></div>
<div class="floor_1 mt10">
<table>
<tr>
<#if star_product_list??>
    <#list star_product_list as product>
        <#if product_index < 2>
            <td class="fubox">
                <div class="fupic">
                    <a href="#"><img src="${product.coverImageUri}" width="360" height="326"></a>
                </div>
                <div class="fuzi">
                    <a href="#">
                        <h2>${product.name}</h2>
                        <h3>${product.brief}</h3>
                        <h4>${product.versionList[0].salePrice?string("#.##")}元</h4>
                    </a>
                </div>
            </td>
        </#if>
    </#list>
</#if>
</tr>
</table>
</div>

<div class="floor_1_1">
<table>
<tr>
<#if star_product_list??>
    <#list star_product_list as product>
        <#if product_index gt 1 && product_index lt 6 >
            <td>
                <a href="#">
                    <p>${product.name}<br />${product.brief}<br />抢购价：￥${product.versionList[0].salePrice?string("#.##")}</p>
                    <img src="${product.coverImageUri}" width="296" height="296">
                </a>
            </td>
        </#if>
    </#list>
</#if>
</tr>
</table>
</div>
</div>

<div class="main mt20">
    <div class="floor"><span>3F-手机产品</span></div>
    <div class="floor_2 mt10">
        <ul>
            <li><a href="#" class="floor_2xz">手机大全</a></li>
            <li><a href="#">平板电脑</a></li>
        </ul>
    </div>
    
    <div class="floor_2_1 mt10">
        <div class="fll floor_2_2">
            <#if phone_left_ad??>
                <a href="${phone_left_ad.destinationUri}"><img src="${phone_left_ad.imageUri}" width="210" height="461"></a>
            </#if>
        </div>
        
        <div class="fll floor_2_3">
            <ul>
                <#list phone_ad_list as ad>
                    <li><a href="${ad.destinationUri}"><img src="${ad.imageUri}" width="346" height="230"></a></li>
                </#list>
            </ul>
        </div>
        <div class="flr floor_2_4">
            <div class="floor_2_4_a"><span>TOP销售排行榜</span></div>
            <div class="floor_2_4_b">
                <ul>
                    <#if phone_hot_product_list??>
                        <#list phone_hot_product_list as product>
                            <li>
                                <span class="tophong">${product_index+1}</span>
                                <span class="topjieshao">
                                    <p>${product.name} ${product.brief}</p>
                                    <p>￥${product.versionList[0].salePrice?string("#.##")}</p>
                                </span>
                                <a href="#"><img src="${product.coverImageUri}" width="78" height="78"></a>
                            </li>
                        </#list>
                    </#if>
                </ul>
            </div>
        </div>
    </div>
    <div class="floor_2_1 mt10">
        <div class="fll floor_2_2">
            <#if pad_left_ad??>
                <a href="${pad_left_ad.destinationUri}"><img src="${pad_left_ad.imageUri}" width="210" height="461"></a>
            </#if>
        </div>
        
        <div class="fll floor_2_3">
            <ul>
                <#list pad_ad_list as ad>
                    <li><a href="${ad.destinationUri}"><img src="${ad.imageUri}" width="346" height="230"></a></li>
                </#list>
            </ul>
        </div>
        <div class="flr floor_2_4">
            <div class="floor_2_4_a"><span>TOP销售排行榜</span></div>
            <div class="floor_2_4_b">
                <ul>
                    <#if pad_hot_product_list??>
                        <#list pad_hot_product_list as product>
                            <li>
                                <span class="tophong">${product_index+1}</span>
                                <span class="topjieshao">
                                    <p>${product.name} ${product.brief}</p>
                                    <p>￥${product.versionList[0].salePrice?string("#.##")}</p>
                                </span>
                                <a href="#"><img src="${product.coverImageUri}" width="78" height="78"></a>
                            </li>
                        </#list>
                    </#if>
                </ul>
            </div>
        </div>
    </div>
</div>


<div class="clear"></div>

<div class="main mt20">
<div class="floor"><span>4F-手机配件</span></div>
<div class="floor_3 mt10">

<div class="floor_3_1">
    <#if accessory_left_ad??>
        <a href="${accessory_left_ad.destinationUri}"><img src="${accessory_left_ad.imageUri}" width="208" height="320"></a>
    </#if>
    <div class="floor_3_1_a">
        <span>手机配件：</span>
        <a href="#">蓝牙耳机</a>
        <a href="#">移动电源</a>
        <a href="#">充电器</a>
        <a href="#">数据线手机</a>
        <a href="#">电池</a>
        <a href="#">手机贴膜</a>
        <a href="#">存储卡</a>
        <a href="#">保护套</a>
        <a href="#">车载iPhone配件</a>
        <a href="#">创意配件</a>
        <a href="#">音箱手机饰品</a>
    </div>
</div>

<div class="floor_3_2 flr">
<table>
<tr>
<#if accessory_big_ad_list??>
    <#list accessory_big_ad_list as ad>
        <#if ad_index lt 5>
            <td><a href="${ad.destinationUri}"><img src="${ad.imageUri}" width="195" height="317"></a></td>
        </#if>
    </#list>
</#if>
</tr>
</table>
</div>

<div class="floor_3_3 flr">
<table>
<tr>
<#if accessory_big_ad_list??>
    <#list accessory_small_ad_list as ad>
        <#if ad_index lt 5>
            <td><a href="${ad.destinationUri}"><img src="${ad.imageUri}" width="195" height="136"></a></td>
        </#if>
    </#list>
</#if>
</tr>
</table>
</div>

</div>
<div class="floor_3_4">
<div class="floor_3_4_1">
<ul>
<li class="floor_3_4_1_a"><a href="#" class="floor_3_4_1_axz">电源类</a></li>
<li class="floor_3_4_1_b"><a href="#">电源类</a></li>
<li class="floor_3_4_1_b"><a href="#" class="floor_3_4_1_bxz">电源类</a></li>
<li class="floor_3_4_1_b"><a href="#">电源类</a></li>
<li class="floor_3_4_1_b"><a href="#">电源类</a></li>
<li class="floor_3_4_1_b"><a href="#">电源类</a></li>
</ul>
</div>
<div class="floor_3_4_2">
<ul>
<li><a href="#"><img src="img/3f_pj1.jpg" width="122" height="122"><p>湛蓝贝手机保护壳</p><p class="orange">￥288.00</p></a></li>
<li><a href="#"><img src="img/3f_pj1.jpg" width="122" height="122"><p>湛蓝贝壳 金属边框手机保护壳</p><p class="orange">￥288.00</p></a></li>
<li><a href="#"><img src="img/3f_pj1.jpg" width="122" height="122"><p>湛蓝贝壳 金属边框手机保护壳</p><p class="orange">￥288.00</p></a></li>
<li><a href="#"><img src="img/3f_pj1.jpg" width="122" height="122"><p>湛蓝贝壳 金属边框手机保护壳</p><p class="orange">￥288.00</p></a></li>
<li><a href="#"><img src="img/3f_pj1.jpg" width="122" height="122"><p>湛蓝贝壳 金属边框手机保护壳</p><p class="orange">￥288.00</p></a></li>
<li><a href="#"><img src="img/3f_pj1.jpg" width="122" height="122"><p>湛蓝贝壳 金属边框手机保护壳</p><p class="orange">￥288.00</p></a></li>
</ul>
</div>
</div>
</div>

<div class="main mt20 phonenumber">
<div class="phonenumber_1"><a href="#">查看更多>></a></div>
<div class="phonenumber_2 fll">
<table>
<tr>
<td><a href="#"><p class="phonenumber_2_a">13985698569</p><p class="phonenumber_2_b">卡费：399元  话费：299元</p></a></td>
<td><a href="#"><p class="phonenumber_2_a">13985698569</p><p class="phonenumber_2_b">卡费：399元  话费：299元</p></a></td>
<td><a href="#"><p class="phonenumber_2_a">13985698569</p><p class="phonenumber_2_b">卡费：399元  话费：299元</p></a></td>
<td><a href="#"><p class="phonenumber_2_a">13985698569</p><p class="phonenumber_2_b">卡费：399元  话费：299元</p></a></td>
<td><a href="#"><p class="phonenumber_2_a">13985698569</p><p class="phonenumber_2_b">卡费：399元  话费：299元</p></a></td>
</tr>
<tr>
<td><a href="#"><p class="phonenumber_2_a">13985698569</p><p class="phonenumber_2_b">卡费：399元  话费：299元</p></a></td>
<td><a href="#"><p class="phonenumber_2_a">13985698569</p><p class="phonenumber_2_b">卡费：399元  话费：299元</p></a></td>
<td><a href="#"><p class="phonenumber_2_a">13985698569</p><p class="phonenumber_2_b">卡费：399元  话费：299元</p></a></td>
<td><a href="#"><p class="phonenumber_2_a">13985698569</p><p class="phonenumber_2_b">卡费：399元  话费：299元</p></a></td>
<td><a href="#"><p class="phonenumber_2_a">13985698569</p><p class="phonenumber_2_b">卡费：399元  话费：299元</p></a></td>
</tr>
</table>
</div>
</div>

<div class="clear"></div>

<div class="main mt20"><div class="newszx">
<table>
<tr>
<td>
<span>手机资讯</span>
<ul>
<li><a href="#">骁龙801顶配旗舰 OPPON3影音娱乐体验最佳音乐手机</a></li>
<li><a href="#">骁龙801顶配旗舰 OPPON3影音娱乐体验最佳音乐手机</a></li>
<li style="background:none;"><a href="#">更多>></a></li>
</ul>
</td>
<td>
<span>手机发烧友</span>
<ul>
<li><a href="#">骁龙801顶配旗舰 OPPON3影音娱乐体验最佳音乐手机</a></li>
<li><a href="#">骁龙801顶配旗舰 OPPON3影音娱乐体验最佳音乐手机</a></li>
<li style="background:none;"><a href="#">更多>></a></li>
</ul>
</td>
<td>
<span>新闻视频</span>
<ul>
<li><a href="#">骁龙801顶配旗舰 OPPON3影音娱乐体验最佳音乐手机</a></li>
<li><a href="#">骁龙801顶配旗舰 OPPON3影音娱乐体验最佳音乐手机</a></li>
<li style="background:none;"><a href="#">更多>></a></li>
</ul>
</td>
</tr>
</table>
</div>
</div>

<div class="clear"></div>

<div class="main mt20">
<div class="floor_n fll"><img src="img/peisongyuanze.png" width="719" height="44"></div>
<div class="flr">
<input class="topnews1_serch" type="text" onfocus="if(value=='热搜机型： iphone 6   MX4 Pro   HTC M8') {value=''}" onblur="if (value=='') {value='热搜机型： iphone 6   MX4 Pro   HTC M8'}"  value="热搜机型： iphone 6   MX4 Pro   HTC M8">
<input type="submit" class="search-btn" title="搜索" value="  ">
</div>
</div>

<div class="clear"></div>

<div class="footallbg">
<div class="main mt15">
<div class="s_footer pt15">
<div class="s_footera fll">
<ul>
<li><div class="bzzx fll"></div><span>帮助中心</span></li>
<li><a href="/help/question-1">购物指南</a></li>
<li><a href="/help/question-2">常见问题</a></li>
<li><a href="/help/question-3">用户协议</a></li>
</ul>
</div>

<div class="s_footera fll" id="s_footera45">
<ul>
<li><div class="zfps fll"></div><span>支付配送</span></li>
        <li><a href="/help/distribution/1">支付方式</a></li>
        <li><a href="/help/distribution/2">配送方式</a></li>
        <li><a href="/help/distribution/3">配送费用</a></li>
</ul>
</div>

<div class="s_footera fll">
<ul>
<li><div class="shfw fll"></div><span>售后服务</span></li>
<li><a href="/help/afshelp-1">三包服务</a></li>
<li><a href="/help/afshelp-2">售后流程</a></li>
</ul>
</div>

<div class="s_footera fll" id="s_footera55">
<ul>
<li><div class="gyzc fll"></div><span>关于荣诚</span></li>
<li><a href="#">了解荣诚</a></li>
<li><a href="#">加入荣诚</a></li>
<li><a href="#">附近门店</a></li>
</ul>
</div>

<div class="s_footerb flr">
<ul>
<li><div class="mfrxdh fll"></div><span>免费热线电话</span></li>
<li class="ml30" id="s_phone">0871-68421560</li>
<li class="ml30">传真：0871-68421560</li>
<li class="ml30">周一到周日9:30-18:00</li>
</ul>
</div>

</div>
</div>
<div class="clear"></div>
<div class="s_footerc">
<p>©2014 荣诚手机超市<a href="#">www.rcsj.com </a>   滇ICP证8888888号  587 号 <a href="http://www.ynyes.com" target="_blank" title="云南网站建设">网站建设</a>技术支持：<a href="http://www.ynyes.com" target="_blank" title="云南网站建设">昆明天度网络公司</a></p>
</div>

</div>

<script>
    function displayTime(){
        var elt = document.getElementById("clock");
        if(leftTime<0){
            elt.innerHTML = "Over";
        }
        else{
            //结束时间，需自定义 懒人建站 http://www.51xuediannao.com 
            var endTime = new Date("2018/07/8 18:45:13");
            var now = new Date();
            var leftTime = endTime.getTime() -now.getTime();
            var ms = parseInt(leftTime%1000).toString();
            leftTime = parseInt(leftTime/1000);
            var o = Math.floor(leftTime / 3600);
            var d = Math.floor(o/24);
            var m = Math.floor(leftTime/60%60);
            var s = leftTime%60;
            elt.innerHTML = o + "小时:" + m + "分:" + s + "秒:" + ms.charAt(0);
            setTimeout(displayTime,100);
        }
    }
    displayTime();
</script>


<script type="text/javascript">

//经过城市切换和内容都显示
$("#city").mouseover(function(){
   $("#change").css({"display":"block"});

})

$("#change").mouseover(function(){
   $("#change").css({"display":"block"});

})

//离开城市和离开内容都隐藏
$("#change").mouseout(function(){

   $("#change").css({"display":"none"});

})

$("#city").mouseout(function(){

   $("#change").css({"display":"none"});

})

//对城市切换的内容进行替换
function change_city(name){
	var content=$("#city").html();
	$("#city").html(name);
	return false;
}
</script>




<script type="text/javascript">
 //经过商品栏目或者是经过内容的时候，都显示（栏目和大类）
 $("#goods").mouseover(function(){
     $("#goods_style").css({"display":"block"});
 })
    

 $("#goods_style").mouseover(function(){
     $("#goods_style").css({"display":"block"});
 })
  
//离开栏目或者是离开内容都进行隐藏（栏目和大类）

 $("#goods").mouseout(function(){
     $("#goods_style").css({"display":"none"});
 })
  
 $("#goods_style").mouseout(function(){
     $("#goods_style").css({"display":"none"});
 })
  


//经过手机以后，显示详细框

 $("#phone").mouseover(function(){
     $("#threeright1").css({"display":"block"});
 })
    
 $("#threeright1").mouseover(function(){
     $("#threeright1").css({"display":"block"});
 })
   
$("#phone").mouseout(function(){
     $("#threeright1").css({"display":"none"});
 })

$("#threeright1").mouseout(function(){
     $("#threeright1").css({"display":"none"});
 })

//经过手机配件

$("#phone_body").mouseover(function(){
     $("#threeright1").css({"display":"block"});
 })
    
 $("#threeright1").mouseover(function(){
     $("#threeright1").css({"display":"block"});
 })
   
$("#phone_body").mouseout(function(){
     $("#threeright1").css({"display":"none"});
 })

$("#threeright1").mouseout(function(){
     $("#threeright1").css({"display":"none"});
 })

//经过手机靓号

$("#phone_number").mouseover(function(){
     $("#threeright1").css({"display":"block"});
 })
    

 $("#threeright1").mouseover(function(){
     $("#threeright1").css({"display":"block"});
 })
   

$("#phone_number").mouseout(function(){
     $("#threeright1").css({"display":"none"});
 })

$("#threeright1").mouseout(function(){
     $("#threeright1").css({"display":"none"});
 })
</script>
</body>
</html>
