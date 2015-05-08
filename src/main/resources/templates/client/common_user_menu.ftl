  <div class="mymember_menu">
    <#if user?? && user.roleId?? && 1==user.roleId>
        <div class="mymember_menu_part"> 
            <span class="mymember_menu_tit"><img src="/client/images/mymember/menu0.png">分销商中心</span>
            <div> 
                <a href="/user/distributor/lower">下级会员管理</a> 
                <a href="/user/distributor/return">返现记录</a> 
                <a href="/user/distributor/bankcard">银行卡管理</a> 
            </div>
        </div>
    </#if>
    <div class="mymember_menu_part">
      <span class="mymember_menu_tit"><img src="/client/images/mymember/menu01.png" />订单中心</span>
      <div>
        <a href="/user/order/list/0">我的订单</a>
        <a href="/user/order/list/1">待确认订单</a>
        <a href="/user/order/list/2">待付款订单</a>
        <a href="/user/order/list/3">待发货订单</a>
        <a href="/user/order/list/4">待收货订单</a>
        <a href="/user/order/list/6">已完成订单</a>
      </div>
    </div><!--mymember_menu_part END-->
    <div class="mymember_menu_part">
      <span class="mymember_menu_tit"><img src="/client/images/mymember/menu02.png" />关注中心</span>
      <div>
        <a href="/user/collect/list">关注商品</a>
        <a href="/user/recent/list">浏览历史</a>
      </div>
    </div><!--mymember_menu_part END-->
    <div class="mymember_menu_part">
      <span class="mymember_menu_tit"><img src="/client/images/mymember/menu03.png" />资产中心</span>
      <div>
        <a href="/user/point/list">积分</a>
      </div>
    </div><!--mymember_menu_part END-->
    <div class="mymember_menu_part">
      <span class="mymember_menu_tit" href="#"><img src="/client/images/mymember/menu04.png" />客户服务</span>
      <div>
        <a href="/user/return/list">返修退换货</a>
        <a href="/user/consult/list">购买咨询</a>
        <a href="/user/comment/list">我的评论</a>
      </div>
    </div><!--mymember_menu_part END-->
    <div class="mymember_menu_part">
      <span class="mymember_menu_tit" href="#"><img src="/client/images/mymember/menu05.png" />设置</span>
      <div>
        <a href="/user">个人中心</a>
        <a href="/user/info">编辑信息</a>
        <a href="/user/password">修改密码</a>
        <a href="/user/address/list">收货地址</a>
      </div>
    </div><!--mymember_menu_part END-->
  </div><!--mymember_menu END-->