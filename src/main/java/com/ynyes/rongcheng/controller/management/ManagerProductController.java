package com.ynyes.rongcheng.controller.management;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 商品管理界面控制器
 * @author Sharon
 *
 */
@Controller
@RequestMapping(value="/admin/product")
public class ManagerProductController {
    
    @RequestMapping
    public String product(){
        return "/management/index";
    }
    
}
