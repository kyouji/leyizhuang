<div id="consult-list">
    <ul class="pro_myseek_list w100">
        <#if consult_page??>
            <#list consult_page.content as item>
            <li>
                <span class="sp1">${item.consultTime?string("yyyy-MM-dd")}</span>
                <p><b class="userName">${item.username!''}：</b>${item.content!''}</p>
                <#if item.isReplied?? && item.isReplied>
                    <p class="red pt5">商家回复：${item.reply!''}</p>
                </#if>
            </li>
            </#list>
        </#if>      
    </ul>
    <div class="clear h20"></div>
    <div class="page-orange">
        <#assign continueEnter=false>
        <#if consult_page.number+1 == 1>
            <a href="javascript:;" class="disabled">上一页</a>
        <#else>
            <a href="javascript:getConsult(${goodsId?c}, ${consult_page.number-1});">上一页</a>
        </#if>
        
        <#if consult_page.totalPages gt 0>
            <#list 1..consult_page.totalPages as page>
                <#if page <= 3 || (consult_page.totalPages-page) < 3 || (consult_page.number+1-page)?abs<3 >
                    <#if page == consult_page.number+1>
                        <a class="sel" href="javascript:;"">${page}</a>
                    <#else>
                        <a href="javascript:getConsult(${goodsId?c}, ${page-1});">${page}</a>
                    </#if>
                    <#assign continueEnter=false>
                <#else>
                    <#if !continueEnter>
                        <span class="sp1">……</span>
                        <#assign continueEnter=true>
                    </#if>
                </#if>
            </#list>
        </#if>
        
        <#if consult_page.number+1 == consult_page.totalPages || consult_page.totalPages==0>
            <a class="pn-next" href="javascript:;">下一页</a>
        <#else>
            <a class="pn-next" href="javascript:getConsult(${goodsId?c}, ${consult_page.number+1});">下一页</a>
        </#if>
    </div>
    <div class="clear h20"></div>
</div> 