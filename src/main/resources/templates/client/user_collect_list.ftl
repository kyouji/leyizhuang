<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}我的关注</title>

<meta name="keywords" content="${site.seoKeywords!''}" />
<meta name="description" content="${site.seoDescription!''}" />

<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/client/css/mycenter_base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/follow.css"/>
</head>

<body>
<!--顶部-->
<#include "/client/common_user_header.ftl" />
<!-- 内容 -->
<div class="content"> 
  <!-- 左侧 -->
  <#include "/client/common_user_menu.ftl" />
  
  <!-- 右侧 -->
    <div class="content_2">
        <div class="content_2_1">关注的商品</div>
        <div class="content_2_2">
              <div class="content_2_2_1">
                  <ul>
                    <li class="dh_1">商品</li>
                    <li class="dh_2">金额</li>
                    <li class="dh_3">操作</li>
                  </ul>
              </div>
             <#if collect_page??>
                <#list collect_page.content as cg>
                      <div class="content_2_2_2">
                          <dl>
                               <dd>
                                   <ul>
                                      <li class="li_1"><a href="/goods/${cg.goodsId}" title=""><img src="${cg.goodsCoverImageUri!''}" /></a><a href="/goods/${cg.goodsId}" title=""><span>${cg.goodsTitle!''}</span></a></li>
                                      <li class="li_2">￥${cg.goodsSalePrice?string("#.##")}</li>
                                      <li class="li_3"><a href="/user/collect/del?id=${cg.goodsId!''}" title="">取消关注</a>&nbsp;/
                                                        <a href="/cart/init?id=${cg.goodsId!''}" title="">加入购物车</a>&nbsp;/
                                                        <a href="#" title="">低价提醒</a></li>
                                   </ul>
                               </dd>
                          </dl>
                      </div>
                </#list>
              </#if>
        </div>
    </div>

  <!--分页-->
      <div class="pagebox">
          <div class="num">
                <#if collect_page??>
                    <#assign continueEnter=false>
                    <#if collect_page.totalPages gt 0>
                        <#list 1..collect_page.totalPages as page>
                            <#if page <= 3 || (collect_page.totalPages-page) < 3 || (collect_page.number+1-page)?abs<3 >
                                <#if page == collect_page.number+1>
                                    <a class="mysel" href="javascript:;">${page}</a>
                                <#else>
                                    <a href="/user/collect/list?page=${page-1}&keywords=${keywords!''}">${page}</a>
                                </#if>
                                <#assign continueEnter=false>
                             <#else>
                                <#if !continueEnter>
                                    ...
                                <#assign continueEnter=true>
                                </#if>
                            </#if>
                        </#list>
                    </#if>
               </#if>  
               </#if>
              <div class="clear"></div>
          </div>
      </div>
</div>
<!--底部footer-->
<#include "/client/common_footer.ftl" />

</body>
</html>
