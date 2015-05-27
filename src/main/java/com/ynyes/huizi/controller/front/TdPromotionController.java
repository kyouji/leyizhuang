package com.ynyes.huizi.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.huizi.entity.TdGoods;
import com.ynyes.huizi.service.TdCommonService;
import com.ynyes.huizi.service.TdGoodsService;
import com.ynyes.huizi.util.ClientConstant;

@Controller
public class TdPromotionController {
   
    @Autowired
    TdGoodsService tdGoodsService;
    
    @Autowired
    TdCommonService tdCommonService;
    
    @RequestMapping("/promotion/{type}")
    public String list(@PathVariable String type, Integer page, ModelMap map, HttpServletRequest req){
        
        tdCommonService.setHeader(map, req);
        
        if (null == type)
        {
            return "/client/error_404";
        }
        
        if (null == page)
        {
            page = 0;
        }
        
        if (type.equalsIgnoreCase("tuan")) // 团购
        {
            Page<TdGoods> goodsPage = tdGoodsService.findByIsGroupSaleTrueAndIsOnSaleTrue(page, ClientConstant.pageSize);
            map.addAttribute("goods_page", goodsPage);
        }
        else
        {
            return "/client/error_404";
        }
        
        return "/client/tuan_list";//错误
    }
}
