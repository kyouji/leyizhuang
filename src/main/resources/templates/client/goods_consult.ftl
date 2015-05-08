<#if consult_page?? && consult_page.content?size gt 0 >
    <#list consult_page.content as consult>
        <dl class="eval-row clearfix">
            <dt class="user-info">
                <img class="head-pic" src="${consult.userHeadImageUri!''}">
                <p class="user-nick">${consult.username!''}</p>
            </dt>
            <dd class="eval-title">咨询内容：</dd>
            <dd class="eval-info">
                <div class="eval-cont">${consult.content!''}</div>
                
                <p class="goods-info">${consult.consultTime?string("yyyy-MM-dd HH:mm:ss")}&nbsp;</p>
            </dd>
            <#if consult.isReplied?? && consult.isReplied>
                <dd class="user">
                    <b>管理回复：${consult.reply!''}</b>
                    <p class="goods-info1">${consult.replyTime?string("yyyy-MM-dd HH:mm:ss")}&nbsp;</p>
                </dd>
            </#if>
            <div class="code-cont"></div>
        </dl>
    </#list>
    <div class="page clearfix mt20 fr">
        <span class="p-skip">
            <#if consult_page??>
                <em>共<b>${consult_page.totalElements!'0'}</b>条记录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<#if consult_page.totalPages gt 0>${consult_page.number+1}<#else>0</#if>/${consult_page.totalPages}页</em>
            </#if>
        </span>
        <div id="J_bottomPage" class="p-wrap">
            <span class="p-num">
               
                <#assign continueEnter=false>
                <#if consult_page.number+1 == 1>
                    <a class="pn-prev disabled"><i>&lt;</i><em>上一页</em></a>
                <#else>
                    <a href="${consult_page.number-1}" class="pn-prev disabled"><i>&lt;</i><em>上一页</em></a>
                </#if>
                
                <#if consult_page.totalPages gt 0>
                    <#list 1..consult_page.totalPages as page>
                        <#if page <= 3 || (consult_page.totalPages-page) < 3 || (consult_page.number+1-page)?abs<3 >
                            <#if page == consult_page.number+1>
                                <a href="javascript:;" class="curr">${page}</a>
                            <#else>
                                <a href="${page}" class="hide">${page}</a>
                            </#if>
                            <#assign continueEnter=false>
                        <#else>
                            <#if !continueEnter>
                                <b class="pn-break">&hellip;</b>
                                <#assign continueEnter=true>
                            </#if>
                        </#if>
                    </#list>
                </#if>
                
                <#if consult_page.number+1 == consult_page.totalPages || consult_page.totalPages==0>
                    <a href="javascript:;" class="pn-next disabled"><em>下一页</em><i>&gt;</i></a>
                <#else>
                    <a href="${consult_page.number+1}" class="pn-next"><em>下一页</em><i>&gt;</i></a>
                </#if>
            </span>
        </div>
    </div>      
</#if>
