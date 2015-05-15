<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>博大生活网——商品详情 ${goods.seoKeywords!''}</title>
<meta name="keywords" content="${goods.seoKeywords!''}">
<meta name="description" content="${goods.seoDescription!''}">
<meta name="copyright" content="" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link href="/client/style/layout.css" rel="stylesheet" type="text/css" />
<link href="/client/style/master.css" rel="stylesheet" type="text/css" />
<link href="/client/style/css.css" type="text/css" rel="stylesheet">  
<script type="text/javascript" src="/client/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/client/js/html5.js"></script>

<script src="/client/js/jquery-1.2.6.pack.js" type="text/javascript"></script>
<script src="/client/js/header.js"></script>

<SCRIPT src="/client/js/base.js" type="text/javascript"></SCRIPT>
<script type="text/javascript" src="/client/js/goods.js"></script>
<script src="/client/js/lib.js" type="text/javascript"></script>
<script src="/client/js/zzsc.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){
    setInterval("timer()",1000);
    
    $("#id-minus").click(function(){
        var q = parseInt($("#quantity").val());
        
        if (q > 1)
        {
            $("#quantity").val(q-1);
        }
        
        $("#addCart").attr("href", "/cart/init?id=${goods.id}&quantity=" + $("#quantity").val() + "<#if goods.isGroupSale && goods.groupSaleStartTime < .now && goods.groupSaleStopTime gt .now>&qiang=1</#if>");
    });
    
    $("#id-plus").click(function(){
        var q = parseInt($("#quantity").val());
        
        <#if goods.leftNumber??>
            if (q < ${goods.leftNumber})
            {
                $("#quantity").val(q+1);
            }
            else
            {
                alert("已达到库存最大值");
            }
        <#else>
            $("#quantity").val(q+1);
        </#if>
        $("#addCart").attr("href", "/cart/init?id=${goods.id}&quantity=" + $("#quantity").val() + "<#if goods.isGroupSale && goods.groupSaleStartTime < .now && goods.groupSaleStopTime gt .now>&qiang=1</#if>");
    
    });
});
function timer()
{
<#if goods.isGroupSale && goods.groupSaleStartTime < .now && goods.groupSaleStopTime gt .now>
    var ts = (new Date(${goods.groupSaleStopTime?string("yyyy")}, 
                parseInt(${goods.groupSaleStopTime?string("MM")}, 10)-1, 
                ${goods.groupSaleStopTime?string("dd")}, 
                ${goods.groupSaleStopTime?string("HH")}, 
                ${goods.groupSaleStopTime?string("mm")}, 
                ${goods.groupSaleStopTime?string("ss")})) - (new Date());//计算剩余的毫秒数
    if (0 == ts)
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
    $("#timeLeft").html("距离本次团购结束时间：" + dd + "天" + hh + "小时" + mm + "分" + ss +"秒");
</#if>
}

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
<!-- header开始 -->
<#include "/client/common_header.ftl" />
<!-- header结束 -->

<article id="main">
<div class="ipp1 top">
    <dd>您当前位置：<a href="/">首页</a> 
        <#if category_tree_list??>
            <#list category_tree_list as category>
                > <a href="/list/${category.id}" <#if category_index+1==category_tree_list?size></#if>>${category.title!""}</a>
            </#list>
        </#if>
        > &nbsp;${goods.title!''}
    </dd>
</div>
<!--面包屑结束-->
<div class="w1198 fl mt15 bor">
    <div class="proinfo-left fl">    
           
        <div id=preview>
            <div class="jqzoom" id="spec-n1">
                
                <#if goods.showPictures??>
                    <#list goods.showPictures?split(",") as uri>
                        <#if ""!=uri>
                            <img height=350 src="${uri!''}" jqimg="${uri!''}" width=350>
                            <#break>
                        </#if>
                    </#list>
                </#if>
            </div>
            <div id="spec-n5">
                <div class="control" id="spec-left">
                    <img src="/client/images/left.gif" />
                </div>
                <div id="spec-list">
                    <ul class="list-h">
                        <#if goods.showPictures??>
                            <#list goods.showPictures?split(",") as uri>
                                <#if ""!=uri>
                                    <li><img src="${uri!''}"></li>
                                </#if>
                            </#list>
                        </#if>
                    </ul>
                </div>
                <div class="control" id="spec-right">
                    <img src="/client/images/right.gif" />
                </div>
            </div>
        </div>
                
		<div class="imgzoom-memo">
			<#-- <dd style="float:left">商品编号：1478489559</dd> -->
			
			<div class="sc fr">
                <a href="javascript:void(0);" onclick="this, addCollect(${goods.id})"><i></i>
                  收藏
                </a>
            </div>
	   </div>
    </div>    	
        <div class="neir_right fr">    
            <div class="proinfo-title">
                <h1 id="itemDisplayName">${goods.title!''}</h1><h2 id="promotionDesc">${goods.subTitle!''}</h2>
            </div>   
            <!--大标题名称结束--> 
            <div class="title">
                <div class="app">
                    <input type="hidden" id="goodsId" value=${goods.id} />
                    <#if goods.isGroupSale && goods.groupSaleStartTime < .now && goods.groupSaleStopTime gt .now>
                        <div class="fl w600">
                            <div class="jg_bd pt20">
                                <b style="color:#f30919; font-size:25px;">￥${goods.groupSalePrice?string("0.00")}</b>
                                <b style="font-weight:normal; font-size:12px; padding-left:15px; color:#999">原价：<del>￥${goods.salePrice?string("0.00")}</del></b>
                                <b class="cux">限时秒杀</b>
                            </div>
                            <div class="jg_bd">
                                <span class="miaos mt15" id="timeLeft"></span>
                            </div>
                        </div>
                    <#else>
                        <div class="fl w600">
                            <div class="jg_bd pt20">博&nbsp;大&nbsp;价：<b style="color:#f30919; font-size:18px;">￥${goods.salePrice?string("0.00")}</b>
                                
                            </div>
                            <div class="jg_bd">市&nbsp;场&nbsp;价：
                                <del style="color:#b6b6b6; padding-right:10px;">￥${goods.marketPrice?string("0.00")}</del>
                            </div>
                            <#--
                            <div class="jg_bd"><img src="/client/images/star4.gif" width="81" height="17" style=" margin-left:60px;" />
                                <b style="color:#ec0010; font-size:13px; font-weight:normal;">4.0分 <a href="#comment">共有${goods.totalComments!'0'}条评价</a></b>
                            </div>
                            -->
                        </div>
                    </#if>
                    <span class="code fr mt20"><img src="/client/images/ewm.png" width="97" height="97" /><dd>扫描下载手机客户端</dd></span>
                </div>
                <!--灰色背景结束-->
                <#--
                <div class="jg_bd pt20">赠&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品：
                    <span class="stock"></span>
                </div>
                -->
                <div class="jg_bd pt20">积&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分：
                    <span>${goods.points!'0'}</span>
                </div>
                <div class="jg_bd pt15">服&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务：
                    <span>${goods.service!'无'}</span>
                </div>
                
                <#if total_select??>
                    <#if 1==total_select>
                        <div class="jg_bd pt15">${select_one_name!''}:
                            <ul class="ys_xuan">
                                <#if select_one_goods_list??>
                                <#list select_one_goods_list as item>
                                    <li><a href="/goods/${item.id}" <#if item.selectOneValue==one_selected>class="yansecur"</#if>>${item.selectOneValue}</a></li>
                                </#list>
                                </#if>
                            </ul>
                        </div>
                    <#elseif 2==total_select>
                        <div class="jg_bd pt15">${select_one_name!''}:
                            <ul class="ys_xuan">
                                <#if select_one_goods_list??>
                                <#list select_one_goods_list as item>
                                    <li><a href="/goods/${item.id}" <#if item.selectOneValue==one_selected>class="yansecur"</#if>>${item.selectOneValue}</a></li>
                                </#list>
                                </#if>
                            </ul>
                        </div>
                        <div class="jg_bd pt15">${select_two_name!''}:
                            <ul class="ys_xuan">
                                <#if select_two_goods_list??>
                                <#list select_two_goods_list as item>
                                    <li><a href="/goods/${item.id}" <#if item.selectTwoValue==two_selected>class="yansecur"</#if>>${item.selectTwoValue}</a></li>
                                </#list>
                                </#if>
                            </ul>
                        </div>
                    <#elseif 3==total_select>
                        <div class="jg_bd pt15">${select_one_name!''}:
                            <ul class="ys_xuan">
                                <#if select_one_goods_list??>
                                <#list select_one_goods_list as item>
                                    <li><a href="/goods/${item.id}" <#if item.selectOneValue==one_selected>class="yansecur"</#if>>${item.selectOneValue}</a></li>
                                </#list>
                                </#if>
                            </ul>
                        </div>
                        <div class="jg_bd pt15">${select_two_name!''}:
                            <ul class="ys_xuan">
                                <#if select_two_goods_list??>
                                <#list select_two_goods_list as item>
                                    <li><a href="/goods/${item.id}" <#if item.selectTwoValue==two_selected>class="yansecur"</#if>>${item.selectTwoValue}</a></li>
                                </#list>
                                </#if>
                            </ul>
                        </div>
                        <div class="jg_bd pt15">${select_three_name!''}:
                            <ul class="ys_xuan">
                                <#if select_three_goods_list??>
                                <#list select_three_goods_list as item>
                                    <li><a href="/goods/${item.id}" <#if item.selectThreeValue==three_selected>class="yansecur"</#if>>${item.selectThreeValue}</a></li>
                                </#list>
                                </#if>
                            </ul>
                        </div>
                    </#if>
                </#if>
                
                <div class="jg_bd pt15">
                    <b style="float:left; line-height:35px; font-weight:normal;">购&nbsp;买&nbsp;量：</b>
                    <div class="zy_cm">
                        <a id="id-minus" href="javascript:;"><img src="/client/images/zyc.png" width="14" height="21"/></a>
                        <input name="quantity" type="text" id="quantity" value="1" size="10" class="input_kc" />
                        <a id="id-plus" href="javascript:;"><img src="/client/images/zycc.png" width="14" height="21"/></a>
                    </div>
                </div>
                
                 
                <div class="tb-action tm-clear">
                    <div class="tb-btn-basket tb-btn-sku ">
                        <a id="addCart" href="/cart/init?id=${goods.id}<#if goods.isGroupSale && goods.groupSaleStartTime < .now && goods.groupSaleStopTime gt .now>&qiang=1</#if>">加入购物车</a>
                    </div>
                    <div class="tb-btn-buy tb-btn-sku">
                        <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt" target="_blank">分享获取积分</a>
                    </div>
                    <script type="text/javascript" >
                        var jiathis_config={
                            data_track_clickback:true,
                            url:"http://${server_ip!'www.kmboda.com'}:${server_port?c!'80'}/goods/${goods.id}<#if user??>?shareId=${user.id}</#if>",
                            summary:"",
                            shortUrl:false,
                            hideMore:false
                        }
                    </script>
                    <script type="text/javascript" src="http://v3.jiathis.com/code_mini/jia.js" charset="utf-8"></script>
                </div>
                
                <div class="ensure fl">
                    <dd>100%样品检验</dd>
                    <dd>按时发货</dd>
                    <dd>礼品卡</dd>
                    <dd style="margin-left:38px;">正品保障</dd>
                    <dd style="margin-left:38px;">不支持无理由退换货</dd>
                </div>    
                                    
            </div>        
		</div>
    </div>
<!--放大效果结束-->    
<div id="main">
    <#if !goods.isGroupSale || goods.groupSaleStartTime gt .now || goods.groupSaleStopTime < .now>
    	<div class="groom bor bor_top mt20 fl">
            <div class="groon_top"><h3>最佳组合</h3></div>
            <ul class="group">
                <#if goods.combList??>
                    <#list goods.combList as item>
                        <li class="fore0">
                            <a href="/goods/${item.goodsId}"><img width="130" height="130" src="${item.coverImageUri!''}"></a>
                            <dd><a href="/goods/${item.goodsId}">${item.goodsTitle!''}</a></dd>
                            <span style="display:block; padding:5px 0; color:#999">原价：￥<del class="comb-origin-price">${item.goodsPrice?string("0.00")}</del></span>
                            <input type="checkbox" class="comb-checkbox" zpid="${item.id}"/>
                            <strong class="itemCurrentPrice comb-current-price">${item.currentPrice?string("0.00")}</strong>
                            <#if item_index+1 < comb_list?size>
                                <span class="xtiein_symbol">+</span>
                            </#if>
                        </li>
                    </#list>
                </#if>
                <div class="zy_zlw">
                    <div class="xtiein_col4"><span class="xtiein_symbo2">=</span></div>
                    <div class="xtiein_col5">
                        <div class="xtiein_total">
                            <div class="xtiein_total_list">
                                <dd class="xtiein_total_price">
                                    <span class="xtiein_total_list_tit">已选择：</span>
                                    <span class="xtiein_total_ist_con"><span id="combCount">0</span>个组合
                                    <#--
                                        <a href="javascript:;" class="xtiein_total_reset" id="clearComb">[清除选择]</a>
                                    -->
                                    </span>
                                </dd>
                                <dd class="xtiein_total_price">
                                    <span class="xtiein_total_list_tit">套餐价：</span>
                                    <span class="xtiein_total_ist_con">￥<span class="mod_price" id="combCurrentPrice">${goods.salePrice?string("0.##")}</span></span>
                                </dd>
                                <dd>
                                    <span class="xtiein_total_list_tit">原&nbsp;&nbsp;&nbsp;价：</span>
                                    <span class="xtiein_total_list_con">
                                        ￥<del id="combOriginPrice">${goods.salePrice?string("0.##")}</del>
                                    </span>
                                </dd>
                                <dd>
                                    <span class="xtiein_total_list_tit">已节省：</span>
                                    <span class="xtiein_total_list_con">￥<span id="combSave">0.00</span></span>
                                </dd>
                                <a href="javascript:;" class="zy_xx" id="zhAddCart" target="_blank">加入购物车</a>
                            </div>
                        </div>
                    </div>
                </div>
            </ul>
        </div>
    </div>
    </#if>
<!--强烈推荐结束-->
<article id="main">
	<div class="left_list fl mt20">
        <div class="left_n fl">
             <h4>热卖推荐</h4>
                <ul class="tuij_nr">
                    <#if hot_list??>
                        <#list hot_list as item>  
                        <#if item_index < 10>
                          <li>
                            <a href="/goods/${item.id}"><img src="${item.coverImageUri}" width="162" height="134"  /></a>
                            <b style="color:#d8000f; font-size:15px; line-height:25px;">￥${item.salePrice?string("0.00")}</b>
                            <p><a href="/goods/${item.id}">${item.title!''}</a></p>
                          </li>
                        </#if>
                        </#list>
                    </#if>
                </ul>         
        </div>
        <#--
        <div class="left_n fl mt20">
         <h4>一周销量排行榜</h4>
            <div class="sidlist_box sidlist_slide">
                <ul>
                    <li>
                        <a target="_blank" class="pro_img_small" href="#"><img src="images/img.jpg" width="70" height="70"><sup class="nub1"></sup></a>
                        <p class="price"><span class="color_red"><em>￥</em>139</span></p>
                        <h3 class="name"><a href="#">品鲜猫 法国进口新鲜银鳕鱼切片 宝宝孕妇专用雪鱼片 500g </a>
                        </h3>
                    </li>             
               </ul>
            </div>
        </div>
        -->
    </div>
    <!--左边结束-->
    <div class="right_list bor fr mt20">
    	<ul class="explicit_top">
        	<li><a href="javascript:;" tid="0" class="stab hover_xx">商品详情</a></li>
        	<li><a href="javascript:;" tid="1" class="stab">包装及参数</a></li>
        	<li><a href="#commentDiv" tid="2" class="stab">评论（${goods.totalComments!'0'}）</a></li>
        	<li><a href="#consultDiv" tid="3" class="stab">资讯（${goods.totalConsults!'0'}）</a></li>
        	<li><a href="javascript:;" tid="4" class="stab">售后服务</a></li>
        </ul>
        <div id="tab0" class="php_z">
        	${goods.detail!''}
        </div>
        <div id="tab1" class="php_z" style="display:none;">
            <table border="0" width="100%" cellpadding="0" cellspacing="1" class="product">
            <tbody>
                <#if goods.paramList??>
                <#list goods.paramList as param>
                    <tr>
                        <th width="14%" bgcolor="#FFFFFF">${param.paramName!''}</th>
                        <td width="86%" bgcolor="#FFFFFF" style="text-align:left"><span>${param.value!''}</span></td>
                    </tr>  
                </#list>
                </#if>
            </tbody>
            </table>
        </div>
        <div id="tab4" class="php_z" style="display:none;">
            ${goods.afterMarketService!''}
        </div>
    </div>
    <div id="commentDiv" class="right_list bor fr mt20" style="display:block;">
        <div class="right_list bor_bot1 fl">
            <div class="discuss_top">
                <h3>商品评论（共${goods.totalComments!'0'}条评论）</h3>综合评分<img src="/client/images/pingf.png" width="68" height="12" />
            </div>
            <#--
            <dd class="eval-item shop-positive">
                <p class="positive-score">98<i class="positive-sign">%</i></p>
                <p class="positive-des">好评度</p>
            </dd>
            <div class="satisfy">
                <img src="/client/images/satisfy.png" width="438" height="35" />
                <b class="hot_zy">4.5</b>
            </div>
            -->
        </div>
        <div id="commentList" class="eval-list comment-show codeHover" style="display: block;">
            <#include "/client/goods_comment.ftl" />
        </div>
        
        <div class="pinlunbox fbpn">
            <ul>
                <#if username??>
                    <li class="pyts">
                        欢迎您<a href="/user"><strong>${username!''}</strong></a>，请发表问答/评论! 
                    </li>
                    <li class="title mt12">内容：</li>
                    <li class="texta mt12">
                      <label>
                        <textarea id="taComment" cols="100" rows="5" class="inp"></textarea>
                      </label>
                    </li>
                    <li class="title mt12">验证码：</li>
                    <li class="yzminp mt12"><input type="text" id="commentCode" /></li>
                    <li class="yzmimg mt12"><img onclick="this.src = '/code?date='+Math.random();" src="/code" width="96" height="21" alt="验证码" /></li>
                    <li class="tijiaobox mt12">
                        <input id="idSubmitComment" type="button" value="提交" class="an5"/>
                    </li>
                <#else>
                    <li class="pyts">
                        欢迎您访客，您在<a href="/login">登录</a>后才能发表问答/评论，如果没有帐户请<a href="/reg">注册</a>！  
                    </li>
                </#if>
            </ul>
        </div>      
    </div>
    
    <div id="consultDiv" class="right_list bor fr mt20" style="display:block;">
        <div class="right_list bor_bot1 fl">
            <div class="discuss_top">
                <h3>购买咨询</h3>
            </div>
        </div>
        <div id="consultList" class="eval-list comment-show codeHover" style="display: block;">
            <#include "/client/goods_consult.ftl" />
        </div>
        
        <div class="pinlunbox fbpn">
            <ul>
                <#if username??>
                    <li class="pyts">
                        欢迎您<a href="/user"><strong>${username!''}</strong></a>，请发表咨询! 
                    </li>
                    <li class="title mt12">内容：</li>
                    <li class="texta mt12">
                      <label>
                        <textarea id="taConsult" cols="100" rows="5" class="inp"></textarea>
                      </label>
                    </li>
                    <li class="title mt12">验证码：</li>
                    <li class="yzminp mt12"><input type="text" id="consultCode" /></li>
                    <li class="yzmimg mt12"><img onclick="this.src = '/code?date='+Math.random();" src="/code" width="96" height="21" alt="验证码" /></li>
                    <li class="tijiaobox mt12">
                        <input id="idSubmitConsult" type="button" value="提交" class="an5"/>
                    </li>
                <#else>
                    <li class="pyts">
                        欢迎您访客，您在<a href="/login">登录</a>后才能发表咨询，如果没有帐户请<a href="/reg">注册</a>！  
                    </li>
                </#if>
            </ul>
        </div>      
    </div>
    
    <!--右边结束-->
    <div class="clear"></div>
</article>
    
</article>
<!--主体结束-->
<#include "/client/common_footer.ftl" />
<!--底部结束-->
</body>
</html>
