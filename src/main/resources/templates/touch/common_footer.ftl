<div class="clear h40"></div>
<section class="botlogin">
  <#if username??>
  <a href="/touch/user">${username!''}</a>
  <a class="ml20" href="/touch/logout">退出</a>
  <#else>
  <a href="/touch/login">登录</a><a class="ml20" href="/touch/reg">注册</a>
  </#if>
  <a class="a1" href="javascript:$('html,body').animate({scrollTop:0},500);">TOP</a>
</section>
<footer class="comfoot main">
    <a href="/">电脑版</a>
    <a href="/touch">触屏版</a>
</footer>
<p class="bottext mainbox">${site.copyright!''}</p>
<p class="bottext mainbox">${site.icpNumber!''}</p>