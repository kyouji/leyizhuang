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
<script type="text/javascript" src="/Tm/js/jquery-1.11.1.min.js"></script>
<script type=text/javascript src="/Tm/js/jquery.jqzoom.js"></script>
<script type=text/javascript src="/Tm/js/jquery.livequery.js"></script>
</head>
<body>
<header>
<div class="main">
<div class="fll header_l"><#if user??><span>您好，<a href="/user/info" >${user.username}</a>欢迎来到荣诚手机超市！您的身份：${user.role}&nbsp;&nbsp;<a href="/logout" >退出</a></span><#else><span>您好，欢迎来到荣诚手机超市！<a href="/login" id="orange">登录</a>&nbsp;&nbsp;&nbsp;<a href="/reg">免费注册</a></span></#if></div>
<div class="flr header_r"><a href="/user/collect">我的收藏</a><a href="#">销售网点</a><a href="#">手机版切换</a><a href="/order/list">我的订单</a><a href="/help/question/1">帮助中心</a><a href="/help/question-1">收藏本站</a></div>
</div>
</header>

<div class="header1 main">
<div class="fll logo"><a href="#" title="荣诚手机超市"><img src="/img/rc_logo.png" width="177" height="69"></a></div>
<div class="fll city"><a href="#">城市切换</a><span></span>
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
<li><a href="/list/4" title="靓号选择">靓号选择</a></li>
<li><a href="/list/5" title="新闻资讯">新闻资讯</a></li>
</ul>
</div>

</div></nav>

<div class="main mt10 rc_ppfl">
<span class="fll">品牌分类：</span>
<ul>
<li><a href="#"><img src="/img/rc_pp.png" width="90" height="45"></a></li>
<li><a href="#"><img src="/img/rc_pp.png" width="90" height="45"></a></li>
<li><a href="#"><img src="/img/rc_pp.png" width="90" height="45"></a></li>
<li><a href="#"><img src="/img/rc_pp.png" width="90" height="45"></a></li>
<li><a href="#"><img src="/img/rc_pp.png" width="90" height="45"></a></li>
<li><a href="#"><img src="/img/rc_pp.png" width="90" height="45"></a></li>
<li><a href="#"><img src="/img/rc_pp.png" width="90" height="45"></a></li>
<li><a href="#"><img src="/img/rc_pp.png" width="90" height="45"></a></li>
<li><a href="#"><img src="/img/rc_pp.png" width="90" height="45"></a></li>
</ul>
<a href="#">更多>></a>
</div>

<div class="clear"></div>

<div class="main">
<div class="place"> <span>您现在的位置：</span><a href="/">首页</a>&gt;<a href="/list/1">手机产品</a>&gt;<a href="#">手机详情</a>&gt; </div>
<div class="shop_show">
  <div class="shop_show_left">
    <div id="preview">
    <div class=jqzoom>
        <#if ShowPictures??>
            <img id=bigImg src="${ShowPictures[0]}" width=310 height=310 jqimg="${ShowPictures[0]}">
        </#if>
        
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
  </div>
  <div class="ShopShowRight">
  <div class="erweimacontent"><img src="/img/erweima.png" width="180" height="180"></div>
    <h2><#if product.id??>${product.name}</#if></h2>
    <!--<h3><#if product.detail??>${product.detail}</#if></h3>-->
    <p><span>商品编码：</span><#if product.code??>${product.code}</#if></p>
    <p><span>市&nbsp;&nbsp;场&nbsp;价：</span>￥${product.priceMinimum?c}.00</p>
    <p><span>荣&nbsp;&nbsp;诚&nbsp;价：</span><em>￥<#if product.flashSalePrice??>${product.flashSalePrice?c}</#if>.00</em><span class="orange ml10">(降价通知)</span></p>
    <p><span>促&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销：</span><i><#if product.promotion??>${product.promotion}</#if></i></p>
    <p><span>商品评价：</span><img src="/images/star.jpg" /><img src="/images/star.jpg" /><img src="/images/star.jpg" /><img src="/images/star.jpg" /><img src="/images/star.jpg" /><span style="color:#1480DB">（共有<#if product.averagePoints??>${product.averagePoints}</#if>条评价）</span></p>
    <p><span>配&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;置：</span><#if product.configuration??>${product.configuration}</#if></p>
    <p><span>服&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务：</span><#if product.service??>${product.service}</#if></p>
    <div class="SelectPackage">
      <p class="mb5"><span class="fll">颜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色：</span><a href="#" class="SelectPackage_on">灰色行货</a><a href="#">白色行货</a></p>
      <div class="clear"></div>
      <p class="mb5"><span class="fll">容&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量：</span><a href="#">6G</a><a href="#" class="SelectPackage_on">32G</a></p>
      <div class="clear"></div>
      <p class="mb5"><span class="fll">版&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本：</span><a href="#">4G</a><a href="#">全网通</a><a href="#" class="SelectPackage_on">2G/3G</a></p>
      <div class="clear"></div>
    </div>
    <p class="shopbtn mt10"><span class="fll">我要购买：</span>
    <a href="javascript:void(0)" class="fll prev"><img src="/images/jia.jpg" /></a>
      <input type="text" class="select_num " id="count" value="1"/>
      <a href="javascript:void(0)" class="fll next"><img src="/images/jian.jpg" /></a></p>
    <div class="clear"></div>
    <div class="gm_btn"> <span class="gm_btn1"><a href="javascript:void(0)" onclick="tm_buy()">立即购买</a></span> <span class="gm_btn2"><a href="/cart">加入购物车</a></span><span class="gm_btn3"><a href="javascript:void(0)" onclick="tm_contra(this,${product.id})">对比</a></span></div>
  </div>
</div>
<div class="clear"></div>

<div class="tuijianzuhe">
<div class="tuijianzuhe_bt"><span>组合推荐</span><a href="#">推荐配置（12）</a><a href="#">推荐配置（32）</a><a href="#" class="tuijianzuhe_btxz">推荐配置</a><a href="#">推荐配置</a><a href="#">推荐配置</a><a href="#">推荐配置</a><a href="#">推荐配置</a><a href="#">推荐配置（5）</a><a href="#">推荐配置</a><div class="clear"></div></div>


<div class="fll tuijianzuhe_a"><ul>

        <li><a href="#"> <img src="/images/spsx.jpg" width="135" height="135" />
          <p>BlackBerryZ30 5英寸Super AMOLED显示屏黑莓10.2系</p>
          <b>￥5900.00</b></a>
          <p><input name="" type="checkbox" value="300.00" ppid="14901" id="ch14901"><span>￥5999.00</span></p>
        </li>
                <li><a href="#"> <img src="/images/spsx.jpg" width="135" height="135" />
          <p>BlackBerryZ30 5英寸Super AMOLED显示屏黑莓10.2系</p>
          <b>￥5900.00</b></a>
          <p><input name="" type="checkbox" value="300.00" ppid="14901" id="ch14901"><span>￥5999.00</span></p>
        </li>
                <li><a href="#"> <img src="/images/spsx.jpg" width="135" height="135" />
          <p>BlackBerryZ30 5英寸Super AMOLED显示屏黑莓10.2系</p>
          <b>￥5900.00</b></a>
          <p><input name="" type="checkbox" value="300.00" ppid="14901" id="ch14901"><span>￥5999.00</span></p>
        </li>
                <li><a href="#"> <img src="/images/spsx.jpg" width="135" height="135" />
          <p>BlackBerryZ30 5英寸Super AMOLED显示屏黑莓10.2系</p>
          <b>￥5900.00</b></a>
          <p><input name="" type="checkbox" value="300.00" ppid="14901" id="ch14901"><span>￥5999.00</span></p>
        </li>
                <li><a href="#"> <img src="/images/spsx.jpg" width="135" height="135" />
          <p>BlackBerryZ30 5英寸Super AMOLED显示屏黑莓10.2系</p>
          <b>￥5900.00</b></a>
          <p><input name="" type="checkbox" value="300.00" ppid="14901" id="ch14901"><span>￥5999.00</span></p>
        </li>
                <li><a href="#"> <img src="/images/spsx.jpg" width="135" height="135" />
          <p>BlackBerryZ30 5英寸Super AMOLED显示屏黑莓10.2系</p>
          <b>￥5900.00</b></a>
          <p><input name="" type="checkbox" value="300.00" ppid="14901" id="ch14901"><span>￥5999.00</span></p>
        </li>
                <li><a href="#"> <img src="/images/spsx.jpg" width="135" height="135" />
          <p>BlackBerryZ30 5英寸Super AMOLED显示屏黑莓10.2系</p>
          <b>￥5900.00</b></a>
          <p><input name="" type="checkbox" value="300.00" ppid="14901" id="ch14901"><span>￥5999.00</span></p>
        </li>
          
</ul>
<div class="clear"></div>
</div>


<div class="fll tuijianzuhe_b">
<span>您自己的DIY</span>
<p>已选择5件产品<a href="#">（清除选项）</a></p>
<p>搭配价格：<span>￥5999.00</span></p>
<p>参考价格：￥5999.00</p>
<p>节省金额：￥129.00</p>
<p class="mt5"><a href="#" class="ligmooo" style="color:#fff;">立即购买</a></p>
</div>
</div>

<div class="clear"></div>
<div class="w1200 overflow">
  <div class="sub_left">
    <div class="hot_list">
      <h2>热销排行</h2>
      <ul>
        <li> <a href="#"> <img src="/images/hot.jpg" /> <span>BlackBerryZ30【黑莓典范】5英寸Super AMOLED显示屏黑莓10.2系</span> <b>￥4599.00</b> </a>
          <div class="num1">1</div>
        </li>
        <li> <a href="#"> <img src="/images/hot.jpg" /> <span>BlackBerryZ30【黑莓典范】5英寸Super AMOLED显示屏黑莓10.2系</span> <b>￥4599.00</b> </a>
          <div class="num1">2</div>
        </li>
        <li> <a href="#"> <img src="/images/hot.jpg" /> <span>BlackBerryZ30【黑莓典范】5英寸Super AMOLED显示屏黑莓10.2系</span> <b>￥4599.00</b> </a>
          <div class="num1">3</div>
        </li>
        <li> <a href="#"> <img src="/images/hot.jpg" /> <span>BlackBerryZ30【黑莓典范】5英寸Super AMOLED显示屏黑莓10.2系</span> <b>￥4599.00</b> </a>
          <div class="num2">4</div>
        </li>
        <li> <a href="#"> <img src="/images/hot.jpg" /> <span>BlackBerryZ30【黑莓典范】5英寸Super AMOLED显示屏黑莓10.2系</span> <b>￥4599.00</b> </a>
          <div class="num2">5</div>
        </li>
        <li> <a href="#"> <img src="/images/hot.jpg" /> <span>BlackBerryZ30【黑莓典范】5英寸Super AMOLED显示屏黑莓10.2系</span> <b>￥4599.00</b> </a>
          <div class="num2">6</div>
        </li>
        <li> <a href="#"> <img src="/images/hot.jpg" /> <span>BlackBerryZ30【黑莓典范】5英寸Super AMOLED显示屏黑莓10.2系</span> <b>￥4599.00</b> </a>
          <div class="num2">7</div>
        </li>
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
        <li><a href="javascript:void(0)">商品评价（639）</a></li>
        <li><a href="javascript:void(0)">购买咨询</a></li>
      <!--  <li><a href="javascript:void(0)">价格走势</a></li>-->
      </ul>
    </div>
    <div class="products_det"> 
    	<ul id="id-tab-content" >
    		<li ><#if product.detail??>${product.detail}</#if></li>
    		<li style="display:none">${product.configuration}</li>
    		<li style="display:none">商品评价</li>
    		<li style="display:none">商品咨询
    		<div class="lr_right_main main_top2">
      <div class="pinglun">
        <h2>购买咨询</h2>
      </div>
      <div class="pinlunbox">
        <dl>
          <dt>
            <ul>
              <li class="name">zhangjinhao</li>
              <li class="time">2011-08-25 07:34:42</li>
              <li class="dtlr">我23号买的东西为什么还没备货出库啊 快点好吗 等着用呢 谢谢</li>
            </ul>
            <div class="clear"></div>
          </dt>
          <dd>
            <ul>
              <li class="name">客服回复</li>
              <li class="ddlr">您好：您的订单已于24号发货，配送时间为2-3个工作日，请您耐心等待，祝您生活愉快！您好：您的订单已于24号发货，配送时间为2-3个工作日，请您耐心等待，祝您生活愉快！您好：您的订单已于24号发货，配送时间为2-3个工作日，请您耐心等待，祝您生活愉快！</li>
            </ul>
            <div class="clear"></div>
          </dd>
        </dl>
      </div>
      <div class="pinlunbox">
        <dl>
          <dt>
            <ul>
              <li class="name">zhangjinhao</li>
              <li class="time">2011-08-25 07:34:42</li>
              <li class="dtlr">我23号买的东西为什么还没备货出库啊 快点好吗 等着用呢 谢谢</li>
            </ul>
            <div class="clear"></div>
          </dt>
          <dd>
            <ul>
              <li class="name">客服回复</li>
              <li class="ddlr">您好：您的订单已于24号发货，配送时间为2-3个工作日，请您耐心等待，祝您生活愉快！</li>
            </ul>
            <div class="clear"></div>
          </dd>
        </dl>
      </div>
      <div class="pinlunbox">
        <dl>
          <dt>
            <ul>
              <li class="name">zhangjinhao</li>
              <li class="time">2011-08-25 07:34:42</li>
              <li class="dtlr">我23号买的东西为什么还没备货出库啊 快点好吗 等着用呢 谢谢</li>
            </ul>
            <div class="clear"></div>
          </dt>
        </dl>
        <p>&nbsp;</p>
      </div>
    </div></li>
    		
    	</ul>
    
    </div>
    
    
    <div class="lr_right_main main_top2">
      <div class="pinglun">
        <h2>商品评价</h2>
      </div>
      <div class="pinlunbox">
        <dl>
          <dt>
            <ul>
              <li class="name1">zhangjinhao</li>
              <li class="time">2011-08-25 07:34:42</li>
              <li class="dtlr">我23号买的东西为什么还没备货出库啊 快点好吗 等着用呢 谢谢</li>
            </ul>
            <div class="clear"></div>
          </dt>
        </dl>
      </div>
<div class="pinlunbox">
        <dl>
          <dt>
            <ul>
              <li class="name1">zhangjinhao</li>
              <li class="time">2011-08-25 07:34:42</li>
              <li class="dtlr">我23号买的东西为什么还没备货出库啊 快点好吗 等着用呢 谢谢</li>
            </ul>
            <div class="clear"></div>
          </dt>
        </dl>
      </div>
<div class="pinlunbox">
        <dl>
          <dt>
            <ul>
              <li class="name1">zhangjinhao</li>
              <li class="time">2011-08-25 07:34:42</li>
              <li class="dtlr">我23号买的东西为什么还没备货出库啊 快点好吗 等着用呢 谢谢</li>
            </ul>
            <div class="clear"></div>
          </dt>
        </dl>
      </div>
    
    <div class="lr_right_main main_top2 fbpn">
      <h2>提交问答/评论</h2>
      <ul>
        <li class="pyts">欢迎您<a href="#"><strong>Services</strong></a>发表问答/评论! 欢迎您访客，您在<a href="/login">登录</a>后才能发表问答/评论，如果没有帐户请<a href="/reg">注册</a>！</li>
        <li class="title">内容：</li>
        <li class="texta">
          <label>
            <textarea name="textarea" id="textarea" cols="100" rows="5" class="inp"></textarea>
          </label>
        </li>
        <li class="title">验证码：</li>
        <li class="yzminp">
          <input type="text" name="textfield2" id="textfield2" />
        </li>
        <li class="yzmimg"><img src="/images/auth.gif" width="96" height="21" alt="验证码" /></li>
        <li class="tijiaobox">
          <input type="submit" value="提交信息"  class="tijiaoan"/>
        </li>
      </ul>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
</div></div>



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



<div class="main"><div class="duibi_bottom" style="display:none">

<div class="fll duibi_bottom_a"><ul>
<li><a href="#"><img src="/images/hot.jpg" width="66" height="66"><p>苹果 iPad Air 2 【极致轻薄】支持Touch ID X芯片,</p><p style="color:#ff6600;">￥4999.00</p></a></li>
<li><a href="#"><img src="/images/hot.jpg" width="66" height="66"><p>苹果 iPad Air 2 【极致轻薄】支持Touch ID X芯片,</p><p style="color:#ff6600;">￥4999.00</p></a></li>
<li><a href="#"><img src="/images/hot.jpg" width="66" height="66"><p>苹果 iPad Air 2 【极致轻薄】支持Touch ID X芯片,</p><p style="color:#ff6600;">￥4999.00</p></a></li>
<li><a href="#"><img src="/images/hot.jpg" width="66" height="66"><p>苹果 iPad Air 2 【极致轻薄】支持Touch ID X芯片,</p><p style="color:#ff6600;">￥4999.00</p></a></li>
</ul></div>

<div class="flr duibi_bottom_b">
<div class="duibi_bottom_b_gb"><a href="javascript:void(0)" class="tm_none">隐藏</a></div>
<div class="duibi_bottom_b_db"><a href="/ProductContrast">对比</a></div>
<div class="duibi_bottom_b_qk"><a href="#">清空对比信息</a></div>

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

			var index = 0;
			var totalCount = 100;
			//下一页功能
			$(".next").click(function(){
				index++;//相当于index = index +1;
				if(index>totalCount)index = 0;
				$("#count").val(index);
			});

		
			//上一页功能
			$(".prev").click(function(){
				index--;//相当于index = index +1;
				if(index<0)index = totalCount;
				$("#count").val(index);
			});
			
			
		});
	//去购买	
		function tm_buy(){
			var id=$("#count").val();
			alert(id)
			window.location.href='/cart?sum='+id;
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
		 // 点击进行Tab切换   tab_d
            $('#id-tab-list li').click(function(){
                var index = $(this).index();
                
                var _tab = $('#id-tab-list li');
                _tab.find("a").removeClass("con");
                _tab.eq(index).find("a").addClass("con");
                
                var _arr = $('#id-tab-content li');
                _arr.eq(index).fadeIn(0).siblings().fadeOut(0);
            });
		
</script>


</body>
</html>




  











