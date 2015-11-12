<div class="c_R_comment top20">
    <div class="c_R_comment_title">
        <a href="javascript:getCommentByStars(${goodsId}, 0, 0);" title="全部评价" <#if !stars?? || stars?? && stars==0>class="c_R_comment_title_choiced"</#if>>全部评价（${comment_count!'0'}）</a>
        <a href="javascript:getCommentByStars(${goodsId}, 3, 0);" title="好评" <#if stars?? && stars==3>class="c_R_comment_title_choiced"</#if>>好评（${three_star_comment_count!'0'}）</a>
        <a href="javascript:getCommentByStars(${goodsId}, 2, 0);" title="中评" <#if stars?? && stars==2>class="c_R_comment_title_choiced"</#if>>中评（${two_star_comment_count!'0'}）</a>
        <a href="javascript:getCommentByStars(${goodsId}, 1, 0);" title="差评" <#if stars?? && stars==1>class="c_R_comment_title_choiced"</#if>>差评（${one_star_comment_count!'0'}）</a>
    </div>
    
    <#if comment_page??>
        <#list comment_page.content as item>
        <!--评价详情-->
        <div class="c_R_comment_con">
            <!--用户信息-->
            <div class="c_R_comment_con_L">
                <ul>
                    <li><img src="${item.userHeadUri!''}"></li>
                    <li><span>${item.username!''}</span></li>
                    <li>会员等级</li>
                </ul>
            </div>
            
            <!--右部-->
            <div class="c_R_comment_con_R">
                <!--星 标签 规格 时间-->
                <div class="c_R_comment_con_R_info">
                    <div class="c_R_comment_con_R_info_L">
                        <b>
                            <img src="/client/images/star.png">
                            <img src="/client/images/star.png">
                            <img src="/client/images/star.png">
                            <img src="/client/images/star.png">
                        </b>
                        <span>${item.content!''}</span>
                    </div>
                    <div class="c_R_comment_con_R_info_M"></div>
                    <div class="c_R_comment_con_R_info_R">${item.commentTime?string("yyyy-MM-dd")}</div>
                </div>
                
                <#if item.isReplied?? && item.isReplied>
                    <div class="c_R_comment_con_R_reply2">
                        <span>商家回复：${item.reply!''}</span>
                    </div>
                </#if>
            </div>
        </div>
        </#list>
    </#if>  
</div>

<#if comment_page??>
<div class="pagebox" style="float:left; padding:15px 0;">
    <div class="num">
        <#assign continueEnter=false>
        <#if comment_page?? && comment_page.number+1 == 1>
            <a class="a1 a0" href="javascript:;" class="disabled"><span>上一页</span></a>
        <#else>
            <a href="javascript:getCommentByStars(${goodsId}, ${stars!'0'}, ${comment_page.number-1});">上一页</a>
        </#if>
        
        <#if comment_page.totalPages gt 0>
            <#list 1..comment_page.totalPages as page>
                <#if page <= 3 || (comment_page.totalPages-page) < 3 || (comment_page.number+1-page)?abs<3 >
                    <#if page == comment_page.number+1>
                        <a class="sel" href="javascript:;"">${page}</a>
                    <#else>
                        <a href="javascript:getCommentByStars(${goodsId}, ${stars!'0'}, ${page-1});">${page}</a>
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
        
        <#if comment_page.number+1 == comment_page.totalPages || comment_page.totalPages==0>
            <a class="a2" href="javascript:;">下一页</a>
        <#else>
            <a class="a2" href="javascript:getCommentByStars(${goodsId}, ${stars!'0'}, ${comment_page.number+1});">下一页</a>
        </#if>
        
        <span> 共<b>${comment_page.totalPages!'0'}</b>页 </span>
    </div>
    <div class="page">
        <input class="sub" type="submit" onclick="javascript:getCommentByStars(${goodsId!''}, ${stars!'0'}, parseInt($('#pageIndex').val())-1);" value="确定" style=" *+border:none;">
        <span>页</span>
        <input id="pageIndex" class="text" type="text" value="1">
        <span>到第</span>
    </div>
    <div class="clear"></div>
</div> 
</#if> 