<header>
    <div id="main">
      <div class="top1">
            <span class="welcome">
                Hi,欢迎来到博大生活网！
                <#if username??>
                    <a href="/user" class="login">${username}
                        <dd class="vip" title="铁牌会员"></dd>
                    </a>
                    <a href="/logout">退出</a>
                <#else>
                    <a href="/login" class="login">登录</a> <a href="/reg" class="register">免费注册</a>
                </#if>
                <#-- 配送：<dt>云南<b></b></dt> -->
            </span>
            <ul class="fright">
              <li><a href="/user/order/list/0" style="padding-left:25px;">我的订单</a></li>
              <li><a href="#" style="padding-left:35px;">在线客服</a></li>
              <li><a href="#" style="padding-left:25px;">手机博大</a></li>
              <li style=" font-size:16px; font-weight:bold; color:#da090b; padding-left:47px; font-family:"微软雅黑""><#if site??>${site.telephone!'400-739-1200'}</#if></li>
            </ul> 
        </div>
        
        <div class="wt1200">
        <div class="logo fl mt20"><a href="/" title="博大生活网"><img src="<#if site??>${site.logoUri!''}<#else>/client/images/logo.png</#if>" width="500" height="94"></a></div>
        
      <div class="fr mt12">
          <div class="serach">
            <form action="/search" method="get">
                <input class="input1" type="text" name="keywords" onfocus="if(value=='<#if keywords_list?? && keywords_list[0]??>${keywords_list[0].title!''}</#if>') {value=''}"size="15" value="<#if keywords_list?? && keywords_list[0]??>${keywords_list[0].title!''}</#if>"/>
                <input class="input2" type="submit" value=" " />
            </form>
                <span>
                    <#if keywords_list??>
                    <#list keywords_list as item>
                        <a href="${item.linkUri!''}">${item.title}</a> <#if item_index+1 != keywords_list?size>|</#if>
                    </#list>
                    </#if>
                </span>
           </div>
           <div class="shopping fr wobble-top"><a href="/cart/"><b>去购物车结算</b><dd><#if cart_goods_list??>${cart_goods_list?size}</#if></dd></a></div>
           <div class="clear"></div>
      </div>
        </div>
        <nav class="mt4 fl">
            <div id="id-all" class="all">全部商品分类
                <div class="arrow-outer">
                    <div class="arrow-shadow"></div>
                </div>
                <div class="all_postion" style="display:none;">    
                    <ul class="flmenu listno "><!--商品分类小菜单开始-->
                      <li index="0">
                          <h5 class="flmenu">食品生鲜<span>></span></h5>
                          <#if fresh_cat_list??>
                            <#list fresh_cat_list as item>
                                <a href="/list/${item.id}">${item.title}</a>
                            </#list>
                          </#if>
                          <div id="shopsub0" class="shopsub_show" style="display:none;">
                              <div class="fleft">
                                <dl class="xdl">
                                    <#if fresh_cat_list??>
                                    <#list fresh_cat_list as item>
                                        <dd> <b><a href="/list/${item.id}" style="font-size:14px; color:#333; width: 56px;">${item.title!''}</a></b>
                                            <p>
                                                <#assign list_name = "fresh_sub_list" + item_index />
                                                <#if list_name?eval??>
                                                    <#list list_name?eval as subItem>
                                                        <a title="${subItem.title!''}" href="/list/${subItem.id}">${subItem.title!''}</a> 
                                                    </#list>
                                                </#if>
                                            </p>
                                        </dd>
                                    </#list>
                                    </#if>
                                </dl>
                              </div>
                          </div>
                      </li>
                      <li index="1">
                          <h5 class="flmenu">家装厨具<span>></span></h5>
                          <#if kitchen_cat_list??>
                            <#list kitchen_cat_list as item>
                                <a href="/list/${item.id}">${item.title}</a>
                            </#list>
                          </#if>
                          <div id="shopsub1" class="shopsub_show" style="display:none;">
                              <div class="fleft">
                                <dl class="xdl">
                                  <#if kitchen_cat_list??>
                                    <#list kitchen_cat_list as item>
                                        <dd> <b><a href="/list/${item.id}" style="font-size:14px; color:#333; width: 56px;">${item.title!''}</a></b>
                                            <p>
                                                <#assign list_name = "kitchen_sub_list" + item_index />
                                                <#if list_name?eval??>
                                                    <#list list_name?eval as subItem>
                                                        <a title="${subItem.title!''}" href="/list/${subItem.id}">${subItem.title!''}</a> 
                                                    </#list>
                                                </#if>
                                            </p>
                                        </dd>
                                    </#list>
                                  </#if>
                                </dl>
                              </div>
                          </div>
                      </li>
                      <li index="2">
                          <h5 class="flmenu">手机通讯<span>></span></h5>
                          <#if mobile_cat_list??>
                            <#list mobile_cat_list as item>
                                <a href="/list/${item.id}">${item.title}</a>
                            </#list>
                          </#if>
                          <div id="shopsub2" class="shopsub_show" style="display:none;">
                              <div class="fleft">
                                <dl class="xdl">
                                  <#if mobile_cat_list??>
                                    <#list mobile_cat_list as item>
                                        <dd> <b><a href="/list/${item.id}" style="font-size:14px; color:#333; width: 56px;">${item.title!''}</a></b>
                                            <p>
                                                <#assign list_name = "mobile_sub_list" + item_index />
                                                <#if list_name?eval??>
                                                    <#list list_name?eval as subItem>
                                                        <a title="${subItem.title!''}" href="/list/${subItem.id}">${subItem.title!''}</a> 
                                                    </#list>
                                                </#if>
                                            </p>
                                        </dd>
                                    </#list>
                                  </#if>
                                </dl>
                              </div>
                          </div>
                      </li>
                      <li index="3">
                          <h5 class="flmenu">数码产品<span>></span></h5>
                          <#if digit_cat_list??>
                            <#list digit_cat_list as item>
                                <a href="/list/${item.id}">${item.title}</a>
                            </#list>
                          </#if>
                          <div id="shopsub3" class="shopsub_show" style="display:none;">
                              <div class="fleft">
                                <dl class="xdl">
                                  <#if digit_cat_list??>
                                    <#list digit_cat_list as item>
                                        <dd> <b><a href="/list/${item.id}" style="font-size:14px; color:#333; width: 56px;">${item.title!''}</a></b>
                                            <p>
                                                <#assign list_name = "digit_sub_list" + item_index />
                                                <#if list_name?eval??>
                                                    <#list list_name?eval as subItem>
                                                        <a title="${subItem.title!''}" href="/list/${subItem.id}">${subItem.title!''}</a> 
                                                    </#list>
                                                </#if>
                                            </p>
                                        </dd>
                                    </#list>
                                  </#if>
                                </dl>
                              </div>
                          </div>
                      </li>
                      <li index="4">
                          <h5 class="flmenu">男装女装<span>></span></h5>
                          <#if cloth_cat_list??>
                            <#list cloth_cat_list as item>
                                <a href="/list/${item.id}">${item.title}</a>
                            </#list>
                          </#if>
                          <div id="shopsub4" class="shopsub_show" style="display:none;">
                              <div class="fleft">
                                <dl class="xdl">
                                  <#if cloth_cat_list??>
                                    <#list cloth_cat_list as item>
                                        <dd> <b><a href="/list/${item.id}" style="font-size:14px; color:#333; width: 56px;">${item.title!''}</a></b>
                                            <p>
                                                <#assign list_name = "cloth_sub_list" + item_index />
                                                <#if list_name?eval??>
                                                    <#list list_name?eval as subItem>
                                                        <a title="${subItem.title!''}" href="/list/${subItem.id}">${subItem.title!''}</a> 
                                                    </#list>
                                                </#if>
                                            </p>
                                        </dd>
                                    </#list>
                                  </#if>
                                </dl>
                              </div>
                          </div>
                      </li>
                    </ul> 
                </div>
             </div>
            <div class="menu">
                 <ul>
                    <#if navi_item_list??>
                        <#list navi_item_list as item>
                            <li>
                                <img src="${item.iconUri!''}" width="24" height="24" />
                                <a href="${item.linkUri!''}">${item.title!''}</a>
                            </li>  
                        </#list>
                    </#if> 
                 </ul>
                 <div class="aq"></div>
            </div>
            <div class="clear"></div>
        </nav>
    </div> 
</header>