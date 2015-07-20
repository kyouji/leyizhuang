<#if (pay_type_index % 5 == 0)>
    <#if (pay_type_index == 5) && onlineBank>
        <div id="expandBank">
            <span class="bankOpera">其他&gt;&gt;</span>
            <span class="ui-icon ui-icon-circle-triangle-s">&nbsp;</span>
        </div>
        <div id="hideBank">
            <span class="bankOpera">收起&gt;&gt;</span>
            <span class="ui-icon ui-icon-circle-triangle-n">&nbsp;</span>
        </div>
    </#if>
    <#if (pay_type_index >= 5) && onlineBank>
        <div class="bankSelect morebank">
    <#else>
        <div class="bankSelect">
    </#if>
</#if>
<#if pay_type.info??>
    <#assign payadInfo=pay_type.info?eval />
</#if>
<span class="paymethod" title="<#if pay_type.info??>${payadInfo[1]!''}<#else>${pay_type.title!''}</#if>">
    <input class="pay_type_chk" name="payTypeId" type="radio" datatype="n" value="${pay_type.id!''}" fee="${pay_type.fee!'0'}" nullmsg="请选择支付方式!" />
    <#if pay_type.coverImageUri??>
        <img class="banklogo" src="${pay_type.coverImageUri!''}" title="${pay_type.title!''}"/>
    <#else>
        <span>${pay_type.title!''}</span>
    </#if>
    <#if pay_type.info??>
        <span class="payment_ad" title="${payadInfo[1]!''}">${payadInfo[0]!''}</span>
    <#else>
        <span class="payment_ad">&nbsp;</span>
    </#if>
</span>
<#if (pay_type_index % 5 == 4)>
</div>
    <#if (pay_type_index == 4)>
    <div class="clear h10"></div>
    <#else>
    <div class="moreclear h10"></div>
    </#if>
<#elseif !pay_type_has_next>
</div>
</#if>