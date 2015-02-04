<#if param_list??>
    <#list param_list as param>
		<a href="javascript:void(0)" class="add multiSelectProp" value="${param.id}">${param.name}</a>
    </#list>
</#if>