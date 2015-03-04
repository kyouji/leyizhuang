<#if ad_list??>
    <#list ad_list as ad>
		<tr>
		    <td class="center">
		        <label>
		            <input type="checkbox" class="tr-check ace" value="${ad.id}" style="line-height:38px;"/>
		            <span class="lbl"></span>
		        </label>
		    </td>
		    <td class="center">
		        <input type="text" onchange="change(${ad.id}, this)" class="col-sm-12 order-input" value="<#if ad.sortNumber??>${ad.sortNumber}</#if>"/>
		    </td>
		    <td class="center">
		        ${ad.id}
		    </td>
		    <td class="center">
		        ${ad.name}
		    </td>
		    <td class="center">
                ${ad.type}
            </td>
            <td class="center">
                <img src="${ad.imageUri}" style="height:36px;width:58px"/>
            </td>
            <td class="center">
                ${ad.clickNumber}
            </td>
		    <td class="center">
		        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
		            <button onclick="modify(${ad.id})"  class="btn btn-xs btn-info">
		                <i class="icon-edit bigger-120"></i>
		            </button>

		            <button onclick="destroy(${ad.id})" class="btn btn-xs btn-danger">
		                <i class="icon-trash bigger-120"></i>
		            </button>
		        </div>
		    </td>
		</tr>
    </#list>
</#if>