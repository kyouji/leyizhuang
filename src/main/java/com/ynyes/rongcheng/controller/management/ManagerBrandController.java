package com.ynyes.rongcheng.controller.management;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ynyes.rongcheng.entity.Brand;
import com.ynyes.rongcheng.service.BrandService;
import com.ynyes.rongcheng.service.ProductTypeService;
import com.ynyes.rongcheng.util.ManagementConstant;

/**
 * 品牌管理控制器
 * 
 * @author Sharon
 * 
 */
@Controller
@RequestMapping(value="/admin/brand")
public class ManagerBrandController {
    
    @Autowired
    BrandService brandService;
    
    @Autowired
    ProductTypeService productTypeService;
    
    @RequestMapping
    public String brand(ModelMap map){
        
        Page<Brand> brandPage = brandService.findAll(0, ManagementConstant.pageSize, "desc", "id");
        
        
        if (null != brandPage)
        {
            map.addAttribute("brand_list", brandPage.getContent());
        }
        
        map.addAttribute("type_list", productTypeService.findAll());
        
        return "/management/brand";
    }
    
    /**
     * 获取指定页号的品牌
     * 
     * @param map
     * @param pageIndex 页号
     * @return
     */
    @RequestMapping(value="/page/{pageIndex}")
    public String page(ModelMap map, @PathVariable Integer pageIndex) {
        
        if (null != pageIndex && pageIndex.intValue() >= 0)
        {
            Page<Brand> brandPage = brandService.findAll(pageIndex, ManagementConstant.pageSize, "desc", "id");
            
            if (null != brandPage)
            {
                map.addAttribute("brand_list", brandPage.getContent());
            }
        }
        
        return "/management/brand/brand_tbody";
    }
    
    @RequestMapping(value="/modify/{brandId}",method = RequestMethod.POST)
    public String modify(ModelMap map, @PathVariable Long brandId){
        if (null != brandId)
        {
            map.addAttribute("brand", brandService.findOne(brandId));
        }
        
        map.addAttribute("type_list", productTypeService.findAll());
        
        return "/management/brand/brand_modify";
    }
    
    @RequestMapping(value="/save",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> add(ModelMap map, 
                                Brand brand,
                                @RequestParam MultipartFile logoPic){
        Map<String, Object> res = new HashMap<String, Object>();
        res.put("code", 1);
        
        if (null == brand)
        {
            res.put("message", "参数有误");
            return res;
        }
        
        if (null == brand.getName() || "".equals(brand.getName()))
        {
            res.put("message", "品牌名为空");
            return res;
        }
        
        if (null != brandService.findByName(brand.getName()))
        {
            res.put("message", "该品牌已存在");
            return res;
        }
        
        brandService.save(brand, logoPic);
        
        res.put("code", 0);
        
        return res;
    }
    
    /**
     * 删除
     * 
     * @param map
     * @param brandId 品牌ID
     * @return
     */
    @RequestMapping(value="/delete/{brandId}", method=RequestMethod.POST)
    @ResponseBody
    public void delete(ModelMap map, @PathVariable Long brandId) {
        
        if (null != brandId)
        {
            brandService.delete(brandId);
        }
    }
    
    /**
     * 存在id字段时先查找出对应的实体
     * 
     * @param id
     * @param model
     */
    @ModelAttribute
    public void getModel(@RequestParam(value = "id", required = false) Long id, Model model) {
        if (id != null) {
            model.addAttribute("brand", brandService.findOne(id));
        }
    }
    
}
