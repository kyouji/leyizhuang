<#if cart_goods_list?? && cart_goods_list?size gt 0>
    <#assign allChecked=true >
    <#assign totalGoods=0>
    <#assign totalPrice=0>

    <div class="wrapper">
        <!--购物车详情-->
        <div class="cart_details">
            <#list cart_goods_list as cg>
                <div class="category">
                    <input class="check_box" name="" onclick="javascript:toggleSelect(${cg.id?c});" type="checkbox" value="" <#if cg.isSelected>checked="checked"<#else><#assign allChecked=false></#if> />
                    <ul>
                        <li class="picture_information">
                            <img class="ss" src="${cg.goodsCoverImageUri!''}" width="100" />
                            <a href="/goods/${cg.goodsId}">${cg.goodsTitle!''}</a>
                        </li>
                        <li class="commodity_price">￥${cg.price?string("0.00")}</li>
                        <li>
                            <a class="calculated">
                                <input class="min" type="button" value="-" onclick="javascript:minusNum(${cg.id?c});"/>
                                <input class="text_box" name="goodnum" type="text" value="${cg.quantity!''}" style="width:70px;height:22px;text-align:center;" />
                                <input class="add" type="button" value="+" onclick="javascript:addNum(${cg.id?c});"/>
                            </a>
                        </li>
                        <li class="commodity_price">￥${(cg.price*cg.quantity)?string("0.00")}</li>
                        <li class="operating_text">
                            <a></a>
                            <a class="delete" href="javascript:delCartItem(${cg.id?c});">删除</a>
                        </li>
                         <#if cg.isSelected>
                                <#assign totalGoods=totalGoods+cg.quantity>
                                <#assign totalPrice=totalPrice+cg.price*cg.quantity>
                         </#if>
                    </ul>
                </div>
            </#list>
        </div>
    
        <!--商品统计-->
        <div class="number_statistics">
            <div class="statistics_left">
                <input class="check_box" type="checkbox" <#if allChecked>checked="checked" onclick="javascript:toggleAllSelect(1);"<#else>onclick="javascript:toggleAllSelect(0);"</#if> />
                <span>全选</span>
               
            </div>
            <div class="statistics_right">
                <a class="number_products">商品数量<span>&nbsp;<#if cart_goods_list??>${totalGoods!'0'}</#if>&nbsp;</span>件</a>
                <a>总价<span>￥<#if cart_goods_list??>${totalPrice?string("0.00")}</#if></span></a>
            </div>
        </div>
    </div>
    
    <!--结算-->
    <div class="clear_num">
        <div class="clearing_num"><a href="javascript:goNext(${totalGoods!0});">结算</a></div>
    </div>
<#else>
    <!--空购物车-->
    <div class="empty">
        <img src="/client/images/order/empty_shopcar.png" />
        <div class="right">
            <p class="pay">您的购物车还是空的，<br />
                赶快去选购心怡的商品吧！
            </p>
            <p class="acceptable"><a href="/">立即去购物 >></a></p>
        </div>
    </div>
</#if>
