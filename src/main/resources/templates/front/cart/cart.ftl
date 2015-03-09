<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>荣诚手机超市</title>
<meta name="keywords" content="荣诚手机超市" />
<meta name="description" content="荣诚手机超市" />
<meta name="copyright" content="荣诚手机超市 版权所有" />
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/rcindex.css" rel="stylesheet" type="text/css" />
<link href="css/gwc.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/Tm/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/Tm/js/common/head.js"></script>
<script src="Tm/js/qikoo.js"></script>
<!--[if IE]>
   <script src="js/html5.js"></script>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="js/DD_belatedPNG_0.0.8a.js" ></script>
<script>
DD_belatedPNG.fix('.,img,background');
</script>
<![endif]-->
</head>
<body>
<#include "/front/common/head.ftl" />

<div class="gwcbg">
<div class="main mt10">
<div class="place"> <span>您现在的位置：</span>
    <a href="/">首页</a>&gt;
    <a href="/cart">购物车</a>
</div>
<div class="s_gwc1"><span id="colorfff">1、我的购物车</span><span>2、我的订单信息</span><span>3、支付成功</span></div>
</div>

<div class="main">
<div class="gwc1_lm mt20">
<table>
<tr>
<td>商品信息</td>
<td>单价</td>
<td>数量</td>
<td>合计</td>
<td>操作</td>
</tr>
</table>
</div>

<div class="gwc1_lm2">

<table>
<#if carts??>
<#list carts as cartId>
<tr id="tr_list">
<td class="gwc1_lm2_a"><input type="checkbox" class="fll duoxuank"   name="coursename" onchange="checkAll(this)"><span><a href="javascript:void(0)" class="t_timg"><img src="${cartId.productCoverImageUri}" width="76" height="76"></a></span>
<p><a href="javascript:void(0)"> <p class="nemes"><#if cartId.productName??>${cartId.productName}</#if></p></a></td>
<td class="gwc1_lm2_b">￥<span class="money" id="moneys"><#if cartId.price??>${cartId.price?c}</#if></span></td>
<td class="gwc1_lm2_c"><div class="ds content_nr_3_jg2"><a href="javascript:void(0)" class="prev" data-sum="<#if cartId.productNumber??>${cartId.productNumber}</#if>"><img src="/img/slj.png" width="20" height="20" ></a><input type="text" class="content_zj" value="${cartId.pid}" id="count" ><a href="javascript:void(0)" class="next"  data-sum="<#if cartId.productNumber??>${cartId.productNumber}</#if>"><img src="/img/sljj.png" width="20" height="20" ></a></div></td>
<td class="gwc1_lm2_b">￥<span id="td_sum">0</span></td>
<td class="gwc1_lm2_d"><input type="button" class="gwc_delete" data-opid="${cartId.id}" value="删除购物车"></td>
</tr>
</#list>
</#if>
</table>
</div>
</div>

<div class="main">
<div class="s_gwc1zj_left fll mt12"><p><input type="checkbox" onclick="checkAll(this,true)" class="fll">全选</p></div>

<div class="s_gwc1zj flr"><p>商品<span id="code_su"> 0 </span>件  总价：¥<span class="tm_code_zon">0.00</span>  商品总计(不含运费)： <span class="tm_code_zon">¥599.00</span> </p></div>

</div>

<div class="clear"></div>

<div class="main">
<div class="s_gwc1zja"><div class="fll s_gwc1zja_1"><a href="javascript:void(0)"> << 继续购物 </a></div><div class="flr s_gwc1zja_2"><a href="javascript:void(0)" onclick="tm_setp(this)" title="去结算">去结算 </a></div></div>
</div>

</div>




<div class="clear"></div>

<#include "/front/common/tail.ftl" />

<script type="text/javascript">

            //--上一页(减1)  / 下一页(加1)
            
            var index = 1;
    
        
            //下一页功能
            $("#tr_list td").find(".next").on("click",function(){
                var $this = $(this);
                var $input =$(this).prev();
                var datasum=$(this).data("sum");
                var total = 0;
                
                index++;//相当于index = index +1;
                if(index > datasum)index = 1;
                $input.val(index);
                var num=$this.parents().find("#count").val();
                var money=$this.parents().find("#moneys").text();
                total += money * num;
                $this.parents().find("#td_sum").text(total);
                tm_total()
                
            });

        
            //上一页功能
            $("#tr_list td").find(".prev").on("click",function(){
            var datasum=$(this).data("sum");
            var $this = $(this);
            var $input =$(this).next();
                index--;//相当于index = index +1;
                if(index<1)index = datasum;
                $input.val(index);
                var num=$this.parents().find("#count").val();
                var money=$this.parents().find("#moneys").text();
                $this.parents().find("#td_sum").text(num*money);
                var unit_price = $(this).parent().parent().find("b.unit-price").eq(0).html();
                tm_total()
            });
            /*总金额计算*/
            function tm_total(){
                var total = 0;
                $("#tr_list").each(function(){
                var checked =$(this).find("td").find(".duoxuank").prop("checked")
                    if(checked==true){
                        var money =  $(this).parents().find("#td_sum").text();
                        var num =  $(this).find("#count").val();
                        total += money * num;
                    }
                    $(".tm_code_zon").text(money)
                });

                var count = $("#listbox").find("li").find(".c_xz:visible").length;
                $("#count").text(count);
                $("#sum").text(total);
            };
            
            
    /*全选*/
    function checkAll(obj,flag){
        var courseName = document.getElementsByName("coursename");
        var count="${count}"
        if(flag){
            if(obj.checked){//判断当前全选选中
            for(var i=0;i<courseName.length;i++){
                courseName[i].checked = true;
                $("#code_su").text(count)
            }
            }else{
                for(var i=0;i<courseName.length;i++){   
                    courseName[i].checked = false;
                    $("#code_su").text(2)
                }   
                $("#code_su").text(0)
            }
        }else{
            
            if(obj.checked){
                $("#code_su").text(count)
            }else{
                $("#code_su").text(0)
            }
        }
    };
    

        /*删除购物车*/
        $("#tr_list .gwc1_lm2_d").on("click",".gwc_delete",function(){
            var $this = $(this);
            var id = $this.data("opid");
            qikoo.dialog.confirm('确定要将该商品移除购物车吗？',function(){
                $.ajax({
                    type:"post",
                    url:"/delete",
                    data:{"id":id},
                    success:function(data){
                        if(data=="success"){
                             $this.parents("#tr_list").fadeOut("slow",function(){
                                $(this).remove();
                            });
                        }
                    }
                })
            },function(){
                
            });
            
        });
        /*去结算*/
        function tm_setp(obj){
            var $this=$("#tr_list").find("td");
            var productName =$this.parents().find(".nemes a").text();
            var productNumber =$this.parents().find(".content_zj").val();
            var price =$this.parents().find(".money").text();
            
            $.ajax({
                type:"post",
                url:"/cartStep",
                data:{"productName":productName,"deliveryQuantity":productNumber,"price":price},
                success:function(data){
                    alert(data)
                }
            })
        
        }

</script>

</body>
</html>