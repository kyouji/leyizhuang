/**
 *添加参数提交
 *@author zackma
 */  

$(function(){
                $("#add-submit").click(function(){
                    var type = $("form #type").val();
                    var name = $("form #name").val();
                    var isValueInputByChoose = $("form #input_type option:selected").val();
                    var isSearchable = $("#searchable:checked").val();
                    var isSingleValue = $("#multiple:checked").val();
                    var valueList = $("form #param_list").val();
                    if(type==""||name==""||isValueInputByChoose==""||isSearchable==""||isSingleValue==""||valueList==""){
			            alert("请填写完整参数！");
			        return;
		            }
                    
                    var subDate = {"type":type,"name":name,"isValueInputByChoose":isValueInputByChoose,"isSearchable":isSearchable,"isSingleValue":isSingleValue,"valueList":valueList};
                    $.ajax({
			            type:"POST",
			            url:"/admin/parameter/save",
			            data:subDate,
			            success:function(data){
					        if(data.code == 0){
					            alert("参数添加成功！");
					            location.reload();
					        }else{
					            alert(data.message);
					        }
			            }
		            });
                });
            });