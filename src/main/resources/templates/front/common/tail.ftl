<div class="main mt20">
    <div class="floor_n fll"><img src="/img/peisongyuanze.png" width="719" height="44"></div>
    <div class="flr">
        <form action="/search/0-0-0-0-0" method="get">
            <input class="topnews1_serch" name="key" type="text" onfocus="if(value=='热搜机型： iphone 6   MX4 Pro   HTC M8') {value=''}" onblur="if (value=='') {value='热搜机型： iphone 6   MX4 Pro   HTC M8'}"  value="">
            <input type="submit" class="search-btn" title="搜索" value="  ">
        </form>
    </div>
</div>

<div class="clear"></div>

<div class="footallbg">
    <div class="main mt15">
        <div class="s_footer pt15">
        <div class="s_footera fll">
            <ul>
                <li><div class="bzzx fll"></div><span>帮助中心</span></li>
                <#if help_info_list??>
                    <#list help_info_list as info>
                        <li><a href="/help/${info.id}">${info.name}</a></li>
                    </#list>
                </#if>
            </ul>
        </div>

        <div class="s_footera fll" id="s_footera45">
            <ul>
                <li><div class="zfps fll"></div><span>支付配送</span></li>
                <#if delivery_info_list??>
                    <#list delivery_info_list as info>
                        <li><a href="/help/${info.id}">${info.name}</a></li>
                    </#list>
                </#if>
            </ul>
        </div>

        <div class="s_footera fll">
            <ul>
                <li><div class="shfw fll"></div><span>售后服务</span></li>
                <#if service_info_list??>
                    <#list service_info_list as info>
                        <li><a href="/help/${info.id}">${info.name}</a></li>
                    </#list>
                </#if>
            </ul>
        </div>

        <div class="s_footera fll" id="s_footera55">
            <ul>
                <li><div class="gyzc fll"></div><span>关于荣诚</span></li>
                <#if about_info_list??>
                    <#list about_info_list as info>
                        <li><a href="/help/${info.id}">${info.name}</a></li>
                    </#list>
                </#if>
            </ul>
        </div>

        <div class="s_footerb flr">
            <ul>
                <li><div class="mfrxdh fll"></div><span>免费热线电话</span></li>
                <#if phone_info_list?? && phone_info_list[0]??>
                    ${phone_info_list[0].content}
                </#if>
            </ul>
        </div>  

    </div>
</div>

<div class="clear"></div>

<div class="s_footerc">
    <p>©2014 荣诚手机超市<a href="/">www.rcsj.com </a>   滇ICP证8888888号  587 号 <a href="http://www.ynyes.com" target="_blank" title="云南网站建设">网站建设</a>技术支持：<a href="http://www.ynyes.com" target="_blank" title="云南网站建设">昆明天度网络公司</a></p>
</div>

</div>