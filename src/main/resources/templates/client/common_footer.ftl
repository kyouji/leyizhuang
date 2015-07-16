<div class="down">
    <section class="index_center">
        <table>
            <#if service_item_list??>
                <tr>
                    <#list service_item_list as item>
                        <td>
                            <a href="javascript:;"><img src="${item.logo!''}" />${item.title!''}<br>${item.description!''}</a>
                        </td>
                    </#list>
                </tr>
            </#if>
        </table>
    </section><!--index_center END-->
</div>
<div class="down2">
    <div class="main">
        <ul style="height:30px;">
            <#if help_level0_cat_list??>
                <#list help_level0_cat_list as item>
                    <li><a href="/info/list/${help_id!'0'}?catId=${item.id!''}">${item.title!''}</a></li>
                </#list>
            </#if>
        </ul>
        
        <div class="clear"></div>
        
        <p>
        友情链接： 
        <#if site_link_list??>
            <#list site_link_list as item>
                <span class="youqin"><a href="${item.linkUri!''}">${item.title!''}</a></span>
            </#list>
        </#if>
        <br />
        ${site.copyright!''}
        <br />
        ${site.address!''} 电话：${site.telephone!''}
        <br />
        <span class="flr"><a title="天度网络信息技术有限公司" href="http://www.ynyes.com" target="_blank">网站建设</a>技术支持：<a title="天度网络信息技术有限公司" href="http://www.ynyes.com" target="_blank">昆明天度网络公司</a></span>
        
        </p>
    </div>
</div>