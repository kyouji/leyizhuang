
<div class="mymember_info mymember_info02">
    <div class="mymember_order_search">
        <a class="a001" href="">全部订单</a>
        <!--<a class="a002">在线客服</a>-->
        <input class="mysub" type="submit" value="  " />
        <input class="mytext" id="keywords" type="text" onFocus="if(value=='订单编号') {value=''}" onBlur="if (value=='') {value='订单编号'}"  value="<#if keywords??>${keywords!''}<#else>订单编号</#if>" />
        <div class="clear"></div>
    </div>
    <table>
        <tr class="mymember_infotab_tit01">
            <th>订单编号</th>
            <th colspan="2">订单信息</th>
            <th width="70">收货人</th>
            <th>订单金额</th>
            <th width="80">
                <select id="time_limit" onchange=fliter();>
                    <option value="1" selected>最近三个月</option>
                    <option value="2" <#if time_limit??&&time_limit==2>selected</#if>>今年内</option>                          
                </select>
            </th>
            <th width="80">
                <select id="order_status" onchange="fliter();">
                    <option value="0" <#if order_status??&&order_status==0>selected</#if>>全部状态</option>
                    <option value="2" <#if order_status??&&order_status==2>selected</#if>>待付款</option>
                    <option value="3" <#if order_status??&&order_status==3>selected</#if>>待发货</option>
                    <option value="4" <#if order_status??&&order_status==4>selected</#if>>待收货</option>
                    <option value="5" <#if order_status??&&order_status==5>selected</#if>>待评价</option>
                    <option value="6" <#if order_status??&&order_status==6>selected</#if>>已完成</option>
                </select>
            </th>
            <th width="120">操作</th>
        </tr>
        <#if order_page??&&order_page.content??>
            <#list order_page.content as item>
                <#list item.orderGoodsList as goods>      
                    <tr>
                        <td width="150" style="border:none;"><a href="#">${item.orderNumber!''}</a></td>
                        <td width="50" style="border:none;" class="td001"><a href="#"><img src="${goods.coverImageUri!''}" alt="${goods.title!''}"  width="50" align="left" /></a></td>
                        <td style="border:none; text-align:left;"><a href="#">${goods.title!''}</a></td>
                        <td>${item.shippingName!''}</td>
                        <td>￥<#if item??&&item.totalPrice??>${item.totalPrice?string("0.00")}<#else>0.00</#if> &nbsp;&nbsp; ${item.payTypeTitle!''}</td>
                        <td class="td003">
                            <#if item??&&item.orderTime??>
                                <p>${item.orderTime?string("yyyy-MM-dd")}</p>
                                <p>${item.orderTime?string("HH:mm:dd")}</p>
                            </#if>
                        </td>
                        <td>
                            <h4>
                                <#if item??&&item.statusId??>
                                    <#switch item.statusId>
                                        <#case 1>待确认<#break>
                                        <#case 2>待付款<#break>
                                        <#case 3>待发货<#break>
                                        <#case 4>待收货<#break>
                                        <#case 5>待评价<#break>
                                        <#case 6>已完成<#break>
                                        <#case 7>已取消<#break>
                                        <#case 8>支付取消<#break>
                                    </#switch>
                                </#if>
                            </h4>
                                <div class="mymember_info_show" id="showinfo01">
                                <i><img src="images/mymember/arrow04.gif" /></i>
                                <a class="z-in10" href="javascript:closeShowInfo();"><img src="images/mymember/close.png" /></a>
                            </div>          
                        </td>
                        <td class="td003" style="border:none;">
                            <a href="#">查看</a>
                            <a href="#">评价</a>
                            <a href="#">晒单</a>
                            <a href="#">申请返修</a>
                            <a href="#">退换货</a>
                        </td>
                    </tr> 
                </#list>
            </#list>
        </#if>
    </table>
    <div class="mypage_line"></div>
    <!--
    <div class="page-ldy">
        <a href="#"><</a>
        <a class="sel" href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">></a>
    </div>
    -->
    <div class="pagebox">
        <div class="num">
            <#if order_page??>
                <#assign continueEnter=false>
                    <#if order_page.number+1 == 1>
                        <a class="a1 a0" href="javascript:;"><span>上一页</span></a>
                    <#else>
                        <a class="a1 a0" href="javascript:fliter(null,1);"><span>上一页</span></a>
                    </#if>
                
                    <#if order_page.totalPages gt 0>
                        <#list 1..order_page.totalPages as page>
                            <#if page <= 3 || (order_page.totalPages-page) < 3 || (order_page.number+1-page)?abs<3 >
                                <#if page == order_page.number+1>
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
                    <#if order_page.number+1 == order_page.totalPages || order_page.totalPages==0>
                        <a class="a2 a0" href="javascript:;"><span>下一页</span></a>
                    <#else>
                        <a class="a2" href="javascript:fliter(null,0);"><span>下一页</span></a>
                    </#if>
                </#if>
                <span> 共<b>${order_page.totalPages}</b>页 </span>
            </div>
            <div class="page">
                <input class="sub" id="page_ensure" type="button" onclick="javascript:fliter(0);" value="确定" />
                <span>页</span>
                <input class="text" type="text" value="<#if pageId??>${pageId + 1}</#if>" id="iPageNum"/>
                <span>到第</span>
            </div>
            <div class="clear"></div>
        </div>
    <div class="clear h20"></div>
</div>