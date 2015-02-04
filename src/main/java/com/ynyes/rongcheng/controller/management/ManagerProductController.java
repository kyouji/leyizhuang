package com.ynyes.rongcheng.controller.management;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ynyes.rongcheng.entity.Product;
import com.ynyes.rongcheng.service.ProductService;
import com.ynyes.rongcheng.util.ManagementConstant;

/**
 * 商品管理界面控制器
 * 
 * @author Sharon
 * 
 */
@Controller
@RequestMapping(value="/admin/product")
public class ManagerProductController {
    
    @Autowired
    ProductService productService;
    
    @RequestMapping
    public String product(ModelMap map){
        
        Page<Product> productPage = productService.findAll(0, ManagementConstant.pageSize, "desc", "onSaleTime");
        
        if (null != productPage)
        {
            map.addAttribute("product_list", productPage.getContent());
        }
        
        return "/management/product";
    }
    
    /**
     * 删除商品
     * 
     * @param map
     * @param productId 商品ID
     * @return
     */
    @RequestMapping(value="/delete/{productId}", method=RequestMethod.POST)
    @ResponseBody
    public void delete(ModelMap map, @PathVariable Long productId) {
        
        if (null != productId)
        {
            productService.delete(productId);
        }
    }
    
}
