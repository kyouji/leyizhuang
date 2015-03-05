<input type="hidden" value="${count}" id="count">
<#if product??>
    <#list product as proud>
      <ul>
        <li><a href="/product/${proud.id}" target="_blank"> <img src="<#if proud.coverImageUri??>${proud.coverImageUri}</#if>" />
          <p><#if proud.name??>${proud.name}</#if></p>
          <b>￥<#if proud.flashSalePrice??>${proud.priceMinimum?c}</#if></b> </a>
          <p>已有0人关注</p>  
          <p><a href="/cart" class="jiongwc" target="_blank">加入购物车</a><a href="/product/${proud.id}" target="_blank" class="jiongwc1">购买</a><a href="#" class="jiongwc1" target="_blank">对比</a></p>
        </li>
       
      </ul>
      
       </#list>
  </#if>
  
  