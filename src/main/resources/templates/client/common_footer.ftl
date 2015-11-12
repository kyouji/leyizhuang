<div class="clear h20"></div>
<section class="index_center">
  <table>  
    <tr>
    <#if service_item_list??>
        <#list service_item_list as item>
            <td>
                <a href="#"><img src="${item.logo!''}" width="57" height="57"/><span class="footer_sp01">${item.title!''}</span><span class="footer_sp02">${item.description!''}</span></a>
            </td>
        </#list>
    </#if>      
    </tr>
  </table>
</section><!--index_center END-->
<div class="clear h20"></div>
<section class="bot_help main">
     <#if help_level0_cat_list??>
           <#list help_level0_cat_list as item>
                  <#if item_index < 5>
                  <menu>
                        <h3><a href="/info/list/${help_id!'1'}?catId=${item.id?c!''}" style="font-size:16px">${item.title!''}</a></h3>
                        <#if ("help_"+item_index+"_article_list")?eval?? >
                             <#list ("help_"+item_index+"_article_list")?eval as article>
                                  <a href="/info/content/${article.id?c!''}?mid=${help_id!'1'}">${article.title!''}</a>
                             </#list>
                        </#if>
                  </menu>
                  </#if>
           </#list>
     </#if>
 
  <div class="bot_work">
    <div class="sys">
      <img src="<#if site??>${site.wxQrCode!''}</#if>" width="83" height="83" style="margin-left:45px;" />
      <p class="lh30 fs20 pb5">微信平台</p>
      <p>微信二维码</p>
      <p>扫一扫更多惊喜带给您</p>
    </div>
  </div>
  <div class="clear h20"></div>
</section>


<footer class="mainfoot">
  <section class="main">
    <nav>

      <a href="#">关于惠客</a>|
      <a href="#">团队介绍</a>|
      <a href="#">高薪诚聘</a>|
      <a href="#">业务合作</a>|
      <a href="#">会员积分</a>|
      <a href="#">投诉建议</a>|
      <a href="#">友情链接</a>
    </nav>
    <p class="c9 w100">
        <#if site??>${site.copyright!''}</#if> 
              <br />
        ${site.address!''} 电话：${site.telephone!''}
      
    </p>
    <span><a title="云南网站建设" href="http://www.ynyes.com" target="_blank">网站建设</a><a>技术支持：</a><a title="云南网站建设" href="http://www.ynyes.com" target="_blank">昆明天度网络公司</a></span>
  </section>
</footer><!--mainfoot END-->