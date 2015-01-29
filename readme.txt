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
		/list/0 --代表访问相关商品类型typeid=1(代表进入明星产品,2代表进入手机产品，3代表搜集配件，4代表靓号选择)
		/product/0  --代表具体商品详情typeid=1
		/ProductContrast --代表访问商品对比
		
		/login ----代表跳转登录页面
		/reg --代表跳转注册页面
		
		/help/question-1	--代表跳转帮助中心  -(1代表购物指南)，(2代表常见问题)，(3代表用户协议)															
		/help/distribution-1	--代表跳转帮助中心  -(1代表支付方式)，(2代表配送方式)，(3代表配送费用)															
		/help/afshelp-1     --代表跳转帮助中心  -(1代表退货政策)，(2代表退货流程)
		
		
		
		
			----解说人-:郭正洋
