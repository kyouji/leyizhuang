jQuery(function($) {
    
    var detailEditor;
    
    // 商品详情编辑框
    KindEditor.ready(function(K) {
        detailEditor = K.create('textarea[name="detailArea"]', {
            allowFileManager : false,
            uploadJson: "/admin/product/upload"
        });
    });
    
    // 新增版本
    var versionHtml = $("#versionList").html();
    $("#id-add-version").click(function(){
        $("#versionList").append(versionHtml);
        
        // 删除版本
        $(".del-version").click(function(){
            if ($(".del-version").length > 1)
            {
                $(this).parent().parent().remove();
            }
        });
    });
    
    // 点击限时抢购
    $("#isFlashSale").click(function(){
        if ($(this).prop("checked"))
        {
            $("#flash-sale-input").css("display", "block");
        }
        else
        {
            $("#flash-sale-input").css("display", "none");
        }
    });
    
    // 选择日期
    $('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
        $(this).prev().focus();
    });
    
    // 选择时间
    $('.time-picker').timepicker({
        minuteStep: 1,
        showSeconds: true,
        showMeridian: false
    }).next().on(ace.click_event, function(){
        $(this).prev().focus();
    });
    
    // 添加商品组合
    var combinationHtml = $("#combinationList").html();
    $("#id-add-comb").click(function(){
        $("#combinationList").append(combinationHtml);
        
        // 删除组合商品
        $(".del-combination").click(function(){
            $(this).parent().parent().remove();
        });
        
        // 重新绑定事件
        $(".combi-type").unbind();
        $(".combi-type").change(function(){
            var combiType = $(this);
            var combiName = combiType.siblings("select.combi-name");
            
            if ($(this).val() != "")
            {
                $.ajax({
                    type:"GET",
                    url:"/admin/product/list/type/" + $(this).val(),
                    success:function(productList){
                        // 清空商品名称下拉框
                        combiName.empty();
                        
                        combiName.append('<option value="">请选择</option>');
                        
                        var i;
                        for (i=0; i<productList.length; i++)
                        {
                            combiName.append('<option id="'+i
                                    +'" value="'+productList[i].id
                                    +'">'+productList[i].name+'</option>');
                        }
                        
                        // 选择完商品名称后
                        $(".combi-name").change(function(){
                            var combiVersion = $(this).siblings("select.combi-version");
                            var combiOriginPrice = $(this).siblings(".combi-origin-price");
                            var combiPrice = $(this).siblings(".combi-price");
                            
                            var verList = productList[$(this).children('option:selected').attr("id")].versionList;
                            combiVersion.empty();
                            combiOriginPrice.val("");
                            combiPrice.val("");
                            
                            if (1 == verList.length)
                            {
                                combiVersion.append('<option value="'+verList[0].id+'">'
                                                    + verList[0].name + " "
                                                    + verList[0].capacity + " "
                                                    + verList[0].color + " "
                                                    +'</option>');
                                combiOriginPrice.val(verList[0].salePrice);
                            }
                            else
                            {
                                combiVersion.append('<option value="">请选择</option>');
                                var j;
                                for (j=0; j<verList.length; j++)
                                {
                                    combiVersion.append('<option id="' + j
                                                        +'" value="'+verList[j].id
                                                        + '">'
                                                        + verList[j].name + " "
                                                        + verList[j].capacity + " "
                                                        + verList[j].color + " "
                                                        +'</option>');
                                }
                                
                                // 选择版本后给出原价
                                $(".combi-version").change(function(){
                                    $(this).siblings(".combi-origin-price").val(verList[$(this).children('option:selected').attr("id")].salePrice);
                                });
                            }
                        });
                    }
                });
            }
        });
    });
    
    // 选择商品类型
    $("#type").change(function(){
        if ($(this).val() != "")
        {
            $.ajax({
                type:"GET",
                url:"/admin/product/property/" + $(this).val(),
                success:function(data){
                    $("#property-section").html(data);
                    
                    // 单选 
                    $(".selectProp").click(function(){
                        $(this).siblings().removeClass("spon");
                        $(this).addClass("spon");
                    });
                    
                    // 多选
                    $(".multiSelectProp").click(function(){
                        $(this).toggleClass("spon");
                    });
                }
            });
        }
        
    });
    
    // 组合商品选择商品类型
    $(".combi-type").change(function(){
        var combiType = $(this);
        var combiName = combiType.siblings("select.combi-name");
        
        if ($(this).val() != "")
        {
            $.ajax({
                type:"GET",
                url:"/admin/product/list/type/" + $(this).val(),
                success:function(productList){
                    // 清空商品名称下拉框
                    combiName.empty();
                    
                    combiName.append('<option value="">请选择</option>');
                    
                    var i;
                    for (i=0; i<productList.length; i++)
                    {
                        combiName.append('<option id="'+i
                                +'" value="'+productList[i].id
                                +'">'+productList[i].name+'</option>');
                    }
                    
                    // 选择完商品名称后
                    $(".combi-name").change(function(){
                        var combiVersion = $(this).siblings("select.combi-version");
                        var combiOriginPrice = $(this).siblings(".combi-origin-price");
                        var combiPrice = $(this).siblings(".combi-price");
                        
                        var verList = productList[$(this).children('option:selected').attr("id")].versionList;
                        combiVersion.empty();
                        combiOriginPrice.val("");
                        combiPrice.val("");
                        
                        if (1 == verList.length)
                        {
                            combiVersion.append('<option value="'+verList[0].id+'">'
                                                + verList[0].name + " "
                                                + verList[0].capacity + " "
                                                + verList[0].color + " "
                                                +'</option>');
                            combiOriginPrice.val(verList[0].salePrice);
                        }
                        else
                        {
                            combiVersion.append('<option value="">请选择</option>');
                            var j;
                            for (j=0; j<verList.length; j++)
                            {
                                combiVersion.append('<option id="' + j
                                                    +'" value="'+verList[j].id
                                                    + '">'
                                                    + verList[j].name + " "
                                                    + verList[j].capacity + " "
                                                    + verList[j].color + " "
                                                    +'</option>');
                            }
                            
                            // 选择版本后给出原价
                            $(".combi-version").change(function(){
                                $(this).siblings(".combi-origin-price").val(verList[$(this).children('option:selected').attr("id")].salePrice);
                            });
                        }
                    });
                }
            });
        }
    });
    
    // 返回上一级
    $(".back").click(function(){
        $("#id-table").siblings().addClass("hide");
        $("#id-table").removeClass("hide");
    });
    
	// 每页数量
	var pageSize = 15;
	
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
				url:"/admin/product/page/" + pageIndex,
				success:function(data){
					$("#id-tbody").html(data);
				}
			});
		}
		
	});
	
	
	
	// 图片显示
    $('#coverImage').ace_file_input({
        style : 'well',
        no_file : '无图片',
        btn_choose : '单选',
        btn_change : '单击可更换',
        droppable : false,
        onchange : null,
        thumbnail : 'fit', // false | true | large
        whitelist : 'gif|png|jpg|jpeg'
    // blacklist:'exe|php'
    // onchange:''
    //
    });
    
    $('.show-picture').ace_file_input({
        style : 'well',
        btn_choose : '多选',
        btn_change : null,
        no_icon : 'icon-picture',
        droppable : true,
        thumbnail : 'fit'// small | large | fit,
        // ,icon_remove:null//set null, to hide remove/reset button
        /**
         * ,before_change:function(files, dropped) { //Check an example below
         * //or examples/file-upload.html return true; }
         */
        /**
         * ,before_remove : function() { return true; }
         */
        ,
        preview_error : function(filename, error_code) {
            // name of the file that failed
            // error_code values
            // 1 = 'FILE_LOAD_FAILED',
            // 2 = 'IMAGE_LOAD_FAILED',
            // 3 = 'THUMBNAIL_FAILED'
            // alert(error_code);
        }

    }).on('change', function() {
        // console.log($(this).data('ace_input_files'));
        // console.log($(this).data('ace_input_method'));
    });
	
	// 点击新增
	$("#button-add").click(function(){
		$("#id-add").siblings().addClass("hide");
		$("#id-add").removeClass("hide");
	});
	
	$("#add-submit").click(function(){
        var i;
        
        // 填充单选参数
        var singleProp = $("a.selectProp.spon");
        for (i=0; i<singleProp.length; i++)
        {
            var text = singleProp.eq(i).html();
            singleProp.eq(i).siblings("input").val(text);
        }
        
        // 填充多选参数
        var multiProp = $("a.multiSelectProp.spon");
        multiProp.siblings("input").val("");
        for (i=0; i<multiProp.length; i++)
        {
            var inputValue = multiProp.eq(i).siblings("input").val();
            var text = multiProp.eq(i).html();
            
            multiProp.eq(i).siblings("input").val(inputValue + text + ";");
        }
        
        var formData = new FormData($('#fm-add')[0]);
        var detailContent = detailEditor.html();
        
        // 填充商品详情
        formData.append("detail", detailContent);

        
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
	});
	/*
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
	*/
   
});

// 修改
function modify(id) 
{
    /*
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
    */
}

// 删除
function destroy(id) 
{
	if(window.confirm('确定要删除吗？')){
		
		$.ajax({
	        url: '/admin/product/delete/' + id,
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