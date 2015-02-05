
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

//分页
$("#id-pagination").pagination($("#id-total-num").val(), {
	num_display_entries : 2, 
	num_edge_entries : 3,
	current_page : 0,
	items_per_page : pageSize,
	prev_text : "上一页",
	next_text : "下一页",
	showGo:true,
	showSelect:true,
	callback : function(pageIndex) {
		$.ajax({
			type:"GET",
			url:"/admin/parameter/page/" + pageIndex,
			success:function(data){
				$("#id-tbody").html(data);
			}
		});
	}
	
});

// 删除参数
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
function modify(id) {

    $.ajax({
        url : '/admin/parameter/modify/'+id,
        type : 'POST',
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
            $(".addinput-form input").change(function(){
            	$("input").css({"background-color":"#ffffcc"});
            });
            $(".addinput-form select").change(function(){
            	$("select").css({"background-color":"#ffffcc"});
            });
            $(".addinput-form textarea").change(function(){
                $("textarea").css({"background-color":"#ffffcc"});	
            });
             
            // 修改提交  zackma-20150204
            $("#m-submit").click(function(){
                    var type = $("form #m-type").val();
                    var name = $("form #m-name").val();
                    var isValueInputByChoose = $("form #m-input_type option:selected").val();
                    var isSearchable = $("#m-searchable:checked").val();
                    var isSingleValue = $("#m-multiple:checked").val();
                    var valueList = $("form #m-param_list").val();
                    if(type==""||name==""||isValueInputByChoose==""||isSearchable==""||isSingleValue==""||valueList==""){
			            alert("请填写完整参数！");
			        return;
		            }
                    
                    var modiDate = {"type":type,"name":name,"isValueInputByChoose":isValueInputByChoose,"isSearchable":isSearchable,"isSingleValue":isSingleValue,"valueList":valueList};
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


