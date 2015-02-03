<#if type_list??>
    <#list type_list as type>
		<tr>
		    <td class="center">
		        <label>
		            <input type="checkbox" class="tr-check ace" value="${type.id}" style="line-height:38px;"/>
		            <span class="lbl"></span>
		        </label>
		    </td>
		    <td class="center">
		        <input type="text" onchange="change(${type.id}, this)" class="col-sm-12 order-input" value="<#if type.sortNumber??>${type.sortNumber}</#if>"/>
		    </td>
		    <td class="center">
		        ${type.id}
		    </td>
		    <td class="center">
		        ${type.name}
		    </td>
		    <td class="center">
		        <#if type.parent??>${type.parent}<#else>根类型</#if>
		    </td>
		    <td class="center">
		        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
		            <button onclick="modify(${type.id})"  class="btn btn-xs btn-info">
		                <i class="icon-edit bigger-120"></i>
		            </button>

		            <button onclick="destroy(${type.id})" class="btn btn-xs btn-danger">
		                <i class="icon-trash bigger-120"></i>
		            </button>
		        </div>
		    </td>
		</tr>
    </#list>
</#if>