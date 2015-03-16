<header>
<div class="main">
    <div class="fll header_l">
        <#if user??>
            <span>
                您好，
                <a href="/user/info" id="id-username">${user.username}</a>
                欢迎来到荣诚手机超市！您的身份：${user.role}&nbsp;&nbsp;
                <a href="/logout" >退出</a>
            </span>
        <#else>
            <span>
                您好，欢迎来到荣诚手机超市！
                <a href="/login" id="orange">登录</a>&nbsp;&nbsp;&nbsp;
                <a href="/reg">免费注册</a>
            </span>
        </#if>
    </div>
    <div class="flr header_r">
        <a href="/user/collect">我的收藏</a>
        <a href="#">销售网点</a>
        <a href="#">手机版切换</a>
        <a href="/order/list">我的订单</a>
        <a href="/help/question/1">帮助中心</a>
        <a href="#">收藏本站</a>
    </div>
</div>
</header>

<div class="header1 main">
    <div class="fll logo">
        <a href="/" title="荣诚手机超市"><img src="/img/rc_logo.png" width="177" height="69"></a>
    </div>
    <div class="fll city">
        <a href="javascript:;" id="city">城市切换</a>
        <span></span>
        <div class="cityqh" style="display:none" id="change">
            <ul>
                <li><a href="javascript:void(0)" name="昆明市">昆明市</a></li>
                <li><a href="javascript:void(0)" name="曲靖市">曲靖市</a></li>
                <li><a href="javascript:void(0)" name="大理州">大理州</a></li>
                <li><a href="javascript:void(0)" name="西双版纳">西双版纳</a></li>
                <li><a href="javascript:void(0)" name="德宏州">德宏州</a></li>
                <li><a href="javascript:void(0)" name="丽江市">丽江市</a></li>
            </ul>
        </div>
    </div>
    <div class="sercha fll">
        <form action="/search/0-0-0-0-0" method="get">
            <input class="topnews1_serch" type="text" name="key" onfocus="if(value=='热搜机型： iphone 6   MX4 Pro   HTC M8') {value=''}" onblur="if (value=='') {value='热搜机型： iphone 6   MX4 Pro   HTC M8'}"  value="">
            <input type="submit" class="search-btn" title="搜索" value="  ">
            <div class="rc_newsgg"><span>新闻公告:</span><a href="#">>>黄章：魅蓝Note有电信版，一月还将发新品</a></div>
        </form>
    </div>
    <div class="fll rc_phone"><span>客服电话：400-888-8888</span></div>
    <div class="flr rc_gwc"><a href="/cart">购物车</a></div>
</div>