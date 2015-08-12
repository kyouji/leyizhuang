<div class="footerall">
    <div class="footer_iconsall">
        <div class="footer_icons">
             <#if service_item_list??>
                 <#list service_item_list as item>
                    <dl>
                        <dt><img src="${item.logo!''}" width="60px;"/></dt>
                        <dd>${item.title!''}</dd>
                    </dl>
                </#list>
            </#if>
        </div>    
    </div>

    <div class="footer_link">
        <#if help_level0_cat_list??>
            <#list help_level0_cat_list as item>
                <ul>
                    <li><a href="/info/list/${help_id!'0'}?catId=${item.id!''}">${item.title!''}</a></li>
                </ul>
            </#list>
        </#if>
    </div>
    

    <div class="footerall_copyall">
        <div class="footerall_copy">
            友情链接：
            <#if site_link_list??>
                <#list site_link_list as item>
                     <a href="${item.linkUri!''}">${item.title!''}</a>
                </#list>
           </#if>
            <br />
            <span> ${site.copyright!''}</span>
        </div>
    </div> 
</div>