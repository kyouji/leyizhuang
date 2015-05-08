<#if cart_goods_list?? && cart_goods_list?size gt 0>
<div class="gwc1_lm mt20">
    <table border="0" cellpadding="0" cellspacing="0">
    <tbody><tr>
    <td>商品信息</td>
    <td>单价</td>
    <td>数量</td>
    <td>合计</td>
    <td>操作</td>
    </tr>
    </tbody></table>
</div>
<#assign allChecked=true >
<#assign totalGoods=0>
<#assign totalPrice=0>
<div class="gwc1_lm2">
    <table>
    <tbody>
    <#list cart_goods_list as cg>
    <tr>
        <td class="gwc1_lm2_a">
            <input type="checkbox" class="fl duoxuank" cgid="${cg.id}" <#if cg.isSelected>checked="checked"<#else><#assign allChecked=false></#if>>
            <span>
            <a href="/goods/${cg.goodsId}"><img src="${cg.goodsCoverImageUri!''}" width="76" height="76"></a>
            </span>
            <p><a href="/goods/${cg.goodsId}"></a></p>
            <p><a href="/goods/${cg.goodsId}">${cg.goodsTitle!''}</a></p>
        </td>
        <td class="gwc1_lm2_b"><span>￥${cg.price?string("#.##")}</span></td>
        <td class="gwc1_lm2_c">
            <div class="ds content_nr_3_jg2">
                <#if cg.quantity==1>
                    <span class="fl"><img src="/client/img/slj.png" width="20" height="20"></span>
                <#else>
                    <a href="javascript:void(0);" class="fl num_minus" cgid="${cg.id}"><img src="/client/img/slj.png" width="20" height="20"></a>
                </#if>
                <input type="text" class="content_zj" value="${cg.quantity!''}">
                <a href="javascript:void(0);" class="fr num_add" cgid="${cg.id}">
                    <img src="/client/img/sljj.png" width="20" height="20">
                </a>
            </div>
        </td>
        <td class="gwc1_lm2_b"><span>￥${(cg.price*cg.quantity)?string("#.##")}</span></td>
        <td class="gwc1_lm2_d"><input type="button" class="gwc_delete" cgid="${cg.id}" value="删除"></td>
        <#if cg.isSelected>
            <#assign totalGoods=totalGoods+cg.quantity>
            <#assign totalPrice=totalPrice+cg.price*cg.quantity>
        </#if>
    </tr>
    </#list>
    </tbody>
    </table>
</div>
<div class="s_gwc1zj_left fl mt12">
    <p id="p-all-select"><input id="all-select" type="checkbox" class="fl" <#if allChecked>checked="checked" sid="1"<#else>sid="0"</#if>>全选</p>
</div>

<div class="s_gwc1zj fr">
    <p>商品
        <span> <#if cart_goods_list??>${totalGoods!'0'}</#if> </span>件  总价：
        <span>¥<#if cart_goods_list??>${totalPrice?string("#.##")}</#if></span>  商品总计(不含运费)： 
        <span>¥<#if cart_goods_list??>${totalPrice?string("#.##")}</#if></span> 
    </p>
</div>
<div class="clear"></div>
<div class="s_gwc1zja">
    <div class="fl s_gwc1zja_1"></div>
    <div class="fr s_gwc1zja_2"><a onclick="goNext(${totalGoods!0})" href="javascript:void(0);" title="去结算">去结算 </a></div>
</div>

<#else>
<div class="buy_ok">
  <div class="fl mt40 mr20"> <img src="/client/img/gwd.png" width="64" height="64"></div>
  <div class="fl">
    <div class="pt10 font17">您的购物袋暂时还没有商品哦~</div>
    <div class="pt10 font13">看看 <a href="#" style=" color:#da090b">已买到商品</a> </div>
    <div class="pt10 font13">看看 <a href="#" style=" color:#da090b">我的收藏夹</a> </div>
  </div>
</div>
</#if>