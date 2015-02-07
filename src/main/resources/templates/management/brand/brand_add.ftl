<div id="id-add" class="hide">
    <div class="form-group">
        <a href="javascript:void(0)" class="back btn btn-default btn-sm">返回上一级</a> 
    </div>

    <div class="space-4"></div>
 
    <form id="fm-add" class="form-horizontal" method="POST" >
        <input type="text" name="type" id="id" value="" class="hide" />
        <div class="col-sm-12"  style="margin-top: 10px;">
            <div class="addinput-form">
	            <label class="col-sm-1 control-label no-padding-right" for="name"> 类型:</label>
	            <div class="col-sm-5">
	                <input type="text" id="type" name="type" class="col-xs-10 col-sm-12"  autofocus="autofocus" maxlength="20"/>
	            </div>
	            <span style="font-size:16px">*请输入品牌类型</sapn>
	        </div>
	        
	        <div class="clear"></div>
	        
	        <div class="addinput-form">
	            <label class="col-sm-1 control-label no-padding-right" for="name"> 名称:</label>
	            <div class="col-sm-5">
	                <input type="text" id="name" class="col-xs-10 col-sm-12"  autofocus="autofocus" maxlength="20"/>
	            </div>
	            <span style="font-size:16px">*请输入品牌名称</sapn>
	        </div>
	        
	        <div class="clear"></div>
	            
	        <div class="addinput-form col-sm-8 no-padding-left">
		        <div class="col-sm-1-2"  style="margin-top: 10px;">
	            
		            <label class="col-sm-1 control-label no-padding-right"> 品牌图片:</label>
		            
		            <div class="col-sm-2">
		                <input type="file" class="brand-picture" name="f" />
		            </div>
	            </div>
	            <span style="font-size:16px">*请上传品牌图片(可以为空)</sapn>	            
	        </div>
	        
	        <div class="clear"></div>
	        
	        <div class="addinput-form">
	            <label class="col-sm-2 control-label no-padding-right" for="name"> 是否推荐:</label>
	            <div class="col-sm-8" style="line-height:32px">
	                <label style="font-size:16px" class="col-xs-10 col-sm-2">是
	                <input type="radio" id="recommended" class="" name="recommended" value="true" />
	                </label>
	                <label style="font-size:16px" class="col-xs-10 col-sm-2" >否
	                <input type="radio" id="recommended" class="" name="recommended" value="false" />
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