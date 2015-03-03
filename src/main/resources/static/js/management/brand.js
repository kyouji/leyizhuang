jQuery(function($) {
	// 新增品牌
	$("#id-new-brand").click(function() {
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
	
	// 点击关联类型
	$(".multiSelectProp").click(function(){
        $(this).toggleClass("spon");
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
	        url : '/admin/brand/delete/',
	        type : 'POST',
	        success : function() {
	            location.reload();
	        }
	    }); // ajax
	});
	
	// 每页数量
	var pageSize = 15;
	
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
				url:"/admin/brand/page/" + pageIndex,
				success:function(data){
					$("#id-tbody").html(data);
				}
			});
		}
		
	});
	
	// 图片显示
    $('.brand-picture').ace_file_input({
        style:'well',
        btn_choose:'点击选择',
        btn_change:null,
        no_icon:'icon-picture',
        droppable:true,
        thumbnail:'fit'//small | large | fit

    }).on('change', function(){
    });

    $("#add-submit").click(function(){
        // 填充多选参数
        var multiProp = $("a.multiSelectProp.spon");
        multiProp.siblings("input").val("");
        for (i=0; i<multiProp.length; i++)
        {
            var inputValue = multiProp.eq(i).siblings("input").val();
            var text = multiProp.eq(i).html();
            
            multiProp.eq(i).siblings("input").val(inputValue + text + ",");
        }
        
        var formData = new FormData($('#fm-add')[0]);
        
        $.ajax({
            url : '/admin/brand/save',
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
       
//        $.ajax({
//            type:"POST",
//            url:"/admin/brand/save",
//            data:subDate,
//            success:function(data){
//                if(data.code == 0){
//                    alert("品牌添加成功！");
//                    location.reload();
//                }else{
//                    alert(data.message);
//                }
//            }
//        });
    });
});
	
// 删除参数
function destroy(id) {
    if (window.confirm('确定要删除该参数吗？')) {

        $.ajax({
            url : '/admin/brand/delete/'+id,
            type : 'POST',
            success : function() {
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
        url : '/admin/brand/modify/'+id,
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
            
            // 图片显示
            $('.m-brand-picture').ace_file_input({
                style:'well',
                btn_choose:'点击更换',
                btn_change:null,
                no_icon:'icon-picture',
                droppable:true,
                thumbnail:'fit'//small | large | fit

            }).on('change', function(){
            	$("#old-pic").addClass("hide");
            });   
            
            //修改后文本框变色显示变色  zackma-20150204
            $(".addinput-form #m-type").change(function(){
            	$("#m-type").css({"background-color":"#ffffdb"});
            });
            $(".addinput-form #m-name").change(function(){
            	$("#m-name").css({"background-color":"#ffffdb"});
            });
             
            // 修改提交  zackma-20150204
            $("#m-submit").click(function(){
            	    var id = $("form #m-id").val();
                    var type = $("form #m-type").val();
                    var name = $("form #m-name").val();
                    var logoUri = $("form .m-brand-picture").val();
                    var isRecommend = $("#m-recommend:checked").val();
                    if(type==""||name==""||isRecommend==""){
			            alert("请填写完整品牌信息！");
			        return;
		            }
                    
                    var modiDate = {"id":id,"type":type,"name":name,"logoUri":logoUri,"isRecommend":isRecommend};
                    $.ajax({
                        url : '/admin/brand/save',
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


