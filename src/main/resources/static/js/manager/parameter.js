    
// 新增参数
$("#id-new-param").click(function() {
    $("#id-table").addClass("hide");
    $("#id-add").removeClass("hide");
});

// 返回上一级
$(".back").click(function() {
    $("#id-table").siblings().addClass("hide");
    $("#id-table").removeClass("hide");
});

// 全选
$("#id-all-check").click(function() {
    $(".tr-check").prop("checked", true);
});

// 反选
$("#id-all-uncheck").click(function() {
    $(".tr-check").prop("checked", false);
});

// 删除选中
$("#id-delete").click(function(){
    var items = $(".tr-check:checked");
    var i;
    var str="";
    
    for (i=0; i<items.length; i++)
    {
        str += items.eq(i).val();
        str += ",";
    }
    
    if ("" == str)
    {
        return;
    }
            
    $.ajax({
        url : '/admin/parameter/destroy/',
        type : 'POST',
        success : function() {
            alert("删除成功");
            location.reload();
        }
    }); // ajax
});

// 删除类型
function destroy(id) {
    if (window.confirm('确定要删除该参数吗？')) {

        $.ajax({
            url : '/admin/parameter/destroy/'+id,
            type : 'POST',
            success : function() {
                alert("删除成功");
                location.reload();
            }
        });

        return true;
    } else {
        return false;
    }
}

// 参数修改  zackma-20150204
/*function modify(id) {

    $.ajax({
        url : '/admin/parameter/modify'+id,
        type : 'POST',
        data : id,
        success : function(data) {
            $("#id-modify").siblings().addClass("hide");
            $("#id-modify").html(data);
            $("#id-modify").removeClass("hide");
        
            // 返回上一级
            $(".back").click(function() {
                $("#id-table").siblings().addClass("hide");
                $("#id-table").removeClass("hide");
            });
        
            //修改后文本框变色显示变色  zackma-20150204
            var link = window.location.href;
            if(link.indexOf("modify")>0){
	            $(".addinput-form input").change(function(){
	            	$("input").css({"background-color":"#ffffcc"});
	            });
	            $(".addinput-form select").change(function(){
	            	$("select").css({"background-color":"#ffffcc"});
	            });
	            $(".addinput-form textarea").change(function(){
	                $("textarea").css({"background-color":"#ffffcc"});	
	            });
            }
             
            // 修改提交  zackma-20150204
            $("#m-submit").click(
                    var type = $("form #type").val();
                    var name = $("form #name").val();
                    var input_type = $("form #input_type:selected").val();
                    var isSearchable = $("#searchable:checked").val();
                    var isSingleValue = $("#multiple:checked").val();
                    var valueList = $("form #param_list").val();
                    if(type==""||name==""||input_type==""||isSearchable==""||isSingleValue==""||valueList==""){
			            alert("请填写完整参数！");
			        return;
		            }
                    
                    var modiDate = {"type":type,"name":name,"input_type":input_type,"isSearchable":isSearchable,"isSingleValue":isSingleValue,"valueList":valueList};
                    $.ajax({
                        url : '/admin/parameter/save',
                        type : 'POST',
                        data : modiDate,
                        success : function(data) {
                            if (0 == data.code) {
                                alert("修改成功");
                                location.reload();
                            } else {
                                alert(data.message);
                            }
                        }
                    });
                });
                }
            });
}
*/


