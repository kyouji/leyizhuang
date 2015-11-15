<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<!--[if IE]>
   <script src="/client/js/html5.js"></script>
<![endif]-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/common.js"></script>
<script src="/client/js/ljs-v1.01.js"></script>
<script src="/client/js/content.js"></script>
<script src="/client/js/scro-content.js"></script>
<script type="text/javascript" src="/client/js/goods.js"></script>

<link rel="shortcut icon" href="/root/images/goods/zphk_logo.ico">
<link href="/client/css/common.css" rel="stylesheet" type="text/css" />
<link href="/client/css/cartoon.css" rel="stylesheet" type="text/css" />
<link href="/client/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/client/css/content_l.css" />

<script type="text/javascript">
  $(document).ready(function(){
    menuDownList("top_phone","#top_phonelist",".a1","sel");
    phoneListMore();//单独下拉
    menuDownList("top_order","#top_orderlist",".a4","sel");//顶部下拉
    searchTextClear(".toptext","请输入品牌或商品名称","#999","#666");
    searchTextClear(".bottext","查看所有门店","#fff","#fff");
    checkNowHover("shopping_down","shopping_sel");
    navDownList("navdown","li",".nav_showbox");
    menuDownList("mainnavdown","#navdown",".a2","sel");
    
    productImgShow("proshowimg","li","proshowmenu","sel",396,396);
    checkBoxShow("assort_menu","a","assort_sum","li","sel");
    topTitFloat("detail_tit",1250,"detail_tit_sel");

    $("#id-minus").click(function(){
        var q = parseInt($("#quantity").val());
        
        if (q > 1)
        {
            $("#quantity").val(q-1);
        }
        
        $("#addCart").attr("href", "/cart/init?id=${goods.id?c}&quantity=" + $("#quantity").val()); 
    });
    
    $("#id-plus").click(function(){
        var q = parseInt($("#quantity").val());
        
        <#if goods.leftNumber??>
            if (q < ${goods.leftNumber!'0'})
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
        $("#addCart").attr("href", "/cart/init?id=${goods.id?c}&quantity=" + $("#quantity").val()); 
    
    });
    
    $("#zhAddCart").click(function(){
        var str = "";
        $(".comboCheckBox:checked").each(function(){
            str += $(this).attr("zpid");
            str += ",";
        });
        var href = "/order/buy/comb?gid=" + ${goods.id?c} + "&zhid=" + str<#if shareId??>+"&shareId=${shareId}"</#if>;
        
        window.location = href;
        
    });
});

 function combSelect(self, price, originPrice)
    {
        var count = parseInt($("#combCount").html());
        var currentPrice = parseFloat($("#combCurrentPrice").html());
        var combOriginPrice = parseFloat($("#combOriginPrice").html());
        var combSavePrice = parseFloat($("#combSave").html());
        
        // 选中
        if (self.checked)
        {
            $("#combCount").html(count+1);
            $("#combCurrentPrice").html(currentPrice + price);
            $("#combOriginPrice").html(combOriginPrice + originPrice);
            $("#combSave").html(combSavePrice + originPrice - price);
        }
        // 取消选中
        else
        {
            $("#combCount").html(count-1);
            $("#combCurrentPrice").html(currentPrice - price);
            $("#combOriginPrice").html(combOriginPrice - originPrice);
            $("#combSave").html(combSavePrice - originPrice + price);
        }
    }
    
    function clearSelect()
    {
        $("#combCount").html(0);
        $("#combCurrentPrice").html(${goods.salePrice?string("0.00")});
        $("#combOriginPrice").html(${goods.salePrice?string("0.00")});
        $("#combSave").html(0);
        
        $(".comboCheckBox").attr("checked", false);
    }
    
function deleterecent()
{
     $.ajax({
            type: "post",
            url: "/user/recent/deleteAll",
            data: { },
            dataType: "json",
            success: function (data) { 
             if (data.code == 0) {
                   window.location.reload();
                } else {
                    alert(data.msg);
                }
            }
        });
}
</script>
</head>

<body>
<#include "/client/common_header.ftl" />
<div class="clear"></div>

<div class="pro_info">
  <h2 class="main pro_tit">
  <span><a href="/">首页</a></span>
   <#if category_tree_list??>
                <#list category_tree_list as category>
                    > <span><a href="/list/${category.id?c}">${category.title!""}</a></span>
                </#list>
    </#if>
    > <span>${goods.title!''}</span>
  </h2>
  
  <div class="pro_box">
    <section class="proinfo_left">
      <menu id="proshowimg">
          <#if goods.showPictures??>
                <#list goods.showPictures?split(",") as uri>
                    <#if ""!=uri && uri_index < 4>
                        <li><img src="${uri!''}" /></li>
                    </#if>
                </#list>
          </#if>
      </menu>
      <div class="clear h20"></div>
            <menu id="proshowmenu"></menu>
      <div class="clear h20"></div>
      
      <div class="pro_share">
        <div class="bdsharebuttonbox" style="float:left;">
                    <a href="#" class="bds_more" data-cmd="more"></a>
                    <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                    <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                    <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
                    <a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网">
                    </a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                  </div>
<script>
                window._bd_share_config={
                "common":{
                    "bdSnsKey":{},
                    "bdText":"正品惠客##${goods.title!''}", bdUrl:"http://116.55.230.207:8010/goods/${goods.id?c}", "bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},
                    "share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
</script>
                   
                    <span class="ml10" style="line-height:30px;">商品编码：${goods.code!''}</span> 
                    <a class="a1" href="javascript:addCollect(${goods.id?c});" style="line-height:30px;">关注该商品</a>
                    <div class="clear"></div>
      </div>
    </section><!--proinfo_left END-->
    
    <section class="proinfo_right">
      <h3>${goods.title!''}<!-- 删除<a href="#">对比</a> --></h3>
      <h4 class="red">${goods.subTitle!''}</h4>
      <div class="pro_price">
        <p class="p1">
          <span>惠客价格：</span>
          <span class="red fs24 lh30 mr20 l-weight">￥<#if goods.salePrice??>${goods.salePrice?string("0.00")}</#if></span>
          <a href="#"><img src="/client/images/content/pro_ico01.png" height="17" /><b>特惠</b></a>
         <!-- 删除 <a href="#"><img src="images/content/pro_ico02.png" height="17" /><b>对比</b></a>
          <a href="#"><img src="images/content/pro_ico03.png" height="17" /><b>走势</b></a> -->
        </p>
        <p class="p1">
          <span>促销信息：</span>
          <span class="l-gift">赠品</span>
          <span class="red">${goods.promotion!''}</span>
        </p>
        <p class="p1">
          <span style="display:block; width:500px">原装标配：${goods.configuration!''}</span>
        </p>
        <p class="p2">共有${goods.totalComments!'0'}人评论，${goods.totalCollects!'0'}人关注</p>
        <p class="p3">好评率：<span class="red fs26 lh30"><#if comment_count?? && three_star_comment_count?? && comment_count != 0>${three_star_comment_count/comment_count}<#else>100</#if>%</span></p>
      </div><!--pro_price END-->
      <table class="pro_choose">
        <#if total_select??>
            <#if 1==total_select>
                <tr>
                  <th>${select_one_name!''}：</th>
                  <td>
                    <#if select_one_goods_list??>
                    <#list select_one_goods_list as item>
                        <a <#if item.selectOneValue==one_selected>class="lchose""</#if> href="/goods/${item.id?c}">${item.selectOneValue}</a>
                    </#list>
                    </#if>
                  </td>
                </tr>
            <#elseif 2==total_select>
                <tr>
                    <th>${select_one_name!''}：</th>
                    <td>
                        <#if select_one_goods_list??>
                        <#list select_one_goods_list as item>
                            <a <#if item.selectOneValue==one_selected>class="lchose"</#if> href="/goods/${item.id?c}">${item.selectOneValue}</a>
                        </#list>
                        </#if>
                    </td>
                </tr>
                <tr>
                    <th>${select_two_name!''}：</th>
                    <td>
                        <#if select_two_goods_list??>
                        <#list select_two_goods_list as item>
                            <a <#if item.selectTwoValue==two_selected>class="lchose"</#if> href="/goods/${item.id?c}">${item.selectTwoValue}</a>
                        </#list>
                        </#if>
                    </td>
                </tr>
            <#elseif 3==total_select>
                <tr>
                    <th>${select_one_name!''}：</th>
                    <td>
                        <#if select_one_goods_list??>
                        <#list select_one_goods_list as item>
                            <a <#if item.selectOneValue==one_selected>class="lchose"</#if> href="/goods/${item.id?c}">${item.selectOneValue}</a>
                        </#list>
                        </#if>
                    </td>
                </tr>
                <tr>
                    <th>${select_two_name!''}：</th>
                    <td>
                        <#if select_two_goods_list??>
                        <#list select_two_goods_list as item>
                            <a <#if item.selectTwoValue==two_selected>class="lchose"</#if> href="/goods/${item.id?c}">${item.selectTwoValue}</a>
                        </#list>
                        </#if>
                    </td>
                </tr>
                <tr>
                    <th>${select_three_name!''}：</th>
                    <td>
                        <#if select_three_goods_list??>
                        <#list select_three_goods_list as item>
                            <a <#if item.selectThreeValue==three_selected>class="lchose"</#if> href="/goods/${item.id?c}">${item.selectThreeValue}</a>
                        </#list>
                        </#if>
                    </td>
                </tr>
            </#if>
        </#if>
        <tr>
          <th>服务支持：</th>
          <td>
            <#if GoodsService_item_list??>                                                       
            <#list GoodsService_item_list as item>      
              <#if item_index < 4 >             
                <img src="${item.logo!''}" width="26" height="26" style="vertical-align:middle;float: left;">                                                                  
                <div style="height: 26px;display: inline-block;line-height: 30px;color:#333333;float: left;margin-right: 40px;margin-left: 10px;">${item.title!''}</div>                                 
              </#if>
            </#list>
            </#if>
            <div class="clear"></div>
          </td>
        </tr>
        <tr>
          <th>数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量：</th>
          <td>

            <input name="quantity" class="text" id="quantity" type="text" value="1" />
             <div class="plus">
              <a href="javascript:;" id="id-plus">+</a>
              <a href="javascript:;" id="id-minus">-</a>
            </div>
            <div class="clear"></div>
          </td>
        </tr>
       <!-- <tr>
          <th>套&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;餐：</th>
          <td><a class="sel" href="###" onclick="lchose(this)">联通4G版</a><a href="###" onclick="lchose(this)">联通4G版</a><a href="###" onclick="lchose(this)">联通4G版</a></td>
        </tr> -->
        <tr>
          <th></th>
          <td>
            <!--<input type="submit" class="sub" id="addCart" href="/cart/init?id=${goods.id?c}<#if shareId??>&shareId=${shareId}</#if>" value="加入购物车" />
            <!-- 删除<input type="submit" class="sub sub01" value="分期付款" /> -->
            <a class="sub" style="height:35px; line-height:35px;text-align:center" id="addCart" href="/cart/init?id=${goods.id?c}">加入购物车</a>
            <div class="clear"></div>
          </td>
        </tr>
      </table>
      
      <div class="sys">
        <i><img src="/client/images/content/pro_sys.png" /></i>
        <p><img src="<#if site??>${site.wxQrCode!''}</#if>"  width="83" height="83"" /></p>
        <p class="pt5">关注官方微信<br /></p>
      </div>
    </section><!--proinfo_right END-->
    <div class="clear h20"></div>
  </div><!--pro_box END--> 
  <div class="clear h20"></div>
</div><!--pro_info END-->



<div class="main pt20">
  <#if goods.combList?? && goods.combList?size gt 0>  
  <section class="pro_assort">
    <menu id="assort_menu">
      <a class="sel" href="#">全部推荐</a>      
      <div class="clear"></div>
    </menu>
    <ul id="assort_sum">
      <li>
        <div class="part">
          <a href="/goods/${goods.id?c}"><img src="${goods.coverImageUri!''}" width="140" height="140" /></a>
          <p style="height: 30px; overflow: hidden;">${goods.title!''}</p>
          <p class="p1"><span>￥<#if goods.salePrice??>${goods.salePrice?string("0.00")}</#if></span></p>
        </div>
        <p class="part"><img src="/client/images/content/pro_plus.png" /></p>
       <#if goods.combList?? && goods.combList?size gt 0>
                    <#list goods.combList as item>
                      <#if item_index < 4 >
                        <div class="part">
                            <a href="/goods/${item.goodsId?c}"><img src="${item.coverImageUri!''}" width="140" height="140"/></a>
                            <p style="height: 30px; overflow: hidden;">${item.goodsTitle!''}</p>
                            <p class="p2"><del>￥${item.goodsPrice?string("0.00")}</del></p>
                            <p class="p1">
                                <input type="checkbox" class="comboCheckBox" zpid="${item.id?c}" onclick="javascript:combSelect(this, ${item.currentPrice?string("0.00")}, ${item.goodsPrice?string("0.00")});"/>
                                <span>￥${item.currentPrice?string("0.00")}</span>
                            </p>
                        </div>
                        <#if item_index+1 < goods.combList?size> 
                            <p class="part"><img src="/client/images/images/spxq_36.png" /></p>                   
                        </#if>
                      </#if>
                    </#list>
                </#if>
        <p class="part"><img src="/client/images/content/pro_eq.png" /></p>
        <div class="part01">
          <p>搭配价：￥<span class="red" id="combCurrentPrice">${goods.salePrice?string("0.00")}</span></p>
          <p>参考价：￥<span class="unl-th" id="combOriginPrice">${goods.salePrice?string("0.00")}</span></p>
          <input id="zhAddCart" class="sub" type="submit" value="立即购买" />
        </div>
        <div class="clear"></div>
      </li>      
    </ul>
    <div class="clear"></div>
  </section><!--pro_assort END-->
  </#if>
  <div class="clear h20"></div>
  <section class="column_left">
     <menu class="border-df mb20">
      <h3 class="tit mb10" style="border-bottom:1px dotted #ddd;">关于${tdProductCategory.title!''}，你可能在找</h3>
      <#if childrenCat_list??>
           <#list childrenCat_list as item>
                <a class="greybox" href="/list/${item.id?c}">${item.title!''}</a>
           </#list>
      </#if>     
     </menu>
    
    <menu class="border-df mb20">
      <h3 class="tit mb10" style="border-bottom:1px dotted #ddd;">其他品牌</h3>
      <#if brand_page??>
           <#list brand_page.content as brand>
                <a class="abox" href="/list/${tdProductCategory.id!'0'}-${brand_index+1}">${brand.title?trim!''}</a>
           </#list>
      </#if>
     </menu>
    
    <menu class="border-df">
      <h3 class="tit">新品推荐</h3>
      <#if new_sold_list??>
           <#list new_sold_list as item>
                <#if item_index < 8>
                     <li>
                        <a href="/goods/${item.id?c}"><img src="${item.coverImageUri!''}" /></a>
                        <a href="/goods/${item.id?c}" style="overflow: hidden;height: 40px;">${item.title!''}</a>
                        <p class="fs18 red ta-c">￥<#if item.salePrice??>${item.salePrice?string("0.00")}</#if></p>
                        <p class="fs12">已有<span class="blue">${item.totalCollects!''}</span>人关注</p>
                     </li>
                </#if>
           </#list>
          
      </#if>           
    </menu>

    <menu class="border-df mt20">
      <h3 class="tit">浏览记录</h3>
      <#if recent_page??>
        <#list recent_page.content as item>
            <#if item_index < 9>
                <a class="scan" href="/goods/${item.goodsId?c}">
                    <img src="${item.goodsCoverImageUri!''}" width="80" height="80"/>
                    <p style="overflow: hidden;height: 60px;">${item.goodsTitle!''}</p>
                    <p class="red">￥<#if item.goodsSalePrice??>${item.goodsSalePrice?string("0.00")}</#if></p>
                </a>
            </#if>
        </#list>
      </#if>     
      
      <div class="ta-r" style="border-top:1px dotted #ddd;"><a class="blue fs12 lh30" href="javascript:deleterecent();">清空浏览记录</a></div>
    </menu>
    
<!--    <menu class="border-df mt20">
      <h3 class="tit">猜你喜欢</h3>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      
    </menu> -->
    
 <!--   <menu class="border-df mt20">
      <h3 class="tit">相关配件</h3>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      <a class="scan" href="#">
        <img src="images/photo/img02.png" />
        <p>苹果iPhone 6 Plus/A1524 5.5英寸特惠版</p>
        <p class="red">￥5498.00</p>
      </a>
      
    </menu> -->
  </section><!--column_left END-->
  
  <div class="column_right">
    <div class="detail_tit" id="detail_tit">
      <div class="out">
        <menu id="product_show_div">
          <a class="sel stab" href="#item1">规格参数</a>
          <a href="#item2" class>商品介绍</a>
          <!--<a href="#item3" class>价格走势</a>-->
          <a href="#item3" class>商品评价</a>
          <a href="#item4" class>商品咨询</a>
          <div class="clear"></div>
        </menu>
      </div>
    </div><!--detail_tit END-->
    <div id="item1"></div>
     <table class="detail_tab">
      <#if goods.paramList??>
                <#list goods.paramList as param>
                    <#if param_index % 3 == 0 >
                        <tr>
                            <td>${param.paramName!''}: ${param.value!''}</td>
                            <#if goods.paramList?size gt param_index+1 >
                                <td>${goods.paramList[param_index+1].paramName!''}: ${goods.paramList[param_index+1].value!''}</td>
                            </#if>
                            <#if goods.paramList?size gt param_index+2 >
                                <td>${goods.paramList[param_index+2].paramName!''}: ${goods.paramList[param_index+2].value!''}</td>
                            </#if>
                        </tr>  
                    </#if>
                </#list>
            </#if>
    </table>
    <div id="item2"></div>
     ${goods.detail!''}    
    <div class="clear h10"></div>
    <div id="item3"></div>
    <section class="detail_hp">
    <div class="part02">
        好评率
        <p class="red fs28 lh40"><#if comment_count?? && three_star_comment_count?? && comment_count != 0>${three_star_comment_count/comment_count}<#else>0</#if>%</p>
      </div>
      <div class="part01">
        <h3 class="fs16 fw400">商品评价</h3>
        <p>
          好评<span><b style=" width:<#if comment_count?? && three_star_comment_count?? && comment_count != 0>${three_star_comment_count/comment_count}<#else>0</#if>%;"></b></span><#if comment_count?? && three_star_comment_count?? && comment_count != 0>${three_star_comment_count/comment_count}<#else>0</#if>%
        </p>
        <p>
          中评<span><b style=" width:<#if comment_count?? && two_star_comment_count?? && comment_count != 0>${two_star_comment_count/comment_count}<#else>0</#if>%;"></b></span><#if comment_count?? && two_star_comment_count?? && comment_count != 0>${two_star_comment_count/comment_count}<#else>0</#if>%
        </p>
        <p>
          差评<span><b style=" width:<#if comment_count?? && one_star_comment_count?? && comment_count != 0>${one_star_comment_count/comment_count}<#else>0</#if>%;"></b></span><#if comment_count?? && one_star_comment_count?? && comment_count != 0>${one_star_comment_count/comment_count}<#else>0</#if>%
        </p>
      </div>
      
      <div class="part03">
        <p class="fs16 pb10">综合评价</p>
        <span>照相不错（200）</span>
        <span>照相不错（200）</span>
        <span>外观漂亮（200）</span>
        <span>系统流畅（200）</span>
        <span>性价比高（200）</span>
      </div>
      <!-- 删除<div class="part04">
        <p class="pt20">写评价得优惠券</p>
        <a href="javascript:openMyWin('pro_mytext',300);">我要写评价</a>
      </div> -->
      <div class="clear"></div>
    </section>
       
    <div class="clear h20"></div>
     <#include "/client/goods_comment.ftl" />
    <div class="clear h20"></div>
    <div id="item4"></div>
    <section class="pro_myseek">
      <#if username??>
            <form id="consultForm" action="javascript:submitConsult();">
                <input type="hidden" name="goodsId" value=${goods.id?c} />
                <h3 class="lh30 fs18 fw400 pb10">购买咨询</h3>
                <menu>
                    <textarea name="content" datatype="*5-255" nullmsg="请输入咨询内容"></textarea>
                </menu>
                <p>温馨提示：我们将尽快回复您的咨询。</p>
                <div class="clear"></div>
                <input class="sub" type="submit" value="马上提问" />
            </form>
        <#else>
            <div>请 <a href="/login">登录</a> 以进行咨询</div>
        </#if>
    </section><!--pro_myseek END-->
    
    <#include "/client/goods_consult.ftl" />
    
  </div><!--column_right END-->
  
  <div class="clear"></div>
</div><!--main END-->

<div class="clear h40"></div>
<#include "/client/common_footer.ftl" />
</body>
</html>
