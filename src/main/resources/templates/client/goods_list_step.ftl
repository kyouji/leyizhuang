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
    <script src="/client/js/goods_list.js" type="text/javascript"></script>
    <script src="/client/js/goods_list_step.js" text="text/javascript"></script>
    </head>
    <script type="text/javascript">
    window.onload = function(){
    	win_cla();//分类弹窗		
    	my_check();//模拟checkbox
    	fen_scroll()
    	footer();
    };
    </script>
    <body>
        <#-- 引入警告提示样式 -->
        <#include "/client/common_warn.ftl">
        <#-- 引入等待提示样式 -->
        <#include "/client/common_wait.ftl">
        <div>
            <#include "/client/common_shopping_type.ftl">
            <!--
            	作者：rich
            	描述：侧边栏 滑动
            -->
            <div id="color_package_select">
                <#include "/client/color_package.ftl">
            </div>
            
            <#include "/client/common_search_header.ftl">
            
            <section class="fen_contnet">
                <#-- 一级分类的div -->
                <div id="level_one">
                    <#include "/client/level_one_category.ftl">
                </div>
                
                <#-- 二级分类的div -->
                <div id="level_two">
                    <#include "/client/level_two_category.ftl">
                </div>
                
                <div id="goods">
                    <#include "/client/step_goods.ftl">
                </div>
            </section>
            
            
            <div class="go_buy">
                <p onclick="window.location.href='/user/selected'">查看已选(<span id="select_num">${selected_number!'0'}</span>)</p>
                <a style="background:#ffaa00;" href="javascript:addCart();">加入已选</a>
                <a href="javascript:clearing();">去结算</a>
            </div>
            <#include "/client/common_footer.ftl">
        </div>		
    </body>
</html>
