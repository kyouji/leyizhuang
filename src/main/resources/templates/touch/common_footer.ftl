<div class="foot_nav">
    <#if username??>
        <a href="/touch/user">${username}</a>
        <a href="">退出</a>
    <#else>
        <a href="/touch/login">登录</a>
        <a href="/touch/reg">注册</a>
    </#if>
    
    <a href="#">返回顶部</a>
</div>