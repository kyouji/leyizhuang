package com.ynyes.rongcheng.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 帮助业务
 * 
 * HelpController<BR>
 * 创建人:guozhengyang <BR><#include "/listTemp/headorder.ftl">
 * 时间：2015年1月29日-下午1:30:32 <BR>
 * @version 1.0.0
 *
 */
@Controller
@RequestMapping("/help")
public class HelpController {
    /**
     * 
     * 帮助中心--新手指南模块<BR>
     * 方法名：question<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-下午3:44:09 <BR>
     * @param typeId
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/question/{typeId}")
    public String question(@PathVariable Long typeId){
        if(typeId==1){
            return "front/question/question_1";
        } 
        if(typeId==2){
            return "front/question/question_2";
        } 
        if(typeId==3){
            return "front/question/question_3";
        } 
        return "/error404";
    }
    /**
     * 
     * 帮助中心--支付配送模块<BR>
     * 方法名：distribution<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-下午3:44:38 <BR>
     * @param typeId
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/distribution/{typeId}")
    public String distribution(@PathVariable Long typeId){
        if(typeId==1){
            return "front/distribution/distribution_1";
        } 
        if(typeId==2){
            return "front/distribution/distribution_2";
        } 
        if(typeId==3){
            return "front/distribution/distribution_3";
        } 
        return "/error404";
    }
    /**
     * 
     *  帮助中心--售后服务模块<BR>
     * 方法名：afshelp<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-下午3:56:39 <BR>
     * @param typeId
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/afshelp/{typeId}")
    public String afshelp(@PathVariable Long typeId){
        if(typeId==1){
            return "front/afshelp/afshelp_1";
        } 
        if(typeId==2){
            return "front/afshelp/afshelp_2";
        } 
        if(typeId==3){
            return "front/afshelp/afshelp_3";
        } 
        return "/error404";
    }
}
