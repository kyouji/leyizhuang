<input type="hidden" value="${count}" id="count">
<#if armature??>
   <#list armature as arma>
      <ul>
        <li><a href="/product/${arma.id}" target="_blank"> <img src="${arma.coverImageUri}" />
          <p>${arma.name}</p>
          <b>￥${arma.flashSalePrice?c}</b> </a>
          <p>已有0人关注</p>  
          <p><a href="/cart" class="jiongwc" target="_blank">加入购物车</a><a href="/product/${arma.id}" target="_blank" class="jiongwc1">购买</a><a href="#" class="jiongwc1" target="_blank">对比</a></p>
        </li>
      </ul>
     </#list>
  </#if>
  