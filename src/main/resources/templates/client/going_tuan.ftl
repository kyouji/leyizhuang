<#if going_goods_page??>
    <p class="fz_24 fw_700 td_group">即将开团</p>
    <div class="scrollBox today_photo" style="margin:0 auto">
            <div class="ohbox">
                <ul class="piclist">
                    <#list going_goods_page as item>
                        <li>
                            <a href="#" class="iphone6_1"><img src="${item.groupSaleImage!''}" /></a>
                            <div class="percentage">
                                <span>${((1-item.groupSalePrice/item.salePrice)*100)?string("0")}</span>%<br />
                                <span>off</span>
                            </div>
                            <div class="timing" id="going_goods${item_index}"></div>
                            <script type="text/javascript">
                            $(document).ready(function(){
                                goingTimer${item_index}();
                                setInterval("goingTimer${item_index}()",1000);
                            });
                            
                            function goingTimer${item_index}(){
                                    var ts = (new Date(${item.groupSaleStartTime?string("yyyy")}, 
                                    parseInt(${item.groupSaleStartTime?string("MM")}, 10)-1, 
                                    ${item.groupSaleStartTime?string("dd")}, 
                                    ${item.groupSaleStartTime?string("HH")}, 
                                    ${item.groupSaleStartTime?string("mm")}, 
                                    ${item.groupSaleStartTime?string("ss")})) - (new Date());
                                    if (0 == ts)
                                    {
                                        window.location.reload();
                                    }
        
                                    var date = new Date();
                                    var dd = parseInt(ts / 1000 / 60 / 60 / 24, 10);
                                    var hh = parseInt(ts / 1000 / 60 / 60 % 24, 10);
                                    var mm = parseInt(ts / 1000 / 60 % 60, 10);
                                    var ss = parseInt(ts / 1000 % 60, 10);
                                    dd = checkTime(dd);
                                    hh = checkTime(hh);
                                    mm = checkTime(mm);
                                    ss = checkTime(ss);
                                    $("#going_goods${item_index}").html("距开团还有：<span>"
                                    + dd + "</span>天<span>"
                                    + hh + "</span>时<span>"
                                    + mm + "</span>分<span>"
                                    + ss + "</span>秒");
                                }
                            </script>
                            <div></div>
                            <a href="#" class="fz_14 trait">${item.title!''}</a>
                            <div class="snapped_up">
                                <input class="right" type="submit" value="团购" />
                                <b class="right">￥<span>${item.groupSalePrice?string("0.00")}</span></b>
                            </div>
                        </li>
                    </#list>
                </ul>
            </div>
            <div class="pageBtn">
                <span class="prev">&lt;</span>
                <span class="next">&gt;</span>
                <#assign totalPage=(going_goods_page?size/5+1)>
                <ul class="list">
                    <#list 1..totalPage as item>
                        <li>${item-1}</li>
                    </#list>
                </ul>
            </div>
            <input type="hidden" value="${going_goods_page?size%5}">
            <input type="hidden" value="${totalPage}">
    </div>
    <script type="text/javascript">jQuery(".scrollBox").slide({ titCell:".list li", mainCell:".piclist", effect:"left",vis:5,scroll:5,delayTime:800,trigger:"click",easing:"easeOutCirc"});</script>
</#if>































    <#if service_item_list??>
        <ol>
            <#list service_item_list as item>
                <#if item_index lt 4>
                    <li>
                        <div><img src="${item.logo!''}" /></div>
                        <p class="fz_14">${item.title!''}</p>
                    </li>
                    <li>
                        <b><img src="/client/images/i_line_1.png" /></b>
                    </li>
                </#if>
                <#if item_index == 5>
                    <li>
                        <div><img src="${item.logo!''}" /></div>
                        <p class="fz_14">${item.title!''}</p>
                    </li>
                </#if>
            </#list>
        </ol>
    </#if>
