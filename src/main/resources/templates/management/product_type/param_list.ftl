<#if param_list??>
    <#list param_list as param>
		<a href="javascript:void(0)" class="add multiSelectProp">${param.name}</a>
    </#list>
</#if>