<menu class="myscore_tit">
    <h3 class="fw400 fs20 fc">我的积分 <span class="fs12 c7 ml20">可用积分${user.totalPoints!'0'}个</span></h3>
    <nav>
        <a <#if status==0>class="sel"</#if> href="javascript:changePoint(0,${pageId},null)">明细</a>
        <a <#if status==1>class="sel"</#if> href="javascript:changePoint(1,${pageId},null)">收入</a>
        <a <#if status==2>class="sel"</#if> href="javascript:changePoint(2,${pageId},null)">支出</a>
    </nav>
</menu>
<#if point_page??> 
        <table class="myscore_tab">
            <tr>
                <th>日期</th>
                <th>收入/支出</th>
                <th>详细说明</th>
            </tr>
            <#list point_page.content as item>
                <#if item.point??&&item.point!=0>
                    <tr>
                        <td><#if item.pointTime??>${item.pointTime?string("yyyy-MM-dd HH:mm:ss")}</#if></td>
                        <td>${item.point!'0'}</td>
                        <td>${item.detail!''}</td>
                    </tr>
                </#if>
            </#list>
        </table>
    </#if>
    <div class="pagebox">
        <div class="num">
            <#if point_page??>
                <#assign continueEnter=false>
                <#if point_page.number+1 == 1>
                    <a class="a1 a0" href="javascript:;"><span>上一页</span></a>
                <#else>
                    <a class="a1 a0" href="javascript:changePoint(${status},${pageId-1});;"><span>上一页</span></a>
                </#if>
                    
                <#if point_page.totalPages gt 0>
                    <#list 1..point_page.totalPages as page>
                        <#if page <= 3 || (order_page.totalPages-page) < 3 || (point_page.number+1-page)?abs<3 >
                            <#if page == point_page.number+1>
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
                <#if point_page.number+1 == point_page.totalPages || point_page.totalPages==0>
                    <a class="a2 a0" href="javascript:;"><span>下一页</span></a>
                <#else>
                    <a class="a2" href="javascript:changePoint(${status},${pageId+1});"><span>下一页</span></a>
                </#if>
            </#if>
            <span> 共<b>${point_page.totalPages}</b>页 </span>
        </div>
        <div class="page">
            <input class="sub" id="page_ensure" type="button" onclick="javascript:changePoint(${status},null,true);" value="确定" />
            <span>页</span>
            <input class="text" type="text" value="<#if pageId??>${pageId + 1}</#if>" id="iPageNum"/>
            <span>到第</span>
        </div>
        <div class="clear"></div>
    </div>
    <div class="clear h20"></div>
</div><!--mymember_info END-->