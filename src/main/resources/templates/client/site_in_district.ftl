<#if all_site??>
    <#list all_site as item>
        <div class="stores-list" onclick="pupopen();">${item.title!''}</div>
    </#list>
</#if>

<#--
    onclick="selectDiySite(${item.id?c});"
-->