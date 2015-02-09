<#if sub_type_list??>
<#list sub_type_list as type>
<tr>
    <td class="center">
        ${type.name}
    </td>
    <td class="center">
        ${type.type}
    </td>
    <td class="center">
        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
            <button onclick="modify(${type.id})" class="btn btn-xs btn-info">
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