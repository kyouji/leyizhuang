package com.ynyes.zphk.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.zphk.service.TdArticleCategoryService;
import com.ynyes.zphk.service.TdArticleService;
import com.ynyes.zphk.service.TdCommonService;
import com.ynyes.zphk.service.TdDiySiteService;
import com.ynyes.zphk.service.TdUserRecentVisitService;
import com.ynyes.zphk.util.ClientConstant;

/**
 * 
 * 同盟店
 *
 */
@Controller
@RequestMapping("/shop")
public class TdShopController {
	@Autowired 
	private TdArticleService tdArticleService;
	
	@Autowired 
    private TdArticleCategoryService tdArticleCategoryService;
	
	@Autowired 
    private TdDiySiteService tdDiySiteService;
	
	@Autowired
    private TdCommonService tdCommonService;
	
	@Autowired
    private TdUserRecentVisitService tdUserRecentVisitService;
    
	@RequestMapping("/list")
    public String infoList(Integer page, 
                            ModelMap map,
                            Integer cid,
                            HttpServletRequest req){
	    
	    tdCommonService.setHeader(map, req);
        
        String username = (String) req.getSession().getAttribute("username");
        
        // 读取浏览记录
        if (null == username)
        {
            map.addAttribute("recent_page", tdUserRecentVisitService.findByUsernameOrderByVisitTimeDesc(req.getSession().getId(), 0, ClientConstant.pageSize));
        }
        else
        {
            map.addAttribute("recent_page", tdUserRecentVisitService.findByUsernameOrderByVisitTimeDesc(username, 0, ClientConstant.pageSize));
        }
        
        if (null == cid)
        {
            cid = 0;
        }
        
        String[] cityArray = {"昆明", "曲靖", "大理"};
        
        map.addAttribute("city_list", cityArray);
        map.addAttribute("cid", cid);
        
        
        
        switch (cid)
        {
        case 1:
            map.addAttribute("shop_list", tdDiySiteService.findByCityAndIsEnableTrueOrderBySortIdAsc("曲靖"));
            break;
            
        case 2:
            map.addAttribute("shop_list", tdDiySiteService.findByCityAndIsEnableTrueOrderBySortIdAsc("大理"));
            break;
            
        default:
            map.addAttribute("shop_list", tdDiySiteService.findByCityAndIsEnableTrueOrderBySortIdAsc("昆明"));
        }
        
        return "/client/shop_list";
    }
	
	@RequestMapping("/{id}")
    public String shop(@PathVariable Long id, ModelMap map, HttpServletRequest req){
	    tdCommonService.setHeader(map, req);
	    
	    map.addAttribute("shop", tdDiySiteService.findOne(id));
	    
        return "/client/shop_detail";
    }
}
