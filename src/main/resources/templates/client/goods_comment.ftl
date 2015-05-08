<#if comment_page?? && comment_page.content?size gt 0 >
    <#list comment_page.content as comment>
        <dl class="eval-row clearfix">
            <dt class="user-info">
                <img class="head-pic" src="${comment.userHeadUri!''}">
                <p class="user-nick">${comment.username!''}</p>
            </dt>
            <dd class="eval-title">评价：</dd>
            <dd class="eval-info">
                <div class="eval-cont">${comment.content!''}</div>
                
                <p class="goods-info">${comment.commentTime?string("yyyy-MM-dd HH:mm:ss")}&nbsp;</p>
            </dd>
            <#if comment.isReplied?? && comment.isReplied>
                <dd class="user">
                    <b>管理回复：${comment.reply!''}</b>
                    <p class="goods-info1">${comment.replyTime?string("yyyy-MM-dd HH:mm:ss")}&nbsp;</p>
                </dd>
            </#if>
            <div class="code-cont"></div>
        </dl>
    </#list>
    <div class="page clearfix mt20 fr">
        <span class="p-skip">
            <#if comment_page??>
                <em>共<b>${comment_page.totalElements!'0'}</b>条记录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<#if comment_page.totalPages gt 0>${comment_page.number+1}<#else>0</#if>/${comment_page.totalPages}页</em>
            </#if>
        </span>
        <div id="J_bottomPage" class="p-wrap">
            <span class="p-num">
               
                <#assign continueEnter=false>
                <#if comment_page.number+1 == 1>
                    <a class="pn-prev disabled"><i>&lt;</i><em>上一页</em></a>
                <#else>
                    <a href="${comment_page.number-1}" class="pn-prev disabled"><i>&lt;</i><em>上一页</em></a>
                </#if>
                
                <#if comment_page.totalPages gt 0>
                    <#list 1..comment_page.totalPages as page>
                        <#if page <= 3 || (comment_page.totalPages-page) < 3 || (comment_page.number+1-page)?abs<3 >
                            <#if page == comment_page.number+1>
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
                
                <#if comment_page.number+1 == comment_page.totalPages || comment_page.totalPages==0>
                    <a href="javascript:;" class="pn-next disabled"><em>下一页</em><i>&gt;</i></a>
                <#else>
                    <a href="${comment_page.number+1}" class="pn-next"><em>下一页</em><i>&gt;</i></a>
                </#if>
            </span>
        </div>
    </div>      
</#if>
