<#if brand_list??>
    <div class="col-sm-12" style="margin-top: 10px;">
        <label class="col-sm-1 control-label no-padding-right" for="name">品牌</label>
        <div class="col-sm-11">
            <input type="text" name="brandName" value="" style="display:none;" />
            <#list brand_list as brand>
                <a href="javascript:void(0)" class="selectProp">${brand.name}</a>
            </#list>
        </div>
    </div>
</#if>

<#if parameter_list??>
<#list parameter_list as parameter>
    <div class="col-sm-12" style="margin-top: 10px;">
        <label class="col-sm-1 control-label no-padding-right" for="name">${parameter.name}</label>
        
        <input type="text" name="paramId" value="${parameter.id}" style="display:none;" />
        
        <#if parameter.isValueInputByChoose>
            <div class="col-sm-11">
                <input type="text" name="paramValue" value="" class="col-sm-12" style="display:none;"/>
                <#if parameter.valueList??>
                    <#list parameter.valueList?split(",") as val>
                        <#if val?? && ""!=val>
                            <#if parameter.isSingleValue>
                                <a href="javascript:void(0)" class="selectProp">${val}</a>
                            <#else>
                                <a href="javascript:void(0)" class="multiSelectProp">${val}</a>
                            </#if>
                        </#if>
                    </#list>
                </#if>
            </div>
        <#else>
            <div class="col-sm-5">
                <input type="text" name="paramValue" value="" class="col-sm-12" />
            </div>
        </#if>
    </div>
</#list>
</#if>