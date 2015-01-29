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
    @RequestMapping("/question-{typeId}")
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
}
