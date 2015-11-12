<div class="c_R_consultation top20">
    <div class="slideTxtBox">
        <div class="hd">
            <ul><li>全部咨询(<#if consult_page??>${consult_page.totalElements!'0'}<#else>0</#if>)</li></ul>
        </div>
        <#if consult_page??>
        
        <div class="bd">
            <dl>
                <dd>
                    <#if consult_page??>
                        <#list consult_page.content as item>
                            <ul>
                                <li><b>?</b><span>${item.username!''}</span><label>${item.content!''}</label></li>
                                <#if item.isReplied?? && item.isReplied>
                                    <p class="red">商家回复：${item.reply!''}</p>
                                    <li><strong>!</strong><span>商家回复</span><label>${item.reply!''}</label></li>
                                </#if>
                            </ul>
                        </#list>
                    </#if>
                </dd>
            </dl>
        </div>
        
        <div class="pagebox" style="float:left; padding:15px 0;">
            <div class="num">
                <#assign continueEnter=false>
                <#if consult_page.number+1 == 1>
                    <a class="a1 a0" href="javascript:;"><span>上一页</span></a>
                <#else>
                    <a href="javascript:getConsult(${goodsId}, ${consult_page.number-1});">上一页</a>
                </#if>
                
                <#if consult_page.totalPages gt 0>
                    <#list 1..consult_page.totalPages as page>
                        <#if page <= 3 || (consult_page.totalPages-page) < 3 || (consult_page.number+1-page)?abs<3 >
                            <#if page == consult_page.number+1>
                                <a class="sel" href="javascript:;"">${page}</a>
                            <#else>
                                <a href="javascript:getConsult(${goodsId}, ${page-1});">${page}</a>
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
                
                <#if consult_page.number+1 == consult_page.totalPages || consult_page.totalPages==0>
                    <a class="a2" href="javascript:;"><span>下一页</span></a>
                <#else>
                    <a class="a2" href="javascript:getConsult(${goodsId}, ${consult_page.number+1});">下一页</a>
                </#if>
                
                <span> 共<b>${consult_page.totalPages!'0'}</b>页 </span>
            </div>
            
            <div class="page">
                <input class="sub" type="submit" onclick="javascript:getConsult(${goodsId!''}, parseInt($('#consultPageIndex').val())-1);" value="确定" style=" *+border:none;">
                <span>页</span>
                <input id="consultPageIndex" class="text" type="text" value="1">
                <span>到第</span>
            </div>
            <div class="clear"></div>
        </div>
        
        </#if>
    </div>
</div>

