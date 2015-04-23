<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>荣诚手机超市</title>
<meta name="keywords" content="荣诚手机超市" />
<meta name="description" content="荣诚手机超市" />
<meta name="copyright" content="荣诚手机超市 版权所有" />
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/rcindex.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/Tm/js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/Tm/js/common/nav.js"></script>
<script type="text/javascript" src="/Tm/js/common/head.js"></script>
<script type="text/javascript" src="/Tm/js/front/index.js"></script>
</head>
<body>
<#include "/front/common/head.ftl" />
<#include "/front/common/nav.ftl" />

<div class="main mt10 rc_ppfl">
<span class="fll">品牌分类：</span>
<ul>
<#if recommend_brand_list??>
<#list recommend_brand_list as brand>
    <#if brand_index < 9>
        <li><a href="/list/${phone_type.id}-${brand_index+1}"><img src="${brand.logoUri}" width="90" height="45"></a></li>
    </#if>
</#list>
</#if>
</ul>
<a href="#">更多>></a>
</div>

<div class="clear h10"></div>

<div class="banner">
    <#if banner_ad??>
        <a href="${banner_ad.destinationUri}" title="${banner_ad.name}" style="background:url(${banner_ad.imageUri}) center no-repeat;"></a>
    </#if>
</div>

<div class="main mt20">
<div class="floor"><span>1F-限时抢购</span></div>
<div class="floor_1 mt10">
<table>
<tr>
<#if flash_sale_product_list??>
    <#list flash_sale_product_list as product>
        <td class="fubox">
            <div class="daojishi">
                <span id="clock"></span><a href="/product/${product.id}">立即抢购</a>
            </div>
            <div class="fupic">
                <a href="/product/${product.id}"><img src="${product.coverImageUri}" width="360" height="326"></a>
            </div>
            <div class="fuzi">
                <a href="/product/${product.id}">
                    <h2>${product.name}</h2>
                    <h3>${product.brief}</h3>
                    <h4>${product.flashSalePrice?string("#.##")}元<span>原价：${product.versionList[0].salePrice?string("#.##")}元</span></h4>
                </a>
            </div>
        </td>
    </#list>
</#if>
</tr>
</table>
</div>
</div>


<div class="main mt20">
<div class="floor"><span>2F-明星产品</span></div>
<div class="floor_1 mt10">
<table>
<tr>
<#if star_product_list??>
    <#list star_product_list as product>
        <#if product_index < 2>
            <td class="fubox">
                <div class="fupic">
                    <a href="/product/${product.id}"><img src="${product.coverImageUri}" width="360" height="326"></a>
                </div>
                <div class="fuzi">
                    <a href="/product/${product.id}">
                        <h2>${product.name}</h2>
                        <h3>${product.brief}</h3>
                        <h4>${product.versionList[0].salePrice?string("#.##")}元</h4>
                    </a>
                </div>
            </td>
        </#if>
    </#list>
</#if>
</tr>
</table>
</div>

<div class="floor_1_1">
<table>
<tr>
<#if star_product_list??>
    <#list star_product_list as product>
        <#if product_index gt 1 && product_index lt 6 >
            <td>
                <a href="/product/${product.id}">
                    <p>${product.name}<br />${product.brief}<br />抢购价：￥${product.versionList[0].salePrice?string("#.##")}</p>
                    <img src="${product.coverImageUri}" width="296" height="296">
                </a>
            </td>
        </#if>
    </#list>
</#if>
</tr>
</table>
</div>
</div>

<div class="main mt20">
    <div class="floor"><span>3F-手机产品</span></div>
    <div class="floor_2 mt10">
        <ul>
            <li><a href="#" class="floor_2xz">手机大全</a></li>
            <li><a href="#">平板电脑</a></li>
        </ul>
    </div>
    
    <div class="floor_2_1 mt10">
        <div class="fll floor_2_2">
            <#if phone_left_ad??>
                <a href="${phone_left_ad.destinationUri}"><img src="${phone_left_ad.imageUri}" width="210" height="461"></a>
            </#if>
        </div>
        
        <div class="fll floor_2_3">
            <ul>
                <#if phone_ad_list??>
                    <#list phone_ad_list as ad>
                        <li><a href="${ad.destinationUri}"><img src="${ad.imageUri}" width="346" height="230"></a></li>
                    </#list>
                </#if>
            </ul>
        </div>
        <div class="flr floor_2_4">
            <div class="floor_2_4_a"><span>TOP销售排行榜</span></div>
            <div class="floor_2_4_b">
                <ul>
                    <#if phone_hot_product_list??>
                        <#list phone_hot_product_list as product>
                            <li>
                                <span class="tophong">${product_index+1}</span>
                                <span class="topjieshao">
                                    <p>${product.name} ${product.brief}</p>
                                    <p>￥${product.versionList[0].salePrice?string("#.##")}</p>
                                </span>
                                <a href="/product/${product.id}"><img src="${product.coverImageUri}" width="78" height="78"></a>
                            </li>
                        </#list>
                    </#if>
                </ul>
            </div>
        </div>
    </div>
    <div class="floor_2_1 mt10">
        <div class="fll floor_2_2">
            <#if pad_left_ad??>
                <a href="${pad_left_ad.destinationUri}"><img src="${pad_left_ad.imageUri}" width="210" height="461"></a>
            </#if>
        </div>
        
        <div class="fll floor_2_3">
            <ul>
                <#if pad_ad_list??>
                    <#list pad_ad_list as ad>
                        <li><a href="${ad.destinationUri}"><img src="${ad.imageUri}" width="346" height="230"></a></li>
                    </#list>
                </#if>
            </ul>
        </div>
        <div class="flr floor_2_4">
            <div class="floor_2_4_a"><span>TOP销售排行榜</span></div>
            <div class="floor_2_4_b">
                <ul>
                    <#if pad_hot_product_list??>
                        <#list pad_hot_product_list as product>
                            <li>
                                <span class="tophong">${product_index+1}</span>
                                <span class="topjieshao">
                                    <p>${product.name} ${product.brief}</p>
                                    <p>￥${product.versionList[0].salePrice?string("#.##")}</p>
                                </span>
                                <a href="/product/${product.id}"><img src="${product.coverImageUri}" width="78" height="78"></a>
                            </li>
                        </#list>
                    </#if>
                </ul>
            </div>
        </div>
    </div>
</div>


<div class="clear"></div>

<div class="main mt20">
<div class="floor"><span>4F-手机配件</span></div>
<div class="floor_3 mt10">

<div class="floor_3_1">
    <#if accessory_left_ad??>
        <a href="${accessory_left_ad.destinationUri}"><img src="${accessory_left_ad.imageUri}" width="208" height="320"></a>
    </#if>
    <div class="floor_3_1_a">
        <span>手机配件：</span>
        <a href="#">蓝牙耳机</a>
        <a href="#">移动电源</a>
        <a href="#">充电器</a>
        <a href="#">数据线手机</a>
        <a href="#">电池</a>
        <a href="#">手机贴膜</a>
        <a href="#">存储卡</a>
        <a href="#">保护套</a>
        <a href="#">车载iPhone配件</a>
        <a href="#">创意配件</a>
        <a href="#">音箱手机饰品</a>
    </div>
</div>

<div class="floor_3_2 flr">
<table>
<tr>
<#if accessory_big_ad_list??>
    <#list accessory_big_ad_list as ad>
        <#if ad_index lt 5>
            <td><a href="${ad.destinationUri}"><img src="${ad.imageUri}" width="195" height="317"></a></td>
        </#if>
    </#list>
</#if>
</tr>
</table>
</div>

<div class="floor_3_3 flr">
<table>
<tr>
<#if accessory_big_ad_list??>
    <#list accessory_small_ad_list as ad>
        <#if ad_index lt 5>
            <td><a href="${ad.destinationUri}"><img src="${ad.imageUri}" width="195" height="136"></a></td>
        </#if>
    </#list>
</#if>
</tr>
</table>
</div>

</div>
<div class="floor_3_4">
<div class="floor_3_4_1">
<ul>
<#if recommend_type_list??>
    <#list recommend_type_list as rtype>
        <#if rtype_index == 0>
            <li class="floor_3_4_1_a">
                <a href="/list/${rtype.id}" class="floor_3_4_1_axz">${rtype.name}</a>
            </li>
        <#elseif rtype_index < 6>
            <li class="floor_3_4_1_a">
                <a href="/list/${rtype.id}">${rtype.name}</a>
            </li>
        </#if>
    </#list>
</#if>
</ul>
</div>
<div class="floor_3_4_2">
    <ul style="display:block;">
        <#if recommed_type_product_list0??>
            <#list recommed_type_product_list0 as product>
                <li>
                    <a href="/product/${product.id}">
                        <img src="${product.coverImageUri}" width="122" height="122">
                        <p>${product.name}</p>
                        <p class="orange">￥${product.priceMinimum?string("#.##")}</p>
                    </a>
                </li>
            </#list>
        </#if>
    </ul>
    <ul style="display:none;">
        <#if recommed_type_product_list1??>
            <#list recommed_type_product_list1 as product>
                <li>
                    <a href="/product/${product.id}">
                        <img src="${product.coverImageUri}" width="122" height="122">
                        <p>${product.name}</p>
                        <p class="orange">￥${product.priceMinimum?string("#.##")}</p>
                    </a>
                </li>
            </#list>
        </#if>
    </ul>
    <ul style="display:none;">
        <#if recommed_type_product_list2??>
            <#list recommed_type_product_list2 as product>
                <li>
                    <a href="/product/${product.id}">
                        <img src="${product.coverImageUri}" width="122" height="122">
                        <p>${product.name}</p>
                        <p class="orange">￥${product.priceMinimum?string("#.##")}</p>
                    </a>
                </li>
            </#list>
        </#if>
    </ul>
    <ul style="display:none;">
        <#if recommed_type_product_list3??>
            <#list recommed_type_product_list3 as product>
                <li>
                    <a href="/product/${product.id}">
                        <img src="${product.coverImageUri}" width="122" height="122">
                        <p>${product.name}</p>
                        <p class="orange">￥${product.priceMinimum?string("#.##")}</p>
                    </a>
                </li>
            </#list>
        </#if>
    </ul>
    <ul style="display:none;">
        <#if recommed_type_product_list4??>
            <#list recommed_type_product_list4 as product>
                <li>
                    <a href="/product/${product.id}">
                        <img src="${product.coverImageUri}" width="122" height="122">
                        <p>${product.name}</p>
                        <p class="orange">￥${product.priceMinimum?string("#.##")}</p>
                    </a>
                </li>
            </#list>
        </#if>
    </ul>
    <ul style="display:none;">
        <#if recommed_type_product_list5??>
            <#list recommed_type_product_list5 as product>
                <li>
                    <a href="/product/${product.id}">
                        <img src="${product.coverImageUri}" width="122" height="122">
                        <p>${product.name}</p>
                        <p class="orange">￥${product.priceMinimum?string("#.##")}</p>
                    </a>
                </li>
            </#list>
        </#if>
    </ul>
</div>
</div>
</div>

<div class="main mt20 phonenumber">
<div class="phonenumber_1"><a href="<#if phone_number_type??>/list/${phone_number_type.id}<#else>javascrip:;</#if>">查看更多>></a></div>
<div class="phonenumber_2 fll">
<table>
<tr>
<#if phone_number_list??>
    <#list phone_number_list as product>
        <#if product_index < 5>
            <td>
                <a href="/product/${product.id}">
                    <p class="phonenumber_2_a">${product.name}</p>
                    <p class="phonenumber_2_b">卡费：${product.versionList[0].salePrice?string("#.##")}元  话费：<#if product.versionList[0].includePrice??>${product.versionList[0].includePrice?string("#.##")}</#if>元</p>
                </a>
            </td>
        </#if>
    </#list>
</#if>
</tr>
<tr>
<#if phone_number_list??>
    <#list phone_number_list as product>
        <#if product_index gt 4 && product_index < 10 >
            <td>
                <a href="/product/${product.id}">
                    <p class="phonenumber_2_a">${product.name}</p>
                    <p class="phonenumber_2_b">卡费：${product.versionList[0].salePrice?string("#.##")}元  话费：${product.versionList[0].includePrice?string("#.##")}元</p><
                /a>
            </td>
        </#if>
    </#list>
</#if></tr>
</table>
</div>
</div>

<div class="clear"></div>

<div class="main mt20"><div class="newszx">
<table>
<tr>
<td>
<span>手机资讯</span>
<ul>
    <#if phone_news_list??>
        <#list phone_news_list as news>
            <li><a href="/news/content/${news.id}">${news.title}</a></li>
        </#list>
        <li style="background:none;"><a href="/news/0">更多>></a></li>
    </#if>
</ul>
</td>
<td>
<span>手机发烧友</span>
<ul>
    <#if phone_lover_list??>
        <#list phone_lover_list as news>
            <li><a href="/news/content/${news.id}">${news.title}</a></li>
        </#list>
        <li style="background:none;"><a href="/news/1">更多>></a></li>
    </#if>
</ul>
</td>
<td>
<span>新闻视频</span>
<ul>
    <#if news_video_list??>
        <#list news_video_list as news>
            <li><a href="/news/content/${news.id}">${news.title}</a></li>
        </#list>
        <li style="background:none;"><a href="/news/2">更多>></a></li>
    </#if>
</ul>
</td>
</tr>
</table>
</div>
</div>

<div class="clear"></div>

<#include "/front/common/tail.ftl" />

<script>
    function displayTime(){
        var elt = document.getElementById("clock");
        if(leftTime<0){
            elt.innerHTML = "Over";
        }
        else{
            //结束时间，需自定义 懒人建站 http://www.51xuediannao.com 
            var endTime = new Date("2018/07/8 18:45:13");
            var now = new Date();
            var leftTime = endTime.getTime() -now.getTime();
            var ms = parseInt(leftTime%1000).toString();
            leftTime = parseInt(leftTime/1000);
            var o = Math.floor(leftTime / 3600);
            var d = Math.floor(o/24);
            var m = Math.floor(leftTime/60%60);
            var s = leftTime%60;
            elt.innerHTML = o + "小时:" + m + "分:" + s + "秒:" + ms.charAt(0);
            setTimeout(displayTime,100);
        }
    }
    displayTime();
</script>
</body>
</html>
