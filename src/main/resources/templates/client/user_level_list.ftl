<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员等级</title>
<link rel="stylesheet" type="text/css" href="/client/css/mycenter_base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/member.css"/>
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/root/images/goods/zphk_logo.ico">
<script src="/client/js/jquery-1.9.1.min.js"></script>

<#-- 这个会员等级的意思大概是,每升一级新增一个特权。级数越高特权越多 -->
</head>

<body>
<#include "/client/common_user_header.ftl" />
<!-- 内容 -->
<div class="content"> 
  <!-- 左侧 -->
 <#include "/client/common_user_menu.ftl" />
  <!-- 右侧 -->
  <div class="content_2">
    <div class="content_2_1">我的等级</div>
    <div class="content_2_2">
      <ul>
         <#if level_page??>
         <#list level_page.content as item>
                <#if item_index = 0>
                   <li class="dj_0">
                   <#if user.userLevelTitle == item.title>
                     <p style="color:#ef7c00;">${item.title!''}</p>
                    <#else>           
                      ${item.title!''}
                    </#if>          
                    </li>
                </#if>  
                <#if item_index gt 0 && item_index lt 4>             
                    <li class="dj_1">           
                      <#if user.userLevelTitle = item.title>
                        <b style="color:#ef7c00;">${item.title!''}</b>
                       <#else>           
                         ${item.title!''}
                       </#if>          
                    </li>
                </#if>
                <#if item_index = 4>
                      <li class="dj_4">           
                         <#if user.userLevelTitle = item.title>
                     <b style="color:#ef7c00;">${item.title!''}</b>
                    <#else>           
                      ${item.title!''}
                    </#if>            
                      </li>
                </#if>                 
                <#if item_index = 5>
                      <li class="dj_5">           
                         <#if user.userLevelTitle = item.title>
                     <b style="color:#ef7c00;">${item.title!''}</b>
                    <#else>           
                      ${item.title!''}
                    </#if>            
                      </li>
                </#if>
            </#list>
        </#if>    
      </ul>
      
 <#--  用户等级的经验条暂时只能是整的，zhangji -->
   <#if level_page??>
       <#list level_page.content as item>
           <#if user.userLevelTitle = item.title>
              <#if item_index = 0>
              <div class="djt_0"></div>
              </#if>
              <#if item_index = 1>
              <div class="djt_1"></div>
              </#if>
              <#if item_index = 2>
              <div class="djt_2"></div>
              </#if>              
              <#if item_index = 3>
              <div class="djt_3"></div>
              </#if>
              <#if item_index = 4>
              <div class="djt_4"></div>
              </#if>
              <#if item_index = 5>
              <div class="djt_5"></div>
              </#if>
           </#if>
        </#list>
    </#if>       
 
 <#--     <div class="djt_1" style="width:(${user.totalSpendCash}/100)%;"></div> -->
    </div>
    <div class="content_2_3">备注：注册用户为等级0开始，只要有一个订单确认收货即可升级，等级最高为5级。</div>  
   <#--  后台只能自定义5个会员等级和一个默认等级，默认等级没有特权 -->     
    <div class="content_2_4">
     <dl class="dl_1">
       <dt class="dt_1"><span>特权</span>等级</dt>
       <#if level_page??>
          <#list level_page.content as item>
              <#if item_index gt 0>
              <dd>${item.privilege!''}</dd>
              </#if>
          </#list>
       </#if>  
     </dl>
     
        <#if level_page??>
           <#list level_page.content as item>
             <#if item_index gt 0>
                <dl>
                    <dt>${item.title!'' }</dt>
                    <dd><img src="/client/images/gou.png" /></dd>
                  <#if item_index gt 1><dd><img src="/client/images/gou.png" /></dd> 
                      <#else> <dd><img src="/client/images/hg.png" /></dd>
                  </#if> 
                  <#if item_index gt 2><dd><img src="/client/images/gou.png" /></dd> 
                      <#else> <dd><img src="/client/images/hg.png" /></dd>
                  </#if> 
                  <#if item_index gt 3><dd><img src="/client/images/gou.png" /></dd> 
                      <#else> <dd><img src="/client/images/hg.png" /></dd>
                  </#if> 
                  <#if item_index gt 4><dd><img src="/client/images/gou.png" /></dd> 
                      <#else> <dd><img src="/client/images/hg.png" /></dd>
                  </#if> 
               </dl>
              </#if>
            </#list>
        </#if>
     

    </div>
  </div>
</div>
<!--底部footer-->
<#include "/client/common_footer.ftl" />
</body>
</html>
