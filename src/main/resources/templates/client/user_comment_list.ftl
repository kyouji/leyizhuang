<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>正品惠客</title>
<meta name="keywords" content="${site.seoKeywords!''}" />
<meta name="description" content="${site.seoDescription!''}" />
<meta name="copyright" content="正品惠客" />

<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/mycenter_base.css  "/>
<link href="/client/css/my_evaluate.css" rel="stylesheet" type="text/css" />
<!--<link href="/client/css/member.css" rel="stylesheet" type="text/css" />-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/Validform_v5.3.2_min.js"></script>

<!--[if IE]>
   <script src="/client/js/html5.js"></script>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="/client/js/DD_belatedPNG_0.0.8a.js" ></script>
<script>
DD_belatedPNG.fix('.,img,background');
</script>
<![endif]-->

</head>
<body>
<form name="form1" method="post" action="/user/order/list" id="form1">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="${__EVENTTARGET!""}">
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="${__EVENTARGUMENT!""}">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="${__VIEWSTATE!""}" >
</div>
<script type="text/javascript">
var theForm = document.forms['form1'];
    if (!theForm) {
        theForm = document.form1;
    }
    function __doPostBack(eventTarget, eventArgument) {
        if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
            theForm.__EVENTTARGET.value = eventTarget;
            theForm.__EVENTARGUMENT.value = eventArgument;
            theForm.submit();
        }
    }
</script>
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
                window.location.reload();
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

<#include "/client/common_user_header.ftl" />
<!-- 内容 -->
<div class="content"> 
  <!-- 左侧 -->
 <#include "/client/common_user_menu.ftl" />
  <!-- 右侧 -->
 <div class="content_right">
    <div class="right_title">
        <a>我的评价</a>


    </div> 
    <ul class="right_nav">
        <li class="right_nav_01"><a>商品信息 </a></li>
        <li class="right_nav_02"><a>购买时间</a></li>
        <li class="right_nav_02"><a>评价状态</a></li> 
    </ul>
    <#if order_page??>
       <#list order_page.content as order>
           <#if order.orderGoodsList??>
               <#list order.orderGoodsList as item>    
                <div class="evaluate_content">
                    <div class="evaluate_nav">
                        <div class="evaluate_img">
                       
                            <img src="${item.goodsCoverImageUri!''}" width="50" height="50" title="${item.goodsTitle!''}">

                            <a href="/goods/${item.goodsId}">${item.goodsTitle!''}</a>
                        </div>
                        <a class="evaluate_date_01">${order.orderTime?string("yyyy-MM-dd")}  </a>
                        <a class="evaluate_date_02"
                            <#if item.isCommented?? && item.isCommented>
                                  href="javascript:showCommentTr(${order_index}, ${item_index});">已评价</a>
                            <#else>
                                 href="/user/comment/edit/${order.id}?id=${item.id}">发表评价</a>
                            </#if>
                        </a>
                    </div>
                    <#if item.isCommented?? && item.isCommented>
                        <#if ("comment_" + order.id + "_" + item.id)?eval??>
                            <#assign comt=("comment_" + order.id + "_" + item.id)?eval>
                            <div id="comment-tr${order_index}${item_index}" class="evaluate_content_down hide">
                            <div class="evaluate_box">
                                <div class="evaluate_box_01">
                                   <p>评价等级：</p>
                                   <input type="radio" disabled="disabled" <#if comt.stars?? && comt.stars==3>checked="checked"</#if>/><span class="mr20"> 好评</span>
                                   <input type="radio" disabled="disabled" <#if comt.stars?? && comt.stars==2>checked="checked"</#if>/><span class="mr20"> 中评</span>
                                   <input type="radio" disabled="disabled" <#if comt.stars?? && comt.stars==1>checked="checked"</#if>/><span class="mr20"> 差评</span>
                                </div>
                            </div>
                            <div class="evaluate_star">
                                <a>评分：</a>
                                <a class="a001" href="javascript:;"><img src="/client/images/<#if comt.goodsStar?? && comt.goodsStar gt 0>evaluate_start.png<#else>&nbsp;</#if>"></a>
                                <a class="a001" href="javascript:;"><img src="/client/images/<#if comt.goodsStar?? && comt.goodsStar gt 1>evaluate_start.png<#else>&nbsp;</#if>"></a>
                                <a class="a001" href="javascript:;"><img src="/client/images/<#if comt.goodsStar?? && comt.goodsStar gt 2>evaluate_start.png<#else>&nbsp;</#if>"></a>
                                <a class="a001" href="javascript:;"><img src="/client/images/<#if comt.goodsStar?? && comt.goodsStar gt 3>evaluate_start.png<#else>&nbsp;</#if>"></a>
                                <a class="a001" href="javascript:;"><img src="/client/images/<#if comt.goodsStar?? && comt.goodsStar gt 4>evaluate_start.png<#else>&nbsp;</#if>"></a>           
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
                                <p>评论内容 :</p>
                                <span>${comment.content!''}</span>
                            </div>
                            <div class="evaluat_show">
                                <#--
                                <p>晒图片 :</p>
                                <div class="show_img"><a>添加图片</a></div>
                                <a class="show_num">0/5</a>
                                -->
                            </div>                              
                          </div>     
                       </#if>
                      <#else>
                      <form class="commentForm" action="/user/comment/add" method="post">
                                        <input type="hidden" name="orderId" value=${order.id} />
                                        <input type="hidden" name="ogId" value=${item.id} />
                                        <input type="hidden" name="goodsId" value=${item.goodsId} />
		                            <div id="comment-tr${order_index}${item_index}" class="evaluate_content_down hide">
		                            <div class="evaluate_box">
		                                
		                                <div class="evaluate_box_01">
		                                   <p>评价等级：</p>
		                                   <div class="pb20 lh25">
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
                       </#if>     
                 </div>                                          
               </#list>
           </#if>
       </#list>
   </#if>      
    
    
</div>
   
  <!--分页-->
  <div class="pagebox">
    <div class="num">
        <#if order_page??>
            <#assign continueEnter=false>
            <#if order_page.number+1 == 1>
                <span class="a1 a0">上一页&nbsp;&nbsp;</span>
            <#else>
                <a class="a2" href="javascript:__doPostBack('btnPage','${order_page.number-1}')">上一页</a>
            </#if>
            <#if order_page.totalPages gt 0>
                <#list 1..order_page.totalPages as page>
                    <#if page <= 3 || (order_page.totalPages-page) < 3 || (order_page.number+1-page)?abs<3 >
                        <#if page == order_page.number+1>
                            <span class="current">${page}</span>
                        <#else>
                            <a href="javascript:__doPostBack('btnPage','${page-1}')">${page}</a>
                        </#if>
                        <#assign continueEnter=false>
                    <#else>
                        <#if !continueEnter>
                            ...
                            <#assign continueEnter=true>
                        </#if>
                    </#if>
                </#list>
            </#if>
                 
            <#if order_page.number+1 == order_page.totalPages || order_page.totalPages==0>
                <span class="a1 a0">&nbsp;&nbsp;下一页</span>
            <#else>
                <a class="a2" href="javascript:__doPostBack('btnPage','${order_page.number+1}')">下一页</a>
            </#if>
        </#if>
                 
         <#--   
        <a class="sel" href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <span> ... </span>
        <a href="#">45</a>
        <a class="a2" href="#"><span>下一页</span></a>
        -->
        <span> 共&nbsp;<b><#if order_page??>${order_page.totalPages}</#if></b>&nbsp;页 
                <b><#if order_page??>${order_page.totalElements}</#if></b>条数据 
        </span>
    </div>
    <#-- 到第？页功能未实现  T.T zhangji -->   
    <#--      
    <div class="page">
        <input class="sub" type="submit" value="确定" style=" *+border:none;" onclick="javascript:__doPostBack('btnPage', 'parseInt($('#pageIndex').val())-1');" />
        <span>页</span>
        <input id="pageIndex" class="text" type="text" value="1" />
        <span>到第</span>
    </div>
    -->
   <#-- 到第？页功能未实现  T.T zhangji   end-->      
          

   </div>
</div>
<!--底部footer-->
<#include "/client/common_footer.ftl" />
</form>
</body>
</html>
