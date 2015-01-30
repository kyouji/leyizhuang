架构:SpringMvc+MYSQL5.0+freemark
包命名：
src/main/java:核心业务处理
	controller:--业务处理
		back:代表后台处理相关：
		front：前台业务处理相关;
		
src/main/resources：所有页面相关，
		static:js/css/images。。。存放目录
		templates:所有页面存放目录
			back:代表后台页面相关：
			front：前台页面处理相关;
			
前台url:
		/ ---代表访问主页
		商品

		/list/0 --代表访问相关商品类型typeid=1(代表进入明星产品,2代表进入手机产品，3代表搜集配件，4代表靓号选择,5代表新闻资讯)
		/product/0  --代表具体商品详情typeid=1	
		/ProductContrast --代表访问商品对比
		
		登录注册
		/login ----代表跳转登录页面
		/reg --代表跳转注册页面
		
		帮助中心
		/help/question/1	--代表跳转帮助中心  -(1代表购物指南)，(2代表常见问题)，(3代表用户协议)															
		/help/distribution/1	--代表跳转帮助中心  -(1代表支付方式)，(2代表配送方式)，(3代表配送费用)															
		/help/afshelp/1     --代表跳转帮助中心  -(1代表退货政策)，(2代表退货流程)
		
		用户
		/user/info  ---跳转用户个人信息
		/user/updatePassword  ---跳转修改密码
		/user/address  ---跳转收货地址
		/user/collect  ---跳转我的收藏
		/user/integral  ---跳转我的积分
		
		订单
		/order/list --跳转所有订单页面
		/order/obligation --跳转待付款订单页面
		/order/startorder --跳转待收货订单页面
		/order/orderok --跳转已完成订单页面
		/order/orderno --跳转已关闭订单页面
		
		新闻资讯
		/news/1     --代表跳转帮助中心  -(1代表手机资讯)，(2代表手机发烧友),(3，代表新闻视频)
		
		下单，购物车：
			/cart   --代表跳转我的购物车
			/cartStep   --代表跳转订单信息填写
			/cartFinish  --代表跳转银行卡选择支付页面（目前没有页面）
			/paysuccess  --支付成功页面
			
			
			----解说人-:郭正洋
