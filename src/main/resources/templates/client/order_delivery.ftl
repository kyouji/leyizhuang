<!DOCTYPE html>
<html lang="zh-CN" class="bgc-f3f4f6">
    <head>
        <meta charset="UTF-8">
        <meta name="keywords" content="">
        <meta name="copyright" content="" />
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        <title>乐易装</title>
        <!-- css -->
        <link rel="stylesheet" type="text/css" href="/client/css/my_base.css"/>
        <link rel="stylesheet" type="text/css" href="/client/css/x_common.css"/>
        <link rel="stylesheet" type="text/css" href="/client/css/x_order_manage.css"/>
        <link rel="stylesheet" type="text/css" href="/client/css/x_my_wealth.css"/>
        <!-- js -->
        <script type="text/javascript" src="/client/js/jquery-1.11.0.js"></script>
        <script type="text/javascript" src="/client/js/order_delivery.js"></script>
    </head>
    <body class="bgc-f3f4f6">
        <#-- 引入警告提示样式 -->
        <#include "/client/common_warn.ftl">
        <#-- 引入等待提示样式 -->
        <#include "/client/common_wait.ftl">
        <!-- 头部 -->
        <header>
            <a class="back" href="/order"></a>
            <p>选择配送方式</p>
        </header>
        <!-- 头部 END -->
        
        <!-- 选择配送方式 -->
        <article class="delive-ways">
            <ul>
                <li id="delivery1" <#if deliveryId??&&deliveryId==0>class="active"</#if>><a>送货上门</a></li>
                <li id="delivery2" <#if deliveryId??&&deliveryId==1>class="active"</#if>><a>门店自提</a></li>
            </ul>   
            <!-- 配送方式 -->
            <!-- 送货上门 -->
            <article class="psfs">
                <div class="div11">
                    <label>配送时间</label>
                    <input type="date" id="theTime" onchange="changeTime();" min="${limitDay!''}"  value=${deliveryDate!''}>
                </div>
                <div class="div11">
                    <label>具体时间</label>
                    <a class="btn-select" id="btn_select">
                        <span class="cur-select">${deliveryDetail!''}</span>
                        <select>
                           <#list 9..18 as item>
                                <option <#if deliveryDetailId??&&deliveryDetailId==item>selected="selected"</#if> value="${item}">${item}:30-${item+1}:30</option>
                            </#list>
                        </select>
                    </a>
                </div>
            </article>
            <script>
            var $$ = function (id) {
                return document.getElementById(id);
            }
            window.onload = function () {
                var btnSelect = $$("btn_select");
                var curSelect = btnSelect.getElementsByTagName("span")[0];
                var oSelect = btnSelect.getElementsByTagName("select")[0];
                var aOption = btnSelect.getElementsByTagName("option");
                oSelect.onchange = function () {
                    var text=oSelect.options[oSelect.selectedIndex].text;
                    var itemId = oSelect.options[oSelect.selectedIndex].value;
                    $("#detailTime").val(itemId);
                    curSelect.innerHTML = text;
                }
            } 
            </script>
            <ol>
                <li <#if deliveryId??&&deliveryId==2>style="display:none"<#else>style="display:block"</#if>></li>
                <li <#if deliveryId??&&deliveryId==2>style="display:list-item"<#else>style="display:none"</#if>>
                    <div class="div11">
                    <label>门店选择</label>
                    <a class="target"><#if diySite??>${diySite.title!''}</#if></a>
                    </div>
                    <!-- 门店列表 -->
                    <#if diy_list??>
                        <article class="stores-select">
                            <#list diy_list as item>
                                <section>
                                    <img class="visi" src="/client/images/x_icon_checked.png" alt="">
                                    <div class="address">
                                        <div class="div1">${item.title!''}</div>
                                        <div class="div2">${item.address!''}</div>
                                    </div>
                                </section>
                            </#list>
                        </article>
                    </#if>
                </li>
            </ol>
            <!-- 配送方式 END -->
            <script type="text/javascript">
            $('ul').on('click','a',function(){
                var $self = $(this);//当前a标签
                var $active = $self.closest('li');//当前点击li
                var theId = $active.attr("id").replace("delivery","");
                $("#type").val(theId);
                var index = $active.prevAll('li').length;//当前索引
            
                $active.addClass('active').siblings('li').removeClass('active');
                $('ol').find('>li')[index==-1?'show':'hide']().eq(index).show();
            });
            </script>
        </article>
        <!-- 选择配送方式 END -->
        <#-- 以下放置几个隐藏标签用于存储配送信息 -->
        <#-- 配送方式 -->
        <input type="hidden" id="type" value="${deliveryId!''}">
        <#-- 配送日期 -->
        <input type="hidden" id="date" value="${deliveryDate!''}">
        <#-- 配送具体时间 -->
        <input type="hidden" id="detailTime" value="${deliveryDetailId!''}">
        <#-- 配送门店id -->
        <input type="hidden" id="diySite" value="${diySiteId!''}">
        <#-- 最小日期 -->
        <input type="hidden" id="limitDay" value="${limitDay!''}">
        <#-- 最小时间端id -->
        <input type="hidden" id="limitId" value="${limitHour!''}">
        <#-- 最小时间文字说明 -->
        <input type="hidden" id="limitTime" value="${earlyDate!''}">
        <a class="btn-next" href="javascript:submit();">确定</a>
    </body>
</html>