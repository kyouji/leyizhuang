<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>手机产品</title>
<meta name="keywords" content="荣诚手机超市" />
<meta name="description" content="荣诚手机超市" />
<meta name="copyright" content="荣诚手机超市 版权所有" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/rcindex.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.pagination a{text-decoration:none;border:solid 1px #ccc;color:#999;}
.pagination a,.pagination span{display:block;float:left;padding:0.3em 0.5em;margin-right:5px;margin-bottom:5px;min-width:1em;text-align:center;}
.pagination .current{background:#ff6600;color:#fff;border:solid 1px #ccc;}
.pagination .current.prev,.pagination .current.next{color:#999;border-color:#999;background:#fff;}
.tm_psize_go{padding:5px;margin-right:4px; float:left;height:27px;line-height:27px;position:relative;border:1px solid #ff6600;}
#tm_pagego{height:27px;line-height:27px;width:30px;float:left;text-align:center;border:1px solid #ccc;}</style>
<script type="text/javascript" src="/Tm/js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/Tm/js/mainTip.js"></script>
<script type="text/javascript" src="/Tm/js/util.js"></script>
<script type="text/javascript" src="/Tm/js/AJAX.js"></script>
<script type="text/javascript" src="/Tm/js/jquery.pagination.js"></script>
<script type="text/javascript" src="/Tm/js/front/producttype.js"></script>
</head>
<body>
<header>
<div class="main">
<div class="fll header_l"><#if user??><span>您好，<a href="/user/info" >${user.username}</a>欢迎来到荣诚手机超市！您的身份：${user.role}&nbsp;&nbsp;<a href="/logout" >退出</a></span><#else><span>您好，欢迎来到荣诚手机超市！<a href="/login" id="orange">登录</a>&nbsp;&nbsp;&nbsp;<a href="/reg">免费注册</a></span></#if></div>
<div class="flr header_r"><a href="/user/collect">我的收藏</a><a href="#">销售网点</a><a href="#">手机版切换</a><a href="/order/list">我的订单</a><a href="/help/question/1">帮助中心</a><a href="#">收藏本站</a></div>
</div>
</header>

<div class="header1 main">
<div class="fll logo"><a href="#" title="荣诚手机超市"><img src="/img/rc_logo.png" width="177" height="69"></a></div>
<div class="fll city"><a href="#">城市切换</a><span></span>
<!--<div class="cityqh"><ul>
<li><a href="#">昆明市</a></li>
<li><a href="#">曲靖市</a></li>
<li><a href="#">大理州</a></li>
<li><a href="#">西双版纳</a></li>
<li><a href="#">德宏州</a></li>
<li><a href="#">丽江市</a></li>
</ul></div>-->
</div>
<div class="sercha fll">
<input class="topnews1_serch" type="text" onfocus="if(value=='热搜机型： iphone 6   MX4 Pro   HTC M8') {value=''}" onblur="if (value=='') {value='热搜机型： iphone 6   MX4 Pro   HTC M8'}"  value="热搜机型： iphone 6   MX4 Pro   HTC M8">
<input type="submit" class="search-btn" title="搜索" value="  ">
<div class="rc_newsgg"><span>新闻公告:</span><a href="#">>>黄章：魅蓝Note有电信版，一月还将发新品</a></div>
</div>
<div class="fll rc_phone"><span>客服电话：400-888-8888</span></div>
<div class="flr rc_gwc"><a href="/cart">购物车（1）</a></div>
</div>

<nav><div class="main">
<div class="nav_more fll"><div class="nav_more1"><a href="/type/list" title="全部商品分类" class="nav_more15">全部商品分类</a></div>


</div>

<div class="nav_2 fll ml4">
<ul>
<li><a href="/" title="首页">首页</a></li>
<li><a href="/list/1" title="明星产品">明星产品</a></li>
<li><a href="/list/2" title="手机产品">手机产品</a></li>
<li><a href="/list/3" title="手机配件">手机配件</a></li>
<li><a href="/list/3" title="二手手机">二手手机</a></li>
<li><a href="/list/4" title="靓号选择">靓号选择</a></li>
<li><a href="/list/5" title="新闻资讯">新闻资讯</a></li>
</ul>
</div>

</div></nav>

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

<div class="clear"></div>
<div class="main">
<div class="place"> 
    <span>您现在的位置：</span>
    <a href="/">首页</a>
    <#if type_list??>
        <#list type_list as type>
            &gt;<a href="/list/${type.id}">${type.name}</a>
        </#list>
    </#if>
</div>
<div class="w1200 overflow">
  <div class="sub_left">
    <div class="hot_list">
      <h2>热销排行</h2>
      <ul>
        <#if hot_product_list??>
            <#list hot_product_list as product>
                <li> 
                    <a href="/product/${product.id}"> 
                        <img src="${product.coverImageUri}" /> 
                        <span>${product.name} ${product.brief}</span> 
                        <b>￥${product.priceMinimum?string("#.##")}</b> 
                    </a>
                    <#if product_index < 3>
                        <div class="num1">${product_index+1}</div>
                    <#else>
                        <div class="num2">${product_index+1}</div>
                    </#if>
                </li>
            </#list>
        </#if>
      </ul>
    </div>
    <div class="hot_list mt20">
      <h2>浏览记录</h2>
      <ul>
        <li> <a href="#"> <img src="/images/hot.jpg" /> <span>BlackBerryZ30【黑莓典范】5英寸Super AMOLED显示屏黑莓10.2系</span> <b>￥4599.00</b> </a> </li>
        <li> <a href="#"> <img src="/images/hot.jpg" /> <span>BlackBerryZ30【黑莓典范】5英寸Super AMOLED显示屏黑莓10.2系</span> <b>￥4599.00</b> </a> </li>
        <li> <a href="#"> <img src="/images/hot.jpg" /> <span>BlackBerryZ30【黑莓典范】5英寸Super AMOLED显示屏黑莓10.2系</span> <b>￥4599.00</b> </a> </li>
        <li> <a href="#"> <img src="/images/hot.jpg" /> <span>BlackBerryZ30【黑莓典范】5英寸Super AMOLED显示屏黑莓10.2系</span> <b>￥4599.00</b> </a> </li>
        <li> <a href="#"> <img src="/images/hot.jpg" /> <span>BlackBerryZ30【黑莓典范】5英寸Super AMOLED显示屏黑莓10.2系</span> <b>￥4599.00</b> </a> </li>
      </ul>
    </div>
  </div>
  <div class="sub_right">
    <div class="sx_tit">
      <h2>手机</h2>
      <input type="text" id="type-id" value="<#if type_id??>${type_id}</#if>" style="display:none;"/>
      （共搜索到<b><#if count??>${count}</#if></b>个商品）<span></span> 
    </div>
     <div class="sx_lb">
      <ul id="prop-ul">
        <#if brand_list??>
            <li> 
                <span>品牌：</span>
                <p>
                    <a href="javascript:;" class="<#if brandIndex == 0 >sxon</#if> brand prop">全部</a>
                    <#list brand_list as brand>
                        <a href="javascript:;" class="<#if brandIndex == brand_index+1>sxon</#if> brand prop">${brand.name}</a>
                    </#list>
                    <#if brand_list?size gt 10>
                        <a href="javascript:;" class="orange">查看更多品牌>></a>
                    </#if>
                </p>
            </li>
        </#if>
        <#if param_list??>
            <#list param_list as param>
                <li> 
                    <span>${param.name}：</span>
                    <p>
                        <#if param_index_list?size==0 || param_index_list?size gt param_index && param_index_list[param_index]==0>
                            <a href="javascript:;" class="sxon prop">全部</a>
                        <#else>
                            <a href="javascript:;" class="prop">全部</a>
                        </#if>
                        
                        <#if param.valueList??>
                            <#list param.valueList?split(",") as value>
                                <#if param_index_list?size gt param_index && param_index_list[param_index]==value_index+1>
                                    <a href="javascript:;" class="sxon prop">${value}</a>
                                <#else>
                                    <a href="javascript:;" class="prop">${value}</a>
                                </#if>
                            </#list>
                        </#if>
                    </p>
                </li>
            </#list>
        </#if>
      </ul>
    </div>
	<div id="centent">
	
    <div class="sxtj">
      <ul id="ul-sort">
        <li><a href="javascript:void(0)" <#if sort_type?? && sort_type==0>class="sxtj_on"</#if>>销量</a></li>
        <li><a href="javascript:void(0)" id="sort-price" <#if sort_type?? && sort_type==1>class="sxtj_on"</#if>>价格<#if price_direction?? && price_direction==1>↑<#else>↓</#if></a></li>
        <li><a href="javascript:void(0)" <#if sort_type?? && sort_type==2>class="sxtj_on"</#if>>上架时间</a></li>
     </ul>
        <div class="sxtjBox">
            <span>价格范围：</span>
            <input type="text" class="jgqj_txt" id="minMoney" value="<#if price_low??>${price_low?string("#")}<#else>0</#if>"/>
            <span>--</span>
            <input type="text" class="jgqj_txt" id="maxMoney" value="<#if price_high??>${price_high?string("#")}<#else>0</#if>"/>
            <input type="button" class="jgqj_btn" id="priceSearch" value="搜 索" />
        </div> 
      <div class="list_fenye flr">
        <a id="prev-page" href="javascript:;"><img src="/img/left.png"></a>
        <span><b id="page-index">${page_index+1}</b>/<b id="page-total"><#if page_total==0>${page_total+1}<#else>${page_total}</#if></b></span>
        <a id="next-page" href="javascript:;"><img src="/img/right.png"></a>
        </div>
      
    </div>
    <div class="sx_list" id="page_con">
    <#include "/front/listtemp/pageProduct.ftl">
      <div class="clear"></div>
    </div>
  </div>
    <div class="page" style="margin-top: 5px;float: right;" ></div>
 
	</div>
</div>
</div>
<div class="clear"></div>
<div class="main mt20">
<div class="floor_n fll"><img src="/img/peisongyuanze.png" width="719" height="44"></div>
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
</body>
</html>