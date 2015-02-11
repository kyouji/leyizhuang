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

import com.ynyes.rongcheng.entity.Product;
import com.ynyes.rongcheng.service.ProductService;
import com.ynyes.rongcheng.service.ProductTypeService;
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
    
    @Autowired
    ProductTypeService productTypeService;
    
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
    
    /**
     * 保存商品
     * 
     * @param product 要保存的商品
     * @return
     */
    
    @RequestMapping(value="/save",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> add(ModelMap map, Product product){
        Map<String, Object> res = new HashMap<String, Object>();
        res.put("code", 1);
        
        if (null == product)
        {
            res.put("message", "信息有误");
            return res;
        }
        
        if (null == product.getName() || "".equals(product.getName()))
        {
            res.put("message", "商品名为空");
            return res;
        }
        
        
        productService.save(product);
        
        res.put("code", 0);
        
        return res;
    } 
}
