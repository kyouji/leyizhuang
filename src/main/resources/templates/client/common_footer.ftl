
<div class="down1">
    <section class="index_center">
      <table>
        <tr>
          <td>
            <a href="#"><img src="/client/images/hzd_36.png" />正品保障<br>正品保障，提供发票</a>
          </td>
          <td>
            <a href="#"><img src="/client/images/hzd_39.png" />极速物流<br>极速物流，极速达人</a>
          </td>
          <td>
            <a href="#"><img src="/client/images/hzd_42.png" />售后无忧<br>15天无理由退换货</a>
          </td>
          <td>
            <a href="#"><img src="/client/images/hzd_45.png" />特色服务<br>自主维修保养预约</a>
          </td>
        </tr>
      </table>
    </section><!--index_center END-->
    <div class="clear"></div>
    <div class="main">
        <ul>
            <li class="downli"><a href="#">购物指南</a>
                <ul>
                    <li><a href="#">购物流程</a></li>
                    <li><a href="#">发票制度</a></li>
                    <li><a href="#">账户管理</a></li>
                    <li><a href="#">会员优惠</a></li>
                </ul>
            </li>
            <li class="downli"><a href="#">支付方式</a>
                <ul>
                    <li><a href="#">订单配送查询</a></li>
                    <li><a href="#">订单状态说明</a></li>
                    <li><a href="#">自助取消订单</a></li>
                    <li><a href="#">自助修改订单</a></li>
                </ul>
            </li>
            <li class="downli"><a href="#">订单服务</a>
                <ul>
                    <li><a href="#">配送范围及免邮标准</a></li>
                    <li><a href="#">当日递/次日达</a></li>
                    <li><a href="#">订单自提</a></li>
                    <li><a href="#">验货与签收</a></li>
                </ul>
            </li>
            <li class="downli"><a href="#">配送方式</a>
                <ul>
                    <li><a href="#">货到付款</a></li>
                    <li><a href="#">网上支付</a></li>
                    <li><a href="#">礼品卡支付</a></li>
                    <li><a href="#">银行转账</a></li>
                </ul>
            </li>
            <li class="downli"><a href="#">退换货</a>
                <ul>
                    <li><a href="#">货到付款</a></li>
                    <li><a href="#">网上支付</a></li>
                    <li><a href="#">礼品卡支付</a></li>
                    <li><a href="#">银行转账</a></li>
                </ul>
            </li>
            <li class="downli"><a href="#">商家服务</a>
                <ul>
                    <li><a href="#">货到付款</a></li>
                    <li><a href="#">网上支付</a></li>
                    <li><a href="#">礼品卡支付</a></li>
                    <li><a href="#">银行转账</a></li>
                </ul>
            </li>
    
        </ul>
    </div>
</div>
<div class="down2">
    <div class=" erweima main">
        <div class="saoyisao">
            <img src="/client/images/hzd_55.png" />
            <h3><a href="#">安卓客户端</a></h3> 
        </div>
        <div class="saoyisao">
            <img src="/client/images/hzd_55.png" />
            <h3><a href="#">安卓客户端</a></h3> 
        </div>
        <div class="saoyisao">
            <img src="/client/images/hzd_55.png" />
            <h3><a href="#">安卓客户端</a></h3> 
        </div>
        <div class="saoyisao">
            <img src="/client/images/hzd_55.png" />
            <h3><a href="#">安卓客户端</a></h3> 
        </div>
        <div class="mendian">
            <img src="/client/images/hzd_52.png" />
            <h3><a href="#">点击查询</a></h3>
        </div>
        <div class="dizhi">
            <p>
                <span>红河蒙自店</span><br>
                <span>地址：</span>蒙自市XX街道XX大楼CX号<br>
                <span>电话：</span>0871-564531245<br>
            </p>
        </div>
    </div>
</div>
<div class="down3">
    <div class="main">
          <ul class="downwenzi">
          <li><a href="#">公司简介</a>丨</li>
          <li><a href="#">联系我们</a>丨</li>
          <li><a href="#">招贤纳士</a>丨</li>
          <li><a href="#">合作伙伴</a>丨</li>
          <li><a href="#">广告合作</a></li>
          </ul>
        <div class="clear"></div>
        版权所有2015 办公狗网上商城 保留所有权利 <br>
        Copyright ©  2015 bangonggou.com.cn All Rights Reserved <a style="color:#FFF" href="#">滇ICP备2-20140075</a>
              <span class="flr"><a title="云南网站建设" href="http://www.ynyes.com" target="_blank">网站建设</a>技术支持：<a title="云南网站建设" href="http://www.ynyes.com" target="_blank">昆明天度网络公司</a></span>
    </div>
</div>


<#--
<footer>
    <div id="main">
        <div class="hot_line fl mt20">
            <ul>
                <li style="font-size:20px; color:#999; padding-left:40px;">${site.telephone!'400-739-1200'}</li>
                <li style="padding-left:40px; line-height:25px; font-size:13px; color:#999">博大生活网客服热线</br>周一至周日：08:00-20:00</li>
            </ul>
            <#if help_level0_cat_list??>
                <#list help_level0_cat_list as item>
                    <ul class="pizz fl <#if item_index != 0>ml90</#if>">
                        <h5>${item.title!''}</h5>
                        <#if item_index==0>
                            <#if help_0_cat_list??>
                                <#list help_0_cat_list as item>
                                    <#if item_index<5>
                                    <li><a href="/info/list/${help_id!''}?catId=${item.id}">${item.title!''}</a></li>
                                    </#if>
                                </#list>
                            </#if>
                        <#elseif item_index==1>
                            <#if help_1_cat_list??>
                                <#list help_1_cat_list as item>
                                    <#if item_index<5>
                                    <li><a href="/info/list/${help_id!''}?catId=${item.id}">${item.title!''}</a></li>
                                    </#if>
                                </#list>
                            </#if>
                        <#elseif item_index==2>
                            <#if help_2_cat_list??>
                                <#list help_2_cat_list as item>
                                    <#if item_index<5>
                                    <li><a href="/info/list/${help_id!''}?catId=${item.id}">${item.title!''}</a></li>
                                    </#if>
                                </#list>
                            </#if>
                        <#elseif item_index==3>
                            <#if help_3_cat_list??>
                                <#list help_3_cat_list as item>
                                    <#if item_index<5>
                                    <li><a href="/info/list/${help_id!''}?catId=${item.id}">${item.title!''}</a></li>
                                    </#if>
                                </#list>
                            </#if>
                        </#if>
                    </ul>
                </#list>
            </#if>
        </div>
        
        <div class="wx fr mt20">
            <span>
                <h5>博大生活微信</h5>
                <img src="<#if site??>${site.wxQrCode!''}</#if>" width="115" height="115">
             </span>
            <span>
                <h5>iPhone客户端</h5>
                <img src="<#if site??>${site.iOsQrCode!''}</#if>" width="115" height="115">
             </span>
            <span>
                <h5>Android客户端</h5>
                <img src="<#if site??>${site.androidQrCode!''}</#if>" width="115" height="115">
             </span>
        </div>
        
        <div class="link fl mt20">
            友情链接：
            <#if site_link_list??>
                <#list site_link_list as item>
                    <a href="${item.linkUri!''}">${item.title!''}</a>
                </#list>
            </#if>
        <b></b>
        </div>
        
        <div class="foot fl mt20">${site.copyright!''} 网站建设技术支持：<a href="http://www.ynyes.com">昆明天度网络公司</a></div>
    </div>
</footer>
-->