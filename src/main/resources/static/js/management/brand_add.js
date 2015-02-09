/**
 *添加品牌提交
 *@author zackma
 */  

$(function(){
                $("#add-submit").click(function(){
                	var id = $("form #id").val();
                    var type = $("form #type").val();
                    var name = $("form #name").val();
                    var logoUri = $("form .brand-picture").val();
                    var isRecommend = $("#recommend:checked").val();
                    if(type==""||name==""||isRecommend==""){
			            alert("请填写完整品牌信息！");
			        return;
		            }
                    
                    var subDate = {"id":id,"type":type,"name":name,"logoUri":logoUri,"isRecommend":isRecommend};
                    $.ajax({
			            type:"POST",
			            url:"/admin/brand/save",
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