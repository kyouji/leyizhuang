<div id="id-add" class="hide">
    <div class="form-group">
        <a href="javascript:void(0)" class="back btn btn-default btn-sm">返回上一级</a> 
    </div>
    
    <form id="fm-add" class="form-horizontal" role="form" method="POST" >
        <div class="col-sm-12">
            <label class="col-sm-1 control-label no-padding-right" for="name">*名称</label>
            <div class="col-sm-3">
                <input type="text" id="name" name="name" class="col-xs-10 col-sm-12"  autofocus="autofocus" maxlength="20"/>
            </div>
            
            <label class="col-sm-1 control-label no-padding-right" for="type">*父类型</label>
            <div class="col-sm-4">
                <select class="form-control" id="parent" name="parent">
                    <option value="">根类型</option>
                    <#list type_all_list as type>
                    <option value="${type.name}">${type.name}</option>
                    </#list>
                </select>
            </div>
            
            <div class="checkbox col-sm-2">
                <label>
                    <input name="isRecommend" type="checkbox" class="ace" checked/>
                    <span class="lbl">是否推荐?</span>
                </label>
            </div>
        </div>
        
        <input type="text" id="propIds" name="propIds" style="display:none;" />
        <div class="col-sm-12" style="margin-top:10px;">
            <label class="col-sm-1 control-label no-padding-right" for="destinationUri">*关联参数</label>
            <div class="col-sm-11">
                <a class="icon-plus col-sm-1" style="line-height:34px;"></a>
                
                <div id="new-property" class="col-sm-11">
                    <div class="col-sm-12">
                        <select class="col-sm-2 prop-type-select">
                            <option value="">请选择</option>
                            <#list param_type_list as param_type>
                                <option value="${param_type}">${param_type}</option>
                            </#list>
                        </select>
                        <div class="param-list col-sm-10">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-sm-12" style="margin-top:10px;">
            <div class="col-sm-10"></div>
            <a href="javascript:void(0)" id="add-submit" class="btn btn-success btn-sm col-sm-1">提交</a> 
        </div>
    </form>
</div><!-- dialog -->      