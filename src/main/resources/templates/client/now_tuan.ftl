<script type="text/javascript">
    function buynow(id){
        if(null != id){
            var goodsId = id;
        }else{
            alert("获取商品信息失败！");
            return;
        }
        window.open("/goods/"+goodsId+"?promotion=nowTuan");
    }
    
    function groupBuy(id){
    if(null != id){
            var goodsId = id;
        }else{
            alert("获取商品信息失败！");
            return;
        }
        window.open("/order/promotionBuy?goodsId="+goodsId+"&promotion=nowTuan");
    }
</script>
<#if tuan_goods_page??>
    <p class="fz_24 fw_700 wh_group">正在团购</p>
    <ul>
        <#list tuan_goods_page.content as item>
            <li>
                <a href="/goods/${item.id}?promotion=nowTuan" target="_blank"><img width="220px; height="220px;" src="${item.groupSaleImage!''}" /></a>
                <div id="tuan_time${item_index}" class="time_left">
                </div>
                <script type="text/javascript">
                    $(document).ready(function(){
                        tuanTimer${item_index}();
                        setInterval("tuanTimer${item_index}()",1000);
                    });
                    
                    function tuanTimer${item_index}(){
                            var ts = (new Date(${item.groupSaleStopTime?string("yyyy")}, 
                            parseInt(${item.groupSaleStopTime?string("MM")}, 10)-1, 
                            ${item.groupSaleStopTime?string("dd")}, 
                            ${item.groupSaleStopTime?string("HH")}, 
                            ${item.groupSaleStopTime?string("mm")}, 
                            ${item.groupSaleStopTime?string("ss")})) - (new Date());
                            if (0 == ts)
                            {
                                window.location.reload();
                            }

                            var date = new Date();
                            var dd = parseInt(ts / 1000 / 60 / 60 / 24, 10);
                            var hh = parseInt(ts / 1000 / 60 / 60 % 24, 10);
                            var mm = parseInt(ts / 1000 / 60 % 60, 10);
                            var ss = parseInt(ts / 1000 % 60, 10);
                            dd = checkTime(dd);
                            hh = checkTime(hh);
                            mm = checkTime(mm);
                            ss = checkTime(ss);
                            $("#tuan_time${item_index}").html("剩余时间：<span>"
                            + dd + "</span>天<span>"
                            + hh + "</span>时<span>"
                            + mm + "</span>分<span>"
                            + ss + "</span>秒");
                        }
                </script>
                <div class="price">
                    <a href="/goods/${item.id}?promotion=nowTuan" target="_blank" class="fz_14 trait">${item.title!''}</a>
                    <p>
                        <b class="fz_18">￥<span>${item.groupSalePrice?string("0.00")}</span></b>
                        <del>￥<span>${item.salePrice?string("0.00")}</span></del>
                    </p>
                     <#if item.groupSaleLeftNumber gt 0>
                        <input type="button" value="立即团购" onClick="groupBuy(${item.id});" />
                    <#else>
                        <input type="button" value="已售完" onClick="javascript:;" style="background-color:#ccc" />
                    </#if>
                </div>
            </li>
        </#list>
    </ul>
</#if>

</div>
<!--分页-->
<div class="pagebox" style="float:left; padding:15px 0;">
    <div class="num">
        <#assign continueEnter=false>
        <#if tuan_goods_page.number+1 == 1>
            <a class="a1 a0" href="javascript:;"><span>上一页</span></a>
        <#else>
            <a href="javascript:changePage(${pageId-1});">上一页</a>
        </#if>

        <#if tuan_goods_page.totalPages gt 0>
            <#list 1..tuan_goods_page.totalPages as page>
                <#if page <= 3 || (tuan_goods_page.totalPages-page) < 3 || (tuan_goods_page.number+1-page)?abs<3 >
                    <#if page == tuan_goods_page.number+1>
                        <a class="sel" href="javascript:;"">${page}</a>
                    <#else>
                        <a href="javascript:changePage(${page-1});">${page}</a>
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

        <#if tuan_goods_page.number+1 == tuan_goods_page.totalPages || tuan_goods_page.totalPages==0>
            <a class="a2 a0" href="javascript:;"><span>下一页</span></a>
        <#else>
            <a class="a2" href="javascript:changePage(${pageId+1});">下一页</a>
        </#if>
        <span> 共<b>${tuan_goods_page.totalPages!'0'}</b>页 </span>
    </div>
        
    <div class="page">
        <input class="sub" type="button" onclick="javascript:changePage();" value="确定" style=" *+border:none;">
        <span>页</span>
        <input id="now_tuan_page" class="text" type="text" value="${pageId+1}">
        <span>到第</span>
    </div>
    <div class="clear"></div>
