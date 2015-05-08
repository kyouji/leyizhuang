$(document).ready(function(){

    var toggleSelect = function()
    {
        $.ajax({
            type:"post",
            url:"/cart/toggleSelect",
            data:{"id":$(this).attr("cgid")},
            success:function(data){
                $(".page-main").html(data);
                
                initClicks();
            }
        });
    }
    
    var toggleAll = function()
    {
        $.ajax({
            type:"post",
            url:"/cart/toggleAll",
            data:{"sid":$(this).attr("sid")},
            success:function(data){
                $(".page-main").html(data);
                
                initClicks();
            }
        });
    }
    
    var numIncrease = function()
    {
        $.ajax({
            type:"post",
            url:"/cart/numberAdd",
            data:{"id":$(this).attr("cgid")},
            success:function(data){
                $(".page-main").html(data);
                
                initClicks();
            }
        });
    }
    
    var numDecrease = function()
    {
        $.ajax({
            type:"post",
            url:"/cart/numberMinus",
            data:{"id":$(this).attr("cgid")},
            success:function(data){
                $(".page-main").html(data);
                
                initClicks();
            }
        });
    }
    
    var delGoods = function()
    {
        $.ajax({
            type:"post",
            url:"/cart/del",
            data:{"id":$(this).attr("cgid")},
            success:function(data){
                $(".page-main").html(data);
                
                initClicks();
            }
        });
    }
    
    var initClicks = function(){
        // 点击商品选择框
        $(".duoxuank").click(toggleSelect);
        // 点击全选
        $("#all-select").click(toggleAll);
        // 数量加1
        $(".num_add").click(numIncrease);
        // 数量减1
        $(".num_minus").click(numDecrease);
        // 点击删除
        $(".gwc_delete").click(delGoods);
    }
    
    initClicks();
});

function goNext(goodsNum)
{
    if (0==goodsNum)
    {
        alert("请至少选择一种商品!");
        return false;
    }
    window.location.href="/order/info";
}