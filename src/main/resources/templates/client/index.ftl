<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>博大生活网——网站首页</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link href="/client/style/layout.css" rel="stylesheet" type="text/css" />
<link href="/client/style/master.css" rel="stylesheet" type="text/css" />
<link href="/client/style/css.css" rel="stylesheet" type="text/css" />
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/client/js/html5.js"></script>
<script type="text/javascript" src="/client/js/index.js"></script>
</head>
<body>
<header>
	<div id="main">
   	  <div class="top1">
            <span class="welcome">
                Hi,欢迎来到博大生活网!
                <#if username??>
                    <a href="/user" class="login">${username}&nbsp;(${user.userLevelTitle!''})
                        <#--
                        <dd class="vip" title="铁牌会员"></dd>
                        -->
                    </a>
                    <a href="/logout">退出</a>
                <#else>
                    <a href="/login" class="login">登录</a> <a href="/reg" class="register">免费注册</a>
                </#if>
                <#-- 配送：<dt>云南<b></b></dt> -->
            </span>
            <ul class="fright">
              <li><a href="/user/order/list/0" style="padding-left:25px;">我的订单</a></li>
              <li><a href="#" style="padding-left:35px;">在线客服</a></li>
              <li><a href="#" style="padding-left:25px;">手机博大</a></li>
              <li style=" font-size:16px; font-weight:bold; color:#da090b; padding-left:47px; font-family:"微软雅黑""><#if site??>${site.telephone!'400-739-1200'}</#if></li>
            </ul> 
        </div>
        
        <div class="wt1200">
        <div class="logo fl mt20"><a href="/" title="博大生活网"><img src="<#if site??>${site.logoUri!''}<#else>/client/images/logo.png</#if>" width="500" height="94"></a></div>
        
    <div class="fr mt12">
        <div class="serach">
            <form action="/search" method="get">
            <input class="input1" type="text" name="keywords" onfocus="if(value=='<#if keywords_list?? && keywords_list[0]??>${keywords_list[0].title!''}</#if>') {value=''}"size="15" value="<#if keywords_list?? && keywords_list[0]??>${keywords_list[0].title!''}</#if>"/>
            <input class="input2" type="submit" value=""/>
            </form>
            <span>
                <#if keywords_list??>
                <#list keywords_list as item>
                    <a href="${item.linkUri!''}">${item.title}</a> <#if item_index+1 != keywords_list?size>|</#if>
                </#list>
                </#if>
            </span>        
        </div>
        <div class="shopping fr wobble-top"><a href="/cart/"><b>去购物车结算</b><dd><#if cart_goods_list??>${cart_goods_list?size}</#if></dd></a></div>
        <div class="clear"></div>
      </div>
        </div>
            <nav class="mt4 fl">
            	<div class="all">全部商品分类
                    <div class="arrow-outer">
                        <div class="arrow-shadow"></div>
                    </div>
                    <div class="all_postion">    
                        <ul class="flmenu listno "><!--商品分类小菜单开始-->
                          <li>
                              <h5 class="flmenu">食品生鲜<span>></span></h5>
                              <#if fresh_cat_list??>
                                <#list fresh_cat_list as item>
                                    <a href="/list/${item.id}">${item.title}</a>
                                </#list>
                              </#if>
                              <div id="shopsub0" class="shopsub_show" style="display:none;">
                                  <div class="fleft">
                                    <dl class="xdl">
                                        <#if fresh_cat_list??>
                                        <#list fresh_cat_list as item>
                                            <dd> <b><a href="/list/${item.id}" style="font-size:14px; color:#333; width: 56px;">${item.title!''}</a></b>
                                                <p>
                                                    <#assign list_name = "fresh_sub_list" + item_index />
                                                    <#if list_name?eval??>
                                                        <#list list_name?eval as subItem>
                                                            <a title="${subItem.title!''}" href="/list/${subItem.id}">${subItem.title!''}</a> 
                                                        </#list>
                                                    </#if>
                                                </p>
                                            </dd>
                                        </#list>
                                        </#if>
                                    </dl>
                                  </div>
                              </div>
                          </li>
                          <li>
                              <h5 class="flmenu">家装厨具<span>></span></h5>
                              <#if kitchen_cat_list??>
                                <#list kitchen_cat_list as item>
                                    <a href="/list/${item.id}">${item.title}</a>
                                </#list>
                              </#if>
                              <div id="shopsub1" class="shopsub_show" style="display:none;">
                                  <div class="fleft">
                                    <dl class="xdl">
                                      <#if kitchen_cat_list??>
                                        <#list kitchen_cat_list as item>
                                            <dd> <b><a href="/list/${item.id}" style="font-size:14px; color:#333; width: 56px;">${item.title!''}</a></b>
                                                <p>
                                                    <#assign list_name = "kitchen_sub_list" + item_index />
                                                    <#if list_name?eval??>
                                                        <#list list_name?eval as subItem>
                                                            <a title="${subItem.title!''}" href="/list/${subItem.id}">${subItem.title!''}</a> 
                                                        </#list>
                                                    </#if>
                                                </p>
                                            </dd>
                                        </#list>
                                      </#if>
                                    </dl>
                                  </div>
                              </div>
                          </li>
                          <li>
                              <h5 class="flmenu">手机通讯<span>></span></h5>
                              <#if mobile_cat_list??>
                                <#list mobile_cat_list as item>
                                    <a href="/list/${item.id}">${item.title}</a>
                                </#list>
                              </#if>
                              <div id="shopsub2" class="shopsub_show" style="display:none;">
                                  <div class="fleft">
                                    <dl class="xdl">
                                      <#if mobile_cat_list??>
                                        <#list mobile_cat_list as item>
                                            <dd> <b><a href="/list/${item.id}" style="font-size:14px; color:#333; width: 56px;">${item.title!''}</a></b>
                                                <p>
                                                    <#assign list_name = "mobile_sub_list" + item_index />
                                                    <#if list_name?eval??>
                                                        <#list list_name?eval as subItem>
                                                            <a title="${subItem.title!''}" href="/list/${subItem.id}">${subItem.title!''}</a> 
                                                        </#list>
                                                    </#if>
                                                </p>
                                            </dd>
                                        </#list>
                                      </#if>
                                    </dl>
                                  </div>
                              </div>
                          </li>
                          <li>
                              <h5 class="flmenu">数码产品<span>></span></h5>
                              <#if digit_cat_list??>
                                <#list digit_cat_list as item>
                                    <a href="/list/${item.id}">${item.title}</a>
                                </#list>
                              </#if>
                              <div id="shopsub3" class="shopsub_show" style="display:none;">
                                  <div class="fleft">
                                    <dl class="xdl">
                                      <#if digit_cat_list??>
                                        <#list digit_cat_list as item>
                                            <dd> <b><a href="/list/${item.id}" style="font-size:14px; color:#333; width: 56px;">${item.title!''}</a></b>
                                                <p>
                                                    <#assign list_name = "digit_sub_list" + item_index />
                                                    <#if list_name?eval??>
                                                        <#list list_name?eval as subItem>
                                                            <a title="${subItem.title!''}" href="/list/${subItem.id}">${subItem.title!''}</a> 
                                                        </#list>
                                                    </#if>
                                                </p>
                                            </dd>
                                        </#list>
                                      </#if>
                                    </dl>
                                  </div>
                              </div>
                          </li>
                          <li>
                              <h5 class="flmenu">男装女装<span>></span></h5>
                              <#if cloth_cat_list??>
                                <#list cloth_cat_list as item>
                                    <a href="/list/${item.id}">${item.title}</a>
                                </#list>
                              </#if>
                              <div id="shopsub4" class="shopsub_show" style="display:none;">
                                  <div class="fleft">
                                    <dl class="xdl">
                                      <#if cloth_cat_list??>
                                        <#list cloth_cat_list as item>
                                            <dd> <b><a href="/list/${item.id}" style="font-size:14px; color:#333; width: 56px;">${item.title!''}</a></b>
                                                <p>
                                                    <#assign list_name = "cloth_sub_list" + item_index />
                                                    <#if list_name?eval??>
                                                        <#list list_name?eval as subItem>
                                                            <a title="${subItem.title!''}" href="/list/${subItem.id}">${subItem.title!''}</a> 
                                                        </#list>
                                                    </#if>
                                                </p>
                                            </dd>
                                        </#list>
                                      </#if>
                                    </dl>
                                  </div>
                              </div>
                          </li>
                        </ul> 
                    </div>
			     </div>
                <div class="menu">
                <ul>
                    <#if navi_item_list??>
                        <#list navi_item_list as item>
                            <li>
                                <img src="${item.iconUri!''}" width="24" height="24" />
                                <a href="${item.linkUri!''}">${item.title!''}</a>
                            </li>  
                        </#list>
                    </#if> 
                </ul>
                <div class="aq"></div>
                </div>
                <div class="clear"></div>
            </nav>
            <div class="banner fl mt10">
                <#if banner_ad_list??>
                    <#list banner_ad_list as item>
                        <a href="${item.linkUri!''}"><img src="${item.fileUri!''}" width="730" height="370" /></a>
                    </#list>
                </#if>
            </div>
            <div class="sevrcie bor mt10 fr">
            	<h3>生活服务</h3>
                <div class="mc">
                        <ul>
                            <li class="fore1" data-iframe="http://chongzhi.jd.com/jd-index-ifame.htm" clstag="h|keycount|2015|10b01" data-idx="0">
                                <a class="cw-icon" href="#">
                                    <i class="ci-left" ></i><span>话费</span>
                                </a>
                            </li>	
                            <li class="fore2" data-iframe="http://jipiao.jd.com/htm/iframeTrip.html" clstag="h|keycount|2015|10b02" data-idx="1">
                                <a class="cw-icon" href="#">
                                    <i class="ci-left" ></i><span>机票</span>
                                </a>
                            </li>	
                            <li class="fore3" data-iframe="http://movie.jd.com/jdmovie.html" clstag="h|keycount|2015|10b03" data-idx="2">
                                <a class="cw-icon" href="#">
                                    <i class="ci-left" ></i><span>电影票</span>
                                </a>
                            </li>	
                            <li class="fore4" data-iframe="http://card.jd.com/html/card-jdIndex2015.html" clstag="h|keycount|2015|10b04" data-idx="3">
                                <a class="cw-icon" href="#">
                                    <i class="ci-left" ></i><span>游戏</span>
                                </a>
                            </li>	
                            <li class="fore5" clstag="h|keycount|2015|10b05">
                                <a class="cw-icon" href="#">
                                    <i class="ci-left" ></i><span>旅行</span>
                                </a>
                            </li>	
                            <li class="fore6" clstag="h|keycount|2015|10b06">
                                <a class="cw-icon" href="#">
                                    <i class="ci-left" ></i><span>团购</span>
                                </a>
                            </li>	
                            <li class="fore7" clstag="h|keycount|2015|10b07">
                                <a class="cw-icon" href="#">
                                    <i class="ci-left" ></i><span>酒店</span>
                                </a>
                            </li>	
                            <li class="fore8" clstag="h|keycount|2015|10b08">
                                <a class="cw-icon" href="#">
                                    <i class="ci-left" ></i><span>水电煤</span>
                                </a>
                            </li>
                            <li class="fore9" clstag="h|keycount|2015|10b08">
                                <a class="cw-icon" href="#">
                                    <i class="ci-left"></i><span>更多</span>
                                </a>
                            </li> 
                        </ul>
                    </div>
                    
                    <div class="iframe-recharge iframe-wrap">
                        <ul class="tab-iframe" id="tab-iframe">
                          <li class="tab-item-selected"><a href="javascript:;" clstag="h|keycount|2015|10b01a">话费充值</a></li>
                        </ul>
                      <div class="iframe-recharge iframe-wrap">
    <div class="content-iframe">
        <dl class="form-top">
            <dt>
                <label for="">号码</label>
            </dt>
            <dd class="pr"><input type="text" class="input-phone" value="移动、联通、电信" ></dd>
        </dl>
        <dl class="form-bottom">
            <dt><label for="">面值</label></dt>
            <dd>
                <select name="" class="select-price-money" >
                    <option value="50">50元</option>
                    <option value="100" selected="selected">100元</option>
                    <option value="200">200元</option>
                </select>
            </dd>
            <dd>
                <span class="msg-price" id="priceRecharge">￥98.0-￥100.0</span>
            </dd>

        </dl>
        <div class="btn-wrap" id="btnRecharge">
            <input type="button" value="立即充值" class="btn-submit" >
        </div>
    </div>
</div>
      </div>
    </div>
</div> 
</header>
<!--header结束-->
<article id="main">
<div class="promotionWrapper">
	<div class="left J_leftWrapper">
		<div class="leftTitle">
			<h3>特价闪购</h3><a href="/promotion/tuan">更多 ></a>
		</div>

		<div class="leftTabController J_leftTabController">
			<span class="leftTabBtn J_leftTabBtn" tabindex="1" style="display:none">下期预告</span>
		</div>

		<div class="leftItem J_leftTab" tabindex="0" style="">
			<#if tuan_page??>
                <#list tuan_page.content as item>
                    <#if item_index < 3>
                    <div class="itemWrapper" compaignid="" sellerid="">
                        <a href="/goods/${item.id}">
                            <img width="260" height="260" alt="" src="${item.coverImageUri!''}">
                            <h5>${item.title!''}</h5>
                            <h6>${item.subTitle!''}</h6>
                            <span class="description">
                                <span class="flag flag_39487"></span>
                            </span>
                            <div class="price"><b>￥${item.groupSalePrice?string("0.00")}</b>
                                <h4 id="timeLeft${item_index}">倒计时 01:01:35</h4>
                            </div>
<script type="text/javascript">
$(document).ready(function(){
    setInterval("timer${item_index}()",1000);
});
function timer${item_index}()
{
<#if item.isGroupSale && item.groupSaleStartTime < .now && item.groupSaleStopTime gt .now>
    var ts = (new Date(${item.groupSaleStopTime?string("yyyy")}, 
                parseInt(${item.groupSaleStopTime?string("MM")}, 10)-1, 
                ${item.groupSaleStopTime?string("dd")}, 
                ${item.groupSaleStopTime?string("HH")}, 
                ${item.groupSaleStopTime?string("mm")}, 
                ${item.groupSaleStopTime?string("ss")})) - (new Date());//计算剩余的毫秒数
    if (0 == ts)
    {
        window.location.reload();
    }
    
    var date = new Date();
    var dd = parseInt(ts / 1000 / 60 / 60 / 24, 10);//计算剩余的天数
    var hh = parseInt(ts / 1000 / 60 / 60 % 24, 10);//计算剩余的小时数
    var mm = parseInt(ts / 1000 / 60 % 60, 10);//计算剩余的分钟数
    var ss = parseInt(ts / 1000 % 60, 10);//计算剩余的秒数
    dd = checkTime${item_index}(dd);
    hh = checkTime${item_index}(hh);
    mm = checkTime${item_index}(mm);
    ss = checkTime${item_index}(ss);
    $("#timeLeft${item_index}").html("倒计时：" + dd + "天" + hh + "小时" + mm + "分" + ss +"秒");
</#if>
}

function checkTime${item_index}(i)  
{  
    if (i < 10) {  
        i = "0" + i;  
    }  
    return i;  
} 
</script>                   
                            <div class="buyBtn J_buyBtn" style="display: block;">立即抢购</div>
                            <div class="promoIcon promoIconActive J_promoIcon">
                            <div class="promoA">${item.groupSaleLeftNumber!'0'}</div></div>
                        </a>
                    </div>
                    </#if>
                </#list>
			</#if>
		</div>

    </div>
		<!--左边结束-->	
    <div class="right J_rightWrapper pt20">
      <h4>——下期预告——</h4>
        <ul>
        	<input type="button" class="bot2 bot2_hover" />
        	<#if next_tuan_page??>
        	   <#list next_tuan_page.content as item>
        	       <li>
        	           <a href="/goods/${item.id}">
        	               <img src="${item.coverImageUri!''}" width="108" height="108" />
        	               <span>${item.title!''}</span>
    	               </a>
    	               <dd>￥${item.groupSalePrice?string("0.00")}</dd>
	               </li>
        	   </#list>
        	</#if>
           	<input type="button" class="bot3" />
        </ul>
        <div class="flv fl mt20">
            <#if next_ad_list??>
                <#list next_ad_list as item>
                    <a href="${item.linkUri!''}"><img src="${item.fileUri!''}" width="309" height="235"/></a>
                </#list>
            </#if>
        </div>
      </div>
    <!--右边结束-->	
	<div style="clear:both"></div>
</div>
</article>
<!--闪购结束-->
<article id="main">
	<div class="brand fl">
    	<h4><b>MY BRAND</b><p>品牌专区</p></h4>
        <table width="100%" border="2" cellspacing="0" cellpadding="0" class="h335">
            <#if brand_page??>
                <#list brand_page.content as item>
                    <#if item_index % 2 ==0 && item_index < 10>
                        <tr>
                            <td><a href="${item.linkUri}"><img src="${item.logoUri}" width="80" height="43" /></a></td>
                            <#if brand_page.content[item_index+1]??>
                                <td><a href="${brand_page.content[item_index+1].linkUri}"><img src="${brand_page.content[item_index+1].logoUri}" width="80" height="43" /></a></td>
                            </#if>
                        </tr>
                    </#if>
                </#list>
            </#if>
        </table>
    </div>
    
    <ul class="brand_ri fr">
        <#if brand_big_list??>
            <#list brand_big_list as item>
                <li>
                    <a href="${item.linkUri!''}"><img src="${item.logoUri!''}" width="440" height="442" /></a>
                </li>
            </#list>
        </#if>
    </ul>
    
    <ul class="hot-index fl mt15">
        <#if brand_small_list??>
            <#list brand_small_list as item>
                <li>
                    <a href="${item.linkUri!''}"><img src="${item.fileUri!''}" alt="${item.title!''}"/><span class="title">${item.title!''}</span><span class="shine">&nbsp;</span></a>
                </li>
            </#list>
        </#if>
    </ul>
</article>
<div class="clear"></div>
<!--今日最大牌结束-->
<article id="main">
	<div class="1f_bd mt20">
    	<div class="mab">
             <h4>1F 食品生鲜 <b><img src="/client/images/hx.png" width="172" height="35" /></b></h4>
         </div>
         
         <div class="main-six-content home" style="display: block;">
      <div class="grid-container-260">
        <div class="banner_box banner_box_on" mark="hover" hover_class="banner_box_on">
          
          <div class="image" style="opacity: 1; display: block;">
            <#if fresh_floor_list??>
                <#list fresh_floor_list as item>
                    <a href="${item.linkUri!''}">
                      <img src="${item.fileUri!''}" style="display: block;">
                    </a>
                </#list>
            </#if>
          </div>
          <div class="g-arr-prev arr" mark="hover" hover_class="g-arr-prev-on" style="display: none;"></div>
          <div class="g-arr-next arr" mark="hover" hover_class="g-arr-next-on" style="display: none;"></div>
        </div>
        <div class="circle-products clear_float">
          <ul>
            <#if fresh_subcategory_list??>
                <#list fresh_subcategory_list as item>
                    <#if item.imgUrl?? && item.imgUrl!="">
                    <li>
                      <a class="pic" href="/list/${item.id}"><img src="${item.imgUrl}" ></a>
                      <a href="">${item.title}</a>
                    </li>
                    </#if>
                </#list>
            </#if>
          </ul>
        </div>
      </div>
      <div class="grid-container-129">
        <div class="cat-brand-slide j_CatBrandSlide">
          <ul class="cat-brand-content clearfix">
            <div>
				<li>
				    <#if fresh_brand_page??>
				        <#list fresh_brand_page.content as item>
				            <a href="${item.linkUri!''}">
				                <img src="${item.logoUri!''}" style="display: block;">
			                </a>
				        </#list>
				    </#if>
				</li>
            </div>
          </ul>
        <ul class="dots clearfix" style="margin-left: -16px;"><li seldata="0" class="cur">1</li><li seldata="1">2</li></ul></div>
        <div class="key-words">
          <ul>
            <#if fresh_subcategory_list??>
                <#list fresh_subcategory_list as item>
                    <li><a href="/list/${item.id}">${item.title!''}</a></li>
                </#list>
            </#if>
          </ul>
        </div>
      </div>
      <div class="grid-container-790">
        <div class="pruduct-box">
          <ul>
            <#if fresh_goods_page??>
                <#list fresh_goods_page.content as item>
                    <li>
                        <a class="pic" href="/goods/${item.id}">
                            <img class="adaptive" src="${item.coverImageUri!''}" style="display: block; position: absolute; left: 0px; top: 0px; width: 180px; height: 180px; ">
                        </a>
                        <p class="title">
                            <a class="name" href="/goods/${item.id}" title="${item.title}">${item.title}</a>
                        </p>
                        <p class="price">￥<b>${item.salePrice?string("0.00")}</b></p>
                        <div class="divide-line"></div>
                        <p class="icons"><span class="blue">积分</span></p>
                    </li>
                </#list>
            </#if>
          </ul>
        </div>
      </div>
    </div>
    </div>
</article>
<div class="clear"></div>
<!--1F结束-->
<article id="main">
	<div class="1f_bd mt20">
    	<div class="mab1">
             <h4>2F 家装厨具 <b><img src="/client/images/jaj.png" width="193" height="35" /></b></h4>
         </div>
    <div class="frist_nr">
            <div class="firstleft fleft "><!--专区左边-->
                <ul class=" firstleftul listno">
                    <#if kitchen_page??>
                        <#list kitchen_page.content as item>
                            <#if item_index < 3>
                            <li>
                                <a href="/goods/${item.id}">
                                    <img src="${item.coverImageUri!''}" alt="${item.title!''}" width="90" height="93" align="left" />
                                </a>
                                <span>
                                    <a href="/goods/${item.id}" title="${item.title!''}">${item.title!''}</a>
                                    <strong>${item.salePrice?string("0.00")}元</strong>
                                </span>
                            </li>
                            </#if>
                        </#list>
                    </#if>
                    <#if kitchen_floor_list??>
                        <#list kitchen_floor_list as item>
                            <a href="${item.linkUri!''}" title="${item.title!''}"><img src="${item.fileUri!''}" alt="${item.title!''}" width="237" height="204" /></a>
                        </#list>
                    </#if>
                </ul>
              </div>     
              <div class="firstright"><!--专区右边-->
                <ul>
                    <#if kitchen_page?? && kitchen_page.content?size gt 3>
                        <#list kitchen_page.content as item>
                            <#if item_index gt 2 && item_index < 8>
                            <li>
                                <a href="/goods/${item.id}"><img src="${item.coverImageUri!''}" alt="${item.title!''}" width="170" height="170" /></a>
                                <dd><a href="/goods/${item.id}" title="${item.title!''}">${item.title!''}</a></dd>
                                <span>&yen;${item.salePrice?string("0.00")}</span>
                            </li>
                            </#if>
                        </#list>
                    </#if>
                </ul>
                <ul>
                    <#if kitchen_page?? && kitchen_page.content?size gt 8>
                        <#list kitchen_page.content as item>
                            <#if item_index gt 7 && item_index < 13>
                            <li>
                                <a href="/goods/${item.id}"><img src="${item.coverImageUri!''}" alt="${item.title!''}" width="170" height="170" /></a>
                                <dd><a href="/goods/${item.id}" title="${item.title!''}">${item.title!''}</a></dd>
                                <span>&yen;${item.salePrice?string("0.00")}</span>
                            </li>
                            </#if>
                        </#list>
                    </#if>
                </ul>
              </div>    		
         </div>
         
             </div>
</article>
<div class="clear"></div>
<!--2F结束-->
<article id="main">
	<div class="1f_bd mt20">
    	<div class="mab3">
             <h4>3F 手机通讯 <b><img src="/client/images/tx.png" width="184" height="35" /></b></h4>
         </div>
         
         <div class="main-six-content home" style="display: block;">
      <div class="grid-container-260">
        <div class="banner_box banner_box_on" mark="hover" hover_class="banner_box_on">
          
            <div class="image" style="opacity: 1; display: block;">
            <#if mobile_floor_list??>
                <#list mobile_floor_list as item>
                    <a href="${item.linkUri!''}">
                      <img src="${item.fileUri!''}" style="display: block;">
                    </a>
                </#list>
            </#if>
            </div>
          	
          <div class="g-arr-prev arr" mark="hover" hover_class="g-arr-prev-on" style="display: none;"></div>
          <div class="g-arr-next arr" mark="hover" hover_class="g-arr-next-on" style="display: none;"></div>
        </div>
        <div class="circle-products clear_float">
          <ul>
            <#if mobile_subcategory_list??>
                <#list mobile_subcategory_list as item>
                    <#if item.imgUrl?? && item.imgUrl!="">
                    <li>
                      <a class="pic" href="/list/${item.id}"><img src="${item.imgUrl}" ></a>
                      <a href="">${item.title}</a>
                    </li>
                    </#if>
                </#list>
            </#if>
          </ul>
        </div>
      </div>
      <div class="grid-container-129">
        <div class="cat-brand-slide j_CatBrandSlide">
          <ul class="cat-brand-content clearfix">
            <div>
				<li>
				    <#if mobile_brand_page??>
                        <#list mobile_brand_page.content as item>
                            <a href="${item.linkUri!''}">
                                <img src="${item.logoUri!''}" style="display: block;">
                            </a>
                        </#list>
                    </#if>
				</li>
            </div>
          </ul>
        <ul class="dots clearfix" style="margin-left: -16px;"><li seldata="0" class="cur">1</li><li seldata="1">2</li></ul></div>
        <div class="key-words">
          <ul>
            <#if mobile_subcategory_list??>
                <#list mobile_subcategory_list as item>
                    <li><a href="/list/${item.id}">${item.title!''}</a></li>
                </#list>
            </#if>
          </ul>
        </div>
      </div>
      <div class="grid-container-790">
        <div class="pruduct-box">
          <ul>       
            <#if mobile_goods_page??>
                <#list mobile_goods_page.content as item>
                    <li>
                        <a class="pic" href="/goods/${item.id}">
                            <img class="adaptive" src="${item.coverImageUri!''}" style="display: block; position: absolute; left: 0px; top: 0px; width: 180px; height: 180px; ">
                        </a>
                        <p class="title">
                            <a class="name" href="/goods/${item.id}" title="${item.title}">${item.title}</a>
                        </p>
                        <p class="price">￥<b>${item.salePrice?string("0.00")}</b></p>
                        <div class="divide-line"></div>
                        <p class="icons"><span class="blue">积分</span></p>
                    </li>
                </#list>
            </#if> 
          </ul>
        </div>
      </div>
    </div>
    </div>
</article>
<div class="clear"></div>
<!--3F结束-->
<article id="main" class="mt20">
    <div class="news">
        <div class="news_le main1">
       	    <div class="news_top">
                <h4>最新资讯</h4>
                <div class="more1"><a href="/info/list/${news_id!''}">more.</a></div>
            </div>
            <div class="ab_neir">
                <ul>
                    <#if latest_news_page??>
                        <#list latest_news_page.content as item>
                            <li><a href="/info/content/${item.id}?mid=${news_id}">${item.title!''}</a></li>
                        </#list>
                    </#if>
                </ul>
            </div>
        </div>
        
        <div class="daog main1">
    	   <div class="daog_top">
                <ul class="tab2">
                <#if news_level0_cat_list??>
                    <#list news_level0_cat_list as item>
                        <li><a href="javascript:;}">${item.title}</a></li>
                    </#list>
                </#if>
                </ul>
                <div class="more1"><a href="/info/list/${news_id!''}">more.</a></div>
            </div>
            
            <div>
    			<div class="jh_01 zy_left">
                   <div class="ab_neir1">
                        <ul>
                            <#if cat0_news_list??>
                                <#list cat0_news_list as item>
                                    <#if item_index < 9>
                                        <li><a href="/info/content/${item.id}?mid=${news_id}">${item.title!''}</a></li>
                                    </#if>
                                </#list>
                            </#if>
                        </ul>
                    </div>
                </div>
                        
    			<div class="jh_01 ">
                   <div class="ab_neir1">
                        <ul>
                            <#if cat0_news_list??>
                                <#list cat0_news_list as item>
                                    <#if item_index gt 8 && item_index < 18>
                                        <li><a href="/info/content/${item.id}?mid=${news_id}">${item.title!''}</a></li>
                                    </#if>
                                </#list>
                            </#if>
                        </ul>
                    </div>
                </div>  
            </div>  
    </div>
    
    <div class="changx">
   	  <div class="changx_top"><h4>通知公告</h4></div>
        <div class="changx_nr">
        	<ul>
        	   <#if latest_note_page??>
        	       <#list latest_note_page.content as item>
        	           <li><a href="/info/content/${item.id}?mid=${note_id}">${item.title}</a></li>
        	       </#list>
        	   </#if>
            </ul>
        </div>
   </div>     
</div>
</article>
<!--新闻结束-->
<#include "/client/common_footer.ftl" />
<!--底部结束-->
</body>
</html>
