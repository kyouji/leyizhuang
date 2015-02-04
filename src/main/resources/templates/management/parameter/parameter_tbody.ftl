<#if param_list??>
    <#list param_list as param>
		<tr>
		    <td class="center">
		        <label>
		            <input type="checkbox" class="tr-check ace" value="${param.id}" style="line-height:38px;"/>
		            <span class="lbl"></span>
		        </label>
		    </td>
		    <td class="center">
		        <input type="text" onchange="change(${param.id}, this)" class="col-sm-12 order-input" value="<#if param.sortNumber??>${param.sortNumber}</#if>"/>
		    </td>
		    <td class="center">
		        ${param.id}
		    </td>
		    <td class="center">
		        ${param.type} 
		    </td>
		    <td class="center">
		        ${param.name}
		    </td>
		    <td class="center">
		    	<#if param.isValueIputByChoose?? && param.isValueIputByChoose==true>
		    		点击选择
		    	<#else>
		    		手动输入
		    	</#if>
		    </td>
		    <td class="center">
		        <#if param.isSearchable?? && param.isSearchable==true>
		                                   是
		        <#else>
		                                   否
		        </#if>
		    </td>
		    <td class="center">
		        <#if param.isSingleValue?? && param.isSingleValue==true>
		                                   是
		        <#else>
		                                   否
		        </#if>
		    </td>
		    <td class="center">
		    	<#if param.valueList??>
		        ${param.valueList}
		        </#if>
		    </td>
		    <td class="center">
		        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
		            <button onclick="modify(${param.id})"  class="btn btn-xs btn-info">
		                <i class="icon-edit bigger-120"></i>
		            </button>

		            <button onclick="destroy(${param.id})" class="btn btn-xs btn-danger">
		                <i class="icon-trash bigger-120"></i>
		            </button>
		        </div>
		    </td>
		</tr>
    </#list>
</#if>