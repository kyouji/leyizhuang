<nav>
    <div class="main">
        <div id="nav-main" class="nav_more fll">
            <div class="nav_more1">
               <a href="javascript:;" title="全部商品分类" class="nav_more15" id="nav-bar">全部商品分类</a>
            </div>

            <ul id="nav-ul" style="display:none">
                <#if root_type_list??>
                    <#list root_type_list as type>
                        <li>
                            <div class="mbj m${type_index+1}"></div>
                                    
                                <div class="divshop">
                                <h4><a href="/list/${type.id}">${type.name}</a></h4>
                                <#if type.name == "手机">
                                    <p>
                                        <#if mi_index??>
                                            <a href="/list/${type.id}-${mi_index}">小米</a>
                                        </#if>
                                        <#if apple_index??>
                                            <a href="/list/${type.id}-${apple_index}">苹果（Apple）</a>
                                        </#if>
                                        <#if lenovo_index??>
                                            <a href="/list/${type.id}-${lenovo_index}">联想</a>
                                        </#if>
                                        <#if huawei_index??>
                                            <a href="/list/${type.id}-${huawei_index}">华为</a>
                                        </#if>
                                    </p>
                                <#elseif type.name == "手机配件">
                                    <#if accessory_sub_type_list??>
                                        <p>
                                            <#list accessory_sub_type_list as atype>
                                                <#if atype_index < 5>
                                                    <a href="/list/${atype.id}">${atype.name}</a>
                                                </#if>
                                            </#list>
                                        </p>
                                    </#if>
                                <#elseif type_index == 2>
                                </#if>
                            </div>
                                    
                            <div class="clear"></div>
                            
                            <div class="threeright" style="display:none">
                                <ul id="threeright1">
                                <li><span>品牌：</span><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a></li>
                                <li><span>品牌：</span><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a></li>
                                <li><span>品牌：</span><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a></li>
                                <li><span>品牌：</span><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a></li>
                                </ul>
                            </div>
                            <div class="threeright" style="display:none">
                                <ul id="threeright1">
                                <li><span>品牌：</span><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a></li>
                                <li><span>品牌：</span><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a></li>
                                <li><span>品牌：</span><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a></li>
                                </ul>
                            </div>
                            <div class="threeright" style="display:none">
                                <ul id="threeright1">
                                <li><span>品牌：</span><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a></li>
                                <li><span>品牌：</span><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a><a href="#">小米</a></li>
                                </ul>
                            </div>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>
        
        <div class="nav_2 fll ml4">
            <ul>
                <li><a href="/" title="首页">首页</a></li>
                <li><a href="#" title="明星产品">明星产品</a></li>
                <#if phone_type??>
                    <li><a href="/list/${phone_type.id}" title="手机产品">手机产品</a></li>
                </#if>
                <#if phone_accessory_type??>
                    <li><a href="/list/${phone_accessory_type.id}" title="手机配件">手机配件</a></li>
                </#if>
                <#if phone_number_type??>
                    <li><a href="/list/${phone_number_type.id}" title="靓号选择">靓号选择</a></li>
                </#if>
                <#if second_hand_phone_type??>
                    <li><a href="/list/${second_hand_phone_type.id}" title="二手手机">二手手机</a></li>
                </#if>
                <li><a href="#" title="新闻资讯">新闻资讯</a></li>
            </ul>
        </div>
    
    </div>
</nav>