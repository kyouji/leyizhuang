<form id="form1" name="form1" action="/order/submit" method="post">
    <div id="main" class="mt15">
        <div class="s_gwc2_1">
            <div class="s_gwc2_1_a"><p><span>收货地址</span></p><p><a id="addAddress" href="javascript:;">新增收货地址</a></p></div>
            <div class="gwc2_psfs555">
                <input id="input-address-id" type="hidden" name="addressId" value="" datatype="n" nullmsg="请选择收货地址!"/>
                <#if user.shippingAddressList?? && user.shippingAddressList?size gt 0>
                    <#list user.shippingAddressList as address>
                        <div class="s_gwc2_1_b">
                            <a class="selAddress" href="javascript:void(0);" aid="${address.id}">
                            <p>收货人：${address.receiverName!''}</p>
                            <p>收货地址：${address.province!''}${address.city!''}${address.disctrict!''}${address.detailAddress!''}</p>
                            <p>联系方式：${address.receiverMobile!''}</p>
                            </a>
                        </div>
                    </#list>
                </#if>
            </div>
            <div class="clear"></div>
        </div>
        
        <div id="addressForm" class="new-address hide">
            <table class="mymember_address">
              <tbody>
              <tr>
                <th>收货人：</th>
                <td>
                    <input class="mytext" id="receiverName" value="" type="text">
                    <span class="Validform_checktip">*收货人姓名</span>
                </td>
              </tr>
              <tr>
                <th>地区：</th>
                <td>
                  <div id="address">
                  <select id="prov" class="prov" style="width: 100px;"></select>
                  <select id="city" class="city" style="width: 100px;"></select>
                  <select id="dist" class="dist" style="width: 100px;"></select>
                  <span class="Validform_checktip">*省市区</span>
                  </div>
                </td>
              </tr>
              <tr>
                <th>详细地址：</th>
                <td>
                    <input class="mytext" id="detailAdd" value="" type="text">
                    <span class="Validform_checktip">*详细地址</span>
                </td>
              </tr>
              <tr>
                <th>邮政编码：</th>
                <td>
                    <input class="mytext" id="postcode" value="" type="text">
                </td>
              </tr>
              <tr>
                <th>联系电话：</th>
                <td>
                    <input class="mytext" id="mobile" value="" type="text">
                    <span class="Validform_checktip">*电话号码</span>
                </td>
              </tr>
              <tr>
                <th></th>
                <td><input id="addAddressSubmit" class="mysub" type="button" value="保存"></td>
              </tr>
            </tbody>
            </table>
        </div>
        
        
        
        <div class="main mt15">
            <div class="s_gwc3_1">
            <div class="s_gwc3_1_a"><p><span>支付方式</span></p></div>
                <div class="gwc_3zf">
                    <ul>
                        <#if pay_type_list??>
                            <#list pay_type_list as pay_type>
                                <li>
                                    <input name="payTypeId" class="input-pay-type" type="radio" datatype="n" value="${pay_type.id!''}" nullmsg="请选择支付方式!">
                                    <#--img src="${pay_type.coverImageUri!''}" width="91" height="30"-->
                                    <span>${pay_type.title!''}</span>
                                </li>
                            </#list>
                        </#if>
                    </ul>
                </div>
            </div>
        </div>
    
        <div class="main mt15">
            <div class="s_gwc3_1">
                <div class="s_gwc3_1_a"><p><span>配送方式</span></p></div>
                <div class="invoice">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <select id="deliveryTypeSelect" name="deliveryTypeId" datatype="n" nullmsg="请选择配送方式">
                        <option value="" price="0">请选择</option>
                        <#if delivery_type_list??>
                            <#list delivery_type_list as delivery_type>
                                <option value="${delivery_type.id!''}" price="${delivery_type.fee?string("#.##")}">${delivery_type.title!''}</option>
                            </#list>
                        </#if>
                    </select>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>说明：</span>
                    <input type="text" class="fapiaolan">
                </div>
            </div>
        </div>
    
        <div class="main mt15">
            <div class="s_gwc3_1">
                <div class="s_gwc3_1_a"><p><span>发票信息</span></p></div>
                <div class="invoice">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>是否开具发票：</span>
                    <input type="radio" name="isNeedInvoice" value="1" datatype="n" nullmsg="请选择是否开具发票!"><span>是</span>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" checked="checked" name="isNeedInvoice" value="0" datatype="n" nullmsg="请选择是否开具发票!"><span>否</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>发票抬头：</span>
                    <input type="text" name="invoiceTitle" class="fapiaolan">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>发票内容：由博大生活网直接开具</span>
                </div>
            </div>
        </div>
    
        <div class="main mt15">
            <div class="s_gwc4_1">
                <div class="s_gwc4_1_a"><p><span>商品信息</span></p></div>
                <div class="gwc2_psfs">
                    <div class="gwc1_lm">
                        <table border="0" cellpadding="0" cellspacing="0">
                        <tbody>
                            <tr>
                                <td width="100">商品编号</td>
                                <td>商品信息</td>
                                <td>单价</td>
                                <td>数量</td>
                                <td>合计</td>
                            </tr>
                        </tbody>
                        </table>
                    </div>
        
                    <div class="gwc1_lm2">
                    <table>
                    <tbody>
                        <#assign totalQuantity=0>
                        <#assign totalPrice=0>
                        <#if selected_goods_list??>
                            <#list selected_goods_list as sg>
                                <tr>
                                    <td class="gwc1_lm2_a0">${sg.goodsId!''}</td>
                                    <td class="gwc1_lm2_a1">
                                        <span><a href="/goods/${sg.goodsId!''}"><img src="${sg.goodsCoverImageUri!''}" width="76" height="76"></a></span>
                                        <p><a href="/goods/${sg.goodsId!''}"></a></p>
                                        <p><a href="/goods/${sg.goodsId!''}">${sg.goodsTitle!''}</a></p>
                                    </td>
                                    <td class="gwc1_lm2_b1"><span>￥${sg.price?string("#.##")}</span></td>
                                    <td class="gwc1_lm2_c1">X${sg.quantity!''}</td>
                                    <td class="gwc1_lm2_b1"><span>￥${(sg.price*sg.quantity)?string("#.##")}</span></td>
                                </tr>
                                <#assign totalQuantity=totalQuantity+sg.quantity>
                                <#assign totalPrice=totalPrice+(sg.price*sg.quantity)>
                            </#list>
                        </#if>
                    </tbody>
                    </table>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    
        <div id="main">
            <div class="s_gwc1zj fr">
                <p>商品<span> ${totalQuantity!'0'} </span>件  总价：商品价格（<span>¥<b id="currentPrice">${totalPrice?string("#.##")}</b></span>) + 运费（<span>¥<b id="deliveryFee">${delivery_fee!'0'}</b></span>）= 商品总计(含运费)： <span>¥<b id="totalPrice">${(totalPrice+delivery_fee!0)?string("#.##")}</b></span> </p>
            </div>
        </div>
        <div class="clear"></div>
        <div class="main">
            <div class="s_gwc1zja">
                <div class="fr s_gwc1zja_2"><input type="submit" value="提交订单" class="input_zy"></input></div>
            </div>
        </div>
    </div>
</form>