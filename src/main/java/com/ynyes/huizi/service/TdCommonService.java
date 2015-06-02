package com.ynyes.huizi.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.ynyes.huizi.entity.TdArticleCategory;
import com.ynyes.huizi.entity.TdProductCategory;

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

    @Autowired
    private TdUserService tdUserService;

    public void setHeader(ModelMap map, HttpServletRequest req) {
        String username = (String) req.getSession().getAttribute("username");

        // 用户名，购物车
        if (null != username) {
            map.addAttribute("username", username);
            map.addAttribute("user",
                    tdUserService.findByUsernameAndIsEnabled(username));
            map.addAttribute("cart_goods_list",
                    tdCartGoodsService.findByUsername(username));
        } else {
            map.addAttribute("cart_goods_list",
                    tdCartGoodsService.findByUsername(req.getSession().getId()));
        }

        // 网站基本信息
        map.addAttribute("site", tdSettingService.findTopBy());
        map.addAttribute("keywords_list",
                tdKeywordsService.findByIsEnableTrueOrderBySortIdAsc());

        // 全部商品分类，取三级
        List<TdProductCategory> topCatList = tdProductCategoryService
                .findByParentIdIsNullOrderBySortIdAsc();
        map.addAttribute("top_cat_list", topCatList);

        if (null != topCatList && topCatList.size() > 0) 
        {
            for (int i = 0; i < topCatList.size(); i++) 
            {
                TdProductCategory topCat = topCatList.get(i);
                List<TdProductCategory> secondLevelList = tdProductCategoryService
                        .findByParentIdOrderBySortIdAsc(topCat.getId());
                map.addAttribute("second_level_" + i + "_cat_list", secondLevelList);

                if (null != secondLevelList && secondLevelList.size() > 0) 
                {
                    for (int j=0; j<secondLevelList.size(); j++)
                    {
                        TdProductCategory secondLevelCat = secondLevelList.get(j);
                        List<TdProductCategory> thirdLevelList = tdProductCategoryService
                                .findByParentIdOrderBySortIdAsc(secondLevelCat.getId());
                        map.addAttribute("third_level_" + i + j + "_cat_list", thirdLevelList);
                    }
                }
            }
        }

        // 导航菜单
        map.addAttribute("navi_item_list",
                tdNaviBarItemService.findByIsEnableTrueOrderBySortIdAsc());

        // 帮助中心
        Long helpId = 12L;

        map.addAttribute("help_id", helpId);

        List<TdArticleCategory> level0HelpList = tdArticleCategoryService
                .findByMenuIdAndParentId(helpId, 0L);

        map.addAttribute("help_level0_cat_list", level0HelpList);

        if (null != level0HelpList) {

            for (int i = 0; i < level0HelpList.size() && i < 4; i++) {
                TdArticleCategory articleCat = level0HelpList.get(i);
                map.addAttribute("help_" + i + "_cat_list",
                        tdArticleCategoryService.findByMenuIdAndParentId(
                                helpId, articleCat.getId()));
            }
        }

        // 友情链接
        map.addAttribute("site_link_list",
                tdSiteLinkService.findByIsEnableTrue());
    }

}
