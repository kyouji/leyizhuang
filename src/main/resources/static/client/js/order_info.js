// 选择收货地址
function selectAddress(self, id)
{
    $(self).siblings().removeClass("current_address");
    $(self).addClass("current_address");
    $("#input-address-id").val(id);
}

function pointChange(self, point, total)
{
    if (null == point || null == total)
    {
        return;
    }
    
    var goodsFee = parseFloat($("#goodsFee").html());//商品价格
    var payTypeFee = parseFloat($("#payTypeFee").html());//手续费
    
    var p = parseInt(point);
    var t = parseInt(total);
    
    if (p > t)
    {
        alert("最多使用积分" + t + "分");
        self.value = 0;
        
        $("#pointUse").html(0);
        $("#totalPrint").html(goodsFee + payTypeFee - 0 - payTypeFee);
        
        return;
    }
    
    self.value = point;
    
    $("#pointUse").html(point);
    $("#totalPrice").html(goodsFee + payTypeFee - point - payTypeFee);
}