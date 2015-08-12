package com.ynyes.zphk.controller.front;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ynyes.zphk.entity.TdGoods;
import com.ynyes.zphk.entity.TdKeywords;
import com.ynyes.zphk.service.TdCommonService;
import com.ynyes.zphk.service.TdGoodsService;
import com.ynyes.zphk.service.TdKeywordsService;
import com.ynyes.zphk.util.ClientConstant;

/**
 * 商品检索
 * @author Sharon
 *
 */
@Controller
public class TdSearchController {
    
    @Autowired
    private TdCommonService tdCommonService;
    
    @Autowired
    private TdGoodsService tdGoodsService;
    
    @Autowired
    private TdKeywordsService tdKeywordsService;
    
    @RequestMapping(value="/search", method = RequestMethod.GET)
    public String list(String keywords, Integer page, HttpServletRequest req, ModelMap map){
        System.err.println(keywords);
        tdCommonService.setHeader(map, req);
        
        if (null == page || page < 0)
        {
            page = 0;
        }
        
        if (null != keywords)
        {
            TdKeywords key = tdKeywordsService.findByTitle(keywords);
            
            if (null != key)
            {
                if (null == key.getTotalSearch())
                {
                    key.setTotalSearch(1L);
                }
                else
                {
                    key.setTotalSearch(key.getTotalSearch() + 1L);
                }
                
                key.setLastSearchTime(new Date());
                
                tdKeywordsService.save(key);
            }
            map.addAttribute("goods_page", tdGoodsService.searchGoods(keywords.trim(), page, ClientConstant.pageSize));
        }
        map.addAttribute("pageId", page);
        map.addAttribute("keywords", keywords);
        
        // 热卖推荐
        map.addAttribute("hot_sale_list", tdGoodsService.findByIsRecommendTypeTrueAndIsOnSaleTrueOrderByIdDesc(0, 10).getContent());   
        
        // 销量排行
        map.addAttribute("most_sold_list", tdGoodsService.findByIsOnSaleTrueOrderBySoldNumberDesc(0, 10).getContent());   
        
        
        return "/client/search_list";
    }
}
