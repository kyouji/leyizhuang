<!DOCTYPE html>
<html>
    <head>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="copyright" content="" />
        <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        <meta charset="utf-8">
        <title>乐易装首页</title>
        
        <link rel="stylesheet" type="text/css" href="/client/css/my_base.css"/>
        <link rel="stylesheet" type="text/css" href="/client/css/main.css"/>
        <link rel="stylesheet" type="text/css" href="/client/css/other.css"/>
        
        <script src="/client/js/jquery-1.11.0.js" type="text/javascript"></script>
        <script src="/client/js/rich_lee.js" type="text/javascript"></script>
    </head>
    
    <body>
        <#-- 引入公共购物方式选择滑动窗口 -->
        <#include "/client/common_shopping_type.ftl">
        <#-- 引入有奖问答图标 -->
        <#include "/client/common_award.ftl">
        <div style="background:#fafafa;">
            <div class="sec_header">
                <a class="back" href="javascript:history.go(-1);"></a>
                <p>促销活动</p>
            </div>
            
            <section class="activ_content">
                <#if activity_list??>
                    <#list activity_list as item>
                        <a href="">
                                <dl>
                                    <dt>
                                        <img src="${item.activityImg!''}"/>
                                    </dt>
                                    
                                    <dd style="border-bottom:1px #dddddd solid; padding-bottom:6px;">
                                        <i>${item.name!''}</i>
                                    </dd>
                                    <dd>
                                        <span onclick="addActivity(${item.id?c});">加入已选</span>
                                    </dd>
                                </dl>
                            </a>
                    </#list>
                </#if>    
            </div>
        </div>      
    </body>
</html>
