package com.ynyes.rongcheng.controller.management;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.rongcheng.entity.ProductType;
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
    
    /**
     * 商品类型管理首页
     * 
     * @param map
     * @return
     */
    @RequestMapping
    public String type(ModelMap map) {
        
        Page<ProductType> typePage = productTypeService.findAll(0, ManagementConstant.pageSize, "desc", "id");
        
        if (null != typePage)
        {
            map.addAttribute("type_list", typePage.getContent());
            map.addAttribute("type_total", typePage.getTotalElements());
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
    @RequestMapping(value="/admin/product/type/page/{pageIndex}")
    public String page(ModelMap map, @PathVariable Integer pageIndex) {
        
        if (null != pageIndex && pageIndex.intValue() > 0)
        {
            Page<ProductType> typePage = productTypeService.findAll(pageIndex, ManagementConstant.pageSize, "desc", "id");
            
            if (null != typePage)
            {
                map.addAttribute("type_list", typePage.getContent());
            }
        }
        
        return "/management/product_type/product_type_tbody";
    }
    
}
