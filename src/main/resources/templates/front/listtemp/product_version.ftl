<#if item.isUseVersionPrice?? && item.isUseVersionPrice>
    <input id="new-price" type="text" value="<#if price??>${price?string("#.##")}</#if>" hidden>
    <input id="versionId" type="text" name="vid" value="<#if vid??>${vid?c}</#if>" hidden>
    <#if version_colors??>
    <p class="mb5"><span class="fleft">颜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色：</span>
    <#list version_colors as color>
        <a href="javascript:void(0)" onclick="clickVersion(this)" class="SelectClass SelectColor <#if co?? && co==color> SelectPackage_on</#if>" >${color}</a>
    </#list>
    </p>
    </#if>
    
    <#if version_names??>
    <p class="mb5"><span class="fleft">版&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本：</span>
    <#list version_names as name>
        <a href="javascript:void(0)" onclick="clickVersion(this)" class="SelectClass SelectVersion <#if na?? && na==name> SelectPackage_on</#if>" >${name}</a>
    </#list>
    </p>
    </#if>

    <#if version_capacities??>
    <p class="mb5"><span class="fleft">容&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量：</span>
    <#list version_capacities as capacity>
        <a href="javascript:void(0)" onclick="clickVersion(this)" class="SelectClass SelectCapacity <#if ca?? && ca==capacity> SelectPackage_on</#if>" >${capacity}</a>
    </#list>
    </p>
    </#if>
<div class="clear"></div>
</#if>