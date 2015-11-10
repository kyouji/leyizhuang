package com.ynyes.zphk.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.zphk.service.TdArticleCategoryService;
import com.ynyes.zphk.service.TdArticleService;
import com.ynyes.zphk.service.TdCommonService;
import com.ynyes.zphk.service.TdDiySiteService;
import com.ynyes.zphk.service.TdUserRecentVisitService;

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
    
	@RequestMapping(value = "/position")
	public String position(HttpServletRequest req,ModelMap map){
		tdCommonService.setHeader(map, req);
		return "/client/position";
	}
	
}
