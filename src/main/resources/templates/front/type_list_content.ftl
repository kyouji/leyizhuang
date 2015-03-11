<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>荣诚手机超市</title>
<meta name="keywords" content="荣诚手机超市" />
<meta name="description" content="荣诚手机超市" />
<meta name="copyright" content="荣诚手机超市 版权所有" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/rcindex.css" rel="stylesheet" type="text/css" />
<liNK rel=stylesheet type=text/css href="/Tm/css/carousel.css">
<style type="text/css">
	.t_red{font-size:14px;color:red;font-family:微软雅黑"}
	#3dmax .3ds{font-size:16px;font-family:微软雅黑;color:#666}
	 *{padding:0;margin:0;}
  #outbox {position:absolute;left:150px;top:286px;width:500px;height:400px;display:block;}
  #outbox img {width:400px;height:400px;}
</style>
<link rel="stylesheet" type="text/css" href="/Tm/css/manhuaTip1.1.0.css" />
<link id="cssfile" type="text/css" rel="stylesheet" href="/Tm/css/dialog_blue.css"/>
<script type="text/javascript" src="/Tm/js/jquery-1.11.1.min.js"></script>
<script type=text/javascript src="/Tm/js/jquery.jqzoom.js"></script>
<script type=text/javascript src="/Tm/js/jquery.livequery.js"></script>
<script type=text/javascript src="/Tm/js/AJAX.js"></script>
<script type=text/javascript src="/Tm/js/util.js"></script>
<script type="text/javascript" src="/Tm/js/popup_dialog.js"></script>
<script type="text/javascript" src="/Tm/js/mainTip.js"></script>
<script type="text/javascript" src="/Tm/js/common/nav.js"></script>
<script type="text/javascript" src="/Tm/js/common/head.js"></script>
<script type="text/javascript" src="/Tm/js/front/product.js"></script>
<script src="/Tm/js/common.js"></script>
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
    <a href="/">首页</a><#if type_list??><#list type_list as type>&gt;<a href="/list/${type.id}">${type.name}</a></#list></#if><a href="javascript:;">&gt; 手机详情</a>
</div>

<div class="shop_show" >
  <div class="shop_show_left">
  
<div id="outbox" style="display:none">
  <--<img src="/images/sjtp/1.jpg" />
  <img src="/images/sjtp/2.jpg" />
  <img src="/images/sjtp/3.jpg" />
  <img src="/images/sjtp/4.jpg" />
  <img src="/images/sjtp/5.jpg" />
  <img src="/images/sjtp/6.jpg" />
  <img src="/images/sjtp/7.jpg" />
  <img src="/images/sjtp/8.jpg" />
  <img src="/images/sjtp/9.jpg" />
  <img src="/images/sjtp/10.jpg" />
  <img src="/images/sjtp/11.jpg" />
  <img src="/images/sjtp/12.jpg" />
  <img src="/images/sjtp/13.jpg" />
  <img src="/images/sjtp/14.jpg" />
  <img src="/images/sjtp/15.jpg" />
  <img src="/images/sjtp/16.jpg" />
  <img src="/images/sjtp/17.jpg" />
  <img src="/images/sjtp/18.jpg" />
  <img src="/images/sjtp/19.jpg" />
  <img src="/images/sjtp/20.jpg" />-->
    < <#list ShowPictures as pic>
                    <img src="${pic}" />
               </#list>
</div><!--outbox END-->
    <div id="preview" >
    <div class="jqzoom" >
        <#if ShowPictures??>
            <img id=bigImg src="${ShowPictures[0]}" width=310 height=310 jqimg="${ShowPictures[0]}">
        </#if>
          <!--  <img id=bigImg src="${product.coverImageUri}" width=310 height=310 jqimg="${ShowPictures[0]}">-->
        
    </div>
    <div id=spec>
        <div id=specLeft class="control specLeftT"></div>
        <div id=specList>
            <ul class=listImg>
               <#list ShowPictures as pic>
                   <li><a href="javascript:void(0)"><img src="${pic}" src_H="${pic}" src_D="${pic}" /></a></li>
               </#list>
            </ul>
        </div>
        <div id=specRight class="control specRightT"></div>
    </div>
</div>
    <div class="box">
      <div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tieba" data-cmd="tieba" title="分享到百度贴吧"></a><a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a></div>
      <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin","tieba","sqq"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin","tieba","sqq"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
</script>
      <div class="love"><a href="javascript:void(0)" onclick="tm_collect(this,${product.id})" style="text—decoration：none"><img src="/images/scsp.jpg" class="img_s"/></a></div>
    </div>
    <div id="3dmax">
    	<a href="javascript:void(0)" class="3ds" >3D视图</a>
    	<a href="javascript:void(0)" class="kaids" >开箱动画</a>
    </div>
  </div>
  <div class="ShopShowRight">
  <div class="erweimacontent"><img src="/img/erweima.png" width="180" height="180"></div>
    <h2><#if product.id??>${product.name}</#if></h2>
    <h3><#if product.brief??>${product.brief}</#if></h3>
    <input id="id-pid" type="text" value="${product.id}" style="display:none;" />
    <input id="id-vid"  type="text" value="<#if vid??>${vid}<#else>${product.priceMinimumVid}</#if>" style="display:none;" />
    <p><span>商品编码：</span><#if product.code??>${product.code}</#if></p>
    <p><span>市&nbsp;&nbsp;场&nbsp;价：</span>￥
        <#if verMarketPrice??>
            ${verMarketPrice?string("#.##")}
        <#else>
            ${product.priceMinimumMarketPrice?string("#.##")}
        </#if>
    </p>
    <p><span>荣&nbsp;&nbsp;诚&nbsp;价：</span><em id="pric">￥<#if verSalePrice??>${verSalePrice?string("#.##")}<#else>${product.priceMinimum?string("#.##")}</#if></em><span class="orange ml10">(降价通知)</span></p>
    <p><span>促&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销：</span><i><#if product.promotion??>${product.promotion}</#if></i></p>
    <p><span>商品评价：</span><img src="/images/star.jpg" /><img src="/images/star.jpg" /><img src="/images/star.jpg" /><img src="/images/star.jpg" /><img src="/images/star.jpg" /><span style="color:#1480DB">（共有<#if comment_total??>${comment_total}</#if>条评价）</span></p>
    <p><span>配&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;置：</span><#if product.configuration??>${product.configuration}</#if></p>
    <p><span>服&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务：</span><#if product.service??>${product.service}</#if></p>
    <div class="SelectPackage">
        <#if ver_color_list??>
            <p class="mb5"><span class="fll">颜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色：</span>
                <#list ver_color_list as item>
                    <#if co?? && co==item>
                        <a href="javascript:;" class="verSelect colorSelect SelectPackage_on">${item}</a>
                    <#else>
                        <a href="javascript:;" class="verSelect colorSelect">${item}</a>
                    </#if>
                </#list>
              </p>
        </#if>
        
        <#if ver_name_list??>
            <p class="mb5"><span class="fll">版&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本：</span>
                <#list ver_name_list as item>
                    <#if na?? && na==item>
                        <a href="javascript:;" class="verSelect nameSelect SelectPackage_on">${item}</a>
                    <#else>
                        <a href="javascript:;" class="verSelect nameSelect">${item}</a>
                    </#if>
                </#list>
              </p>
        </#if>
        
        <#if ver_capacity_list??>
            <p class="mb5"><span class="fll">容&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量：</span>
                <#list ver_capacity_list as item>
                    <#if ca?? && ca==item>
                        <a href="javascript:;" class="verSelect capSelect SelectPackage_on">${item}</a>
                    <#else>
                        <a href="javascript:;" class="verSelect capSelect">${item}</a>
                    </#if>
                </#list>
              </p>
        </#if>
    </div>
    <p class="shopbtn mt10"><span class="fll">我要购买：</span>
    <a href="javascript:void(0)" class="fll prev" data-num="${product.versionList[0].leftNumber}"><img src="/images/jia.jpg" /></a>
      <input type="text" class="select_num " id="quantity" value="1"/>
      <a href="javascript:void(0)" class="fll next" data-num="${product.versionList[0].leftNumber}"><img src="/images/jian.jpg"/></a></p>
    <div class="clear"></div>
    <div class="gm_btn"> <span class="gm_btn1"><a id="id-buy" href="javascript:void(0)">立即购买</a></span> <span class="gm_btn2"><a href="javascript:void(0)" onclick="tm_buy()">加入购物车</a></span><span class="gm_btn3"><a href="javascript:void(0)" onclick="tm_contra(this,${product.id})" >对比</a></span></div>
  </div>
</div>
<div class="clear"></div>

<div class="tuijianzuhe" >
    <div class="tuijianzuhe_bt">
        <span>组合推荐</span>
        <#if combi_type_list??>
            <#list combi_type_list as ctype>
                <a href="javascript:;" <#if ctype_index == 0>class="tuijianzuhe_btxz" </#if> >${ctype}</a>
                <a href="javascript:;" >${ctype}</a>
            </#list>
        </#if>
    </div>

    <#if combi_type_list??>
        <#list combi_type_list as ctype>
            <div class="fll tuijianzuhe_a" <#if ctype_index != 0>style="display:none;"</#if> >
                <ul>
                    <#if combi_list??>
                        <#list combi_list as combiProduct>
                            <li>
                                <a href="/product/${combiProduct.pid}"> 
                                <img src="${combiProduct.productCoverImageUri}" width="135" height="135" />
                                <p>${combiProduct.productName}</p>
                                <b>￥${combiProduct.productPrice?string("#.##")}</b></a>
                                <p>
                                    <input class="combi-price-check" type="checkbox">
                                    <span>￥${combiProduct.combinationPrice?string("#.##")}</span>
                                </p>
                            </li>
                        </#list>
                    </#if>
                </ul>
            </div>
            
            <div class="fll tuijianzuhe_a" style="display: none;">
                <ul>
                    <#if combi_list??>
                        <#list combi_list as combiProduct>
                            <li>
                                <a href="/product/${combiProduct.pid}"> 
                                <img src="${combiProduct.productCoverImageUri}" width="135" height="135" />
                                <p>${combiProduct.productName}</p>
                                <b>￥${combiProduct.productPrice?string("#.##")}</b></a>
                                <p>
                                    <input class="combi-price-check" type="checkbox">
                                    <span>￥${combiProduct.combinationPrice?string("#.##")}</span>
                                </p>
                            </li>
                            <li>
                                <a href="/product/${combiProduct.pid}"> 
                                <img src="${combiProduct.productCoverImageUri}" width="135" height="135" />
                                <p>${combiProduct.productName}</p>
                                <b>￥${combiProduct.productPrice?string("#.##")}</b></a>
                                <p>
                                    <input class="combi-price-check" type="checkbox">
                                    <span>￥${combiProduct.combinationPrice?string("#.##")}</span>
                                </p>
                            </li>
                        </#list>
                    </#if>
                </ul>
            </div>
        </#list>
    </#if>
    
    <div class="fll tuijianzuhe_b">
        <span>您自己的DIY</span>
        <p>已选择&nbsp;&nbsp;<span id="combi-num" class="jia">0</span>件产品
            <a id="clear-select" href="javascript:void(0)">（清除选项）</a>
        </p>
        <p>搭配价格：<span id="combi-price-total" class="jia">￥<#if verSalePrice??>${verSalePrice?string("#.##")}<#else>${product.priceMinimum?string("#.##")}</#if></span></p>
        <p>原价：<span id="combi-price-origin" class="jia">￥<#if verSalePrice??>${verSalePrice?string("#.##")}<#else>${product.priceMinimum?string("#.##")}</#if></span></p>
        <p>节省金额：<span id="combi-price-saved" class="jia">￥0.00</span></p>
        <p class="mt5"><a href="javascript:;" class="ligmooo" style="color:#fff;">立即购买</a></p>
    </div>
</div>

<div class="clear"></div>
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
    <div class="sx_tit" style="padding:0;">
      <ul id="id-tab-list">
        <li><a href="javascript:void(0)" class="con">商品详情</a></li>
        <li><a href="javascript:void(0)">商品参数</a></li>
        <li><a href="javascript:void(0)">商品评价（${comment_total}）</a></li>
        <li><a href="javascript:void(0)">购买咨询</a></li>
        <#--<li><a href="javascript:void(0)">价格走势</a></li>-->
      </ul>
    </div>
    <div class="products_det"> 
    	<ul id="id-tab-content" >
            <li class="tab_li">
                <#if product.detail??>${product.detail}</#if>
            </li>
    		
    		<li class="tab_li" style="display:none">
    		  <#if product.paramList??>
    		      <#list product.paramList as param>
    		          <p>${param.paramName}: ${param.value}</p>
    		      </#list>
    		  </#if>
    		</li>
    		
            <li class="tab_li" style="display:none">
                <div class="pinglun">
                    <h2>商品评价</h2>
                </div>
                <#if comment_list??>
                    <#list comment_list as comment>
                    <div class="pinlunbox">
                        <dl>
                            <dt>
                                <ul>
                                    <li class="name"><#if comment.username??>${comment.username}说:</#if></li>
                                    <li class="time"><#if comment.commentTime??>${comment.commentTime}</#if></li>
                                    <li class="dtlr">${comment.content}</li>
                                </ul>
                                <div class="clear"></div>
                            </dt>
                        </dl>
                    </div>
                    </#list>
                </#if>
		          
                <div class="lr_right_main main_top2 fbpn">
                    <h2>提交问答/评价</h2>
                    <ul>
                        <#if user??>
                            <li class="pyts">欢迎您,<a href="/user/info"><strong>${user.username}</strong></a>发表问答/评论!
                            <li class="title">内容：</li>
                            <li class="texta">
                            <label>
                                <textarea name="textarea" id="centent" cols="100" rows="5" class="inp"  maxlength="200" placeholder="请输入内容"></textarea>
                            </label>
                            </li>
                            <li class="title">验证码：</li>
                            <li class="yzminp">
                              <input type="text" name="textfield2" id="verify" maxlength="4" />
                            </li>
                            <li class="yzmimg"><a href="javascript:void(0)"><img onclick="this.src = '/verify?date='+Math.random();" src="/verify" id="yzm" alt="验证码"/></a></li>
                            <li class="tijiaobox">
                              <input type="button" value="提交信息"  class="tijiaoan" onclick="tm_save(this,${product.id})"/>
                            </li>
                    
                        <#else>
    		                欢迎您访客，您在<a href="/login" class="t_red">登录</a>后才能发表问答/评论，如果没有帐户请<a href="/reg" class="t_red">注册</a>！</li>
    		            </#if>
                    </ul>
                    <div style="clear:both;"></div>
                </div>
    		</li>
    		<li class="tab_li" style="display:none">
                <div class="pinglun">
		          <h2>商品咨询</h2>
                </div>
                <#if consult_list??>
                    <#list consult_list as consult>
                        <div class="pinlunbox">
                            <dl>
                                <dt>
                		            <ul>
                		              <li class="name"><#if consult.username??>${consult.username}</#if></li>
                		              <li class="time"><#if consult.consultTime??>${consult.consultTime}</#if></li>
                		              <li class="dtlr">${consult.content}</li>
                		            </ul>
        	                        <div class="clear"></div>
                                </dt>
                            </dl>
                        </div>
                    </#list>
                </#if>
                
                <div class="lr_right_main main_top2 fbpn">
                    <h2>提交咨询</h2>
                    <ul>
                        <li class="pyts">欢迎您,<#if user??><a href="/user/info"><strong>${user.username}</strong></a><#else>游客</#if>,咨询商品!
		       			<li class="title">内容：</li>
                        <li class="texta">
        		          <label>
        		            <textarea name="textarea" id="centents" cols="100" rows="5" class="inp"  maxlength="200" placeholder="请输入内容"></textarea>
        		          </label>
                        </li>
                        <li class="title">验证码：</li>
                        <li class="yzminp">
                          <input type="text" name="textfield2" id="verifys" maxlength="4" />
                        </li>
                        <li class="yzmimg"><a href="javascript:void(0)"><img onclick="this.src = '/verify?date='+Math.random();" src="/verify" id="yzm" alt="验证码"/></a></li>
                        <li class="tijiaobox">
                          <input type="button" value="提交信息"  class="tijiaoan" onclick="tm_saveconn(this,${product.id})"/>
                        </li>
                    </ul>
                    <div style="clear:both;"></div>
    		    </div>
            </li>
            <li class="tab_li" style="display:none">
            			价格
            </li>		
    	</ul>
    </div>
</div>
</div>
</div></div>
 
<div class="clear"></div>

<#include "/front/common/tail.ftl" />

<div class="main"><div class="duibi_bottom" style="display:none">
<div  class="tm_click_">
<div class="fll duibi_bottom_a" ><ul>
<li><a href="#"><img src="/images/hot.jpg" width="66" height="66"><p>苹果 iPad Air 2 【极致轻薄】支持Touch ID X芯片,</p><p style="color:#ff6600;">￥4999.00</p></a></li>
<li><a href="#"><img src="/images/hot.jpg" width="66" height="66"><p>苹果 iPad Air 2 【极致轻薄】支持Touch ID X芯片,</p><p style="color:#ff6600;">￥4999.00</p></a></li>
<li><a href="#"><img src="/images/hot.jpg" width="66" height="66"><p>苹果 iPad Air 2 【极致轻薄】支持Touch ID X芯片,</p><p style="color:#ff6600;">￥4999.00</p></a></li>
<li><a href="#"><img src="/images/hot.jpg" width="66" height="66"><p>苹果 iPad Air 2 【极致轻薄】支持Touch ID X芯片,</p><p style="color:#ff6600;">￥4999.00</p></a></li>
</ul></div>
</div>
<div class="flr duibi_bottom_b">
<div class="duibi_bottom_b_gb"><a href="javascript:void(0)" class="tm_none">隐藏</a></div>
<div class="duibi_bottom_b_db"><a href="/ProductContrast">对比</a></div>
<div class="duibi_bottom_b_qk"><a href="javascript:void(0)" class="_click">清空对比信息</a></div>

</div>
  
</div></div>

<script type="text/javascript">

$(function(){
    
    /* 鼠标移动小图,小图对应大图显示在大图上,并替换放大镜中的图*/
    $("#specList ul li img").livequery("mouseover",function(){ 
        var imgSrc = $(this).attr("src");
        var i = imgSrc.lastIndexOf(".");
        var unit = imgSrc.substring(i);
        imgSrc = imgSrc.substring(0,i);
        var imgSrc_small = $(this).attr("src_D");
        var imgSrc_big = $(this).attr("src_H");
        $("#bigImg").attr({"src": imgSrc_small ,"jqimg": imgSrc_big });
        $(this).css({"border":"2px solid #3399cc","padding":"1px"});
    });
    
    $("#specList ul li img").livequery("mouseout",function(){ 
        $(this).css({"border":"1px solid #ddd","padding":"2px"});
    });
    
    //使用jqzoom
    $(".jqzoom").jqueryzoom({
        xzoom: 400, //放大图的宽度(默认是 200)
        yzoom: 400, //放大图的高度(默认是 200)
        offset: 10, //离原图的距离(默认是 10)
        position: "right", //放大图的定位(默认是 "right")
        preload:1   
    });
    
    /*如果小图过多,则出现滚动条在一行展示*/
    var btnNext = $('#specRight');
    var btnPrev = $('#specLeft')
    var ul = btnPrev.next().find('ul');

    var len = ul.find('li').length;
    var i = 0 ;
    if (len > 5) {
        $("#specRight").addClass("specRightF").removeClass("specRightT");
        ul.css("width", 54 * len)
        btnNext.click(function(e) {
            if(i>=len-5){
                
                return;
            }
            i++;
            if(i == len-5){
                $("#specRight").addClass("specRightT").removeClass("specRightF");
            }
            $("#specLeft").addClass("specLeftF").removeClass("specLeftT");
            moveS(i);
        })
        btnPrev.click(function(e) {
            if(i<=0){
                return;
            }
            i--;
            if(i==0){
                $("#specLeft").addClass("specLeftT").removeClass("specLeftF");
            }
            $("#specRight").addClass("specRightF").removeClass("specRightT");
            moveS(i);
        })
    }
    function moveS(i) {
        ul.animate({left:-54 * i}, 500)
    }
    function picAuto(){
      if ($(".listImg li").size()<=5) {
        $("#specLeft,#specRight").hide();
      }
    }
    picAuto();
    		
			
});
$(function(){
			//分页---上一页(减1)  / 下一页(加1)
			
			var index = 1;
			//var totalCount = 100;
		
			//下一页功能
			$(".next").click(function(){
				index++;//相当于index = index +1;
					var datasum=$(this).data("num");
					
				if(index>datasum)index = 1;
				$("#quantity").val(index);
			});

		
			//上一页功能
			$(".prev").click(function(){
			var datasum=$(this).data("num");
				index--;//相当于index = index +1;
				if(index<1)index = datasum;
				$("#quantity").val(index);
			});
			
			
		});
	   //去购买	
		function tm_buy(){
			var id=$("#quantity").val();
			$.ajax({
				type:"post",
				url:"/add",
				data:{"quantity":id,"pid":id,"vid":1},
				success:function(data){
					if(data=="success"){
						window.location.href="/cart";
					}else if(data="nulluser"){
						window.location.href="/login";
						alert(data.message)
					}
				}
			})
			
		
		}
//收藏
		function tm_collect(obj,id){
		$.ajax({
			type:"post",
			url:"/addcollect",
			data:{"productid":id},
			success:function(data){
			//收藏商品未登录
				if(data=="logout"){
					window.location.href="/login";
				}else if(data=="success"){
					$(obj).parents().find(".img_s").remove()
					$(obj).empty()
					$(obj).append("<div style='font-size:14px;color:red;'>已经收藏</div>").fadeIn(3000,function(){
						window.location.href="/user/collect";
					})
				}else if(data=="flok"){
					$(obj).parents().find(".img_s").remove()
					$(obj).empty()
					$(obj).append("<div style='font-size:14px;color:red;'>已经收藏过!</div>");
				}
			}
		})
		
		}
		//对比
		function tm_contra(obj,id){
			$(".duibi_bottom").css("display","block");
		}
		//隐藏对比
		$(".tm_none").on("click",function(){
			$(".duibi_bottom").css("display","none");
		})
		$("._click").on("click",function(){
			$(".tm_click_").css("display","none");
		})
		$(".tm_close").on("click",function(){
			$(".tuijianzuhe_a").css("display","none");
			$(".jia").empty()
		})
		// 点击进行Tab切换   tab_d
            $('#id-tab-list li').click(function(){
                var index = $(this).index();
               // alert(index)
                var _tab = $('#id-tab-list li');
                _tab.find("a").removeClass("con");
                _tab.eq(index).find("a").addClass("con");
                
                var _arr = $('#id-tab-content .tab_li');
          
                _arr.eq(index).fadeIn(0).siblings().fadeOut(0);
            });
            
        function tm_save(obj,id){
        	var centent=$("#centent").val();
        	var verify=$("#verify").val();
        	if(isEmpty(centent)){
        		 Tmtip({html:"您输入的内容不能为空!!!",src:"/Tm/images/24.PNG"});
        		 $("#centent").focus();
        		 return;
        	}
        	if(isEmpty(verify)){
        		 Tmtip({html:"验证码不能为空!!!",src:"/Tm/images/24.PNG"});
        		 $("#verify").focus();
        		 return;
        	}
        	tm_ajax({
        		url:"/saveComm",
        		data:{"productId":id,"content":centent,"verify":verify},
        		 callback:function(data) {
        		 	 if(data=="success"){
        		 	 	Tmtip({html:"评论已经提交！工作人员会在24小时内处理!",src:"/Tm/images/24.PNG",callback:function(){location.reload()}});
        		 		$("#centent").val("");
        				$("#verify").val("");
        		 	 }else if(data=="vfalse"){
        		 	 	Tmtip({html:"验证码输入错误!",src:"/Tm/images/24.PNG"});
        		 	 	$("#verify").select();
        		 	 }
        		 }
        		
        	})
        } 
        function tm_saveconn(obj,id){
        	var centent=$("#centents").val();
        	var verify=$("#verifys").val();
        	if(isEmpty(centent)){
        		 Tmtip({html:"您输入的内容不能为空!!!",src:"/Tm/images/24.PNG"});
        		 $("#centents").focus();
        		 return;
        	}
        	if(isEmpty(verify)){
        		 Tmtip({html:"验证码不能为空!!!",src:"/Tm/images/24.PNG"});
        		 $("#verifys").focus();
        		 return;
        	}
        	tm_ajax({
        		url:"/saveConn",
        		data:{"productId":id,"content":centent,"verify":verify},
        		 callback:function(data) {
        		 	 if(data=="success"){
        		 	 	Tmtip({html:"咨询已经提交！工作人员会在24小时内处理!",src:"/Tm/images/24.PNG",callback:function(){location.reload()}});
        		 		$("#centent").val("");
        				$("#verify").val("");
        		 	 }else if(data=="vfalse"){
        		 	 	Tmtip({html:"验证码输入错误!",src:"/Tm/images/24.PNG"});
        		 	 	$("#verify").select();
        		 	 }
        		 }
        		
        	})
        } 
        
        $("#3dmax").find(".3ds").on("click",function(){
        	$(this).text("平面展示");
        	$("#preview").css("display","none")
        	$(".box").css("paddingTop",400)
        	$("#outbox").css("display","block")
        })
</script>


</body>
</html>
