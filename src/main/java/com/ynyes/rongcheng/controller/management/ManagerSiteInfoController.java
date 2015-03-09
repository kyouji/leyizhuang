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

import com.ynyes.rongcheng.entity.SiteInfo;
import com.ynyes.rongcheng.service.SiteInfoService;
import com.ynyes.rongcheng.util.ManagementConstant;

/**
 * 网站资料管理控制器
 * 
 * @author Sharon
 * 
 */
@Controller
@RequestMapping(value="/admin/info")
public class ManagerSiteInfoController {
    
    @Autowired
    SiteInfoService siteInfoService;
    
    @RequestMapping
    public String siteInfo(ModelMap map){
        
        Page<SiteInfo> siteInfoPage = siteInfoService.findAll(0, ManagementConstant.pageSize, "desc", "id");
        
        
        if (null != siteInfoPage)
        {
            map.addAttribute("site_info_list", siteInfoPage.getContent());
        }
        
        return "/management/info";
    }
    
    /**
     * 获取指定页号的网站资料
     * 
     * @param map
     * @param pageIndex 页号
     * @return
     */
    @RequestMapping(value="/page/{pageIndex}")
    public String page(ModelMap map, @PathVariable Integer pageIndex) {
        
        if (null != pageIndex && pageIndex.intValue() >= 0)
        {
            Page<SiteInfo> siteInfoPage = siteInfoService.findAll(pageIndex, ManagementConstant.pageSize, "desc", "id");
            
            if (null != siteInfoPage)
            {
                map.addAttribute("site_info_list", siteInfoPage.getContent());
            }
        }
        
        return "/management/info/info_tbody";
    }
    
    @RequestMapping(value="/modify/{brandId}",method = RequestMethod.POST)
    public String modify(ModelMap map, @PathVariable Long id){
        if (null != id)
        {
            map.addAttribute("site_info", siteInfoService.findOne(id));
        }
        
        return "/management/info/info_modify";
    }
    
    @RequestMapping(value="/save",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> add(ModelMap map, 
                                SiteInfo info){
        Map<String, Object> res = new HashMap<String, Object>();
        res.put("code", 1);
        
        if (null == info)
        {
            res.put("message", "参数有误");
            return res;
        }
        
        if (null == siteInfoService.save(info))
        {
            res.put("message", "保存资料出错");
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
            siteInfoService.delete(id);
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
            map.addAttribute("info", siteInfoService.findOne(id));
        }
    }
    
}
