<p class="fz_24 fw_700 td_group">即将开团</p>
<#if going_goods_page??>
    <div class="today_photo">
        <ul>
            <#list going_goods_page.content as item>
                <li style="position:relative">
                    <a href="#" class="iphone6_1"><img width="188" height="188" src="${item.groupSaleImage!''}" /></a>
                    <div class="percentage">
                        <span>${((1-item.groupSalePrice/item.salePrice)*100)?string("0")}</span>%<br />
                        <span>off</span>
                    </div>
                    <a href="#" class="fz_14 trait">${item.title!''}</a>
                    <a href="#" id="going_goods${item_index}" class="fz_14 time_live"></a>
                    <script type="text/javascript">
                        $(document).ready(function(){
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
                                $("#going_goods${item_index}").html("<span>"
                                + dd + "</span>天<span>"
                                + hh + "</span>时<span>"
                                + mm + "</span>分<span>"
                                + ss + "</span>秒后开团");
                            }
                    </script>
                    <div class="snapped_up">
                        <input class="right" type="submit" value="团购" />
                        <b class="right">￥<span>${item.groupSalePrice}</span></b>
                    </div>
                </li>
            </#list>
        </ul>
        <!--前进后退箭头-->
        <a href="javascript:;" class="pre_1"></a>
        <a href="javascript:;" class="next_1"></a>
    </div>
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
