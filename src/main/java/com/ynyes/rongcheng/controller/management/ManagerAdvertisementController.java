package com.ynyes.rongcheng.controller.management;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ynyes.rongcheng.entity.Advertisement;
import com.ynyes.rongcheng.service.AdvertisementService;
import com.ynyes.rongcheng.service.AdvertisementTypeService;
import com.ynyes.rongcheng.util.ManagementConstant;

/**
 * 品牌管理控制器
 * 
 * @author Sharon
 * 
 */
@Controller
@RequestMapping(value="/admin/ad")
public class ManagerAdvertisementController {
    
    @Autowired
    AdvertisementService advertisementService;
    
    @Autowired
    AdvertisementTypeService advertisementTypeService;
    
    @RequestMapping
    public String ad(ModelMap map){
        
        Page<Advertisement> adPage = advertisementService.findAll(0, ManagementConstant.pageSize, "desc", "id");
        
        
        if (null != adPage)
        {
            map.addAttribute("ad_list", adPage.getContent());
        }
        
        map.addAttribute("ad_type_list", advertisementTypeService.findAll());
        
        return "/management/ad";
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
            Page<Advertisement> adPage = advertisementService.findAll(pageIndex, ManagementConstant.pageSize, "desc", "id");
            
            if (null != adPage)
            {
                map.addAttribute("ad_list", adPage.getContent());
            }
        }
        
        return "/management/ad/ad_tbody";
    }
    
    @RequestMapping(value="/modify/{brandId}",method = RequestMethod.POST)
    public String modify(ModelMap map, @PathVariable Long brandId){
        if (null != brandId)
        {
            map.addAttribute("ad", advertisementService.findOne(brandId));
        }
        
        map.addAttribute("ad_type_list", advertisementTypeService.findAll());
        
        return "/management/ad/ad_modify";
    }
    
    @RequestMapping(value="/save",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> add(ModelMap map, 
                                Advertisement advertisement,
                                @RequestParam MultipartFile pic){
        Map<String, Object> res = new HashMap<String, Object>();
        res.put("code", 1);
        
        if (null == advertisement)
        {
            res.put("message", "参数有误");
            return res;
        }
        
        if (null == advertisement.getName() || "".equals(advertisement.getName()))
        {
            res.put("message", "名称不能为空");
            return res;
        }
        
        if (null == advertisementService.save(advertisement, pic))
        {
            res.put("message", "保存广告出错");
            return res;
        }
        
        res.put("code", 0);
        
        return res;
    }
    
    /**
     * 删除
     * 
     * @param map
     * @param id ID
     * @return
     */
    @RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
    @ResponseBody
    public void delete(ModelMap map, @PathVariable Long id) {
        
        if (null != id)
        {
            advertisementService.delete(id);
        }
    }
    
    /**
     * 存在id字段时先查找出对应的实体
     * 
     * @param id
     * @param model
     */
    @ModelAttribute
    public void getModel(@RequestParam(value = "id", required = false) Long id, ModelMap map) {
        if (id != null) {
            map.addAttribute("advertisement", advertisementService.findOne(id));
        }
    }
    
}
