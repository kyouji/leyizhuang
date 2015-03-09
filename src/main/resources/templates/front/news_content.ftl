<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>荣诚手机超市--新闻资讯</title>
<meta name="keywords" content="荣诚手机超市" />
<meta name="description" content="荣诚手机超市" />
<meta name="copyright" content="荣诚手机超市 版权所有" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/rcindex.css" rel="stylesheet" type="text/css" />
<link href="/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/Tm/js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/Tm/js/jquery.pagination.js"></script>
<script type="text/javascript" src="/Tm/js/common/nav.js"></script>
<script type="text/javascript" src="/Tm/js/common/head.js"></script>
</head>
<body>
<#include "/front/common/head.ftl" />
<#include "/front/common/nav.ftl" />

<div class="main mt15">

<div class="place"> <span>您现在的位置：</span>
    <a href="/">首页</a>&gt;<a href="/news/0">新闻资讯</a></div>

<div class="news_lanmu1">
<ul>
<li><a href="/news/0" <#if news_type?? && news_type==0 >class="news_lanmu1xz"</#if>>手机资讯</a></li>
<li><a href="/news/1" <#if news_type?? && news_type==1 >class="news_lanmu1xz"</#if>>手机发烧友</a></li>
<li style="border:none;"><a href="/news/2" <#if news_type?? && news_type==2 >class="news_lanmu1xz"</#if>>新闻视频</a></li>
</ul>
</div></div>



<div class="main mt15">
    <#if news??>
    <div class="content_page">
      <h2>${news.title}</h2>
      <div class="nr_info"> 日期：${news.createTime?string("yyyy-MM-dd")}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        作者：${news.author?default("")}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;    点击：${news.clickNumber?default("0")} </div>
      ${news.content}
              <div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tieba" data-cmd="tieba" title="分享到百度贴吧"></a><a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a></div>
      <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin","tieba","sqq"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin","tieba","sqq"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
</script>
    </div>
    </#if>
</div>





<div class="clear"></div>
<#include "/front/common/tail.ftl" />
</body>
</html>




  











