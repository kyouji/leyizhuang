jQuery(function($) {
    
    // 返回上一级
    $(".back").click(function(){
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
    
	// 每页数量
	var pageSize = 5;
	
	// 分页
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
				url:"/admin/product/type/page/" + pageIndex,
				success:function(data){
					$("#id-tbody").html(data);
				}
			});
		}
		
	});
	
	// 点击新增
	$("#button-add").click(function(){
		$("#id-add").siblings().addClass("hide");
		$("#id-add").removeClass("hide");
	});
	
	var props = $("#new-property").html();
	
	// 点击加号添加属性
	$("a.icon-plus").click(function(){
	    $("#new-property").append(props);

	    // 选择完属性类型
	    $(".prop-type-select").change(function(){
	        var propDiv = $(this);
	        
	        $.ajax({
	            url: '/admin/product/type/param/add/' + $(this).val(),
	            type: 'POST',
	            success: function (data) {
	                propDiv.siblings().eq(0).html(data);
	                
	                // 点击属性
	                propDiv.siblings().find(".add.multiSelectProp").click(function(){
	                    $(this).toggleClass("spon");
	                });
	            }
	        }); // ajax
	    }); // change
	}); // click
	
	// 选择完属性类型
	$(".prop-type-select").change(function(){
	    var propDiv = $(this);
	    
	    $.ajax({
            url: '/admin/product/type/param/add/' + $(this).val(),
            type: 'POST',
            success: function (data) {
                propDiv.siblings().eq(0).html(data);
                
                // 点击属性
                $(".add.multiSelectProp").click(function(){
                    $(this).toggleClass("spon");
                });
            }
        }); // ajax
	}); // change
	
	// 提交
	$("#add-submit").click(function(){
	    var propStr = "";
		var props = $(".add.multiSelectProp.spon");
		
		if ("" == $("#name").val())
		{
			alert("请填写名称");
			return;
		}
	
		var i;
		for (i=0; i<props.length; i++)
		{
			var str = props.eq(i).attr("value");
			if ("" != str)
			{
			    propStr += str;
			    propStr += ",";
			}
		}

        $("#propIds").val(propStr);
		
		var data = $('#fm-add').serialize();
        
        $.ajax({
            url: '/admin/product/type/save',
            type: 'POST',
            dataType: "json", 
            data: data,
            success: function (res) {
                
                if (0 == res.code)
                {
                    alert("添加成功");
                    location.reload();
                }
                else
                {
                    alert(res.message);
                }
            }
        });
		
	});
   
});

// 修改
function modify(id) 
{
	$.ajax({
        url: '/admin/product/type/modify/' + id,
        type: 'POST',
        success: function (data) {
        	$("#id-modify").siblings().addClass("hide");
        	$("#id-modify").html(data);
        	$("#id-modify").removeClass("hide");
        	
        	// 返回上一级
        	$(".back").click(function(){
        		$("#id-table").siblings().addClass("hide");
        		$("#id-table").removeClass("hide");
        	});
        	
        	// 点击属性
            $(".modify.multiSelectProp").click(function(){
                $(this).toggleClass("spon");
            });
            
        	var props = $("#modify-property").html();
            
            // 点击加号添加属性
            $("a.icon-plus").click(function(){
                $("#modify-property").append(props);

                // 选择完属性类型
                $(".prop-type-select").change(function(){
                    var propDiv = $(this);
                    
                    $.ajax({
                        url: '/admin/product/type/param/modify/' + $(this).val(),
                        type: 'POST',
                        success: function (data) {
                            propDiv.siblings().eq(0).html(data);
                            
                            // 点击属性
                            propDiv.siblings().find(".multiSelectProp").click(function(){
                                $(this).toggleClass("spon");
                            });
                        }
                    }); // ajax
                }); // change
            }); // click
            
            // 选择完属性类型
            $(".prop-type-select").change(function(){
                var propDiv = $(this);
                
                $.ajax({
                    url: '/admin/product/type/param/modify/' + $(this).val(),
                    type: 'POST',
                    success: function (data) {
                        propDiv.siblings().eq(0).html(data);
                        
                        // 点击属性
                        propDiv.siblings().find(".multiSelectProp").click(function(){
                            $(this).toggleClass("spon");
                        });
                    }
                }); // ajax
            }); // change
        	
            
            // 提交
        	$("#modify-submit").click(function(){
        	    var propStr = "";
                var props = $(".modify.multiSelectProp.spon");
                
                if ("" == $("#m-name").val())
                {
                    alert("请填写名称");
                    return;
                }
            
                var i;
                for (i=0; i<props.length; i++)
                {
                    var str = props.eq(i).attr("value");
                    if ("" != str && -1 == propStr.indexOf(str+","))
                    {
                        propStr += str;
                        propStr += ",";
                    }
                }

                $("#m-propIds").val(propStr);
                
                var data = $('#fm-modify').serialize();
                
                $.ajax({
                    url: '/admin/product/type/save',
                    type: 'POST',
                    dataType: "json", 
                    data: data,
                    success: function (res) {
                        
                        if (0 == res.code)
                        {
                            alert("修改成功");
                            location.reload();
                        }
                        else
                        {
                            alert(res.message);
                        }
                    }
                });// ajax
        	}); // modify-submit
        }
    });
}

// 删除
function destroy(id) 
{
	if(window.confirm('确定要删除吗？')){
		
		$.ajax({
	        url: '/admin/product/type/delete/' + id,
	        type: 'POST',
	        success: function () {
	        	location.reload();
	        }
	    });
		return true;
    }else{
        return false;
    }
}