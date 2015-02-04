    
    // 新增参数
    $("#id-new-param").click(function() {
        $("#id-table").addClass("hide");
        $("#id-add").removeClass("hide");
        $(".row").css({'margin':'0 15px'});
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