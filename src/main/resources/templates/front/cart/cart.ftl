<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>荣诚手机超市--购物车</title>
<meta name="keywords" content="荣诚手机超市" />
<meta name="description" content="荣诚手机超市" />
<meta name="copyright" content="荣诚手机超市 版权所有" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/rcindex.css" rel="stylesheet" type="text/css" />
<link href="/css/gwc.css" rel="stylesheet" type="text/css" />
<link href="Tm/css/qikoo.css" type="text/css" rel="stylesheet" />
<link href="Tm/css/store.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/Tm/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/Tm/js/common/head.js"></script>
<script src="Tm/js/qikoo.js"></script>
</head>
<body>
<#include "/front/common/head.ftl" />

<div class="gwcbg">
<div class="main mt10">
<div class="place"> 
    <span>您现在的位置：</span>
    <a href="/">首页</a>&gt;
    <a href="javascript:;">购物车</a>
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
<input type="hidden" value="<#if cartId.pid??>${cartId.pid}</#if>" class="p_pid">
<input type="hidden" value="<#if cartId.vid??>${cartId.vid}</#if>" class="v_vid">
<td class="gwc1_lm2_a">
    <input type="checkbox" class="fll duoxuank" name="coursename" <#-- onchange="checkAll(this)" --> >
    <span>
        <a href="/product/${cartId.pid}" class="t_timg">
            <img src="${cartId.productCoverImageUri}" width="76" height="76">
        </a>
    </span>
    <p>
    <a href="/product/${cartId.pid}"> 
        <p class="nemes">
            <#if cartId.productName??>
                ${cartId.productName?default("")} 
                ${cartId.productVerName?default("")} 
                ${cartId.productVerColor?default("")}
                ${cartId.productVerCap?default("")}
            </#if>
        </p>
    </a>
</td>

<td class="gwc1_lm2_b">￥<span class="money" id="moneys"><#if cartId.price??>${cartId.price?c}</#if></span></td>
<td class="gwc1_lm2_c">
    <div class="ds content_nr_3_jg2">
        <a href="javascript:void(0)" class="prev" data-sum="<#if cartId.productNumber??>${cartId.productNumber}</#if>">
            <img src="/img/slj.png" width="20" height="20" >
        </a>
        <input type="text" class="content_zj" value="${cartId.quantity}" id="count" >
        <a href="javascript:void(0)" class="next"  data-sum="<#if cartId.productNumber??>${cartId.productNumber}</#if>">
            <img src="/img/sljj.png" width="20" height="20" >
        </a>
    </div>
</td>
<td class="gwc1_lm2_b">￥<span id="td_sum">${(cartId.price * cartId.quantity)?string("#.##")}</span></td>
<td class="gwc1_lm2_d"><input type="button" class="gwc_delete" data-opid="${cartId.id}" value="删除"></td>
</tr>
</#list>
</#if>
</table>
</div>
</div>

<div class="main">
<div class="s_gwc1zj_left fll mt12">
    <p><input type="checkbox" onclick="checkAll(this,true)" class="fll" id="checked">全选</p>
</div>

<div class="s_gwc1zj flr">
    <p>已选择商品<span id="code_su"> 0 </span>件  总价：¥<span id="total-price" class="tm_code_zon">0.00</span></p></div>

</div>

<div class="clear"></div>

<div class="main">
<div class="s_gwc1zja"><div class="fll s_gwc1zja_1"><a href="javascript:void(0)">  </a></div><div class="flr s_gwc1zja_2"><a href="javascript:void(0)" onclick="tm_setp(this)" title="去结算">去结算 </a></div></div>
</div>

</div>




<div class="clear"></div>

<#include "/front/common/tail.ftl" />

<script type="text/javascript">

    var setTotalCountAndPrice = function(){
        var i;
        var cbs = $(".duoxuank");
        var totalCount = 0;
        var totalPrice = 0;
        
        for(i=0; i<cbs.length; i++)
        {
            var count = parseInt(cbs.eq(i).parent().siblings(".gwc1_lm2_c").children(".content_nr_3_jg2").children(".content_zj").val());
            var price = parseFloat(cbs.eq(i).parent().siblings(".gwc1_lm2_b").children("#td_sum").html());
                
            if (cbs.eq(i).prop("checked"))
            {
                totalCount += count;
                totalPrice += price;
            }
        }
        
        $("#code_su").html(totalCount);
        $("#total-price").html(totalPrice);
    }
    
    // 点击选择框
    $(".duoxuank").click(function(){
        setTotalCountAndPrice();
    });
    
    // 减号
    $(".prev").click(function(){
        var countInput = $(this).siblings(".content_zj");
        var count = parseInt(countInput.val());
        var sumPriceSpan = $(this).parent().parent().siblings(".gwc1_lm2_b").children("#td_sum");
        var sumPrice = parseFloat(sumPriceSpan.html());
        var unitPrice = parseFloat($(this).parent().parent().siblings(".gwc1_lm2_b").children(".money").html());
        
        count--;
        
        if (count > 0)
        {
            countInput.val(count);
            sumPriceSpan.html(sumPrice - unitPrice);
        }
        setTotalCountAndPrice();
    });
    
    // 加号
    $(".next").click(function(){
        var countInput = $(this).siblings(".content_zj");
        var count = parseInt(countInput.val());
        var sumPriceSpan = $(this).parent().parent().siblings(".gwc1_lm2_b").children("#td_sum");
        var sumPrice = parseFloat(sumPriceSpan.html());
        var unitPrice = parseFloat($(this).parent().parent().siblings(".gwc1_lm2_b").children(".money").html());
        
        count++;
        
        if (count > 0)
        {
            countInput.val(count);
            sumPriceSpan.html(sumPrice + unitPrice);
        }
        setTotalCountAndPrice();
    });
    
    
			//--上一页(减1)  / 下一页(加1)
			
			var index = 1;
	
		
			//下一页功能
			<#--
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
				tm_total();
				
			});
            -->
		
			
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
			var checked =$this.find(".duoxuank").prop("checked")
			var checkeds =$("#checked").prop("checked")
			var productName =$this.parents().find(".nemes a").text();
			var productNumber =$this.parents().find(".content_zj").val();
			var price =$this.parents().find(".money").text();
			var pid =$this.parents().find(".p_pid").val();
			var vid =$this.parents().find(".v_vid").val();
			if(checked==true || checkeds==true){
			$.ajax({
				type:"post",
				url:"/stepCart",
				data:{"deliveryQuantity":productNumber,"price":price,"pid":pid,"vid":vid},
				success:function(data){
				/*	if(data=="success"){
						window.location.href="/cartStep"
					}*/
					if(data.code==0){
						window.location.href="/cartStep"
					}else{
						alert(data.message)
					}
				}
				})
			}else{
				alert("你还没有选择")
			}
		
		}

</script>



</body>
</html>



