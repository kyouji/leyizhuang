<input type="hidden" value="${count}" id="count">
<#if product_list??>
    <#list product_list as product>
        <ul>
            <li><a href="/product/${product.id}"> <img src="<#if product.coverImageUri??>${product.coverImageUri}</#if>" />
                <p><#if product.name??>${product.name}</#if></p>
                <b>￥<#if product.priceMinimum??>${product.priceMinimum?c}</#if></b> </a>
                <p>已有0人关注</p>  
                <p><a href="/cart" class="jiongwc" target="_blank">加入购物车</a><a href="/product/${product.id}" target="_blank" class="jiongwc1">购买</a><a href="#" class="jiongwc1" target="_blank">对比</a></p>
            </li>
        </ul>
    </#list>
</#if>
  
