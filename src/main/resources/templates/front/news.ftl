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
<div class="news_lanmulist">
<ul>
<#if news_list??>
    <#list news_list as news>
        <#if news_index < 9>
        <li>
            <a href="/news/content/${news.id}">
                <img src="${news.coverImageUri}" width="360" height="200">
                <p>${news.title}</p>
            </a>
        </li>
        </#if>
    </#list>
</#if>
</ul>


</div>
        <div class="clear h20"></div>
        <div class="flr fot_fanye"><ul class="haoh">
        <li><a href="#" ><<</a></li>
         <li><a href="#" class="act">1</a></li>
          <li><a href="#">2</a></li>
           <li><a href="#">>></a></li>
        </ul></div>

</div>





<div class="clear"></div>
<#include "/front/common/tail.ftl" />
</body>
</html>




  











