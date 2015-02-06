<#if brand_list??>
    <#list brand_list as brand>
		<tr>
		    <td class="center">
		        <label>
		            <input type="checkbox" class="tr-check ace" value="${brand.id}" style="line-height:38px;"/>
		            <span class="lbl"></span>
		        </label>
		    </td>
		    <td class="center">
		        <input type="text" onchange="change(${brand.id}, this)" class="col-sm-12 order-input" value="<#if brand.sortNumber??>${brand.sortNumber}</#if>"/>
		    </td>
		    <td class="center">
		        ${brand.id}
		    </td>
		    <td class="center">
		        <#if brand.type??>${brand.type}</#if> 
		    </td>
		    <td class="center">
		        ${brand.name}
		    </td>
		    <td class="center">
		        <#if brand.logoUri??>${brand.logoUri}</#if>
		    </td>
		    <td class="center">
		    	<#if brand.isRecommend?? && brand.isRecommend==true>
		    		是
		    	<#else>
		    		否
		    	</#if>
		    </td>
		    <td class="center">
		        ${brand.createTime}
		    </td>
		    
		    <td class="center">
		        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
		            <button onclick="modify(${brand.id})"  class="btn btn-xs btn-info">
		                <i class="icon-edit bigger-120"></i>
		            </button>

		            <button onclick="destroy(${brand.id})" class="btn btn-xs btn-danger">
		                <i class="icon-trash bigger-120"></i>
		            </button>
		        </div>
		    </td>
		</tr>
    </#list>
</#if>