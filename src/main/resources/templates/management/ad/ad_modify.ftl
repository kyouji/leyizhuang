<div>
    <div class="form-group">
        <a href="javascript:void(0)" class="back btn btn-default btn-sm">返回上一级</a> 
    </div>

    <form id="fm-modify" class="form-horizontal" method="POST" >
        <input type="text" name="id" value="${ad.id}" class="hide" />
        <div class="col-sm-12"  style="margin-top: 10px;">
            <div class="addinput-form">
                <label class="col-sm-1 control-label no-padding-right" for="name"> 名称:</label>
                <div class="col-sm-5">
                    <input type="text" name="name" class="col-sm-12" value=${ad.name} autofocus="autofocus" maxlength="100"/>
                </div>
            </div>
            
            <div class="clear"></div>   
            
            <#if ad_type_list??>
                <div class="addinput-form">
                    <label class="col-sm-1 control-label no-padding-right">类型</label>
                    <div class="col-sm-11">
                        <input type="text" name="type" value="" style="display:none;" />
                        <#list ad_type_list as ad_type>
                            <a href="javascript:void(0)" class="m-selectProp <#if ad.type==ad_type.name>spon</#if>">${ad_type.name}</a>
                        </#list>
                    </div>
                </div>
            </#if>

            <div class="clear"></div>   
            
            <div class="addinput-form col-sm-8 no-padding-left">
                <div class="col-sm-1-2"  style="margin-top: 10px;">
                
                    <label class="col-sm-1 control-label no-padding-right"> 图片:</label>
                    
                    <div class="col-sm-2">
                        <#if ad.imageUri??>
                            <img src="${ad.imageUri}"  width="176" height="176"/>
                        </#if>
                        <input type="file" class="m-picture" name="pic" />
                    </div>
                </div>                  
            </div>
            
            <div class="addinput-form">
                <label class="col-sm-1 control-label no-padding-right" for="destinationUri"> 链接地址:</label>
                <div class="col-sm-5">
                    <input type="text" name="destinationUri" class="col-sm-12" value="${ad.destinationUri}" maxlength="100"/>
                </div>
            </div>
            
            <div class="clear"></div>                       
            
        </div>
        
        <div class="col-sm-12"  style="margin-top: 10px;">
            <div class="col-sm-10"></div>
            <a href="javascript:void(0)" id="modify-submit" class="btn btn-success btn-sm col-sm-1">提交</a> 
        </div>
    </form>
</div><!-- dialog -->      