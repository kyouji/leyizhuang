package com.ynyes.rongcheng.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 登录处理
 * 
 * LoginController<BR>
 * 创建人:guozhengyang <BR>
 * 时间：2015年1月29日-下午1:07:55 <BR>
 * @version 1.0.0
 *
 */
@Controller
public class LoginController {
    @RequestMapping("/login")
    public String login(){
       return "/front/login"; 
    }
}
