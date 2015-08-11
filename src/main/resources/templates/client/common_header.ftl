
<!--顶部-->
<div class="top_all">
    <div class="top">
        <div class="top_left">
            <div class="top_left_welcome">欢迎光临正品惠客</div>
            <a href="/login" title="登录" >请登录</a>
            
            <a href="/reg" title="免费注册" >免费注册</a>
        </div>
        <div class="top_right">
            <a href="/user" title="">我的惠客</a>
            <a class="top_right_like" href="/user/collect/list" >我的关注</a>
            <a class="top_right_hk" href="/user">我的惠客</a>
        </div>
    </div>
    
</div>

<!--头部-->
<div class="header">
    <!--logo大小：190 58-->
    <div class="header_logo"><a href="/"><img src="<#if site??>${site.logoUri!''}</#if>" /></a></div>
    <!--广告语大小：183 58-->
    <div class="header_ad">
        <#if top_small_ad_list??>
            <#list top_small_ad_list as item>
                <a <#if item.typeIsNewWindow?? && item.typeIsNewWindow>target="_blank"</#if> href="${item.linkUri!''}">
                    <img src="${item.fileUri!''}" />
                </a>
                <#break>
            </#list>
        </#if>
    </div>
    
    <div class="header_search">
        <div class="header_search_top">
            <input type="text" class="header_search_top_text">
            <a href="#" title="" class="header_search_top_btn">搜 索</a>
        </div>
        <div class="header_search_bot">
        热门搜索：
             <#if keywords_list??>
                <#list keywords_list as item>
                    <#if item_index gt 0>
                    <a href="${item.linkUri!''}">${item.title}</a>
                    </#if>
                </#list>
            </#if>
        </div>
    </div>
    
    <div class="header_cart">
        <a href="/cart" title="购物车" class="header_cart_btn">购物车（<#if cart_goods_list??>${cart_goods_list?size}<#else>0</#if>）</a>
    </div>
</div>

<!--导航-->
<div class="navigation">
    <div class="nav">
        <div class="nav_submenu">全部商品分类</div>
        
        <div class="nav_nav">
            <ul>
                <li><a href="#" title="" class="nav_choiced">首页</a></li>
                <li><a href="#" title="">惠客秒杀</a></li>
                <li><a href="#" title="">惠客团购</a></li>
                <li><a href="#" title="">惠客众筹</a></li>
                <li><a href="#" title="">惠客积分</a></li>
                <li><a href="#" title="">生活服务</a></li>
                <li><a href="#" title="">售后服务</a></li>
            </ul>
        </div>
        
        <div class="nav_num"><#if site??>全国服务热线：${site.telephone!''}</#if></div>
    </div>
</div>