<div id="comment-list"> 
    <div class="c_R_comment top20">
        <div class="c_R_comment_title">
            <a href="#" title="" class="c_R_comment_title_choiced">全部评价（60）</a>
            <a href="#" title="">好评（60）</a>
            <a href="#" title="">中评（60）</a>
            <a href="#" title="">差评（60）</a>
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
    <div class="pagebox" style="float:left; padding:15px 0;">
      <div class="num">
        <a class="a1 a0" href="#"><span>上一页</span></a>
        <a class="sel" href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <span> ... </span>
        <a href="#">45</a>
        <a class="a2" href="#"><span>下一页</span></a>
        <span> 共<b>45</b>页 </span>
      </div>
      <div class="page">
        <input class="sub" type="submit" value="确定" style=" *+border:none;">
        <span>页</span>
        <input class="text" type="text" value="1">
        <span>到第</span>
      </div>
      <div class="clear"></div>
    </div>  
</div> 