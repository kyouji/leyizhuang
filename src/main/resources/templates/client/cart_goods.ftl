
<#if cart_goods_list?? && cart_goods_list?size gt 0>
    <#assign allChecked=true >
    <#assign totalGoods=0>
    <#assign totalPrice=0>
    <table class="attention_tab">
            <tr>
              <th colspan="3">商品</th>
              <th>单价</th>
              <th>数量</th>
              <th>合计</th>
              <th>操作</th>
            </tr>
            <#list cart_goods_list as cg>
                 <tr>
                      <td width="50"><input type="checkbox"  onclick="javascript:toggleSelect(${cg.id?c});" <#if cg.isSelected>checked="checked"<#else><#assign allChecked=false></#if>/></td>
                      <td width="130"><a href="/goods/${cg.goodsId?c}"><img src="${cg.goodsCoverImageUri!''}" width="110" height="110" /></a></td>
                      <td class="td01"><a href="/goods/${cg.goodsId?c}">${cg.goodsTitle!''}</a><p class="pt10">添加时间：<#if cg.addTime??>${cg.addTime?string("yyyy-MM-dd")}</#if></p></td>
                      <td width="150" class="red">￥${cg.price?string("0.00")}</td>
                      <td width="150" >
                          <input class="text02 shopcarnum" id="l-number" type="text" value="${cg.quantity!''}" name="goodnum"/>
                          <div class="plus">
                          <a href="javascript:addNum(${cg.id?c});" id="l-add" >+</a>
                          <a href="javascript:minusNum(${cg.id?c});" id="l-reduce" >-</a>
                      </td>
                      <td width="150" class="red">￥${(cg.price*cg.quantity)?string("0.00")}</td>
                      <td width="150">
                          <a class="block fs12" href="javascript:delCartItem(${cg.id?c});">删除</a>
                      </td>
                      <#if cg.isSelected>
                            <#assign totalGoods=totalGoods+cg.quantity>
                            <#assign totalPrice=totalPrice+cg.price*cg.quantity>
                      </#if>
                </tr>
            </#list>           
          <tr>
              <td width="20"></td>
              <td colspan="2" style="text-align:left;">
                <span class="mr20">
                  <a class="c9" id="checkbox_all" href="javascript:toggleAllSelect(0);" >全选</a>
                </span>
                <span class="mr20">
                  <a class="c9" id="checkbox_reall" href="javascript:toggleAllSelect(1);" >取消全选</a>
                </span><!--<a class="c9" href="#">删除选中的商品</a>--></td>
              <td colspan="4" style="text-align:right; font-size:16px; line-height:35px;">
                已选择<span class="fc fw-b number_products" ><#if cart_goods_list??>${totalGoods!'0'}</#if></span>件商品&nbsp;&nbsp;
                商品总计（不含运费）：
                <span class="fc fw-b">￥<b class="decimal_format"><#if cart_goods_list??>${totalPrice?string("0.00")}</#if></b>
                </span>
              </td>
        </tr>
      </table>
      
      <div class="clear h10"></div>
       <div class="car_btn">
            <a class="ml20 fc" href="/">继续购物</a>
            <a class="sub" href="javascript:goNext(${totalGoods!0});">去结算</a>
       </div>
<#else>
    <!--空购物车-->
    <div class="empty">
        <img src="/client/images/order/empty_shopcar.png" />
        <div class="right">
            <p class="pay">您的购物车还是空的，<br /><br />赶快去选购心怡的商品吧！</p>
            <p class="acceptable"><a href="/">立即去购物 >></a></p>
        </div>
    </div>
</#if>