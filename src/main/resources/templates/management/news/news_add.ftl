<div id="id-add" class="hide">
    <div class="form-group">
        <a href="javascript:void(0)" class="back btn btn-default btn-sm">返回上一级</a> 
    </div>

    <form id="fm-add" class="form-horizontal" method="POST" >
        <input type="text" name="id" value="" class="hide" />
        <div class="col-sm-12"  style="margin-top: 10px;">
            <div class="addinput-form">
	            <label class="col-sm-1 control-label no-padding-right" for="title"> 标题:</label>
	            <div class="col-sm-5">
	                <input type="text" name="title" class="col-sm-12"  autofocus="autofocus" maxlength="100"/>
	            </div>
	        </div>
	        
	        <div class="clear"></div>	
	        
	        <div class="addinput-form">
                <label class="col-sm-1 control-label no-padding-right" for="type"> 分类:</label>
                <div class="col-sm-5">
                    <input type="text" name="type" class="col-sm-12"  autofocus="autofocus" maxlength="100"/>
                </div>
            </div>
            
            <div class="clear"></div>   
            
            <div class="addinput-form">
                <label class="col-sm-1 control-label no-padding-right" for="author"> 作者:</label>
                <div class="col-sm-5">
                    <input type="text" name="author" class="col-sm-12"  autofocus="autofocus" maxlength="100"/>
                </div>
            </div>
            
            <div class="clear"></div>   
            
            <div class="addinput-form col-sm-8 no-padding-left">
                <div class="col-sm-1-2"  style="margin-top: 10px;">
                
                    <label class="col-sm-1 control-label no-padding-right"> 缩略图:</label>
                    
                    <div class="col-sm-2">
                        <input type="file" class="picture" name="pic" />
                    </div>
                </div>                  
            </div>
            
            <div class="clear"></div>       
	            
	        <div class="col-sm-12" style="margin:10px;">
                <label class="col-sm-1 control-label no-padding-right" for="content-editor">内容</label>
                <textarea id="content-editor" name="contentArea" style="width:100%;height:400px;visibility:hidden;margin-top:5px;"></textarea>
            </div>	  
            
            <div class="clear"></div>       
                
            <div class="col-sm-12" style="margin-top:10px;">
                <div class="checkbox">
                    <label>
                        <input name="isShow" type="checkbox" class="ace" />
                        <span class="lbl">前台显示?</span>
                    </label>
                </div>
            </div>      
	        
        </div>
        
        <div class="col-sm-12"  style="margin-top: 10px;">
            <div class="col-sm-10"></div>
            <a href="javascript:void(0)" id="add-submit" class="btn btn-success btn-sm col-sm-1">提交</a> 
        </div>
    </form>
</div><!-- dialog -->      