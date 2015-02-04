package com.ynyes.rongcheng.controller.management;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
    
    @RequestMapping(value="/destroy/{paramId}",method = RequestMethod.POST)
    @ResponseBody
    public void destroy(ModelMap map, @PathVariable Long paramId){
        if (null != paramId)
        {
            parameterService.delete(paramId);
        }
    }
    
    @RequestMapping(value="/save",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> add(ModelMap map, Parameter param){
        Map<String, Object> res = new HashMap<String, Object>();
        res.put("code", 1);
        
        if (null == param)
        {
            res.put("message", "参数有误");
            return res;
        }
        
        if (null == param.getName() || "".equals(param.getName()))
        {
            res.put("message", "参数为空");
            return res;
        }
        
        parameterService.save(param);
        
        res.put("code", 0);
        
        return res;
    }
    
}