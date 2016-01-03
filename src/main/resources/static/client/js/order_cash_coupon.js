window.onload = function(){
	$(".select-coupons .check").height($(".select-coupons .coupon").height());
}
$(function() {
	$(".select-coupons section").click(
		function() {
			var cssattr = $(this).find("div.check").attr("class");
			var id = $(this).attr("id");
			console.debug(id);
			console.debug(cssattr);
			// 开启等待图标
			wait();
			if (cssattr.indexOf("checked") > 0) {
				$.ajax({
					url : "/order/operate/coupon",
					type : "post",
					timeout : 10000,
					data : {
						id : id,
						type : 0,
						status : 1
					},
					error:function(XMLHttpRequest, textStatus, errorThrown) {
						// 关闭等待图标
						close(1);
						warning("亲，您的网速不给力啊");
					},
					success(res){
						if(0 == res.status){
							window.location.reload();
							
						}
					}
				});
			} else {
				$.ajax({
					url : "/order/operate/coupon",
					type : "post",
					timeout : 10000,
					data : {
						id : id,
						type : 0,
						status : 0
					},
					error:function(XMLHttpRequest, textStatus, errorThrown) {
						// 关闭等待图标
						close(1);
						warning("亲，您的网速不给力啊");
					},
					success(res){
						if(0 == res.status){
							window.location.reload();
						}
					}
				});
			}
	});
});