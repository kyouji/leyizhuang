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

import com.ynyes.rongcheng.entity.News;
import com.ynyes.rongcheng.service.NewsService;
import com.ynyes.rongcheng.util.ManagementConstant;

/**
 * 品牌管理控制器
 * 
 * @author Sharon
 * 
 */
@Controller
@RequestMapping(value="/admin/news")
public class ManagerNewsController {
    
    @Autowired
    NewsService newsService;
    
    @RequestMapping
    public String news(ModelMap map){
        
        Page<News> newsPage = newsService.findAll(0, ManagementConstant.pageSize, "desc", "id");
        
        
        if (null != newsPage)
        {
            map.addAttribute("news_list", newsPage.getContent());
        }
        
        return "/management/news";
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
            Page<News> newsPage = newsService.findAll(pageIndex, ManagementConstant.pageSize, "desc", "id");
            
            if (null != newsPage)
            {
                map.addAttribute("ad_list", newsPage.getContent());
            }
        }
        
        return "/management/news/news_tbody";
    }
    
    @RequestMapping(value="/modify/{brandId}",method = RequestMethod.POST)
    public String modify(ModelMap map, @PathVariable Long brandId){
        if (null != brandId)
        {
            map.addAttribute("news", newsService.findOne(brandId));
        }
        
        return "/management/news/news_modify";
    }
    
    @RequestMapping(value="/save",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> add(ModelMap map, 
                                News news,
                                @RequestParam MultipartFile pic){
        Map<String, Object> res = new HashMap<String, Object>();
        res.put("code", 1);
        
        if (null == news)
        {
            res.put("message", "参数有误");
            return res;
        }
        
        if (null == news.getTitle() || "".equals(news.getTitle()))
        {
            res.put("message", "标题不能为空");
            return res;
        }
        
        if (null == newsService.save(news, pic))
        {
            res.put("message", "保存资讯出错");
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
            newsService.delete(id);
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
            map.addAttribute("news", newsService.findOne(id));
        }
    }
    
}
