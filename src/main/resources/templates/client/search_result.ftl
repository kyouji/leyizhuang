<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>博大生活网——网站首页</title>
<meta name="keywords" content="${seoKeyword!""}">
<meta name="description" content="${seoDescription!""}">
<meta name="copyright" content="" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link href="/client/style/layout.css" rel="stylesheet" type="text/css" />
<link href="/client/style/master.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/mag/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/client/js/html5.js"></script>
<script type="text/javascript" src="/client/js/header.js"></script>
<script type="text/javascript" src="/client/js/list.js"></script>
<script>
function setprice() {
    var p1 = $.trim($('#ParamFiltern_price1').val()), p2 = $.trim($('#ParamFiltern_price2').val())
    if (isNaN(p1) || p1=="") { p1 = 0 }
    if (isNaN(p2) || p2== "") { p2 = 0 }
    var price = p1 + '-' + p2;
    var url = '/list/' + $('#urlcoll').val();
    if (price != "0-0") { url += "_" + price; }
    location.href = url;
}
</script>
</head>
<body>
<!-- header开始 -->
<#include "/client/common_header.ftl" />
<!-- header结束 -->

<article id="main">
    <div class="ipp1 top">
        <dd>您当前位置：<a href="/">首页</a> 
            > <a href="javascript:;" class="hover_zy">搜索结果</a>
        </dd>
    </div>
    <!--面包屑结束-->
    <div class="all_cont mt15">
        
    </div>    
</article>
<!--品牌分类结束-->
<article id="main">
    <!--左边开始-->
	<div class="left_list fl mt20">
        <div class="left_n fl">
            <h4>热卖推荐</h4>
                <ul class="tuij_nr">
                    <#if most_sold_list??>
                        <#list most_sold_list as goods>
                            <li>
                                <a href="/goods/${goods.id}">
                                    <img src="${goods.coverImageUri!""}"/>
                                </a>
                                <b style="color:#d8000f; font-size:15px; line-height:25px;">￥${goods.salePrice?string("#.##")}</b>
                                <p><a href="/goods/${goods.id}">${goods.title!""} ${goods.version!""} ${goods.color!""} ${goods.capacity!""}</a></p>
                            </li>
                        </#list>
                    </#if>
                </ul>         
        </div>
        <div class="left_n fl mt20">
             <h4>销量排行榜</h4>
             <div class="sidlist_box sidlist_slide">
                    <ul>
                        <#if most_sold_list??>
                            <#list most_sold_list as goods>
                                <li>
                                    <a target="_blank" class="pro_img_small" href="#">
                                        <img src="${goods.coverImageUri!""}" width="70" height="70">
                                        <sup class="nub${goods_index+1}"></sup>
                                    </a>
                                    <p class="price"><span class="color_red"><em>￥</em>${goods.salePrice?string("#.##")}</span></p>
                                    <h3 class="name"><a href="#">${goods.title!""} ${goods.version!""} ${goods.color!""} ${goods.capacity!""}</a>
                                    </h3>
                                </li>
                            </#list>
                        </#if>               
                   </ul>
              </div>
        </div>
    </div>
    <!--左边结束-->
    <div class="right_list fr mt20">
        <div class="shuaixuan">
        </div> 
        <!--筛选结束-->
        <#-- 商品列表开始 -->
        <div class="b_pro">
            <#if goods_page??>
                <#list goods_page.content as goods>
                    <dl class="prod">
                    <dt><a href="/goods/${goods.id}"><img src="${goods.coverImageUri!""}"></a></dt>
                    <dd>
                        <font class="shop_s">￥${goods.salePrice?string("#.##")}</font>
                        <p><a href="/goods/${goods.id}">${goods.title!""} ${goods.version!""} ${goods.color!""} ${goods.capacity!""}</a></p>
                    </dd>
                    <dl>
                        <a href="/cart/init?id=${goods.id}" target="_blank"><b class="quer wobble-top"></b></a>
                        <a href="javascript:void(0);" onclick="this, addCollect(${goods.id})"><b class="quer1 wobble-top"></b></a>
                        <dd class="qipao" id="dd_${goods.id}" style="display:none;"><span>请登录</span></dd>
                    </dl>
                    <p class="pl11">
                        <a href="/goods/${goods.id}#comment">${goods.totalComments!"0"}条评论</a><#if goods.leftNumber?? && goods.leftNumber gt 0><b>云南有货</b><#else><b style="color: #ccc;">暂时缺货</b></#if>
                    </p>
                    </dl>
                </#list>
            </#if>
        </div>
        <#-- 商品列表结束 --> 
         
        <#-- 分页开始 -->
        <div class="page clearfix mt20 fr">
            <span class="p-skip">
                <#if goods_page??>
                <em>共<b>${goods_page.totalElements!'0'}</b>条记录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<#if goods_page.totalPages gt 0>${goods_page.number+1}<#else>0</#if>/${goods_page.totalPages}页</em>
                </#if>
            </span>
            <div id="J_bottomPage" class="p-wrap">
                <span class="p-num">
                <#if goods_page??>
                    <#assign continueEnter=false>
                    <#if goods_page.number+1 == 1>
                        <a class="pn-prev disabled"><i>&lt;</i><em>上一页</em></a>
                    <#else>
                        <a href="${categoryId!'0'}-${brand_index+1}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-${goods_page.number-1}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>" class="pn-prev disabled"><i>&lt;</i><em>上一页</em></a>
                    </#if>
                    
                    <#if goods_page.totalPages gt 0>
                        <#list 1..goods_page.totalPages as page>
                            <#if page <= 3 || (goods_page.totalPages-page) < 3 || (goods_page.number+1-page)?abs<3 >
                                <#if page == goods_page.number+1>
                                    <a href="javascript:;" class="curr">${page}</a>
                                <#else>
                                    <a href="${categoryId!'0'}-${brand_index+1}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-${page}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>" class="hide">${page}</a> <#-- ${page} -->
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
                    
                    <#if goods_page.number+1 == goods_page.totalPages || goods_page.totalPages==0>
                        <a href="javascript:;" class="pn-next disabled"><em>下一页</em><i>&gt;</i></a>
                    <#else>
                        <a href="${categoryId!'0'}-${brand_index+1}<#list param_index_list as pindex>-${pindex!'0'}</#list>-${orderId!'0'}-${soldId!'0'}-${priceId!'0'}-${timeId!'0'}-${goods_page.number+1}-${leftId!'0'}<#if priceLow?? && priceHigh??>_${priceLow?string("#.##")}-${priceHigh?string("#.##")}</#if>" class="pn-next"><em>下一页</em><i>&gt;</i></a>
                    </#if>
                </#if>
                </span>
            </div>
        </div>  
        <#-- 分页结束 -->
        
                
    </div>
    <!--右边结束-->
    <div class="clear"></div>
</article>
<!--主体结束-->
<article id="main">
<#--
  <div class="look fl mt20">
    	<h4><b>|</b>大家都在看</h4>
      <ul class="mt15">
       	  <li>
          <a href="#"><img src="/client/images/img3.jpg" width="220" height="220"></a>
          <dd>￥99.00<del>￥198.00</del></dd>
          <p><a href="#">蕾丝连衣裙女2015春装新款韩版修身气质裙子娃娃领雪纺短袖连衣裙 粉紫色 XL</a></p>
          </li>
       	  <li>
          <a href="#"><img src="/client/images/img3.jpg" width="220" height="220"></a>
          <dd>￥99.00<del>￥198.00</del></dd>
          <p><a href="#">蕾丝连衣裙女2015春装新款韩版修身气质裙子娃娃领雪纺短袖连衣裙 粉紫色 XL</a></p>
          </li>
       	  <li>
          <a href="#"><img src="/client/images/img3.jpg" width="220" height="220"></a>
          <dd>￥99.00<del>￥198.00</del></dd>
          <p><a href="#">蕾丝连衣裙女2015春装新款韩版修身气质裙子娃娃领雪纺短袖连衣裙 粉紫色 XL</a></p>
          </li>
       	  <li>
          <a href="#"><img src="/client/images/img3.jpg" width="220" height="220"></a>
          <dd>￥99.00<del>￥198.00</del></dd>
          <p><a href="#">蕾丝连衣裙女2015春装新款韩版修身气质裙子娃娃领雪纺短袖连衣裙 粉紫色 XL</a></p>
          </li>
       	  <li>
          <a href="#"><img src="/client/images/img3.jpg" width="220" height="220"></a>
          <dd>￥99.00<del>￥198.00</del></dd>
          <p><a href="#">蕾丝连衣裙女2015春装新款韩版修身气质裙子娃娃领雪纺短袖连衣裙 粉紫色 XL</a></p>
          </li>
      </ul>
    </div>
-->
</article>
<!--大家都在看结束-->
<#include "/client/common_footer.ftl" />
<!--底部结束-->
</body>
</html>
