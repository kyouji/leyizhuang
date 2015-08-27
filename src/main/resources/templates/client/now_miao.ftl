<div class="hui_spike">
    <ul>
        <#if miao_goods_page??>
            <#list miao_goods_page.content as item>
<script>
$(document).ready(function(){
    setInterval("timer${item_index}()",1000);
});

function timer${item_index}()
{
<#if item.isFlashSale && item.flashSaleStartTime < .now && item.flashSaleStopTime gt .now>
    var ts = (new Date(${item.flashSaleStopTime?string("yyyy")}, 
                parseInt(${item.flashSaleStopTime?string("MM")}, 10)-1, 
                ${item.flashSaleStopTime?string("dd")}, 
                ${item.flashSaleStopTime?string("HH")}, 
                ${item.flashSaleStopTime?string("mm")}, 
                ${item.flashSaleStopTime?string("ss")})) - (new Date());//计算剩余的毫秒数
    
    var allts = (new Date(${item.flashSaleStopTime?string("yyyy")}, 
                parseInt(${item.flashSaleStopTime?string("MM")}, 10)-1, 
                ${item.flashSaleStopTime?string("dd")}, 
                ${item.flashSaleStopTime?string("HH")}, 
                ${item.flashSaleStopTime?string("mm")}, 
                ${item.flashSaleStopTime?string("ss")}))
               - (new Date(${item.flashSaleStartTime?string("yyyy")}, 
                parseInt(${item.flashSaleStartTime?string("MM")}, 10)-1, 
                ${item.flashSaleStartTime?string("dd")}, 
                ${item.flashSaleStartTime?string("HH")}, 
                ${item.flashSaleStartTime?string("mm")}, 
                ${item.flashSaleStartTime?string("ss")}));//总共的毫秒数
                
    if (0 >= ts)
    {
        window.location.reload();
    }
    
    var date = new Date();
    var dd = parseInt(ts / 1000 / 60 / 60 / 24, 10);//计算剩余的天数
    var hh = parseInt(ts / 1000 / 60 / 60 % 24, 10);//计算剩余的小时数
    var mm = parseInt(ts / 1000 / 60 % 60, 10);//计算剩余的分钟数
    var ss = parseInt(ts / 1000 % 60, 10);//计算剩余的秒数
    dd = checkTime(dd);
    hh = checkTime(hh);
    mm = checkTime(mm);
    ss = checkTime(ss);
    $("#timeLeft${item_index}").html("<span>"+dd+"</span>天<span>"+hh+"</span>时<span>"+mm+"</span>分<span>"+ss+"</span>秒");          
</#if>
}
</script>
                <li>
                    <a href="/goods/${item.id}?promotion=miao" target="_blank" class="iPhone6">
                        <img width="300" height="300" src="${item.coverImageUri!''}" />
                    </a>
                    <div class="spike_right">
                        <a href="/goods/${item.id}?promotion=miao" target="_blank" class="trait">${item.title!''}</a>
                        <a href="/goods/${item.id}?promotion=miao" target="_blank" class="fz_14 trait">${item.subTitle!''}</a>                
                        <p class="special_offer">
                            <del>原价<br />￥<span><#if item.salePrice??>${item.salePrice?string("0.00")}</#if></span></del>
                            <b>节省<br /><span><#if item.salePrice?? && item.flashSalePrice??>${(item.salePrice-item.flashSalePrice)?string("0.00")}</#if></span></b>
                        </p>
                        <div class="time_left">
                            <div id="timeLeft${item_index}"><span>00</span>天<span>00</span>时<span>00</span>分<span>00</span>秒</div>
                            <div class="remaining">还剩<span>${item.flashSaleLeftNumber?c}</span>件</div>
                        </div>
                        
                    </div>
                    <div class="snapped_up">
                        <#if item.flashSaleLeftNumber gt 0>
                            <input type="button" onClick="flashBuy(${item.id})" class="snapp" value="立即抢购">
                        <#else>
                            <input type="button" onClick="javascript:;" class="snapp" style="background-color:#ccc" value="已售完">
                        </#if>
                        <b class="snapp_price">￥<span><#if item.salePrice??>${item.flashSalePrice?string("0.00")}</#if></span></b>
                    </div>
                </li>
            </#list>
        </#if>
    </ul>
</div>
<!--秒杀结束-->

<!--分页-->
<div class="pagebox" style="float:left; padding:15px 0;">
    <div class="num">
        <#assign continueEnter=false>
        <#if miao_goods_page.number+1 == 1>
            <a class="a1 a0" href="javascript:;"><span>上一页</span></a>
        <#else>
            <a href="javascript:changeMiao(${pageId-1});">上一页</a>
        </#if>

        <#if miao_goods_page.totalPages gt 0>
            <#list 1..miao_goods_page.totalPages as page>
                <#if page <= 3 || (miao_goods_page.totalPages-page) < 3 || (miao_goods_page.number+1-page)?abs<3 >
                    <#if page == miao_goods_page.number+1>
                        <a class="sel" href="javascript:;"">${page}</a>
                    <#else>
                        <a href="javascript:changeMiao(${page-1});">${page}</a>
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

        <#if miao_goods_page.number+1 == miao_goods_page.totalPages || miao_goods_page.totalPages==0>
            <a class="a2 a0" href="javascript:;"><span>下一页</span></a>
        <#else>
            <a class="a2" href="javascript:changeMiao(${pageId+1});">下一页</a>
        </#if>
        <span> 共<b style="float:none;">${miao_goods_page.totalPages!'0'}</b>页 </span>
    </div>
        
    <div class="page">
        <input class="sub" type="button" onclick="javascript:changeMiao();" value="确定" style=" *+border:none;">
        <span>页</span>
        <input id="now_flash_page" class="text" type="text" value="${pageId+1}">
        <span>到第</span>
    </div>
    <div class="clear"></div>
</div>