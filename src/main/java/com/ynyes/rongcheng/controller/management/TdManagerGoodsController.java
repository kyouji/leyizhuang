package com.ynyes.rongcheng.controller.management;

import javax.servlet.http.HttpServletRequest;

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

import com.ynyes.rongcheng.entity.TdGoods;
import com.ynyes.rongcheng.entity.TdProductCategory;
import com.ynyes.rongcheng.service.TdArticleService;
import com.ynyes.rongcheng.service.TdBrandService;
import com.ynyes.rongcheng.service.TdGoodsService;
import com.ynyes.rongcheng.service.TdManagerLogService;
import com.ynyes.rongcheng.service.TdParameterService;
import com.ynyes.rongcheng.service.TdProductCategoryService;
import com.ynyes.rongcheng.service.TdProductService;
import com.ynyes.rongcheng.service.TdWarehouseService;
import com.ynyes.rongcheng.util.SiteMagConstant;

/**
 * 后台首页控制器
 * 
 * @author Sharon
 */

@Controller
@RequestMapping(value="/admin/goods")
public class TdManagerGoodsController {
    
    @Autowired
    TdProductCategoryService tdProductCategoryService;
    
    @Autowired
    TdArticleService tdArticleService;
    
    @Autowired
    TdGoodsService tdGoodsService;
    
    @Autowired
    TdWarehouseService tdWarehouseService;
    
    @Autowired
    TdManagerLogService tdManagerLogService;
    
    @Autowired
    TdBrandService tdBrandService;
    
    @Autowired
    TdParameterService tdParameterService;
    
    @Autowired
    TdProductService tdProductService;
    
    @RequestMapping(value="/edit/parameter/{categoryId}", method = RequestMethod.POST)
    public String parameter(@PathVariable Long categoryId, ModelMap map,
            HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username) {
            return "redirect:/admin/login";
        }
        
        TdProductCategory tpc = tdProductCategoryService.findOne(categoryId);
        
        if (null != tpc)
        {
            Long pcId = tpc.getParamCategoryId();
            
            if (null != pcId)
            {
                map.addAttribute("param_list", tdParameterService.findByCategoryTreeContaining(pcId));
                
                // 查找产品列表
                map.addAttribute("product_list", tdProductService.findByProductCategoryTreeContaining(categoryId));
            
                // 查找品牌
                map.addAttribute("brand_list", tdBrandService.findByProductCategoryTreeContaining(categoryId));
            }
           
        }
        
        return "/site_mag/goods_category_param_list";
    }
    
    @RequestMapping(value="/list/dialog/{type}")
    public String goodsListDialog(@PathVariable String type,
                                String keywords,
                                Long categoryId,
                                Integer page, 
                                Integer size,
                                Integer total,
                                String __EVENTTARGET,
                                String __EVENTARGUMENT,
                                String __VIEWSTATE,
                                ModelMap map,
                                HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username) {
            return "redirect:/admin/login";
        }
        if (null != __EVENTTARGET)
        {
            if (__EVENTTARGET.equalsIgnoreCase("btnPage"))
            {
                if (null != __EVENTARGUMENT)
                {
                    page = Integer.parseInt(__EVENTARGUMENT);
                } 
            }
            else if (__EVENTTARGET.equalsIgnoreCase("btnSearch"))
            {
                
            }
            else if (__EVENTTARGET.equalsIgnoreCase("categoryId"))
            {
                
            }
        }
        
        if (null == page || page < 0)
        {
            page = 0;
        }
        
        if (null == size || size <= 0)
        {
            size = SiteMagConstant.pageSize;;
        }
        
        if (null != keywords)
        {
            keywords = keywords.trim();
        }
        
        Page<TdGoods> goodsPage = null;
        
        if (null == categoryId)
        {
            if (null == keywords || "".equalsIgnoreCase(keywords))
            {
                goodsPage = tdGoodsService.findAllOrderBySortIdAsc(page, size);
            }
            else
            {
                goodsPage = tdGoodsService.searchAndOrderBySortIdAsc(keywords, page, size);
            }
        }
        else
        {
            if (null == keywords || "".equalsIgnoreCase(keywords))
            {
                goodsPage = tdGoodsService.findByCategoryIdOrderBySortIdAsc(categoryId, page, size);
            }
            else
            {
                goodsPage = tdGoodsService.searchAndFindByCategoryIdOrderBySortIdAsc(keywords, categoryId, page, size);
            }
        }
        
        map.addAttribute("goods_page", goodsPage);
        
        // 参数注回
        map.addAttribute("category_list", tdProductCategoryService.findAll());
        map.addAttribute("page", page);
        map.addAttribute("size", size);
        map.addAttribute("total", total);
        map.addAttribute("keywords", keywords);
        map.addAttribute("categoryId", categoryId);
        map.addAttribute("__EVENTTARGET", __EVENTTARGET);
        map.addAttribute("__EVENTARGUMENT", __EVENTARGUMENT);
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        
        if (null != type && type.equalsIgnoreCase("gift"))
        {
            return "/site_mag/dialog_goods_gift_list";
        }
        
        return "/site_mag/dialog_goods_combination_list";
    }
    
    @RequestMapping(value="/save", method = RequestMethod.POST)
    public String save(TdGoods tdGoods, 
                        String[] hid_photo_name_show360,
                        String __EVENTTARGET,
                        String __EVENTARGUMENT,
                        String __VIEWSTATE,
                        String menuId,
                        String channelId,
                        ModelMap map,
                        HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username)
        {
            return "redirect:/admin/login";
        }
        
        String uris = parsePicUris(hid_photo_name_show360);
        
        tdGoods.setShowPictures(uris);
        
        String type = null;
        
        if (null == tdGoods.getId())
        {
            type = "add";
        }
        else
        {
            type = "edit";
        }
        
        tdGoodsService.save(tdGoods);
        
        tdManagerLogService.addLog(type, "用户修改商品", req);
        
        return "redirect:/admin/content/list?cid=" + channelId
                + "&mid=" + menuId
                + "&__EVENTTARGET=" + __EVENTTARGET
                + "&__EVENTARGUMENT=" + __EVENTARGUMENT
                + "&__VIEWSTATE=" + __VIEWSTATE;
    }
    
    @ModelAttribute
    public void getModel(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            TdGoods goods = tdGoodsService.findOne(id);
            model.addAttribute("tdGoods", goods);
        }
    }
    
    /**
     * 图片地址字符串整理，多张图片用,隔开
     * 
     * @param params
     * @return
     */
    private String parsePicUris(String[] uris)
    {
        if (null == uris || 0 == uris.length)
        {
            return null;
        }
        
        String res = "";
        
        for (String item : uris)
        {
            String uri = item.substring(item.indexOf("|")+1, item.indexOf("|", 2));
            
            if (null != uri)
            {
                res += uri;
                res += ",";
            }
        }
        
        return res;
    }
    
}
