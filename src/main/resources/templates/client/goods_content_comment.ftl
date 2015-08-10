<div id="comment-list" class="c_R_comment top20">
            
            <!--评价详情-->
         <#if comment_page??>
            <#list comment_page.content as item>
            <div class="c_R_comment_con">
                <!--用户信息-->
                       <div class="c_R_comment_con_L">
                           <ul>
                               <li><img src="${item.userHeadUri!''}" /></li>
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
                            <#if item.goodsStar?? && item.goodsStar gt 0>
                                <#list 1..item.goodsStar as starCount>
                                    <a class="goodsStar fl" href="javascript:;"><img src="/client/images/content/start01.png" /></a>
                                </#list>
                            <#if 5-item.goodsStar gt 0>
                                <#list 1..(5-item.goodsStar) as whiteCount>
                                    <a class="goodsStar fl" href="javascript:;"><img src="/client/images/content/start03.png" /></a>
                                </#list>
                            </#if>
                             <#else>
                                <#list 1..5 as noUseCount>
                                    <a class="goodsStar fl" href="javascript:;"><img src="/client/images/content/start03.png" /></a>
                                </#list>
                             </#if>
                            </b>
                            <p>
                                <a href="#" title="">${item.tags!''}</a>
                            </p>
                            <span>${content!''}</span>
                        </div>
                        <div class="c_R_comment_con_R_info_M">
                            <p>颜色：白</p>
                            <p>规格：移动联通双4G(16GB ROM)</p>
                        </div>
                        <div class="c_R_comment_con_R_info_R">${item.commentTime}</div>
                    </div>
                    
                    <div class="c_R_comment_con_R_reply">
                        <a href="#" title="">有用（${item.positiveNumber!'0'}）</a>
                        <a href="#" title="">回复（${item.negativeNumber!'0'}）</a>
                    </div>
                    
                    <!--有图片的-->
                    <div class="c_R_comment_con_R_pic">
                        <ul>
                            <li><img src="/client/images/pic2.png" /></li>
                            <li><img src="/client/images/pic2.png" /></li>
                            <li><img src="/client/images/pic2.png" /></li>
                            <li><img src="/client/images/pic2.png" /></li>
                            <li><img src="/client/images/pic2.png" /></li>
                        </ul>
                    </div>
                    
                    <!--回复
                    <div class="c_R_comment_con_R_reply1">
                        <input type="text" />
                        <a href="#" title="">回 复</a>
                    </div>
                    -->
                    <!--已回复的-->
                    <#if item.isReplied>
                    <div class="c_R_comment_con_R_reply2">
                        <span>店家回复：${item.reply}</span>
                    </div>
                    </#if>
                    
                </div>
             </div>
           </#list>
             </#if>
         <div class="pagebox" style="float:left; padding:15px 0;">
          <div class="num">
            <#if comment_page??>
                <#assign continueEnter=false>
                <#if comment_page.number == 0>
                   <a class="a1 a0" href="javascript:;"><span>上一页</span></a>
                 <#else>
                   <a class="a2" href="#"><span>上一页</span></a>
                </#if>
                <#if comment_page.totalPages gt 0>
                    <#list 1..comment_page.totalPages as page>
                         <#if page <= 3 || (comment_page.totalPages-page) < 3 || (comment_page.number+1-page)?abs<3 >
                             <#if page == comment_page.number+1>
                                 <a class="sel" href="javascript:;">${page}</a>
                             <#else>
                                 <a href="#">${page}</a> <#-- ${page} -->
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
                        <a class="a2 a0" href="javascript:;"><span>下一页</span></a>
                    <#else>
                        <a class="a2" href=""><span>下一页</span></a>
                    </#if>
                </#if>
            <span> 共<b>${comment_page.totalPages}</b>页 </span>
          </div>
          <div class="page">
            <input class="sub" type="submit" value="确定" onclick="javascript:btnPageSubmit();" style=" *+border:none;" />
            <span>页</span>
            <input class="text" type="text" value="${comment_page.number}" id="iPageNum"/>
            <span>到第</span>
          </div>
          <div class="clear"></div>
        </div>
    
    
      </div>