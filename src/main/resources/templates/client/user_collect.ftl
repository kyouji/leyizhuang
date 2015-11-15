<div class="mymember_mainbox">
    <div class="mymember_info">
        <div class="mymember_order_search" style="border-bottom:1px solid #eee; padding-bottom:20px;">
            <a class="a001" href="#">关注中心</a>
            <input class="mysub" type="button" onclick="changeCollection(${pageId!'0'})" value="  " />
            <input class="mytext" id="keywords" type="text" onFocus="if(value=='商品名称') {value=''}" onBlur="if (value=='') {value='商品名称'}"  value="<#if keywords??>${keywords!''}<#else>商品名称</#if>" />
            <div class="clear"></div>
        </div>
<#if collect_page??>
    <table class="attention_tab">
        <tr>
            <th colspan="2">商品</th>
            <th>惠客价</th>
            <th>库存</th>
            <th>操作</th>
        </tr>
        <#list collect_page.content as item>
            <tr>
                <td width="130"><a href="/goods/${item.goodsId?c}"><img src="${item.goodsCoverImageUri!''}" width="110" height="110" /></a></td>
                <td class="td01"><a href="/goods/${item.goodsId?c}">${item.goodsTitle!''}</a><p class="pt10">加关注时间：2015-01-22</p></td>
                <td width="150" class="red">￥<#if item.goodsSalePrice??>${item.goodsSalePrice?string("0.00")}</#if></td>
                <td width="150">现货</td>
                <td width="150">
                    <a class="block fs12" href="/user/collect/del?id=${item.goodsId?c}">取消关注</a>
                    <a class="a1" href="/cart/init?id=${item.goodsId?c}">加入购物车</a>
                </td>
            </tr>
        </#list>
        <tr>
            <td></td>
            <td class="td02" colspan="5">
            <div class="clear h20"></div>
            <div class="pagebox">
                <div class="num">
                    <#if collect_page??>
                        <#assign continueEnter=false>
                        <#if collect_page.number+1 == 1>
                            <a class="a1 a0" href="javascript:;"><span>上一页</span></a>
                        <#else>
                            <a class="a1 a0" href="javascript:changeCollection(${pageId-1},null);"><span>上一页</span></a>
                        </#if>
                        <#if collect_page.totalPages gt 0>
                            <#list 1..collect_page.totalPages as page>
                                <#if page <= 3 || (collect_page.totalPages-page) < 3 || (collect_page.number+1-page)?abs<3 >
                                    <#if page == collect_page.number+1>
                                        <a class="sel" href="javascript:;">${page}</a>
                                    <#else>
                                        <a href="">${page}</a> <#-- ${page} -->
                                    </#if>
                                    <#assign continueEnter=false>
                                <#else>
                                    <#if !continueEnter>
                                        <span> ... </span>
                                        <#assign continueEnter=true>
                                    </#if>
                                </#if>
                            </#list>
                        </#if>
                        <#if collect_page.number+1 == collect_page.totalPages || collect_page.totalPages==0>
                            <a class="a2 a0" href="javascript:;"><span>下一页</span></a>
                        <#else>
                            <a class="a2 a0" href="javascript:changeCollection(${pageId+1},null);"><span>下一页</span></a>
                        </#if>
                    </#if>
                    <span> 共<b>${collect_page.totalPages}</b>页 </span>
                </div>
                <div class="page">
                    <input class="sub" id="page_ensure" type="button" onclick="javascript:changeCollection(null,0);" value="确定" />
                    <span>页</span>
                    <input class="text" type="text" value="<#if pageId??>${pageId + 1}</#if>" id="iPageNum"/>
                    <span>到第</span>
                </div>
                <div class="clear"></div>
                </div>
                <div class="clear h20"></div>
            </td>
        </tr>
    </table>
</#if>