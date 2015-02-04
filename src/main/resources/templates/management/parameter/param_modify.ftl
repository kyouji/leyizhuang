<div id="sub-modify class="hide">
    <div class="form-group">
        <a href="javascript:void(0)" class="back btn btn-default btn-sm">返回上一级</a> 
    </div>

    <div class="space-4"></div>
 
    <form id="fm-modify" class="form-horizontal" method="POST" >
        <input type="text" name="id" value="${parameter.id}" class="hide" />
        <div class="col-sm-12"  style="margin-top: 10px;">
            <div class="addinput-form">
	            <label class="col-sm-1 control-label no-padding-right" for="name"> 类型:</label>
	            <div class="col-sm-5">
	                <input type="text" id="type" name="type" class="col-xs-10 col-sm-12" value="${parameter.type}" autofocus="autofocus" maxlength="20"/>
	            </div>
	            <span style="font-size:16px">*请输入参数类型</sapn>
	        </div>
	        
	        <div class="clear"></div>
	        
	        <div class="addinput-form">
	            <label class="col-sm-1 control-label no-padding-right" for="name"> 名称:</label>
	            <div class="col-sm-5">
	                <input type="text" id="name" class="col-xs-10 col-sm-12" value="${parameter.name}" autofocus="autofocus" maxlength="20"/>
	            </div>
	            <span style="font-size:16px">*请输入参数名称</sapn>
	        </div>
	        
	        <div class="clear"></div>
	            
	        <div class="addinput-form col-sm-8 no-padding-left">
	            <label class="col-sm-2 control-label no-padding-right" for="type">参数值输入类型:</label>
	            <div class="col-sm-4" style="width:34%">	            
	                <select class="form-control " id="input_type" name="input_type">
	                    <#if parameter.isValueIputByChoose??&&parameter.isValueIputByChoose==true>
                        <option value="true">点击选择</option>
                        <option value="false">手动输入</option>
                        <#else>
                        <option value="false">手动输入</option>
                        <option value="true">点击选择</option>
                        </#if>
	                </select>
	            </div>
	            <span style="font-size:16px">*请选择参数值输入类型</sapn>
	        </div>
	        
	        <div class="clear"></div>
	        
	        <div class="addinput-form">
	            <label class="col-sm-2 control-label no-padding-right" for="name"> 是否可检索:</label>
	            <div class="col-sm-8" style="line-height:32px">
	                <label style="font-size:16px" class="col-xs-10 col-sm-2">是
	                <input type="radio" id="searchable" class="" name="searchable" value="yes" <#if parameter.isSearchable??&&parameter.isSearchable==true>checked</#if> />
	                </label>
	                <label style="font-size:16px" class="col-xs-10 col-sm-2" >否
	                <input type="radio" id="searchable" class="" name="searchable" value="no" <#if parameter.isSearchable??&&parameter.isSearchable==false>checked</#if> />
	                </label>
	            </div>
	        </div>
	        
	        <div class="clear"></div>
	        
	        <div class="addinput-form">
	            <label class="col-sm-2 control-label no-padding-right" for="name"> 是否为多值参数:</label>
	            <div class="col-sm-8" style="line-height:32px">
	                <label style="font-size:16px" class="col-xs-10 col-sm-2">是
	                <input type="radio" id="multiple" class="" name="multiple"  value="yes" <#if parameter.isSingleValue??&&parameter.isSingleValue==true>checked</#if> />
	                </label>
	                <label style="font-size:16px" class="col-xs-10 col-sm-2">否
	                <input type="radio" id="multiple" class="" name="multiple" value="no" <#if parameter.isSingleValue??&&parameter.isSingleValue==false>checked</#if> />
	                </label>
	            </div>
	        </div>
	        
	        <div class="clear"></div>
	        
	        <div class="addinput-form">
	            <label class="col-sm-1 control-label no-padding-right" for="name"> 参数值列表:</label>
	            <div class="col-sm-5">
	                <textarea id="param_list" class="col-xs-10 col-sm-12"  autofocus="autofocus" rows='5' cols='12' value="" ></textarea>
	            </div>
	            <span style="font-size:16px">*请输入参数值  多个参数值以英文逗号隔开</sapn>
	        </div>
	        
	        <div class="clear"></div>
	        
        </div>
        
        <div class="col-sm-12"  style="margin-top: 10px;">
            <div class="col-sm-10"></div>
            <a href="javascript:void(0)" id="m-submit" class="btn btn-success btn-sm col-sm-1">提交</a> 
        </div>
    </form>
</div><!-- dialog -->      