/**
 *添加商品提交
 *@author zackma
 */  

$(function(){
                $("#add-submit").click(function(){
                	var NeContent = $("#fm-add").serialize();
                	var eContent1 = editor1.html();
                    var eContent2 = deitor2.html();
                    
                    if(type==""||name==""||code==""){
			            alert("请填写完整品牌信息！");
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
            });