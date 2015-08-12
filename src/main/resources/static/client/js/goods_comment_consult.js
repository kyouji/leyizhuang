

// 按星级获取评论
function getCommentByStars(goodsId, stars, page)
{
    if (null == goodsId || null == stars || null == page)
    {
        return;
    }
    
    $.ajax({
        type:"post",
        url:"/goods/comment/" + goodsId + "?stars=" + stars + "&page=" + page,
        success:function(res){
        	$("#the_comment").html(res);
            <!-- $("#comment-list").html(res);  -->
        }
    });
}

//获取咨询
function getConsult(goodsId, page)
{
    if (null == goodsId || null == page)
    {
        return;
    }
    
    $.ajax({
        type:"post",
        url:"/goods/consult/" + goodsId + "?page=" + page,
        success:function(res){
            $("#consult-list").html(res);
        }
    });
}


//提交咨询
function submitConsult()
{
	var goodsId =  $('#goodsId').val();
	var content = $('#consult').val();
    $.ajax({
        type:"post",
        url:"/user/consult/add?goodsId=" +goodsId+"&content="+content,
        success:function(res){
            if (0 == res.code)
            {
                alert("提交咨询成功，请耐心等待审核~~");
            }
            else
            {
                var ss = "" + res.message;
                alert(res["message"]);
            }
        }
    });
}

// 改变星级
function starChange(type, stars)
{
    if (null == type || null == stars)
    {
        return;
    }
    
    var starCount = parseInt(stars);
    
    // 商品满意度
    if ("goodsStar" == type)
    {
        $("#goodsStar").val(starCount);
        switch(starCount)
        {
        case 1:
            $("a.goodsStar").eq(0).html('<img src="/client/images/content/start01.png" />');
            $("a.goodsStar").eq(1).html('<img src="/client/images/content/start03.png" />');
            $("a.goodsStar").eq(2).html('<img src="/client/images/content/start03.png" />');
            $("a.goodsStar").eq(3).html('<img src="/client/images/content/start03.png" />');
            $("a.goodsStar").eq(4).html('<img src="/client/images/content/start03.png" />');
            break;
        case 2:
            $("a.goodsStar").eq(0).html('<img src="/client/images/content/start01.png" />');
            $("a.goodsStar").eq(1).html('<img src="/client/images/content/start01.png" />');
            $("a.goodsStar").eq(2).html('<img src="/client/images/content/start03.png" />');
            $("a.goodsStar").eq(3).html('<img src="/client/images/content/start03.png" />');
            $("a.goodsStar").eq(4).html('<img src="/client/images/content/start03.png" />');
            break;
        case 3:
            $("a.goodsStar").eq(0).html('<img src="/client/images/content/start01.png" />');
            $("a.goodsStar").eq(1).html('<img src="/client/images/content/start01.png" />');
            $("a.goodsStar").eq(2).html('<img src="/client/images/content/start01.png" />');
            $("a.goodsStar").eq(3).html('<img src="/client/images/content/start03.png" />');
            $("a.goodsStar").eq(4).html('<img src="/client/images/content/start03.png" />');
            break;
        case 4:
            $("a.goodsStar").eq(0).html('<img src="/client/images/content/start01.png" />');
            $("a.goodsStar").eq(1).html('<img src="/client/images/content/start01.png" />');
            $("a.goodsStar").eq(2).html('<img src="/client/images/content/start01.png" />');
            $("a.goodsStar").eq(3).html('<img src="/client/images/content/start01.png" />');
            $("a.goodsStar").eq(4).html('<img src="/client/images/content/start03.png" />');
            break;
        case 5:
            $("a.goodsStar").eq(0).html('<img src="/client/images/content/start01.png" />');
            $("a.goodsStar").eq(1).html('<img src="/client/images/content/start01.png" />');
            $("a.goodsStar").eq(2).html('<img src="/client/images/content/start01.png" />');
            $("a.goodsStar").eq(3).html('<img src="/client/images/content/start01.png" />');
            $("a.goodsStar").eq(4).html('<img src="/client/images/content/start01.png" />');
            break;
        default:
            $("a.goodsStar").eq(0).html('<img src="/client/images/content/start03.png" />');
            $("a.goodsStar").eq(1).html('<img src="/client/images/content/start03.png" />');
            $("a.goodsStar").eq(2).html('<img src="/client/images/content/start03.png" />');
            $("a.goodsStar").eq(3).html('<img src="/client/images/content/start03.png" />');
            $("a.goodsStar").eq(4).html('<img src="/client/images/content/start03.png" />');    
        }
    }
}