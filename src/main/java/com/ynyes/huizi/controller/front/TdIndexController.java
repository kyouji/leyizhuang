package com.ynyes.huizi.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.huizi.entity.TdAdType;
import com.ynyes.huizi.entity.TdArticleCategory;
import com.ynyes.huizi.entity.TdProductCategory;
import com.ynyes.huizi.service.TdAdService;
import com.ynyes.huizi.service.TdAdTypeService;
import com.ynyes.huizi.service.TdArticleCategoryService;
import com.ynyes.huizi.service.TdArticleService;
import com.ynyes.huizi.service.TdBrandService;
import com.ynyes.huizi.service.TdCommonService;
import com.ynyes.huizi.service.TdGoodsService;
import com.ynyes.huizi.service.TdProductCategoryService;
import com.ynyes.huizi.service.TdSiteLinkService;
import com.ynyes.huizi.util.ClientConstant;

/**
 * 前端首页控制
 *
 */
@Controller
@RequestMapping("/")
public class TdIndexController {

    @Autowired
    private TdCommonService tdCommonService;

    @Autowired
    private TdGoodsService tdGoodsService;

    @Autowired
    private TdArticleService tdArticleService;

    @Autowired
    private TdArticleCategoryService tdArticleCategoryService;

    @Autowired
    private TdProductCategoryService tdProductCategoryService;

    @Autowired
    private TdSiteLinkService tdSiteLinkService;

    @Autowired
    private TdAdTypeService tdAdTypeService;

    @Autowired
    private TdAdService tdAdService;

    @Autowired
    private TdBrandService tdBrandService;

    @RequestMapping
    public String index(HttpServletRequest req, ModelMap map) {

        tdCommonService.setHeader(map, req);

        map.addAttribute(
                "tuan_page",
                tdGoodsService
                        .findByIsGroupSaleTrueAndGroupSaleStartTimeBeforeAndGroupSaleStopTimeAfterAndIsOnSaleTrue(
                                0, ClientConstant.pageSize));

        map.addAttribute(
                "next_tuan_page",
                tdGoodsService
                        .findByIsGroupSaleTrueAndGroupSaleStartTimeAfterAndGroupSaleStopTimeAfterAndIsOnSaleTrue(
                                0, ClientConstant.pageSize));

        // 生鲜
        TdProductCategory cat = tdProductCategoryService.findByTitle("生鲜");

        // 生鲜首页推荐
        map.addAttribute(
                "fresh_goods_page",
                tdGoodsService
                        .findByCategoryIdAndIsRecommendIndexTrueAndIsOnSaleTrueOrderByIdDesc(
                                cat.getId(), 0, ClientConstant.pageSize));

        // 生鲜一级分类列表
        map.addAttribute("fresh_subcategory_list",
                tdProductCategoryService.findByParentIdOrderBySortIdAsc(cat.getId()));

        // 品牌
        map.addAttribute("brand_page", tdBrandService
                .findByStatusIdOrderBySortIdAsc(1L, 0, ClientConstant.pageSize));

        // 食品生鲜品牌
        map.addAttribute(
                "fresh_brand_page",
                tdBrandService.findByStatusIdAndProductCategoryTreeContaining(1L, cat.getId(), 0, ClientConstant.pageSize));

        // 家装厨具
        cat = tdProductCategoryService.findByTitle("厨具");
        map.addAttribute(
                "kitchen_page",
                tdGoodsService
                        .findByCategoryIdAndIsRecommendIndexTrueAndIsOnSaleTrueOrderByIdDesc(
                                cat.getId(), 0, ClientConstant.pageSize));

        // 手机
        cat = tdProductCategoryService.findByTitle("手机");

        // 手机首页推荐
        map.addAttribute(
                "mobile_goods_page",
                tdGoodsService
                        .findByCategoryIdAndIsRecommendIndexTrueAndIsOnSaleTrueOrderByIdDesc(
                                cat.getId(), 0, ClientConstant.pageSize));

        // 手机一级分类列表
        map.addAttribute("mobile_subcategory_list",
                tdProductCategoryService.findByParentIdOrderBySortIdAsc(cat.getId()));

        // 手机品牌
        map.addAttribute(
                "mobile_brand_page",
                tdBrandService.findByStatusIdAndProductCategoryTreeContaining(1L, cat.getId(), 0, ClientConstant.pageSize));

        // 资讯一级分类
        Long newsId = 10L;
        map.addAttribute("news_id", newsId);

        List<TdArticleCategory> level0NewsList = tdArticleCategoryService
                .findByMenuIdAndParentId(newsId, 0L);

        // 首页轮播广告
        TdAdType tdAdType = tdAdTypeService.findByTitle("首页大图广告");

        if (null != tdAdType) {
            map.addAttribute("banner_ad_list",
                    tdAdService.findByTypeId(tdAdType.getId()));
        }

        tdAdType = tdAdTypeService.findByTitle("下期预告底部广告");

        if (null != tdAdType) {
            map.addAttribute("next_ad_list",
                    tdAdService.findByTypeId(tdAdType.getId()));
        }

        tdAdType = tdAdTypeService.findByTitle("品牌专区大图广告");

        if (null != tdAdType) {
            map.addAttribute("brand_big_list",
                    tdAdService.findByTypeId(tdAdType.getId()));
        }

        tdAdType = tdAdTypeService.findByTitle("品牌专区小图广告");

        if (null != tdAdType) {
            map.addAttribute("brand_small_list",
                    tdAdService.findByTypeId(tdAdType.getId()));
        }

        tdAdType = tdAdTypeService.findByTitle("食品生鲜楼层广告");

        if (null != tdAdType) {
            map.addAttribute("fresh_floor_list",
                    tdAdService.findByTypeId(tdAdType.getId()));
        }

        tdAdType = tdAdTypeService.findByTitle("家装厨具楼层广告");

        if (null != tdAdType) {
            map.addAttribute("kitchen_floor_list",
                    tdAdService.findByTypeId(tdAdType.getId()));
        }

        tdAdType = tdAdTypeService.findByTitle("手机通讯楼层广告");

        if (null != tdAdType) {
            map.addAttribute("mobile_floor_list",
                    tdAdService.findByTypeId(tdAdType.getId()));
        }

        map.addAttribute("news_level0_cat_list", level0NewsList);

        if (null != level0NewsList) {
            for (int i = 0; i < level0NewsList.size(); i++) {
                TdArticleCategory articleCat = level0NewsList.get(i);
                map.addAttribute("cat" + i + "_news_list",
                        tdArticleService.findByCategoryId(articleCat.getId()));
            }
        }

        // 最新资讯
        map.addAttribute("latest_news_page", tdArticleService
                .findByMenuIdAndIsEnableOrderByIdDesc(newsId, 0,
                        ClientConstant.pageSize));

        // 通知公告
        Long noteId = 11L;
        map.addAttribute("note_id", noteId);
        map.addAttribute("latest_note_page", tdArticleService
                .findByMenuIdAndIsEnableOrderByIdDesc(noteId, 0,
                        ClientConstant.pageSize));

        return "/client/index";
    }
}
