<#if news_list??>
    <#list news_list as news>
		<tr>
		    <td class="center">
		        <label>
		            <input type="checkbox" class="tr-check ace" value="${news.id}" style="line-height:38px;"/>
		            <span class="lbl"></span>
		        </label>
		    </td>
		    <td class="center">
		        <input type="text" onchange="change(${news.id}, this)" class="col-sm-12 order-input" value="<#if news.sortNumber??>${news.sortNumber}</#if>"/>
		    </td>
		    <td class="center">
		        ${news.id}
		    </td>
		    <td class="center">
		        ${news.title}
		    </td>
		    <td class="center">
                ${news.type}
            </td>
            <td class="center">
                ${news.createTime}
            </td>
            <td class="center">
                ${news.isShow?c}
            </td>
            <td class="center">
                ${news.clickNumber}
            </td>
		    <td class="center">
		        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
		            <button onclick="modify(${news.id})"  class="btn btn-xs btn-info">
		                <i class="icon-edit bigger-120"></i>
		            </button>

		            <button onclick="destroy(${news.id})" class="btn btn-xs btn-danger">
		                <i class="icon-trash bigger-120"></i>
		            </button>
		        </div>
		    </td>
		</tr>
    </#list>
</#if>