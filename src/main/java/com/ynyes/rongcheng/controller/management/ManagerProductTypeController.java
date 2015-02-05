package com.ynyes.rongcheng.controller.management;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

import com.ynyes.rongcheng.entity.Parameter;
import com.ynyes.rongcheng.entity.ProductType;
import com.ynyes.rongcheng.entity.ProductTypeParameter;
import com.ynyes.rongcheng.service.ParameterService;
import com.ynyes.rongcheng.service.ProductTypeParameterService;
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
    
    @Autowired
    ProductTypeParameterService ptpService;
    
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
    @RequestMapping(value="/param/{methodType}/{paramType}", method=RequestMethod.POST)
    public String param(ModelMap map, @PathVariable String methodType, @PathVariable String paramType) {
        
        if (null != paramType)
        {
            List<Parameter> paramList = parameterService.findByType(paramType);
            
            if (null != paramList)
            {
                map.addAttribute("param_list", paramList);
            }
        }
        
        if ("add".equals(methodType))
        {
            return "/management/product_type/add_param_list";
        }
        else
        {
            return "/management/product_type/modify_param_list";
        }
    }
    
    /**
     * 保存商品分类
     * 
     * @param map
     * @param type 商品分类
     * @return
     */
    @RequestMapping(value="/save", method=RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> modify(ModelMap map, ProductType type, String propIds) {
        Map<String, Object> res = new HashMap<String, Object>();
        res.put("code", 1);
        
        if (null == type.getName() || "".equals(type.getName()))
        {
            res.put("message", "类型名称不能为空");
            return res;
        }
        
        if (null != propIds && !"".equals(propIds))
        {
            if (null == type.getTypeParamList())
            {
                type.setTypeParamList(new ArrayList<ProductTypeParameter>());
            }
            
            String[] propIdArray = propIds.split(",");
            
            for (String idStr : propIdArray)
            {
                ProductTypeParameter ptp = new ProductTypeParameter();
                ptp.setParamId(Long.parseLong(idStr));
                
                type.getTypeParamList().add(ptp);
                
                ptpService.save(ptp);
            }
        }
        
        productTypeService.save(type);
        
        res.put("code", 0);
        
        return res;
    }
    
    /**
     * 修改商品分类
     * 
     * @param map
     * @param typeId
     * @return
     */
    @RequestMapping(value="/modify/{typeId}", method=RequestMethod.POST)
    public String modify(ModelMap map, @PathVariable Long typeId) {
        
        if (null != typeId)
        {
            ProductType type = productTypeService.findOne(typeId);
            
            if (null != type)
            {
                List<Long> ids = new ArrayList<Long>();
                
                for (ProductTypeParameter ptp : type.getTypeParamList())
                {
                    ids.add(ptp.getParamId());
                }
                
                map.addAttribute("type_all_list", productTypeService.findAll());
                map.addAttribute("product_type", type);
                map.addAttribute("param_type_list", parameterService.findTypes());
                
                if (ids.size() > 0)
                {
                    map.addAttribute("prop_list", parameterService.findByIdIn(ids));
                }
            }
        }

        return "/management/product_type/modify";
    }
    
    /**
     * 删除商品分类
     * 
     * @param map
     * @param typeId
     * @return
     */
    @RequestMapping(value="/delete/{typeId}", method=RequestMethod.POST)
    @ResponseBody
    public void delete(ModelMap map, @PathVariable Long typeId) {
        
        if (null != typeId)
        {
            productTypeService.delete(typeId);
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
            model.addAttribute("type", productTypeService.findOne(id));
        }
    }
    
}
