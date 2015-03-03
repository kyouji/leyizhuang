<#if shopping_order_list??>
    <#list shopping_order_list as order>
		<tr>
		    <td class="center">
		        <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                    <a class="blue azoom" href="javascript:;">
                        <i class="icon-zoom-in bigger-130"></i>
                    </a>
                </div>
		    </td>
		    <td class="center">
		        <input type="text" onchange="change(${order.id}, this)" class="col-sm-12 order-input" value="<#if order.sortNumber??>${order.sortNumber}</#if>"/>
		    </td>
		    <td class="center">
		        ${order.id}
		    </td>
		    <td class="center">
		        ${order.orderNumber}
		    </td>
		    <td class="center">
                ${order.orderTime}
            </td>
            <td class="center">
                ${order.username}
            </td>
            <td class="center">
                ${order.totalPrice}
            </td>
            <td class="center">
                ${order.statusCode}
            </td>
		    <td class="center">
		        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
		            <button onclick="modify(${order.id})"  class="btn btn-xs btn-info">
		                <i class="icon-edit bigger-120"></i>
		            </button>

		            <button onclick="destroy(${order.id})" class="btn btn-xs btn-danger">
		                <i class="icon-trash bigger-120"></i>
		            </button>
		        </div>
		    </td>
		</tr>
    </#list>
</#if>