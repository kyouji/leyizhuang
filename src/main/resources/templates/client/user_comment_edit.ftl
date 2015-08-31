<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客</title>
<meta name="keywords" content="${site.seoKeywords!''}" />
<meta name="description" content="${site.seoDescription!''}" />
<meta name="copyright" content="正品惠客" />
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/client/css/mycenter_base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/return_1.css"/>

<link rel="shortcut icon" href="/root/images/goods/zphk_logo.ico">
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/Validform_v5.3.2_min.js"></script>
<script src="/client/js/jquery.cityselect.js"></script>

<!--[if IE]>
   <script src="/client/js/html5.js"></script>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="/client/js/DD_belatedPNG_0.0.8a.js" ></script>
<script>
DD_belatedPNG.fix('.,img,background');
</script>
<![endif]-->

<script type="text/javascript">
  
  $(document).ready(function(){
       // menuDownList("top_phone","#top_phonelist",".a1","sel");
      //  phoneListMore();//单独下拉
    //    menuDownList("top_order","#top_orderlist",".a4","sel");//顶部下拉
    //    navDownList("navdown","li",".nav_showbox");
    //    menuDownList("mainnavdown","#navdown",".a2","sel");
    //    checkNowHover("shopping_down","shopping_sel");
    //初始化表单验证
    $(".commentForm").Validform({
        tiptype: 3,
        ajaxPost:true,
        callback: function(data) {
            if (data.code==0)
            {
                alert("提交评论成功");
                function countDown(secs){
                	  tiao.innerText=secs;
                	  if(--secs>0)
                	   setTimeout("countDown("+secs+")",1000);
                	  }
                	  countDown(3);
                window.location.href='/user/comment/list';
            }
            else
            {
                alert(data.message);
            }
        }
    });
});

function showCommentTr(i, j)
{
    $("#comment-tr" + i + j).toggleClass("hide");
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
            
        $(".goodsStar").val(starCount);
        switch(starCount)
        {
        case 1:
            $("a.goodsStar").eq(0).html('<img src="/client/images/start01.png" />');
            $("a.goodsStar").eq(1).html('<img src="/client/images/start03.png" />');
            $("a.goodsStar").eq(2).html('<img src="/client/images/start03.png" />');
            $("a.goodsStar").eq(3).html('<img src="/client/images/start03.png" />');
            $("a.goodsStar").eq(4).html('<img src="/client/images/start03.png" />');
            break;
        case 2:
            $("a.goodsStar").eq(0).html('<img src="/client/images/start01.png" />');
            $("a.goodsStar").eq(1).html('<img src="/client/images/start01.png" />');
            $("a.goodsStar").eq(2).html('<img src="/client/images/start03.png" />');
            $("a.goodsStar").eq(3).html('<img src="/client/images/start03.png" />');
            $("a.goodsStar").eq(4).html('<img src="/client/images/start03.png" />');
            break;
        case 3:
            $("a.goodsStar").eq(0).html('<img src="/client/images/start01.png" />');
            $("a.goodsStar").eq(1).html('<img src="/client/images/start01.png" />');
            $("a.goodsStar").eq(2).html('<img src="/client/images/start01.png" />');
            $("a.goodsStar").eq(3).html('<img src="/client/images/start03.png" />');
            $("a.goodsStar").eq(4).html('<img src="/client/images/start03.png" />');
            break;
        case 4:
            $("a.goodsStar").eq(0).html('<img src="/client/images/start01.png" />');
            $("a.goodsStar").eq(1).html('<img src="/client/images/start01.png" />');
            $("a.goodsStar").eq(2).html('<img src="/client/images/start01.png" />');
            $("a.goodsStar").eq(3).html('<img src="/client/images/start01.png" />');
            $("a.goodsStar").eq(4).html('<img src="/client/images/start03.png" />');
            break;
        case 5:
            $("a.goodsStar").eq(0).html('<img src="/client/images/start01.png" />');
            $("a.goodsStar").eq(1).html('<img src="/client/images/start01.png" />');
            $("a.goodsStar").eq(2).html('<img src="/client/images/start01.png" />');
            $("a.goodsStar").eq(3).html('<img src="/client/images/start01.png" />');
            $("a.goodsStar").eq(4).html('<img src="/client/images/start01.png" />');
            break;
        default:
            $("a.goodsStar").eq(0).html('<img src="/client/images/start03.png" />');
            $("a.goodsStar").eq(1).html('<img src="/client/images/start03.png" />');
            $("a.goodsStar").eq(2).html('<img src="/client/images/start03.png" />');
            $("a.goodsStar").eq(3).html('<img src="/client/images/start03.png" />');
            $("a.goodsStar").eq(4).html('<img src="/client/images/start03.png" />');    
        }
   
    }
    // 专业技能满意度
    else if ("skillStar" == type)
    {
        $("#skillStar").val(starCount);
        switch(starCount)
        {
        case 1:
            $("a.skillStar").eq(0).html('<img src="/client/images/content/start01.png" />');
            $("a.skillStar").eq(1).html('<img src="/client/images/content/start03.png" />');
            $("a.skillStar").eq(2).html('<img src="/client/images/content/start03.png" />');
            $("a.skillStar").eq(3).html('<img src="/client/images/content/start03.png" />');
            $("a.skillStar").eq(4).html('<img src="/client/images/content/start03.png" />');
            break;
        case 2:
            $("a.skillStar").eq(0).html('<img src="/client/images/content/start01.png" />');
            $("a.skillStar").eq(1).html('<img src="/client/images/content/start01.png" />');
            $("a.skillStar").eq(2).html('<img src="/client/images/content/start03.png" />');
            $("a.skillStar").eq(3).html('<img src="/client/images/content/start03.png" />');
            $("a.skillStar").eq(4).html('<img src="/client/images/content/start03.png" />');
            break;
        case 3:
            $("a.skillStar").eq(0).html('<img src="/client/images/content/start01.png" />');
            $("a.skillStar").eq(1).html('<img src="/client/images/content/start01.png" />');
            $("a.skillStar").eq(2).html('<img src="/client/images/content/start01.png" />');
            $("a.skillStar").eq(3).html('<img src="/client/images/content/start03.png" />');
            $("a.skillStar").eq(4).html('<img src="/client/images/content/start03.png" />');
            break;
        case 4:
            $("a.skillStar").eq(0).html('<img src="/client/images/content/start01.png" />');
            $("a.skillStar").eq(1).html('<img src="/client/images/content/start01.png" />');
            $("a.skillStar").eq(2).html('<img src="/client/images/content/start01.png" />');
            $("a.skillStar").eq(3).html('<img src="/client/images/content/start01.png" />');
            $("a.skillStar").eq(4).html('<img src="/client/images/content/start03.png" />');
            break;
        case 5:
            $("a.skillStar").eq(0).html('<img src="/client/images/content/start01.png" />');
            $("a.skillStar").eq(1).html('<img src="/client/images/content/start01.png" />');
            $("a.skillStar").eq(2).html('<img src="/client/images/content/start01.png" />');
            $("a.skillStar").eq(3).html('<img src="/client/images/content/start01.png" />');
            $("a.skillStar").eq(4).html('<img src="/client/images/content/start01.png" />');
            break;
        default:
            $("a.skillStar").eq(0).html('<img src="/client/images/content/start03.png" />');
            $("a.skillStar").eq(1).html('<img src="/client/images/content/start03.png" />');
            $("a.skillStar").eq(2).html('<img src="/client/images/content/start03.png" />');
            $("a.skillStar").eq(3).html('<img src="/client/images/content/start03.png" />');
            $("a.skillStar").eq(4).html('<img src="/client/images/content/start03.png" />');
                
        }
    }
    // 服务满意度
    else if ("serviceStar" == type)
    {
        $("#serviceStar").val(starCount);
        switch(starCount)
        {
        case 1:
            $("a.serviceStar").eq(0).html('<img src="/client/images/content/start01.png" />');
            $("a.serviceStar").eq(1).html('<img src="/client/images/content/start03.png" />');
            $("a.serviceStar").eq(2).html('<img src="/client/images/content/start03.png" />');
            $("a.serviceStar").eq(3).html('<img src="/client/images/content/start03.png" />');
            $("a.serviceStar").eq(4).html('<img src="/client/images/content/start03.png" />');
            break;
        case 2:
            $("a.serviceStar").eq(0).html('<img src="/client/images/content/start01.png" />');
            $("a.serviceStar").eq(1).html('<img src="/client/images/content/start01.png" />');
            $("a.serviceStar").eq(2).html('<img src="/client/images/content/start03.png" />');
            $("a.serviceStar").eq(3).html('<img src="/client/images/content/start03.png" />');
            $("a.serviceStar").eq(4).html('<img src="/client/images/content/start03.png" />');
            break;
        case 3:
            $("a.serviceStar").eq(0).html('<img src="/client/images/content/start01.png" />');
            $("a.serviceStar").eq(1).html('<img src="/client/images/content/start01.png" />');
            $("a.serviceStar").eq(2).html('<img src="/client/images/content/start01.png" />');
            $("a.serviceStar").eq(3).html('<img src="/client/images/content/start03.png" />');
            $("a.serviceStar").eq(4).html('<img src="/client/images/content/start03.png" />');
            break;
        case 4:
            $("a.serviceStar").eq(0).html('<img src="/client/images/content/start01.png" />');
            $("a.serviceStar").eq(1).html('<img src="/client/images/content/start01.png" />');
            $("a.serviceStar").eq(2).html('<img src="/client/images/content/start01.png" />');
            $("a.serviceStar").eq(3).html('<img src="/client/images/content/start01.png" />');
            $("a.serviceStar").eq(4).html('<img src="/client/images/content/start03.png" />');
            break;
        case 5:
            $("a.serviceStar").eq(0).html('<img src="/client/images/content/start01.png" />');
            $("a.serviceStar").eq(1).html('<img src="/client/images/content/start01.png" />');
            $("a.serviceStar").eq(2).html('<img src="/client/images/content/start01.png" />');
            $("a.serviceStar").eq(3).html('<img src="/client/images/content/start01.png" />');
            $("a.serviceStar").eq(4).html('<img src="/client/images/content/start01.png" />');
            break;
        default:
            $("a.serviceStar").eq(0).html('<img src="/client/images/content/start03.png" />');
            $("a.serviceStar").eq(1).html('<img src="/client/images/content/start03.png" />');
            $("a.serviceStar").eq(2).html('<img src="/client/images/content/start03.png" />');
            $("a.serviceStar").eq(3).html('<img src="/client/images/content/start03.png" />');
            $("a.serviceStar").eq(4).html('<img src="/client/images/content/start03.png" />');
                
        }
    }
}

function commentJump()
{
    window.location.href="/user/comment/list?statusId=" + $("#commentTypeSelect").val();
}
</script>

</head>
<body>
<#include "/client/common_user_header.ftl" />
<!-- 内容 -->
<div class="content"> 
  <!-- 左侧 -->
  <#include "/client/common_user_menu.ftl" />
  <!-- 右侧 -->
  <div class="content_2">
<div class="content_2_1">
  <ul>
    <li class="li_1">评价 </li>
    <li class="li_2"></li>
    <li class="li_3"></li>
  </ul>
</div>
<div class="content_2_2">
<div class="content_2_2_1">
  <div class="l_1">退货商品信息</div>
  <#if order_goods??>
  <div class="l_2"> 
    <dl>
      <dt><img src="${order_goods.goodsCoverImageUri!''}" title="${order_goods.goodsTitle!''}"/></dt>
      <dd><a href="/goods/${order_goods.goodsId!''}" target="_blank">${order_goods.goodsTitle!''}</a></dd>
    </dl>
  </div>
  <div class="l_3">
    <dl>
      <dt>单  价：${order_goods.price}元       ×${order_goods.quantity}(数量)</dt>
      <dd>小计：<span>${order_goods.quantity * order_goods.price}</span>元</dd>
    </dl>
  </div>
  </#if>
  <#if order_info??>
  <div class="l_4">订单信息</div>
      <div class="l_5">
        <ul>
          <li>订单编号：<span class="sp_1"><a href="/user/order?id=${order.id}">${order.orderNumber!''}</a></span> </li>
          <li>运费：${order_info.deliverTypeFee!0.00}元</li>
          <li>总计：<span class="sp_2">${order_info.totalPrice!'' }</span>元</li>
          <li>成交时间： ${order_info.orderTime!''}</li>
        </ul>
      </div>
  </#if>
</div>
<div class="content_2_2_2">
<div class="y_1"><label>我要评价</label>
 
</div>
<div class="y_2"></div>

   <form class="commentForm" action="/user/comment/add" method="post">
                                        <input type="hidden" name="orderId" value=${order_info.id} />
                                        <input type="hidden" name="ogId" value=${order_goods.id} />
                                        <input type="hidden" name="goodsId" value=${order_goods.goodsId} />
                            <div >
                            <div class="evaluate_box">
                                
                                <div style="height:60px;">
                                   <p style="margin-top:10px;">评价等级：</p>
                                   <div style="margin-top:10px;">
                                       <input class="ml20" type="radio" name="stars" value="3" datatype="n" nullmsg="请点击进行评价"/><span style="margin-right:20px;"> 好评</span>
                                       <input type="radio" name="stars" value="2" datatype="n" nullmsg="请点击进行评价"/><span style="margin-right:20px;"> 中评</span>
                                       <input type="radio" name="stars" value="1" datatype="n" nullmsg="请点击进行评价"/><span style="margin-right:20px;"> 差评</span>
                                    </div>
                                </div>
                            </div>
                            <div class="evaluate_star">
                                <a>评分：</a>
                                <input class="goodsStar" name="goodsStar" type="hidden" value="1" />
                                <a class="goodsStar" href="javascript:starChange('goodsStar', 1);"><img src="/client/images/start03.png"></a>
                                <a class="goodsStar" href="javascript:starChange('goodsStar', 2);"><img src="/client/images/start03.png"></a>
                                <a class="goodsStar" href="javascript:starChange('goodsStar', 3);"><img src="/client/images/start03.png"></a>
                                <a class="goodsStar" href="javascript:starChange('goodsStar', 4);"><img src="/client/images/start03.png"></a>
                                <a class="goodsStar" href="javascript:starChange('goodsStar', 5);"><img src="/client/images/start03.png"></a>
                            </div>
                    <#--  【标签】 暂时注释掉不做  zhangji
                            <div class="evaluat_label">
                                <p>标签：</p>
                                <ul class="evaluat_label_box">
                                    <li><a>外观漂亮</a></li>
                                    <li><a>外观漂亮</a></li>
                                    <li><a>用的挺不错，很好</a></li>
                                    <li><a>外观漂亮</a></li>
                                    <li><a>外观漂亮</a></li>
                                    <li><a>很轻便</a></li>
                                    <li><a>外观漂亮</a></li>
                                    <li><a>外观漂亮</a></li>
                                    <li><a>卡死</a></li>
                                    <li><a>卡死</a></li> 
                                </ul>
                            </div>
                                                               【标签】  end-->
                            <div class="evaluat_take">
                                <p>评论内容:</p>
                                <textarea  name="content" datatype="*5-255" nullmsg="请输入评价内容"></textarea>
                            </div>
                          
                            <div class="evaluat_show">
                            <#--
                                <p>晒图片 :</p>                                
                                <div class="show_img"><a>添加图片</a></div>
                                <a class="show_num">0/5</a>
                            -->
                            </div>   
                            <input class="evaluat_sure" type="submit" value="提交"></input>                            
                          </div>   
                          </form>
</div>
</form>
</div>
</div>
</div>
</div>
<!--主体结束-->
<#include "/client/common_footer.ftl" />
</body>
</html>
<!--结束-->
