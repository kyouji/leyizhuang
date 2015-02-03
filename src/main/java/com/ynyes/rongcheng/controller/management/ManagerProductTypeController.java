package com.ynyes.rongcheng.controller.management;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ynyes.rongcheng.entity.Parameter;
import com.ynyes.rongcheng.entity.ProductType;
import com.ynyes.rongcheng.service.ParameterService;
import com.ynyes.rongcheng.service.ProductTypeService;
import com.ynyes.rongcheng.util.ManagementConstant;

/**
 * 商品类型控制器
 * @author Sharon
 *
 */
@Controller
@RequestMapping(value="/admin/product/type")
public class ManagerProductTypeController {
    
    @Autowired
    ProductTypeService productTypeService;
    
    @Autowired
    ParameterService parameterService;
    
    /**
     * 商品类型管理首页
     * 
     * @param map
     * @return
     */
    @RequestMapping
    public String type(ModelMap map) {
        
        Page<ProductType> typePage = productTypeService.findAll(0, ManagementConstant.pageSize, "desc", "id");
        List<ProductType> typeList = productTypeService.findAll();
        
        if (null != typePage)
        {
            map.addAttribute("type_all_list", typeList);
            map.addAttribute("type_list", typePage.getContent());
            map.addAttribute("type_total", typePage.getTotalElements());
            
            map.addAttribute("param_type_list", parameterService.findTypes());
        }
        
        return "/management/product_type";
    }
    
    /**
     * 获取指定页号的商品分类
     * 
     * @param map
     * @param pageIndex 页号
     * @return
     */
    @RequestMapping(value="/page/{pageIndex}")
    public String page(ModelMap map, @PathVariable Integer pageIndex) {
        
        if (null != pageIndex && pageIndex.intValue() >= 0)
        {
            Page<ProductType> typePage = productTypeService.findAll(pageIndex, ManagementConstant.pageSize, "desc", "id");
            
            if (null != typePage)
            {
                map.addAttribute("type_list", typePage.getContent());
            }
        }
        
        return "/management/product_type/tbody";
    }
    
    /**
     * 根据参数类型获取参数列表
     * 
     * @param map
     * @param paramType 参数类型
     * @return
     */
    @RequestMapping(value="/param/{paramType}", method=RequestMethod.POST)
    public String param(ModelMap map, @PathVariable String paramType) {
        
        if (null != paramType)
        {
            List<Parameter> paramList = parameterService.findByType(paramType);
            
            if (null != paramList)
            {
                map.addAttribute("param_list", paramList);
            }
        }
        
        return "/management/product_type/param_list";
    }
    
}
