package com.ynyes.rongcheng.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 注册处理
 * 
 * RegController<BR>
 * 创建人:guozhengyang <BR>
 * 时间：2015年1月29日-下午1:10:51 <BR>
 * @version 1.0.0
 *
 */
@Controller
public class RegController {
    @RequestMapping("/reg")
    public String reg(){
        return "/front/reg";
    }
}
