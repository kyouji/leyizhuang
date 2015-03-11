<div>
    <div class="form-group">
        <a href="javascript:void(0)" class="back btn btn-default btn-sm">返回上一级</a> 
    </div>

    <form id="fm-modify" class="form-horizontal" method="POST" >
        <input type="text" name="id" value="${site_info.id}" class="hide" />
        <div class="col-sm-12"  style="margin-top: 10px;">
            <div class="addinput-form">
                <label class="col-sm-1 control-label no-padding-right"> 名称:</label>
                <div class="col-sm-5">
                    <input type="text" name="name" class="col-sm-12" value="${site_info.name?default("")}" autofocus="autofocus" maxlength="100"/>
                </div>
            </div>
            
            <div class="clear"></div>
            
            <div class="addinput-form">
                <label class="col-sm-1 control-label no-padding-right" for="type"> 分类:</label>
                <div class="col-sm-5">
                    <input type="text" name="type" class="col-sm-12" value="${site_info.type?default("")}" autofocus="autofocus" maxlength="100"/>
                </div>
            </div>
            
            <div class="clear"></div>     
            
            <script type="text/javascript">
                window.pcontent = '${site_info.content?js_string}';
            </script>
            
            <div class="col-sm-12" style="margin:10px;">
                <label class="col-sm-1 control-label no-padding-right" for="content-editor">内容</label>
                <textarea id="content-editor" name="mContentArea" style="width:100%;height:400px;visibility:hidden;margin-top:5px;"></textarea>
            </div>    
            
            <div class="clear"></div>       
                
            <div class="col-sm-12" style="margin-top:10px;">
                <div class="checkbox">
                    <label>
                        <input name="isShow" type="checkbox" class="ace" <#if site_info.isShow??>checked</#if>/>
                        <span class="lbl">前台显示?</span>
                    </label>
                </div>
            </div>      
            
        </div>
        
        <div class="col-sm-12"  style="margin-top: 10px;">
            <div class="col-sm-10"></div>
            <a href="javascript:void(0)" id="modify-submit" class="btn btn-success btn-sm col-sm-1">提交</a> 
        </div>
    </form>
</div><!-- dialog -->      