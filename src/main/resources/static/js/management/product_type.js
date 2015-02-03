jQuery(function($) {
	
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
	
	// 点击加号添加属性
	$("a.icon-plus").click(function(){
	    $("#new-property").append($("#property-show").html());
	    
	});
	
	// 选择完属性类型
	$("#prop-type-select").change(function(){
	    var propDiv = $(this);
	    
	    $.ajax({
            url: '/admin/product/type/param/'+$(this).val(),
            type: 'POST',
            success: function (data) {
                propDiv.parent().siblings().eq(0).html(data);
            }
        });
	});
	
	// 提交
	$("#add-submit").click(function(){
	    /*
		var typeStr = "";
		var types = $(".add.selectProp");
		
		if ("" == $("#name").val())
		{
			alert("请填写名称");
			return;
		}
	
		var i;
		for (i=0; i<types.length; i++)
		{
			if (types.eq(i).hasClass("spon"))
			{
				var str = types.eq(i).html();
				if ("" != str)
				{
					typeStr += str;
					typeStr += ",";
				}
			}
		}
		
		if ("" == typeStr)
		{
			alert("请选择关联类型");
			return;
		}
		
		$("#type").val(typeStr);
		
		var formData = new FormData($('#fm-add')[0]);
        
        $.ajax({
            url: '/admin/goods/prop/2/save',
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
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
        */
	});
	
	// 返回上一级
	$(".back").click(function(){
		$("#id-table").siblings().addClass("hide");
		$("#id-table").removeClass("hide");
	});
   
});

// 修改
function modify(id) 
{
    /*
	var formData = new FormData();
	formData.append("id", id);
	
	$.ajax({
        url: '/admin/goods/prop/2/modify',
        type: 'POST',
        data: formData,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success: function (data) {
        	$("#id-modify").siblings().addClass("hide");
        	$("#id-modify").html(data);
        	$("#id-modify").removeClass("hide");
        	
        	// 返回上一级
        	$(".back").click(function(){
        		$("#id-table").siblings().addClass("hide");
        		$("#id-table").removeClass("hide");
        	});
        	
            // 选择关联类型
            $(".selectProp").click(function(){
                $(this).toggleClass("spon");
            });
            
            // 提交
        	$("#modify-submit").click(function(){
        		var typeStr = "";
        		var types = $(".modify.selectProp");
        		
        		if ("" == $("#m-name").val())
        		{
        			alert("请填写名称");
        			return;
        		}
        	
        		var i;
        		for (i=0; i<types.length; i++)
        		{
        			if (types.eq(i).hasClass("spon"))
        			{
        				var str = types.eq(i).html();
        				if ("" != str)
        				{
        					typeStr += str;
        					typeStr += ",";
        				}
        			}
        		}
        		
        		if ("" == typeStr)
        		{
        			alert("请选择关联类型");
        			return;
        		}
        		
        		$("#m-type").val(typeStr);
        		
        		var formData = new FormData($('#fm-modify')[0]);
                
                $.ajax({
                    url: '/admin/goods/prop/2/save',
                    type: 'POST',
                    data: formData,
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,
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
                });
        	});
        }
    });
    */
}

// 删除
function destroy(id) 
{
    /*
	if(window.confirm('确定要删除吗？')){
		var formData = new FormData();
		formData.append("id", id);
		
		$.ajax({
	        url: '/admin/goods/prop/2/delete',
	        type: 'POST',
	        success: function () {
	        	location.reload();
	        }
	    });
		
		return true;
    }else{
        return false;
    }
    */
}