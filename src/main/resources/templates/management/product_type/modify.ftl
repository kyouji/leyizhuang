<div id="sub-modify">
    <div class="form-group">
        <a href="javascript:void(0)" class="back btn btn-default btn-sm">返回上一级</a> 
    </div>
    
    <form id="fm-modify" class="form-horizontal" role="form" method="POST" >
        <div class="col-sm-12">
            <input type="text" style="display:none;" name="id" value="${product_type.id}">
            <label class="col-sm-1 control-label no-padding-right" for="name">*名称</label>
            <div class="col-sm-3">
                <input type="text" id="m-name" name="name" value="${product_type.name}" class="col-xs-10 col-sm-12"  autofocus="autofocus" maxlength="20"/>
            </div>
            
            <label class="col-sm-2 control-label no-padding-right" for="type">*父类型</label>
            <div class="col-sm-4">
                <select class="form-control" id="m-parent" name="parent">
                    <#if product_type.parent=="">
                        <option value="">根类型</option>
                    <#else>
                        <option value="${product_type.parent}">${product_type.parent}</option>
                        <option value="">根类型</option>
                    </#if>
                    
                    <#list type_all_list as type>
                        <#if product_type.parent != type.name>
                        <option value="${type.name}">${type.name}</option>
                        </#if>
                    </#list>
                </select>
            </div>
        </div>

        <div class="space-4"></div>
        
        <input type="text" id="m-propIds" name="propIds" style="display:none;" />
        <div class="col-sm-12" style="margin-top:10px;">
            <label class="col-sm-1 control-label no-padding-right" for="destinationUri">*关联参数</label>
            <div class="col-sm-11">
                <#if prop_list??>
                    <#list prop_list as param>
                    <a href="javascript:void(0)" class="modify multiSelectProp spon" value="${param.id}">${param.name}</a>
                    </#list>
                </#if>
            </div>
            <div class="col-sm-1"></div>
            <div class="col-sm-11">
                <a class="icon-plus col-sm-1" style="line-height:34px;"></a>
                
                <div id="modify-property" class="col-sm-11">
                    <div class="col-sm-12">
                        <select class="col-sm-2 prop-type-select">
                            <option value="">请选择</option>
                            <#list param_type_list as param_type>
                                <option value="${param_type}">${param_type}</option>
                            </#list>
                        </select>
                        <div class="param-list col-sm-10"></div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-sm-12" style="margin-top:10px;">
            <div class="col-sm-10"></div>
            <a href="javascript:void(0)" id="modify-submit" class="btn btn-success btn-sm col-sm-1">提交</a> 
        </div>
    </form>
</div><!-- dialog -->      