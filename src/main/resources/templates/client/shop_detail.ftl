<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>车有同盟</title>
<meta name="keywords" content="${site.seoKeywords!''}">
<meta name="description" content="${site.seoDescription!''}">
<meta name="copyright" content="${site.copyright!''}" />
<!--[if IE]>
   <script src="/client/js/html5.js"></script>
<![endif]-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/common.js"></script>
<script src="/client/js/ljs-v1.01.js"></script>

<link href="/client/style/common.css" rel="stylesheet" type="text/css" />
<link href="/client/style/cytm.css" rel="stylesheet" type="text/css" />
<link href="/client/style/cartoon.css" rel="stylesheet" type="text/css" />
<link href="/client/style/style.css" rel="stylesheet" type="text/css" />

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
	//productBoxShow("assort_menu","a","assort_ol","li","assort_sum","ul","sel");
	productBoxWidth(".partside");
	topTitFloat("detail_tit",1100,"detail_tit_sel");
});
</script>
</head>
<body>
<#include "/client/common_header.ftl" />

<div class="main">
    <div class="dituxiangxi">
    <div class="pro_box">
        <section class="proinfo_left">
            <menu id="proshowimg">
                <#if shop?? && shop.showPictures??>
                    <#list shop.showPictures?split(",") as uri>
                        <#if uri != "" && uri_index < 4>
                            <li><img src="${uri!""}" /></li>
                        </#if>
                    </#list>
                </#if>
            </menu>
            
            <div class="clear h15"></div>
            <menu id="proshowmenu"></menu>
            <div class="clear"></div>
    
        </section><!--proinfo_left END-->
    
    <section class="proinfo_right">
        <h3><#if shop??>${shop.title!''}</#if></h3>
        <div class="pro_price">
        
            <p class="p1">
             门店地址：<#if shop??>${shop.address!''}</#if>
            </p>
            <p class="p1">
             所在区域：<#if shop??>${shop.city!''}</#if>
            </p>
            <p class="p1">
            付款方式：<#if shop??>${shop.payType!''}</#if>
            </p>
            <p class="p1">
            营业时间：<#if shop??>${shop.openTimeSpan!''}</#if>
            </p>
            <p class="p1">
            门店客服：<#if shop??>${shop.serviceTele!''}</#if>
            </p>
            <p class="p1">
            投诉电话：<#if shop??>${shop.complainTele!''}</#if>
            </p>
        </div><!--pro_price END-->
        <table class="pro_choose">
            <tr>
                <td colspan="2">
                    <!--<input type="submit" class="sub" value="立即购买" />-->
                    <a href="javascript:;" class="sub" style="text-align:center;">地址发送到手机</a>
                    <div class="clear"></div>
                </td>
            </tr>
        </table>
      
    </section><!--proinfo_right END-->
    <div class="clear h20"></div>
</div>
<div class="clear"></div>
<#--
<menu class="pro_eval w100">
      <p class="pb10 lh25"><span class="circle_tit">车友口碑</span></p>
      <h3 class="tit"><input type="radio" /><span>全部评价</span><input type="radio" /><span>好评（10）</span><input type="radio" /><span>中评（5）</span><input type="radio" /><span>差评（5）</span></h3>
      <li>
        <a class="a1" href="#"><img src="/client/images/photo/img05.png" /><p>135******555</p></a>
        <p class="pb10">手机很好很强大，性价比非常不错，朋友看了都喜欢！手机很好很强大，性价比非常不错，朋友看了都喜欢！手机很好很强大，性价比非常不错，朋友看了都喜欢！</p>
        <span class="time">2015.05.12</span>
        <div>
          <p>
            <span class="fl ml20">同盟店服务态度：</span>
            <a class="fl" href="#"><img src="/client/images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="/client/images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="/client/images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="/client/images/content/start02.png" /></a>
            <a class="fl" href="#"><img src="/client/images/content/start03.png" /></a>
          </p>
          <p class="clear h10"></p>
          <p>
            <span class="fl ml20">同盟店服务态度：</span>
            <a class="fl" href="#"><img src="/client/images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="/client/images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="/client/images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="/client/images/content/start02.png" /></a>
            <a class="fl" href="#"><img src="/client/images/content/start03.png" /></a>
          </p>
          <p class="clear h10"></p>
          <p>
            <span class="fl ml20">同盟店服务态度：</span>
            <a class="fl" href="#"><img src="/client/images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="/client/images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="/client/images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="/client/images/content/start02.png" /></a>
            <a class="fl" href="#"><img src="/client/images/content/start03.png" /></a>
          </p>
        </div>
      </li>
      <li>
        <a class="a1" href="#"><img src="images/photo/img05.png" /><p>135******555</p></a>
        <p class="pb10">手机很好很强大，性价比非常不错，朋友看了都喜欢！手机很好很强大，性价比非常不错，朋友看了都喜欢！手机很好很强大，性价比非常不错，朋友看了都喜欢！</p>
        <span class="time">2015.05.12</span>
        <div>
          <p>
            <span class="fl ml20">同盟店服务态度：</span>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start02.png" /></a>
            <a class="fl" href="#"><img src="images/content/start03.png" /></a>
          </p>
          <p class="clear h10"></p>
          <p>
            <span class="fl ml20">同盟店服务态度：</span>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start02.png" /></a>
            <a class="fl" href="#"><img src="images/content/start03.png" /></a>
          </p>
          <p class="clear h10"></p>
          <p>
            <span class="fl ml20">同盟店服务态度：</span>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start02.png" /></a>
            <a class="fl" href="#"><img src="images/content/start03.png" /></a>
          </p>
        </div>
      </li>
      <li>
        <a class="a1" href="#"><img src="images/photo/img05.png" /><p>135******555</p></a>
        <p class="pb10">手机很好很强大，性价比非常不错，朋友看了都喜欢！手机很好很强大，性价比非常不错，朋友看了都喜欢！手机很好很强大，性价比非常不错，朋友看了都喜欢！</p>
        <span class="time">2015.05.12</span>
        <div>
          <p>
            <span class="fl ml20">同盟店服务态度：</span>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start02.png" /></a>
            <a class="fl" href="#"><img src="images/content/start03.png" /></a>
          </p>
          <p class="clear h10"></p>
          <p>
            <span class="fl ml20">同盟店服务态度：</span>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start02.png" /></a>
            <a class="fl" href="#"><img src="images/content/start03.png" /></a>
          </p>
          <p class="clear h10"></p>
          <p>
            <span class="fl ml20">同盟店服务态度：</span>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start02.png" /></a>
            <a class="fl" href="#"><img src="images/content/start03.png" /></a>
          </p>
        </div>
      </li>
      <li>
        <a class="a1" href="#"><img src="images/photo/img05.png" /><p>135******555</p></a>
        <p class="pb10">手机很好很强大，性价比非常不错，朋友看了都喜欢！手机很好很强大，性价比非常不错，朋友看了都喜欢！手机很好很强大，性价比非常不错，朋友看了都喜欢！</p>
        <span class="time">2015.05.12</span>
        <div>
          <p>
            <span class="fl ml20">同盟店服务态度：</span>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start02.png" /></a>
            <a class="fl" href="#"><img src="images/content/start03.png" /></a>
          </p>
          <p class="clear h10"></p>
          <p>
            <span class="fl ml20">同盟店服务态度：</span>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start02.png" /></a>
            <a class="fl" href="#"><img src="images/content/start03.png" /></a>
          </p>
          <p class="clear h10"></p>
          <p>
            <span class="fl ml20">同盟店服务态度：</span>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start02.png" /></a>
            <a class="fl" href="#"><img src="images/content/start03.png" /></a>
          </p>
        </div>
      </li>
      <li>
        <a class="a1" href="#"><img src="images/photo/img05.png" /><p>135******555</p></a>
        <p class="pb10">手机很好很强大，性价比非常不错，朋友看了都喜欢！手机很好很强大，性价比非常不错，朋友看了都喜欢！手机很好很强大，性价比非常不错，朋友看了都喜欢！</p>
        <span class="time">2015.05.12</span>
        <div>
          <p>
            <span class="fl ml20">同盟店服务态度：</span>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start02.png" /></a>
            <a class="fl" href="#"><img src="images/content/start03.png" /></a>
          </p>
          <p class="clear h10"></p>
          <p>
            <span class="fl ml20">同盟店服务态度：</span>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start02.png" /></a>
            <a class="fl" href="#"><img src="images/content/start03.png" /></a>
          </p>
          <p class="clear h10"></p>
          <p>
            <span class="fl ml20">同盟店服务态度：</span>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start01.png" /></a>
            <a class="fl" href="#"><img src="images/content/start02.png" /></a>
            <a class="fl" href="#"><img src="images/content/start03.png" /></a>
          </p>
        </div>
      </li>
      
    </menu>
  </div>
      <div class="clear h20"></div>
      <div class="darkpage">
        <a href="#">上一页</a>
        <a class="sel" href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <span class="sp1">……</span>
        <a href="#">99</a>
        <a href="#">下一页</a>
        <span class="sp1">共99页</span>
        <div>
          <span class="fl mr5">到第</span>
          <input type="text" value="1" class="text" />
          <span class="fl mr5 ml5">页</span>
          <input type="submit" class="sub" value="确定" />
          <p class="clear"></p>
        </div>
      </div>

  
  
 -->
  
  
  
  
  <div class="clear"></div> 
</div><!--main END-->

<div class="clear h50"></div>
<#include "/client/common_footer.ftl" />
</body>
</html>
