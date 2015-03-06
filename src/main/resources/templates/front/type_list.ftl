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
<script type="text/javascript" src="/Tm/js/common/nav.js"></script>
<script type="text/javascript" src="/Tm/js/common/head.js"></script>
</head>
<body>
<#include "/front/common/head.ftl" />
<#include "/front/common/nav.ftl" />

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
      <h2>${type.name}</h2>
      <input type="text" id="type-id" value="<#if type??>${type.id}</#if>" style="display:none;"/>
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
<#include "/front/common/tail.ftl" />
</body>
</html>