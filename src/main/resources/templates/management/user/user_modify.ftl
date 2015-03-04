<div>
    <div class="form-group">
        <a href="javascript:void(0)" class="back btn btn-default btn-sm">返回上一级</a> 
    </div>

    <form id="fm-modify" class="form-horizontal" method="POST" >
        <input type="text" name="id" value="${user.id}" class="hide" />
        <div class="col-sm-12"  style="margin-top: 10px;">
            <div class="addinput-form">
                <label class="col-sm-1 control-label no-padding-right" for="name"> 用户名:</label>
                <div class="col-sm-5">
                    <input type="text" name="name" class="col-sm-12" value=${user.username} autofocus="autofocus" maxlength="20"/>
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