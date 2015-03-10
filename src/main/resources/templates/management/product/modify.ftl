<div id="id-modify">
    <div class="form-group">
        <a href="javascript:void(0)" class="back btn btn-default btn-sm">返回上一级</a> 
    </div>

    <div class="space-4"></div>
 
    <form id="fm-modify" enctype="multipart/form-data" class="form-horizontal" role="form">
        <input type="text" name="id" value="${product.id}" style="display:none;" />
        <div class="col-sm-12">
            <label class="col-sm-1 control-label no-padding-right" for="type">*分类</label>
                
            <div class="col-sm-3">
                <select class="form-control" id="m-type" name="typeId">
                    <#if product_type_list??>
                        <#list product_type_list as type>
                            <#if type == product.type>
                                <option value="${type.id}">${type.name}</option>
                            </#if>
                        </#list>
                    </#if>
                    <#if product_type_list??>
                        <#list product_type_list as type>
                            <#if type != product.type>
                                <option value="${type.id}">${type.name}</option>
                            </#if>
                        </#list>
                    </#if>
                </select>
            </div>
        </div>
    
        <div class="col-sm-12" style="margin-top: 10px;">
            <label class="col-sm-1 control-label no-padding-right" for="m-name">*名称</label>
    
            <div class="col-sm-5">
                <input type="text" id="m-name" name="name" value="${product.name}" class="col-sm-12" />
            </div>
        </div>
        
        <div class="col-sm-12" style="margin-top: 10px;">
            <label class="col-sm-1 control-label no-padding-right" for="m-brief">*副标题</label>
            <div class="col-sm-5">
                <textarea class="limited col-sm-12" id="m-brief" name="brief" maxlength="100">${product.brief}</textarea>
            </div>
        </div>
            
        <div class="col-sm-12" style="margin-top: 10px;">
            <label class="col-sm-1 control-label no-padding-right" for="m-code">*编号</label>
    
            <div class="col-sm-5">
                <input type="text" id="m-code" name="code" class="col-sm-12" value="${product.code}" />
            </div>
        </div>
        
        <div class="col-sm-12" style="margin-top: 10px;">
            <label class="col-sm-1 control-label no-padding-right" for="m-promotion">*促销</label>
            <div class="col-sm-5">
                <textarea class="limited col-sm-12" id="m-promotion" name="promotion" maxlength="100">${product.promotion}</textarea>
            </div>
        </div>
        
        <div class="col-sm-12" style="margin-top: 10px;">
            <label class="col-sm-1 control-label no-padding-right" for="m-configuration">*配置</label>
            <div class="col-sm-5">
                <textarea class="limited col-sm-12" id="m-configuration" name="configuration" maxlength="100">${product.configuration}</textarea>
            </div>
        </div>
        
        <div class="col-sm-12" style="margin-top: 10px;">
            <label class="col-sm-1 control-label no-padding-right" for="m-service">*服务</label>
            <div class="col-sm-5">
                <textarea class="limited col-sm-12" id="m-service" name="service" maxlength="100">${product.service}</textarea>
            </div>
        </div>
        
        <div class="col-sm-12" style="margin-top: 10px;">
            
            <label class="col-sm-1 control-label no-padding-right">封面图片</label>
            
            <div class="col-sm-2">
                <img src="${product.coverImageUri}"  width="176" height="176"/>
                <input type="file" id="m-coverImage" name="coverImage"/>
            </div>
            
            <label class="col-sm-1 control-label no-padding-right">展示图片</label>
            
            <div class="col-sm-2">
                <#if show_picture_list??>
                    <#list show_picture_list as pic>
                        <img src="${pic}"  width="176" height="176"/>
                    </#list>
                </#if>
                <input type="file" multiple class="m-show-picture" name="pictures" />
            </div>
        </div>
        
        <!-- 参数块 -->
        <div id="property-section" class="col-sm-12" style="margin-top: 10px;"> </div>
        
        <!-- 价格块 -->
        <div class="col-sm-12" style="margin-top: 10px;">
            <div class="widget-box">
                <div class="widget-header widget-header-flat">
                    <h4 class="smaller col-sm-1">商品价格</h4>
                    
                    <div class="widget-toolbar">
                        
                        <label>
                            <a href="javascript:void(0)" id="m-id-add-version" class="btn btn-success btn-sm">增加版本</a> 
                        </label>
                    </div>
                </div>
    
                <div class="widget-body">
                    
                    <!-- 价格 -->
                    <div id="m-versionList" class="row">
                        <#list product.versionList as ver>
                        <div class="col-sm-12">
                            <label style="margin-left:10px;" class="control-label">版本</label>

                            <input type="text" name="versionNames" style="width:100px;" value="${ver.name?default("")}"/>
                             
                            <label style="margin-left:10px;" class="control-label">颜色</label>

                            <input type="text" name="versionColors" style="width:100px;" value="${ver.color?default("")}"/>
                            
                            <label style="margin-left:10px;" class="control-label">容量</label>

                            <input type="text" name="versionCapacities" style="width:100px;" value="${ver.capacity?default("")}"/>
                            
                            <label style="margin-left:10px;" class="control-label">成本价</label>
                                
                            <input type="text" name="versionCostPrices" style="width:100px;" value="<#if ver.costPrice??>${ver.costPrice?string("#.##")}</#if>"/>
                            
                            <label style="margin-left:10px;" class="control-label">*市场价</label>
                                
                            <input type="text" class="versionMarketPrices" name="versionMarketPrices" style="width:100px;" value="<#if ver.marketPrice??>${ver.marketPrice?string("#.##")}</#if>"/>
                            
                            <label style="margin-left:10px;" class="control-label">*销售价</label>
                                
                            <input type="text" class="versionSalePrices" name="versionSalePrices" style="width:100px;" value="<#if ver.salePrice??>${ver.salePrice?string("#.##")}</#if>"/>
                            
                            <label style="margin-left:10px;" class="control-label">*数量</label>
                                
                            <input type="text" class="versionLeftNumbers" name="versionLeftNumbers" style="width:100px;" value="${ver.leftNumber?default("")}"/>
                            
                            <label style="margin-left:10px;" >
                            
                                <a href="javascript:void(0)" class="btn btn-grey btn-xs del-version">
                                    <i class="icon-trash icon-2x icon-only"></i>
                                </a>
                            </label>
                        </div>
                        </#list>
                        
                    </div><!-- versionPrice -->
                </div>
            </div>
        </div> <!-- 价格块 -->
          
        <div class="col-sm-12" style="margin:10px;">
            <label class="col-sm-1 control-label no-padding-right" for="m-detail-editor">商品详情</label>
            <textarea id="m-detail-editor" name="mDetailArea" style="width:100%;height:400px;visibility:hidden;margin-top:5px;">${product.detail}</textarea>
        </div>
        
        <div class="col-sm-12" style="margin-top:10px;">
            <div class="checkbox">
                <label>
                    <input name="isStarProduct" type="checkbox" class="ace" <#if product.isStarProduct?? && true==product.isStarProduct>checked</#if> />
                    <span class="lbl">明星商品?</span>
                </label>
            </div>
        </div>
        
        <div class="col-sm-12" style="margin-top:10px;">
            <div class="checkbox">
                <label>
                    <input id="isFlashSale" name="isFlashSale" type="checkbox" class="ace" <#if product.isFlashSale?? && true==product.isFlashSale>checked</#if>/>
                    <span class="lbl">限时抢购?</span>
                </label>
            </div>
        </div>
        
        <div id="flash-sale-input" class="col-sm-12" <#if product.isFlashSale?? && true==product.isFlashSale><#else>style="margin-top:10px; display:none;"</#if>>
            <label class="control-label col-sm-1 no-padding-right">*开始时间</label>
            <div class="input-group col-sm-3">
                <input class="form-control date-picker" id="id-start-date" name="fsStartDate" type="text" data-date-format="yyyy-mm-dd" value="${product.flashSaleStartTime?string("yyyy-MM-dd")}" />
                <span class="input-group-addon">
                    <i class="icon-calendar bigger-110"></i>
                </span>
                
                <input id="id-start-time" type="text" name="fsStartTime" class="time-picker form-control" value="${product.flashSaleStartTime?string("HH:mm:ss")}"/>
                <span class="input-group-addon">
                    <i class="icon-time bigger-110"></i>
                </span>
            </div>
            
            <label class="control-label col-sm-1 no-padding-right">*结束时间</label>
            <div class="input-group col-sm-3">
                <input class="form-control date-picker" name="fsEndDate" id="id-end-date" type="text" data-date-format="yyyy-mm-dd" value="${product.flashSaleStopTime?string("yyyy-MM-dd")}" />
                <span class="input-group-addon">
                    <i class="icon-calendar bigger-110"></i>
                </span>
                
                <input id="id-end-time" type="text" name="fsEndTime" class="time-picker form-control" value="${product.flashSaleStopTime?string("HH:mm:ss")}"/>
                <span class="input-group-addon">
                    <i class="icon-time bigger-110"></i>
                </span>
            </div>
            
            <label class="control-label no-padding-right col-sm-1" for="flashSalePrice">*抢购价</label>
                            
            <input type="text" id="flashSalePrice" class="col-sm-1 control-label" name="flashSalePrice"/>
            
            <label class="control-label no-padding-right col-sm-1" for="flashSaleLeftNumber">*数量</label>
                            
            <input type="text" id="flashSaleLeftNumber" class="col-sm-1 control-label" name="flashSaleLeftNumber"/>
        </div>
        
        <!-- 组合商品 -->
        <div class="col-sm-12" style="margin-top: 10px;">
            <div class="widget-box">
                <div class="widget-header widget-header-flat">
                    <h4 class="smaller col-sm-1">商品组合</h4>
                    
                    <div class="widget-toolbar">
                        
                        <label>
                            <a href="javascript:void(0)" id="id-add-comb" class="btn btn-success btn-sm">增加</a> 
                        </label>
                    </div>
                </div>
    
                <div class="widget-body">
                    <div id="combinationList" class="row">
                        <div class="col-sm-12" style="margin-top:10px;">
                            <label class="control-label no-padding-right" for="type" style="margin-left:10px;">商品类型</label>
                        
                            <select class="combi-type" style="width:140px;" >
                                <option value="">请选择</option>
                                <#if product_type_list??>
                                    <#list product_type_list as type>
                                    <option value="${type.name}">${type.name}</option>
                                    </#list>
                                </#if>
                            </select>
                            
                            <label class="control-label no-padding-right" for="type" style="margin-left:10px;">商品名称</label>
                        
                            <select class="combi-name" name="combPid" style="width:140px;">
                                <option value="">请选择</option>
                                <#if type_list??>
                                    <#list type_list as type>
                                    <option value="${type.name}">${type.name}</option>
                                    </#list>
                                </#if>
                            </select>
                            
                            <label class="control-label no-padding-right" for="type" style="margin-left:10px;">版本</label>
                        
                            <select class="combi-version" name="combVid" style="width:140px;">
                                <option value="">请选择</option>
                                <#if type_list??>
                                    <#list type_list as type>
                                    <option value="${type.name}">${type.name}</option>
                                    </#list>
                                </#if>
                            </select>
                            
                            <label class="control-label no-padding-right" for="type" style="margin-left:10px;">原价</label>
                            
                            <input type="text" class="combi-origin-price" readonly/>
                            
                            <label class="control-label no-padding-right" for="type" style="margin-left:10px;">组合价</label>
                        
                            <input type="text" class="combi-price" name="combPrice"/>
                            
                            <label style="margin-left:10px;" >
                            
                                <a href="javascript:void(0)" class="btn btn-grey btn-xs del-combination">
                                    <i class="icon-trash icon-2x icon-only"></i>
                                </a>
                            </label>
                        </div>
                    </div>
                </div> <!-- widget-body -->
            </div>
        </div> <!-- 组合商品 -->
        
        <div class="form-group" style="margin-top:10px;">
            <div class="col-sm-10"></div>
            <a href="javascript:void(0)" id="modify-submit" class="btn btn-success btn-sm col-sm-1">提交</a> 
        </div>
    </form>
</div><!-- dialog -->      