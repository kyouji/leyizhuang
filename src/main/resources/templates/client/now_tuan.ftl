
    <p class="fz_24 fw_700 wh_group">正在团购</p>
    <#if tuan_goods_page??>
        <ul>
            <#list tuan_goods_page.content as item>
                <li>
                    <a href="#"><img width="220px; height="220px;" src="${item.groupSaleImage!''}" /></a>
                    <div id="tuan_time${item_index}" class="time_left">
                    </div>
                    <script type="text/javascript">
                            $(document).ready(function(){
                                setInterval("tuanTimer${item_index}()",1000);
                            });
                            
                            function tuanTimer${item_index}(){
                                    var ts = (new Date(${item.groupSaleStopTime?string("yyyy")}, 
                                    parseInt(${item.groupSaleStopTime?string("MM")}, 10)-1, 
                                    ${item.groupSaleStopTime?string("dd")}, 
                                    ${item.groupSaleStopTime?string("HH")}, 
                                    ${item.groupSaleStopTime?string("mm")}, 
                                    ${item.groupSaleStopTime?string("ss")})) - (new Date());
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
                                    $("#tuan_time${item_index}").html("剩余时间：<span>"
                                    + dd + "</span>天<span>"
                                    + hh + "</span>时<span>"
                                    + mm + "</span>分<span>"
                                    + ss + "</span>秒");
                                }
                        </script>
                    <div class="price">
                        <a href="#" class="fz_14 trait">${item.title!''}</a>
                        <p>
                            <b class="fz_18">￥<span>${item.groupSalePrice}</span></b>
                            <del>￥<span>${item.salePrice}</span></del>
                        </p>
                        <input type="submit" value="立即团购" />
                    </div>
                </li>
            </#list>
        </ul>
    </#if>
    <!--分页-->
    <div class="pagebox">
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
            <input class="sub" type="submit" value="确定" style=" *+border:none;" />
            <span>页</span>
            <input class="text" type="text" value="1" />
            <span>到第</span>
        </div>
        <div class="clear"></div>
    </div> 
