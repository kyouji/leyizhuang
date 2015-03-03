<div id="sub-modify">
    <div class="form-group">
        <a href="javascript:void(0)" class="back btn btn-default btn-sm">返回上一级</a> 
    </div>

    <form id="fm-modify" class="form-horizontal" method="POST" >
        <input type="text" name="type" id="id" value="${brand.id}" class="hide" />
        <div class="col-sm-12"  style="margin-top: 10px;">
            <div class="addinput-form">
                <label class="col-sm-1 control-label no-padding-right" for="name"> 名称:</label>
                <div class="col-sm-5">
                    <input type="text" name="name" class="col-sm-12"  value="${brand.name}" autofocus="autofocus" maxlength="20"/>
                </div>
            </div>
            
            <div class="clear"></div>
            
            <div class="addinput-form">
                <label class="col-sm-1 control-label no-padding-right" for="name"> 关联类型:</label>
                <div class="col-sm-11">
                    <#if type_list??>
                        <input type="text" name="type" value="" style="display:none;"/>
                        <#list type_list as type>
                            <a href="javascript:void(0)" class="multiSelectProp">${type.name}</a>
                        </#list>
                    </#if>
                </div>
            </div>
            
            <div class="clear"></div>
                
            <div class="addinput-form col-sm-8 no-padding-left">
                <div class="col-sm-1-2"  style="margin-top: 10px;">
                
                    <label class="col-sm-1 control-label no-padding-right"> 品牌图片:</label>
                    
                    <div class="col-sm-2">
                        <input type="file" class="brand-picture" name="logoPic" />
                    </div>
                </div>                  
            </div>
            
            <div class="clear"></div>
            
            <div class="addinput-form col-sm-12">
                <div class="checkbox">
                    <label>
                        <input name="isRecommend" type="checkbox" class="ace" <#if true==brand.isRecommend>checked</#if>/>
                        <span class="lbl">是否推荐?</span>
                    </label>
                </div>
            </div>
            
            <div class="clear"></div>                       
            
        </div>
        
        <div class="col-sm-12"  style="margin-top: 10px;">
            <div class="col-sm-10"></div>
            <a href="javascript:void(0)" id="add-submit" class="btn btn-success btn-sm col-sm-1">提交</a> 
        </div>
    </form>
</div><!-- dialog -->      