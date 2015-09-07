<div class="nav">
    <#if navi_touch_list??&&navi_touch_list?size gt 0>
        <ul class="listico">
            <#list navi_touch_list as item>
                <li class="icon_1"><a href="${item.linkUri!''}" style="background: url('${item.iconUri!''}') no-repeat center 0;background-size:50px;">${item.title!''}</a></li>
            </#list>                        
        </ul> 
    </#if>
</div>