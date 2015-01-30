package com.ynyes.rongcheng.controller.management;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.rongcheng.entity.Parameter;
import com.ynyes.rongcheng.service.ParameterService;
import com.ynyes.rongcheng.util.ManagementConstant;

/**
 * 商品属性管理界面
 * 
 * @author Sharon
 *
 */
@Controller
@RequestMapping(value="/admin/parameter")
public class ManagerParameterController {
    
    @Autowired
    ParameterService parameterService;
    
    @RequestMapping
    public String parameter(ModelMap map){
        Page<Parameter> paramPage = parameterService.findAll(0, ManagementConstant.pageSize, null, null);
        
        if (null != paramPage)
        {
            map.addAttribute("param_list", paramPage.getContent());
            map.addAttribute("param_total", paramPage.getTotalElements());
        }
        
        return "/management/parameter";
    }
    
}
