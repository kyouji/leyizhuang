package com.ynyes.rongcheng.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.rongcheng.entity.News;
import com.ynyes.rongcheng.service.NewsService;
import com.ynyes.rongcheng.util.StringUtils;

/**
 * 
 * 新闻资讯
 * NewsController<BR>
 * 创建人:guozhengyang <BR>
 * 时间：2015年1月29日-下午6:09:32 <BR>
 * @version 1.0.0
 *
 */
@Controller
@RequestMapping("/news")
public class NewsController {
	@Autowired NewsService NewsService;
    
	@RequestMapping("/{typeId}")
    public String news(@PathVariable String typeId,Integer page,Integer size,String direction,String property,Model model){
    	 
    	 if(page==null){
    		 page=0; 
    	 }
         size=12;
         direction="desc";//排序
         property="typeSortNumber";
    	if(StringUtils.isNotEmpty(typeId) && StringUtils.isNumber(typeId)){
            if(typeId.equals("1")){
            	System.out.println("================================="+typeId);
            	Page<News> pages=NewsService.findByType(typeId, page, size, direction, property);
            	model.addAttribute("news", pages.getContent());
            	model.addAttribute("count", pages.getTotalElements());
            	model.addAttribute("totalpage",pages.getTotalPages());
            	model.addAttribute("page",page);
            	System.out.println("========"+pages.getContent());
            	System.out.println("=========="+pages.getTotalElements());
            	//model.addAttribute("newsmobiles",NewsService.findByType(typeId, page, size, direction, property) );
                return "/front/news/news_mobile";//手机资讯
            }
            if(typeId.equals("2")){
            	System.out.println("================================="+typeId);
            	Page<News> pages=NewsService.findByType(typeId, page, size, direction, property);
            	model.addAttribute("news", pages.getContent());
            	model.addAttribute("count", pages.getTotalElements());
            	System.out.println("========"+pages.getContent());
            	System.out.println("=========="+pages.getTotalElements());
            	//model.addAttribute("newsmobiles",NewsService.findByType(typeId, page, size, direction, property) );
                return "/front/news/news_fever";//手机发烧
            }
            if(typeId.equals("3")){
            	System.out.println("================================="+typeId);
            	Page<News> pages=NewsService.findByType(typeId, page, size, direction, property);
            	model.addAttribute("news", pages.getContent());
            	model.addAttribute("count", pages.getTotalElements());
            	System.out.println("========"+pages.getContent());
            	System.out.println("=========="+pages.getTotalElements());
            	//model.addAttribute("newsmobiles",NewsService.findByType(typeId, page, size, direction, property) );
                return "/front/news/news_video";//新闻视频
            }
       
    }
        return "error404";
    }
}
