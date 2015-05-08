<footer>
    <div id="main">
        <div class="hot_line fl mt20">
            <ul>
                <li style="font-size:20px; color:#999; padding-left:40px;">${site.telephone!'400-739-1200'}</li>
                <li style="padding-left:40px; line-height:25px; font-size:13px; color:#999">博大生活网客服热线</br>周一至周日：08:00-20:00</li>
            </ul>
            <#if help_level0_cat_list??>
                <#list help_level0_cat_list as item>
                    <ul class="pizz fl <#if item_index != 0>ml90</#if>">
                        <h5>${item.title!''}</h5>
                        <#if item_index==0>
                            <#if cat0_help_list??>
                                <#list cat0_help_list as item>
                                    <li><a href="/info/content/${item.id}?mid=${help_id}">${item.title!''}</a></li>
                                </#list>
                            </#if>
                        <#elseif item_index==1>
                            <#if cat1_help_list??>
                                <#list cat1_help_list as item>
                                    <li><a href="/info/content/${item.id}?mid=${help_id}">${item.title!''}</a></li>
                                </#list>
                            </#if>
                        <#elseif item_index==2>
                            <#if cat2_help_list??>
                                <#list cat2_help_list as item>
                                    <li><a href="/info/content/${item.id}?mid=${help_id}">${item.title!''}</a></li>
                                </#list>
                            </#if>
                        <#elseif item_index==3>
                            <#if cat3_help_list??>
                                <#list cat3_help_list as item>
                                    <li><a href="/info/content/${item.id}?mid=${help_id}">${item.title!''}</a></li>
                                </#list>
                            </#if>
                        </#if>
                    </ul>
                </#list>
            </#if>
        </div>
        
        <div class="wx fr mt20">
            <span>
                <h5>博大生活微信</h5>
                <img src="/client/images/wx.png" width="115" height="115">
             </span>
            <span>
                <h5>iPhone客户端</h5>
                <img src="/client/images/wx.png" width="115" height="115">
             </span>
            <span>
                <h5>Android客户端</h5>
                <img src="/client/images/wx.png" width="115" height="115">
             </span>
        </div>
        
        <div class="link fl mt20">
            友情链接：
            <#if site_link_list??>
                <#list site_link_list as item>
                    <a href="${item.linkUri!''}">${item.title!''}</a>
                </#list>
            </#if>
        <b></b>
        </div>
        
        <div class="foot fl mt20">${site.copyright!''} 网站建设技术支持：<a href="http://www.ynyes.com">昆明天度网络公司</a></div>
    </div>
</footer>