<#if product_list??>
<#list product_list as product>
<tr>
    <td class="center">
        <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
            <a class="blue azoom" href="javascript:;">
                <i class="icon-zoom-in bigger-130"></i>
            </a>
        </div>
    </td>
    <!--td class="center">
        <label>
            <input type="checkbox" class="tr-check ace" value="${product.id}"/>
            <span class="lbl"></span>
        </label>
    </td-->
    <td class="center">
        <input type="text" onchange="change(${product.id}, this)" class="col-sm-12 order-input" value="<#if product.sortNumber??>${product.sortNumber}</#if>"/>
    </td>
    <td class="center">
        ${product.id}
    </td>
    <td class="center">
        <#if product.code??>${product.code}</#if>
    </td>
    <td class="center">
        ${product.name}
    </td>
    <td class="center">
        <a href="#" class="table-a<#if product.isStarProduct?? && product.isStarProduct> ton</#if>">明星产品</a> |
        <a href="#" class="table-a<#if product.isFlashSale?? && product.isFlashSale> ton</#if>">限时抢购</a>
    </td>    
    <td class="center">
        ${product.createTime}
    </td>
    <td class="center">
        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
            <button onclick="modify(${product.id})"  class="btn btn-xs btn-info">
                <i class="icon-edit bigger-120"></i>
            </button>

            <button onclick="destroy(${product.id})" class="btn btn-xs btn-danger">
                <i class="icon-trash bigger-120"></i>
            </button>
        </div>
    </td>
</tr>

<!--<tr class="hide">
    <td colspan="10">
    <table style="width:100%;background-color: #E1F1C7;">
        <tbody>
        <tr>
            <td width="10%" class="center">ID</td>
            <td width="20%" class="center">名称</td>
            <td width="20%" class="center">颜色</td>
            <td width="20%" class="center">容量</td>
            <td width="15%" class="center">价格</td>
            <td width="15%" class="center">数量</td>
        </tr>
        <#if product.goodsVersions??>
        <#list product.goodsVersions as ver>
        <tr>
            <td width="10%" class="center" >${ver.id}</td>
            <td width="20%" class="center"><#if ver.name??>${ver.name}</#if></td>
            <td width="20%" class="center"><#if ver.color??>${ver.color}</#if></td>
            <td width="20%" class="center"><#if ver.capacity??>${ver.capacity}</#if></td>
            <td width="15%" class="center"><#if ver.price??>${ver.price?string("#.##")}</#if></td>
            <td width="15%" class="center"><#if ver.number??>${ver.number?c}</#if></td>
        </tr>
        </#list>
        </#if>
        <tbody>
    </table>
    </td>
</tr>-->
</#list>
</#if>