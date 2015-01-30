package com.ynyes.rongcheng.controller.management;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 后台首页控制器
 * @author Sharon
 *
 */
@Controller
public class ManagerIndexController {
    
    @RequestMapping(value="/admin")
    public String index(){
        return "/management/index";
    }
    
}
