<#if user_collection??>
    <div class="scrollBox" style="margin:0 auto">
        <div class="ohbox">
            <ul class="piclist">
                <#list user_collection as item>
                    <li><a href="/goods/${item.goodsId!'0'}" target="_blank"><img src="${item.goodsCoverImageUri!''}" width="185px" height="185px" /><span>${item.goodsTitle!''}</span><p>￥${item.goodsSalePrice?string("0.00")}</p></a></li>
                </#list>
            </ul>
        </div>
        <div class="pageBtn">
            <span class="prev">&lt;</span>
            <span class="next">&gt;</span>
            <ul class="list">
            <#if user_collection?size%3==0>
                <#assign totalPage=(user_collection?size/3)>
            <#else>
                <#assign totalPage=(user_collection?size/3+1)>
            </#if>
            <#list 1..totalPage as item>
                <li>${item-1}</li>
            </#list>
            </ul>
        </div>
    </div>
    <script type="text/javascript">jQuery(".scrollBox").slide({ titCell:".list li", mainCell:".piclist", effect:"left",vis:3,scroll:3,delayTime:800,trigger:"click",easing:"easeOutCirc"});</script>
</#if>