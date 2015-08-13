<div id="tab3" class="c_R_consultation top20">
	<div class="slideTxtBox">
		<div class="hd">
			<ul>
				<#if consult_page??>
					<li>全部咨询(${consult_page.content?size!'0'})</li>
				<#else>
					<li>全部咨询(0)</li>
				</#if>
			</ul>
		</div>
		<div class="bd">
			<dl>
				<dd>
					<#if consult_page?? && consult_page.content?size gt 0> 
						<#list consult_page.content as item>
							<ul>
								<li><b>?</b><span>${item.username}</span><label>${item.content}</label></li>
								<#if item.isReplied>
									<li><strong>!</strong><span>店家回复</span><label>${item.reply}</label></li>
								</#if>
							</ul>
						</#list> 
					</#if>
				</dd>
			</dl>
		</div>
		<div class="pagebox" style="float: left; padding: 15px 0;">
			<div class="num">
				<#if consult_page??>
					<#assign continueEnter=false>
					<#if consult_page.number == 0>
						<a class="a1 a0" href="javascript:;"><span>上一页</span></a>
					<#else> 
						<a class="a2" href="javascript:getConsult(${goodsId},${page!'0'}-1)"><span>上一页</span></a> 
					</#if> 
					<#if consult_page.totalPages gt 0> 
						<#list 1..consult_page.totalPages as page> 
							<#if page <= 3 || (consult_page.totalPages-page) < 3 ||(consult_page.number+1-page)?abs<3 > 
								<#if page == consult_page.number+1> 
									<a class="sel" href="javascript:;">${page}</a>
								<#else> 
									<a href="javascript:getConsult(${goodsId},(${page!'0'})-1)">${page}</a> <#-- ${page} --> 
								</#if> 
								<#assign continueEnter=false> 
							<#else> 
								<#if !continueEnter> 
									<span> ...</span> 
									<#assign continueEnter=true> 
								</#if> 
							</#if> 
						</#list> 
					</#if>
					<#if consult_page.number+1 == consult_page.totalPages || consult_page.totalPages==0>
						<a class="a2 a0" href="javascript:;"><span>下一页</span></a>
					<#else> 
						<a class="a2" href="javascript:getConsult(${goodsId},(${page!'0'}+1))"><span>123123下一页</span></a> 
					</#if> 
				</#if> 
				<#if consult_page??>
					<span>共<b>${consult_page.totalPages}</b>页
				<#else>
					<span>共<b>0</b>页 </span>
				</#if>
				</span>
			</div>
			<div class="page">
				<input class="sub" type="submit" value="确定" onclick="javascript:btnPageSubmit('consult');" style="border: none;" /> <span>页</span>
				<#if consult_page??>
					<input class="text" type="text" value="${consult_page.number+1}" id="consultPageNum" /> <span>到第</span>
				<#else>
					<input class="text" type="text" value="0" id="consultPageNum" /> <span>到第</span>
				</#if>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!--	<script type="text/javascript">jQuery(".slideTxtBox").slide();</script>     -->
</div>