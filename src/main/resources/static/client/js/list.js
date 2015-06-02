function addCollect(goodsId)
{
    if (undefined == goodsId)
    {
        return;
    }
    
    $.ajax({
        type:"post",
        url:"/user/collect/add",
        data:{"goodsId": goodsId},
        success:function(res){
            $('#dd_' + goodsId).html("<span>"+res.message+"</span>");
            $('#dd_' + goodsId).css("display", "block");
            
            // 需登录
            if (res.code==1)
            {
                setTimeout(function(){
                    window.location.href = "/login";
                }, 1000); 
            }
            else
            {
                setTimeout(function(){
                    $('#dd_' + goodsId).css("display", "none");
                }, 5000);
            }
        }
    });
}
