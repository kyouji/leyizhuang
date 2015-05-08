package com.ynyes.rongcheng.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.ynyes.rongcheng.entity.TdArticleCategory;
import com.ynyes.rongcheng.entity.TdProductCategory;

@Service
public class TdCommonService {
    
    @Autowired
    private TdSettingService tdSettingService;
    
    @Autowired
    private TdKeywordsService tdKeywordsService;
    
    @Autowired
    private TdCartGoodsService tdCartGoodsService;
    
    @Autowired
    private TdNaviBarItemService tdNaviBarItemService;
    
    @Autowired
    private TdArticleCategoryService tdArticleCategoryService;
    
    @Autowired
    private TdArticleService tdArticleService;
    
    @Autowired
    private TdProductCategoryService tdProductCategoryService;
    
    @Autowired
    private TdSiteLinkService tdSiteLinkService;
    
    public void setHeader( ModelMap map, HttpServletRequest req)
    {
        String username = (String) req.getSession().getAttribute("username");
        
        if (null != username)
        {
            map.addAttribute("username", username);
            map.addAttribute("cart_goods_list", tdCartGoodsService.findByUsername(username));
        }
        else
        {
            map.addAttribute("cart_goods_list", tdCartGoodsService.findByUsername(req.getSession().getId()));
        }
        
        map.addAttribute("site", tdSettingService.findTopBy());
        map.addAttribute("keywords_list", tdKeywordsService.findByIsEnableTrueOrderBySortIdAsc());
        map.addAttribute("navi_item_list", tdNaviBarItemService.findByIsEnableTrueOrderBySortIdAsc());
        
        // 帮助中心
        Long helpId = 12L;
        
        map.addAttribute("help_id", helpId);
        
        List<TdArticleCategory> level0HelpList = tdArticleCategoryService.findByMenuIdAndParentId(helpId, 0L);
        
        map.addAttribute("help_level0_cat_list", level0HelpList);
        
        if (null != level0HelpList)
        {
            for (int i=0; i<level0HelpList.size(); i++)
            {
                TdArticleCategory articleCat = level0HelpList.get(i);
                map.addAttribute("cat" + i + "_help_list", tdArticleService.findByCategoryId(articleCat.getId()));
            }
        }
        
        TdProductCategory freshCat = tdProductCategoryService.findByTitleContaining("生鲜");
        TdProductCategory kitchenCat = tdProductCategoryService.findByTitleContaining("厨具");
        TdProductCategory mobileCat = tdProductCategoryService.findByTitleContaining("通讯");
        TdProductCategory digitCat = tdProductCategoryService.findByTitleContaining("数码");
        TdProductCategory clothCat = tdProductCategoryService.findByTitleContaining("衣装");
        
        map.addAttribute("fresh_cat", freshCat);
        
        if (null != freshCat.getId())
        {
            List<TdProductCategory> freshCatList = tdProductCategoryService
                    .findByParentId(freshCat.getId());

            map.addAttribute("fresh_cat_list", freshCatList);

            for (int i = 0; i < freshCatList.size(); i++) {
                map.addAttribute("fresh_sub_list" + i, tdProductCategoryService
                        .findByParentId(freshCatList.get(i).getId()));
            }
        }
        
        map.addAttribute("kitchen_cat", kitchenCat);

        if (null != kitchenCat)
        {
            List<TdProductCategory> kitchenCatList = tdProductCategoryService
                    .findByParentId(kitchenCat.getId());

            map.addAttribute("kitchen_cat_list", kitchenCatList);

            for (int i = 0; i < kitchenCatList.size(); i++) {
                map.addAttribute("kitchen_sub_list" + i,
                        tdProductCategoryService.findByParentId(kitchenCatList
                                .get(i).getId()));
            }
        }
        
        map.addAttribute("mobile_cat", mobileCat);
        
        if (null != mobileCat)
        {
            List<TdProductCategory> mobileCatList = tdProductCategoryService
                    .findByParentId(mobileCat.getId());

            map.addAttribute("mobile_cat_list", mobileCatList);

            for (int i = 0; i < mobileCatList.size(); i++) {
                map.addAttribute("mobile_sub_list" + i,
                        tdProductCategoryService.findByParentId(mobileCatList
                                .get(i).getId()));
            }
        }
        
        map.addAttribute("digit_cat", digitCat);
        
        if (null != digitCat)
        {
            List<TdProductCategory> digitCatList = tdProductCategoryService
                    .findByParentId(digitCat.getId());

            map.addAttribute("digit_cat_list", digitCatList);

            for (int i = 0; i < digitCatList.size(); i++) {
                map.addAttribute("digit_sub_list" + i, tdProductCategoryService
                        .findByParentId(digitCatList.get(i).getId()));
            }
        }
        
        map.addAttribute("cloth_cat", clothCat);
        
        if (null != clothCat)
        {
            List<TdProductCategory> clothCatList = tdProductCategoryService
                    .findByParentId(clothCat.getId());

            map.addAttribute("cloth_cat_list", clothCatList);

            for (int i = 0; i < clothCatList.size(); i++) {
                map.addAttribute("cloth_sub_list" + i, tdProductCategoryService
                        .findByParentId(clothCatList.get(i).getId()));
            }
        }
        
        // 友情链接
        map.addAttribute("site_link_list", tdSiteLinkService.findByIsEnableTrue());
    }
    
    
}
