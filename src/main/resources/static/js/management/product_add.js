/**
 *添加商品提交
 *@author zackma
 */  

$(function(){
    /*
    $("#add-submit").click(function(){
        
        var formData = new FormData($('#fm-add')[0]);
        var eContent1 = detailEditor.html();
        
        $.ajax({
            url : '/admin/product/save',
            type : 'POST',
            data : formData,
            async : false,
            cache : false,
            contentType : false,
            processData : false,
            success : function(res) {

                if (0 == res.code) {
                    alert("添加商品成功");
                    location.reload();
                } else {
                    alert(res.message);
                }
            }
        }); // ajax
        
        return;
        
    	var NeContent = $("#fm-add").serialize();
    	var eContent1 = editor1.html();
        var eContent2 = editor2.html();
        
        var type = $('select[name="type"]:selected').val();
        var name = $("#name").val();
        var code = $("#code").val();
        
        if(name==""||code==""){
            alert("请填写完整商品信息！");
            return;
        }
        
        var newContent = NeContent.replace("&content1=","");
        newContent = newContent.replace("&content2=","");
        var subDate = newContent+"&content1="+eContent1+"&content2="+eContent2;

        $.ajax({
            type:"POST",
            url:"/admin/product/save",
            data:subDate,
            success:function(data){
		        if(data.code == 0){
		            alert("品牌添加成功！");
		            location.reload();
		        }else{
		            alert(data.message);
		        }
            }
        });
    });
    */
});