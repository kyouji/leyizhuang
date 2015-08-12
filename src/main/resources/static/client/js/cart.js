// 点击复选框
function toggleSelect(id)
{
    $.ajax({
        type:"post",
        url:"/cart/toggleSelect",
        data:{"id":id},
        success:function(data){
            $("#cart-main").html(data);
        }
    });
}

// 点击全选框
function toggleAllSelect(sid)
{
    $.ajax({
        type:"post",
        url:"/cart/toggleAll",
        data:{"sid":sid},
        success:function(data){
            $("#cart-main").html(data);
        }
    });
}

// 商品数量加1
function addNum(id)
{
	
    $.ajax({
        type:"post",
        url:"/cart/numberAdd",
        data:{"id":id},
        success:function(data){
            $("#cart-main").html(data);
        }
    });
}

// 商品数量减1
function minusNum(cartId)
{
    $.ajax({
        type:"post",
        url:"/cart/numberMinus",
        data:{"id":cartId},
        success:function(data){
            $("#cart-main").html(data);
        }
    });
}

function delCartItem(id)
{
    if (null == id)
    {
        return;
    }
    
    $.ajax({
        type:"post",
        url:"/cart/del",
        data:{"id": id},
        success:function(data){
            $("#cart-main").html(data);
        }
    });
}

function goNext(goodsNum)
{
    if (0==goodsNum)
    {
        alert("请至少选择一种商品!");
        return false;
    }
    window.location.href="/order/info";
}