<#if ad_type_list??>
    <#list ad_type_list as ad_type>
		<tr>
		    <td class="center">
		        <label>
		            <input type="checkbox" class="tr-check ace" value="${ad_type.id}" style="line-height:38px;"/>
		            <span class="lbl"></span>
		        </label>
		    </td>
		    <td class="center">
		        <input type="text" onchange="change(${ad_type.id}, this)" class="col-sm-12 order-input" value="<#if ad_type.sortNumber??>${ad_type.sortNumber}</#if>"/>
		    </td>
		    <td class="center">
		        ${ad_type.id}
		    </td>
		    <td class="center">
		        ${ad_type.name}
		    </td>
		    <td class="center">
		        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
		            <button onclick="modify(${ad_type.id})"  class="btn btn-xs btn-info">
		                <i class="icon-edit bigger-120"></i>
		            </button>

		            <button onclick="destroy(${ad_type.id})" class="btn btn-xs btn-danger">
		                <i class="icon-trash bigger-120"></i>
		            </button>
		        </div>
		    </td>
		</tr>
    </#list>
</#if>