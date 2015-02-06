<div id="sub-modify">
    <div class="form-group">
        <a href="javascript:void(0)" class="back btn btn-default btn-sm">返回上一级</a> 
    </div>

    <div class="space-4"></div>
 
    <form id="fm-modify" enctype="multipart/form-data" class="form-horizontal" role="form">
    
    <input type="text" id="m-goods-id" name="id" value="${goods.id}" hidden/>
    <div class="col-sm-12" style="margin-top: 10px;">
        <label class="col-sm-1 control-label no-padding-right" for="type">类型</label>
            
        <div class="col-sm-3">
            <select class="form-control" id="m-type" name="type">
                <option value="${goods.type}">${goods.type}</option>
                <#if type_list??>
                    <#list type_list as type>
                    <#if type.name != goods.type>
                    <option value="${type.name}">${type.name}</option>
                    </#if>
                    </#list>
                </#if>
            </select>
        </div> 
        <div class="col-sm-3">
            <select class="form-control" id="m-subType" name="subType">
                <#if goods.subType??>
                <option value="${goods.subType}">${goods.subType}</option>
                <#else>
                <option value="">请选择</option>
                </#if>
                <#if sub_type_list??>
                    <#list sub_type_list as sub_type>
                        <#if goods.subType??>
                            <#if sub_type.name != goods.subType>
                                <option value="${sub_type.name}">${sub_type.name}</option>
                            </#if>
                        <#else>
                            <option value="${sub_type.name}">${sub_type.name}</option>
                        </#if>
                    </#list>
                </#if>
            </select>
        </div> 
    </div>
    
    <div class="space-4"></div>

    <div class="col-sm-12" style="margin-top: 10px;">
        <label class="col-sm-1 control-label no-padding-right" for="name">商品名称</label>

        <div class="col-sm-5">
            <input type="text" id="name" name="name" value="${goods.name}" class="col-xs-10 col-sm-12" />
        </div>
        
        <label class="col-sm-1 control-label no-padding-right" for="title">商品标题</label>

        <div class="col-sm-5">
            <input type="text" id="title" name="title" value="${goods.title}" class="col-xs-10 col-sm-12" />
        </div>  
    </div>
            
    <div class="space-4"></div>
        
    <div class="col-sm-12" style="margin-top: 10px;">
        <label class="col-sm-1 control-label no-padding-right" for="code">商品编号</label>

        <div class="col-sm-5">
            <input type="text" id="code" name="code" value="${goods.code}" class="col-xs-10 col-sm-12" />
        </div>  
        
        <label class="col-sm-1 control-label no-padding-right" for="barCode">商品条码</label>

        <div class="col-sm-5">
            <input type="text" id="barCode" name="barCode" value="${goods.barCode}" class="col-xs-10 col-sm-12" />
        </div>  
    </div>
    
    <div class="space-4"></div>
    
    <!-- 属性块 -->
    <div class="col-sm-12" style="margin-top: 10px;">
        <!-- 手机属性 -->
        <div id="m-id-phone-prop" class="row m-div-prop <#if goods.type?index_of('手机')==-1>hide</#if>">
            <div class="col-sm-12">
                <label class="col-sm-1 control-label blue">品牌</label>
                
                <input type="text" name="brandName" value="<#if goods.brandName??>${goods.brandName}</#if>" class="hide" />
                
                <div class="col-sm-11">
                    <#list phone_property_map["brandName"] as value>
                        <#if value_index gt 0>
                        <a href="javascript:void(0)" class="m-selectProp <#if goods.brandName?? && value==goods.brandName>spon</#if>">${value}</a>
                        </#if>
                    </#list>
                    </div>
                </div>
                
                <div class="col-sm-12">
                    <label class="col-sm-1 control-label blue ">价格区间</label>
                    
                    <input type="text" name="priceSpan" value="<#if goods.priceSpan??>${goods.priceSpan}</#if>" class="hide" />
                    
                    <div class="col-sm-11">
                    <#list phone_property_map["priceSpan"] as value>
                        <#if value_index gt 0>
                        <a href="javascript:void(0)" class="m-selectProp <#if goods.priceSpan?? && value==goods.priceSpan>spon</#if>">${value}</a>
                        </#if>
                    </#list>
                    </div>
                </div>
                
                <div class="col-sm-12">
                    <label class="col-sm-1 control-label blue ">网络制式</label>
                    
                    <input type="text" name="networkType" value="<#if goods.networkType??>${goods.networkType}</#if>" class="hide" />
                    
                    <div class="col-sm-11">
                    <#list phone_property_map["networkType"] as value>
                        <#if value_index gt 0>
                        <a href="javascript:void(0)" class="m-multiSelectProp <#if goods.networkType?? && goods.networkType?contains(value)>spon</#if>">${value}</a>
                        </#if>
                    </#list>
                    </div>
                </div>

                <div class="col-sm-12">
                    <label class="col-sm-1 control-label blue ">后摄像头</label>
                    
                    <input type="text" name="backCamera" value="<#if goods.backCamera??>${goods.backCamera}</#if>" class="hide" />
                    
                    <div class="col-sm-11">
                    <#list phone_property_map["backCamera"] as value>
                        <#if value_index gt 0>
                        <a href="javascript:void(0)" class="m-selectProp <#if goods.backCamera?? && value==goods.backCamera>spon</#if>">${value}</a>
                        </#if>
                    </#list>
                    </div>
                </div>
                
                <div class="col-sm-12">
                    <label class="col-sm-1 control-label blue ">核心数</label>
                    
                    <input type="text" name="coreNumber" value="<#if goods.coreNumber??>${goods.coreNumber}</#if>" class="hide"/>
                    
                    <div class="col-sm-11">
                    <#list phone_property_map["coreNumber"] as value>
                        <#if value_index gt 0>
                        <a href="javascript:void(0)" class="m-selectProp <#if goods.coreNumber?? && value==goods.coreNumber>spon</#if>">${value}</a>
                        </#if>
                    </#list>
                    </div>
                </div>
                
                <div class="col-sm-12">
                    <label class="col-sm-1 control-label blue ">操作系统</label>
                    
                    <input type="text" name="os" value="<#if goods.os??>${goods.os}</#if>" class="hide"/>
                    
                    <div class="col-sm-11">
                    <#list phone_property_map["os"] as value>
                        <#if value_index gt 0>
                        <a href="javascript:void(0)" class="m-selectProp <#if goods.os?? && value==goods.os>spon</#if>">${value}</a>
                        </#if>
                    </#list>
                    </div>
                </div>
                
                <div class="col-sm-12">
                    <label class="col-sm-1 control-label blue ">屏幕尺寸</label>
                    
                    <input type="text" name="screenSize" value="<#if goods.screenSize??>${goods.screenSize}</#if>" class="hide"/>
                    
                    <div class="col-sm-11">
                    <#list phone_property_map["screenSize"] as value>
                        <#if value_index gt 0>
                        <a href="javascript:void(0)" class="m-selectProp <#if goods.screenSize?? && value==goods.screenSize>spon</#if>">${value}</a>
                        </#if>
                    </#list>
                    </div>
                </div>
            </div><!-- id-phone-prop -->
            
            <!-- 数码属性 -->
            <div id="m-id-digit-prop" class="row m-div-prop <#if goods.type?index_of('数码')==-1>hide</#if>">
                <div class="col-sm-12">
                    <label class="col-sm-1 control-label blue">品牌</label>
                    <input type="text" name="brandName" value="<#if goods.brandName??>${goods.brandName}</#if>" class="hide"/>
                    <div class="col-sm-11">
                    <#list digit_property_map["brandName"] as value>
                        <#if value_index gt 0>
                        <a href="javascript:void(0)" class="m-selectProp <#if goods.brandName?? && value==goods.brandName>spon</#if>">${value}</a>
                        </#if>
                    </#list>
                    </div>
                </div>
                
                <div class="col-sm-12">
                    <label class="col-sm-1 control-label blue ">价格区间</label>
                    <input type="text" name="priceSpan" value="<#if goods.priceSpan??>${goods.priceSpan}</#if>" class="hide" />
                    <div class="col-sm-11">
                    <#list digit_property_map["priceSpan"] as value>
                        <#if value_index gt 0>
                        <a href="javascript:void(0)" class="m-selectProp <#if goods.priceSpan?? && value==goods.priceSpan>spon</#if>">${value}</a>
                        </#if>
                    </#list>
                    </div>
                </div>
                
                <div class="col-sm-12">
                    <label class="col-sm-1 control-label blue ">内存大小</label>
                    
                    <input type="text" name="memorySize" class="hide" value="<#if goods.memorySize??>${goods.memorySize}</#if>"/>
                    
                    <div class="col-sm-11">
                    <#list digit_property_map["memorySize"] as value>
                        <#if value_index gt 0>
                        <a href="javascript:void(0)" class="m-multiSelectProp <#if goods.memorySize?? && goods.memorySize?contains(value)>spon</#if>">${value}</a>
                        </#if>
                    </#list>
                    </div>
                </div>
                
                <div class="col-sm-12">
                    <label class="col-sm-1 control-label blue ">核心数</label>
                    <input type="text" name="coreNumber" class="hide" value="<#if goods.coreNumber??>${goods.coreNumber}</#if>"/>
                    <div class="col-sm-11">
                    <#list digit_property_map["coreNumber"] as value>
                        <#if value_index gt 0>
                        <a href="javascript:void(0)" class="m-selectProp <#if goods.coreNumber?? && value==goods.coreNumber>spon</#if>">${value}</a>
                        </#if>
                    </#list>
                    </div>
                </div>
                
                <div class="col-sm-12">
                    <label class="col-sm-1 control-label blue ">操作系统</label>
                    <input type="text" name="os" class="hide" value="<#if goods.os??>${goods.os}</#if>"/>
                    <div class="col-sm-11">
                    <#list digit_property_map["os"] as value>
                        <#if value_index gt 0>
                        <a href="javascript:void(0)" class="m-selectProp <#if goods.os?? && value==goods.os>spon</#if>">${value}</a>
                        </#if>
                    </#list>
                    </div>
                </div>
                
                <div class="col-sm-12">
                    <label class="col-sm-1 control-label blue ">屏幕尺寸</label>
                    <input type="text" name="screenSize" class="hide" value="<#if goods.screenSize??>${goods.screenSize}</#if>"/>
                    <div class="col-sm-11">
                    <#list digit_property_map["screenSize"] as value>
                        <#if value_index gt 0>
                        <a href="javascript:void(0)" class="m-selectProp <#if goods.screenSize?? && value==goods.screenSize>spon</#if>">${value}</a>
                        </#if>
                    </#list>
                    </div>
                </div>
            </div><!-- id-digit-prop -->
            
            <!-- 运营商属性 -->
            <div id="m-id-carrier-prop" class="row div-prop <#if goods.type?index_of('运营商')==-1>hide</#if>">
                <div class="col-sm-12">
                    <label class="col-sm-1 control-label blue">品牌</label>
                    <input type="text" name="brandName" class="hide" value=""/>
                    <div class="col-sm-11">
                    <#list carrier_property_map["brandName"] as value>
                        <#if value_index gt 0>
                        <a href="javascript:void(0)" class="m-selectProp">${value}</a>
                        </#if>
                    </#list>
                    </div>
                </div>
            </div>
            
        </div> <!-- 属性块 -->
        
        <#--
        <div class="row">
        
            <label class="col-sm-1 control-label no-padding-right" for="isOnSale">是否上架</label>
            
            <div class="col-sm-2">
                <select class="form-control" id="isOnSale" name="isOnSale" data-placeholder="是">
                    <option value="true">是</option>
                    <option value="false">否</option>
                </select>
            </div> 
            
            <label class="col-sm-1 control-label no-padding-right" for="isVirtualGoods">虚拟商品</label>
            
            <div class="col-sm-2">
                <select class="form-control" id="isVirtualGoods" name="isVirtualGoods">
                    <option value="false">否</option>
                    <option value="true">是</option>
                </select>
            </div> 
            
            <label class="col-sm-1 control-label no-padding-right" for="isSupportPointToBuy">积分购买</label>
            
            <div class="col-sm-2">
                <select class="form-control" id="isSupportPointToBuy" name="isSupportPointToBuy" data-placeholder="不支持">
                    <option value="false">不支持</option>
                    <option value="true">支持</option>
                </select>
            </div> 
            
            <label class="col-sm-1 control-label no-padding-right" for="pointsLimitedToBuy">积分限额</label>
            
            <div class="col-sm-2">
                <input type="text" id="pointsLimitedToBuy" name="pointsLimitedToBuy" class="col-sm-10" />
            </div> 
            
        </div>
        -->

        <div class="space-4"></div>
        
        <div class="col-sm-12" style="margin-top: 10px;">
            
            <label class="col-sm-1 control-label no-padding-right" for="coverImage">封面图片</label>

            <div class="col-sm-2">
                <img style="width:160px; height:160px" src="${goods.coverImageUri}"/>
                <input type="file" id="m-coverImage" name="coverImage" />
            </div>
            
            <label class="col-sm-1 control-label no-padding-right">展示图片</label>
            <div class="col-sm-2">
                <#list goods.showPictures?split(',') as pic>
                <#if "" != pic>
                <img style="width:160px; height:160px" src="${pic}"/>
                </#if>
                </#list>
                <input type="file" multiple class="m-show-picture" name="pictures" />
            </div>
            
            <label class="col-sm-1 control-label no-padding-right" for="promotionPic">促销图片</label>

            <div class="col-sm-2">
                <#if goods.promotionPicUri??>
                <img style="width:160px; height:160px" src="${goods.promotionPicUri}"/>
                </#if>
                <input type="file" id="m-promotionPic" name="promotionPic" />
            </div>
        </div>
        
        <div class="space-4"></div>
        
        <!-- 价格块 -->
        <div class="col-sm-12" style="margin-top: 10px;">
            <div class="widget-box">
                <div class="widget-header widget-header-flat">
                    <h4 class="smaller col-sm-1">商品价格</h4>
                    
                    <label class="col-sm-1 control-label no-padding-right" for="priceUnit">单位</label>
                    
                    <div class="smaller col-sm-2" style="align:center;">
                        <select class="form-control" id="priceUnit" name="priceUnit" data-placeholder="元">
                            <option value="元">元</option>
                            <!--<option value="美元">美元</option>-->
                        </select>
                    </div> 
                    
                    <div style"float:right;" class="col-sm-2"> 
                        <a href="javascript:void(0)" id="m-id-add-version" class="btn btn-success btn-sm hide">增加版本</a> 
                    </div> 
                    
                    <div class="widget-toolbar">
                        
                        <label>
                            <small class="green">
                                <b>按版本定价</b>
                            </small>
                            
                            <input type="checkbox" id="value-isUseVersionPrice" 
                            <#if goods.isUseVersionPrice?? && goods.isUseVersionPrice>
                                value="true"
                            <#else>
                                value="false"
                            </#if> hidden/>
                            <input id="m-isUseVersionPrice" name="isUseVersionPrice" type="checkbox" class="ace ace-switch ace-switch-6" value="true" />
                            <span class="lbl"></span>
                        </label>
                    </div>
                </div>
    
                <div class="widget-body">
                    <div class="widget-main">
                        <div class="row">
                            <label class="col-sm-1 control-label no-padding-right" for="costPrice">成本价</label>
    
                            <div class="col-sm-5">
                                <input type="text" <#if goods.costPrice??>value="${goods.costPrice?string("#.##")}"</#if> id="costPrice" name="costPrice" class="price col-xs-10 col-sm-12" />
                            </div>  
                            
                            <label class="col-sm-1 control-label no-padding-right" for="marketPrice">市场价</label>
    
                            <div class="col-sm-5">
                                <input type="text" <#if goods.marketPrice??>value="${goods.marketPrice?string("#.##")}"</#if> id="marketPrice" name="marketPrice" class="price col-xs-10 col-sm-12" />
                            </div>  
                        </div>
                        
                        <div class="space-4"></div>
                        
                        <!-- 统一定价 -->
                        <div id="m-simplePrice" class="row">
                            <label class="col-sm-1 control-label no-padding-right" for="salePrice">销售价</label>
    
                            <div class="col-sm-5">
                                <input type="text" <#if goods.salePrice??>value="${goods.salePrice?string("#.##")}"</#if> id="salePrice" name="salePrice" class="price col-xs-10 col-sm-12" />
                            </div>  
                            
                            <label class="col-sm-1 control-label no-padding-right" for="number">数量</label>
                    
                            <div class="col-sm-5">
                                <input type="text" <#if goods.number??>value="${goods.number?c}"</#if> id="number" name="number" class="number col-xs-10 col-sm-12" />
                            </div>  
                        </div>
                        
                        <!-- 分版本定价 -->
                        <div id="m-versionPrice" class="row hide">
                            <#if goods.goodsVersions??>
                            <#list goods.goodsVersions as version>
                            <div class="col-sm-12">
                                <label class="col-sm-1 control-label" for="versionNames">版本名</label>
    
                                <input type="text" <#if version.name??>value="${version.name}"</#if> id="versionNames" name="versionNames" class="versionNames col-sm-2" />
                                 
                                <label class="col-sm-1 control-label" for="versionColors">颜色</label>
    
                                <input type="text" <#if version.color??>value="${version.color}"</#if> id="versionColors" name="versionColors" class="versionColors col-sm-1" />
                                
                                <label class="col-sm-1 control-label" for="versionCapacities">容量</label>
    
                                <input type="text" <#if version.capacity??>value="${version.capacity}"</#if> id="versionCapacities" name="versionCapacities" class="versionCapacities col-sm-1" />
                                
                                <label class="col-sm-1 control-label" for="versionPrices">价格</label>
                                    
                                <input type="text" <#if version.price??>value="${version.price?string("#.##")}"</#if> id="versionPrices" name="versionPrices" class="price versionPrices col-sm-1" />
                                
                                <label class="col-sm-1 control-label" for="versionNumbers">数量</label>
                                    
                                <input type="text" <#if version.number??>value="${version.number?c}"</#if> id="versionNumbers" name="versionNumbers" class="number versionNumbers col-sm-1" />
                                
                                <label class="col-sm-1">
                                
                                <a href="javascript:void(0)" class="btn btn-grey btn-xs m-del-version">
                                    <i class="icon-trash icon-2x icon-only"></i>
                                </a>
                                </label>
                            </div>
                            </#list>
                            </#if>
                        </div>
                        <!-- 分版本定价 -->
                    </div>
                </div>
            </div>
        </div> <!-- 价格块 -->
            
        <div class="space-4"></div> 
        
        <label class="col-sm-1 control-label no-padding-right" for="m-propDetail">商品参数</label>
        <input type="text" id="m-propDetail-input" name="propDetail" hidden></input>
        <div class="wysiwyg-editor" id="m-propDetail"><#if goods.propDetail??>${goods.propDetail}</#if></div>
        
        <div class="space-4"></div>
        
        <div class="form-group">
            <div class="col-sm-6">
                <label for="description">商品简述</label>

                <textarea class="form-control limited" id="description" name="description" maxlength="100"><#if goods.description??>${goods.description}</#if></textarea>
            </div>
            
            <div class="col-sm-6">
                <label for="config">配置说明</label>

                <textarea class="form-control limited" id="config" name="config" maxlength="100"> <#if goods.config??>${goods.config}</#if> </textarea>
            </div>
        </div>
        
        <div class="space-4"></div>
        
        <div class="form-group">
            <div class="col-sm-6">
                <label for="service">服务说明</label>

                <textarea class="form-control limited" id="service" name="service" maxlength="100"><#if goods.service??>${goods.service}</#if></textarea>
            </div>
            
            <div class="col-sm-6">
                <label for="deliverySpec">配送说明</label>

                <textarea class="form-control limited" id="deliverySpec" name="deliverySpec" maxlength="100"><#if goods.deliverySpec??>${goods.deliverySpec}</#if></textarea>
            </div>
        </div>
        
        <div class="space-4"></div>
        
        <div class="form-group">
            <label class="col-sm-1 control-label no-padding-right" for="m-form-field-tags">商品标签</label>

            <div class="col-sm-5">
                <input type="text" name="tags" id="m-form-field-tags" value="<#if goods.tags??>${goods.tags}</#if>" placeholder="按回车录入标签 ..." />
            </div>
        </div>
        
        <div class="space-4"></div>
        
        <div class="form-group hide">
            
            <label class="col-sm-1 control-label no-padding-right" for="shop">商家</label>
            
            <div class="col-sm-2">
                <select class="form-control" id="shopName" name="shopName">
                    <option selected value="">请选择</option>
                </select>
            </div> 
            
            <label class="col-sm-1 control-label no-padding-right" for="providerName">供货商</label>
            
            <div class="col-sm-2">
                <select class="form-control" id="providerName" name="providerName">
                    <option selected value="">请选择</option>
                </select>
            </div> 
            
            <label class="col-sm-1 control-label no-padding-right" for="storehouseName">储存仓库</label>
            
            <div class="col-sm-2">
                <select class="form-control" id="storehouseName" name="storehouseName">
                    <option selected value="">请选择</option>
                </select>
            </div> 
            
            <label class="col-sm-1 control-label no-padding-right" for="warningMinNumber">库存预警值</label>
            
            <div class="col-sm-2">
                <input type="text" id="warningMinNumber" name="warningMinNumber" placeholder="0" class="col-xs-10 col-sm-10" />
            </div> 
            
        </div> <!-- /form-group -->
        
        <div class="space-4"></div>
        
        <div class="form-group hide">
            
            <label class="col-sm-1 control-label no-padding-right" for="putInStorageDate">入库日期</label>

            <div class="col-sm-2">
                <div class="input-group">
                    <input class="form-control date-picker" id="putInStorageDate" name="putInStorageDate" type="text" data-date-format="yyyy-mm-dd" />
                    <span class="input-group-addon">
                        <i class="icon-calendar bigger-110"></i>
                    </span>
                </div>
            </div>
            
            <label class="col-sm-1 control-label no-padding-right" for="validDate">过期日期</label>

            <div class="col-sm-2">
                <div class="input-group">
                    <input class="form-control date-picker" id="validDate" name="validDate" type="text" data-date-format="yyyy-mm-dd" />
                    <span class="input-group-addon">
                        <i class="icon-calendar bigger-110"></i>
                    </span>
                </div>
            </div>
        </div> <!-- /form-group -->
        
        <div class="space-4"></div>
        
        <label class="col-sm-1 control-label no-padding-right" for="m-detail">商品详情</label>
        <input type="text" id="m-detail-input" name="detail" hidden></input>
        <div class="wysiwyg-editor" id="m-detail"><#if goods.detail??>${goods.detail}</#if></div>
        
        <div class="space-4"></div>
        
        <div class="form-group">
            <div class="col-sm-10"></div>
            <a href="javascript:void(0)" id="modify-submit" class="btn btn-success btn-sm col-sm-1">提交</a> 
        </div>
    </form>
</div><!-- dialog -->      