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
        <ul>
            <li><a href="#" title="">关于我们</a></li>
            <li><a href="#" title="">关于我们们们</a></li>
            <li><a href="#" title="">关于我们</a></li>
            <li><a href="#" title="">关于我们们</a></li>
            <li><a href="#" title="">关于我们</a></li>
        </ul>
        <ul>
            <li><a href="#" title="">关于我们</a></li>
            <li><a href="#" title="">关于我们</a></li>
            <li><a href="#" title="">关于我们</a></li>
            <li><a href="#" title="">关于我们</a></li>
            <li><a href="#" title="">关于我们</a></li>
        </ul>
        <ul>
            <li><a href="#" title="">关于我们</a></li>
            <li><a href="#" title="">关于我们</a></li>
            <li><a href="#" title="">关于我们</a></li>
            <li><a href="#" title="">关于我们</a></li>
            <li><a href="#" title="">关于我们</a></li>
        </ul>
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
            <span>Copyright©2006-2014 All Rights Reserved 丫丫网 版权所有 滇ICP备07004173号</span>
        </div>
    </div> 
</div>