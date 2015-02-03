package com.ynyes.rongcheng.controller.management;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 商品属性管理界面
 * 
 * @author Sharon
 *
 */
@Controller
@RequestMapping(value="/admin/parameter")
public class ManagerParameterController {
    
    
    
    @RequestMapping
    public String parameter(){
        return "/management/parameter";
    }
    
}
