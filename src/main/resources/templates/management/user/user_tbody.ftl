<#if user_list??>
    <#list user_list as user>
		<tr>
		    <td class="center">
		        <label>
		            <input type="checkbox" class="tr-check ace" value="${user.id}" style="line-height:38px;"/>
		            <span class="lbl"></span>
		        </label>
		    </td>
		    <td class="center">
		        <input type="text" onchange="change(${user.id}, this)" class="col-sm-12 order-input" value="<#if user.sortNumber??>${user.sortNumber}</#if>"/>
		    </td>
		    <td class="center">
		        ${user.id}
		    </td>
		    <td class="center">
		        ${user.username}
		    </td>
		    <td class="center">
                ${user.role}
            </td>
            <td class="center">
                <#if user.mobile??>${user.mobile}</#if>
            </td>
            <td class="center">
                ${user.isEnable?c}
            </td>
            <td class="center">
                ${user.lastLoginTime}
            </td>
		    <td class="center">
		        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
		            <button onclick="modify(${user.id})"  class="btn btn-xs btn-info">
		                <i class="icon-edit bigger-120"></i>
		            </button>

		            <button onclick="destroy(${user.id})" class="btn btn-xs btn-danger">
		                <i class="icon-trash bigger-120"></i>
		            </button>
		        </div>
		    </td>
		</tr>
    </#list>
</#if>