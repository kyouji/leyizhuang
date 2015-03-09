<#if site_info_list??>
    <#list site_info_list as site_info>
		<tr>
		    <td class="center">
		        <label>
		            <input type="checkbox" class="tr-check ace" value="${site_info.id}" style="line-height:38px;"/>
		            <span class="lbl"></span>
		        </label>
		    </td>
		    <td class="center">
		        <input type="text" onchange="change(${site_info.id}, this)" class="col-sm-12 order-input" value="<#if site_info.sortNumber??>${site_info.sortNumber}</#if>"/>
		    </td>
		    <td class="center">
		        ${site_info.id}
		    </td>
		    <td class="center">
                ${site_info.name}
            </td>
		    <td class="center">
                ${site_info.type}
            </td>
            <td class="center">
                ${site_info.isShow?c}
            </td>
		    <td class="center">
		        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
		            <button onclick="modify(${site_info.id})"  class="btn btn-xs btn-info">
		                <i class="icon-edit bigger-120"></i>
		            </button>

		            <button onclick="destroy(${site_info.id})" class="btn btn-xs btn-danger">
		                <i class="icon-trash bigger-120"></i>
		            </button>
		        </div>
		    </td>
		</tr>
    </#list>
</#if>