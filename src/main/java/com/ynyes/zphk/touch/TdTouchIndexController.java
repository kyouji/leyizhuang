package com.ynyes.zphk.touch;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.zphk.entity.TdAdType;
import com.ynyes.zphk.entity.TdArticleCategory;
import com.ynyes.zphk.entity.TdGoods;
import com.ynyes.zphk.entity.TdNaviBarItem;
import com.ynyes.zphk.entity.TdProductCategory;
import com.ynyes.zphk.service.TdAdService;
import com.ynyes.zphk.service.TdAdTypeService;
import com.ynyes.zphk.service.TdArticleCategoryService;
import com.ynyes.zphk.service.TdArticleService;
import com.ynyes.zphk.service.TdBrandService;
import com.ynyes.zphk.service.TdCommonService;
import com.ynyes.zphk.service.TdGoodsService;
import com.ynyes.zphk.service.TdNaviBarItemService;
import com.ynyes.zphk.service.TdProductCategoryService;
import com.ynyes.zphk.service.TdSiteLinkService;
import com.ynyes.zphk.util.ClientConstant;

/**
 * 前端首页控制
 *
 */
@Controller
@RequestMapping("/touch")
public class TdTouchIndexController {

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
    
    @Autowired
	private TdNaviBarItemService tdNaviBarItemService;

    @RequestMapping
    public String index(HttpServletRequest req, Device device, ModelMap map) {
        tdCommonService.setHeader(map, req);

        // 商城快报
        List<TdArticleCategory> catList = tdArticleCategoryService
                .findByMenuId(10L);

        if (null != catList && catList.size() > 0) {
            Long catId = catList.get(0).getId();

            map.addAttribute("news_page", tdArticleService
                    .findByMenuIdAndCategoryIdAndIsEnableOrderByIdDesc(10L,
                            catId, 0, ClientConstant.pageSize));
        }

        // 养车宝典
        catList = tdArticleCategoryService.findByMenuId(11L);

        if (null != catList && catList.size() > 0) {
            Long catId = catList.get(0).getId();

            map.addAttribute("curing_page", tdArticleService
                    .findByMenuIdAndCategoryIdAndIsEnableOrderByIdDesc(11L,
                            catId, 0, ClientConstant.pageSize));
        }

        // 一级分类
        List<TdProductCategory> topCatList = tdProductCategoryService
                .findByParentIdIsNullOrderBySortIdAsc();
        if (null != topCatList && topCatList.size() > 0) {
            map.addAttribute("top_category_list", topCatList);

            for (int i = 0; i < topCatList.size(); i++) {
                TdProductCategory topCat = topCatList.get(i);

                if (null != topCat) {
                    map.addAttribute(
                            "top_cat_goods_page" + i,
                            tdGoodsService
                                    .findByCategoryIdAndIsRecommendIndexTrueAndIsOnSaleTrueOrderByIdDesc(
                                            topCat.getId(), 0, 3));
                }
            }
        }

        // 首页大图轮播广告
        TdAdType adType = tdAdTypeService.findByTitle("首页轮播大图广告");

        if (null != adType) {
            map.addAttribute("big_scroll_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }
        
        // 商品分类底部广告
        adType = tdAdTypeService.findByTitle("商品分类底部广告");

        if (null != adType) {
            map.addAttribute("cat_bottom_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 页面中部轮播广告
        adType = tdAdTypeService.findByTitle("页面中部轮播广告");

        if (null != adType) {
            map.addAttribute("mid_scroll_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 页面中部大图广告
        adType = tdAdTypeService.findByTitle("页面中部大图广告");

        if (null != adType) {
            map.addAttribute("mid_big_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 商品分类轮播广告
        adType = tdAdTypeService.findByTitle("商品分类轮播广告");

        if (null != adType) {
            map.addAttribute("type_scroll_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 昆明自驾游大图广告
        adType = tdAdTypeService.findByTitle("昆明自驾游大图广告");

        if (null != adType) {
            map.addAttribute("tour_km_big_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 省内自驾游大图广告
        adType = tdAdTypeService.findByTitle("省内自驾游大图广告");

        if (null != adType) {
            map.addAttribute("tour_province_big_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 国内自驾游大图广告
        adType = tdAdTypeService.findByTitle("国内自驾游大图广告");

        if (null != adType) {
            map.addAttribute("tour_country_big_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 昆明自驾游列表广告
        adType = tdAdTypeService.findByTitle("昆明自驾游列表广告");

        if (null != adType) {
            map.addAttribute("tour_km_list_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 省内自驾游列表广告
        adType = tdAdTypeService.findByTitle("省内自驾游列表广告");

        if (null != adType) {
            map.addAttribute("tour_province_list_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 国内自驾游列表广告
        adType = tdAdTypeService.findByTitle("国内自驾游列表广告");

        if (null != adType) {
            map.addAttribute("tour_country_list_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 首页底部大图广告
        adType = tdAdTypeService.findByTitle("首页底部大图广告");

        if (null != adType) {
            map.addAttribute("bottom_big_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 首页底部小图广告
        adType = tdAdTypeService.findByTitle("首页底部小图广告");

        if (null != adType) {
            map.addAttribute("bottom_small_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 已经结束团购
        map.addAttribute("tuan_prev_page", tdGoodsService
                .findByGroupSaleEndedOrderByGroupSaleStartTimeAsc(0, 5));
        // 下期预告团购
        map.addAttribute("tuan_next_page", tdGoodsService
                .findByGroupSaleGoingToStartOrderByGroupSaleStartTimeAsc(0, 5));
        // 正在进行团购
        map.addAttribute("tuan_cur_page", tdGoodsService
                .findByGroupSalingOrderByGroupSaleStartTimeAsc(0, 5));

        // 已经结束秒杀
        map.addAttribute("miao_prev_page", tdGoodsService
                .findByFlashSaleEndedOrderByFlashSaleStartTimeAsc(0, 5));
        // 即将开始秒杀
        map.addAttribute("miao_next_page", tdGoodsService
                .findByFlashSaleGoingToStartOrderByFlashSaleStartTimeAsc(0, 5));
        // 正在秒杀
        map.addAttribute("miao_cur_page", tdGoodsService
                .findByFlashSalingOrderByFlashSaleStartTimeAsc(0, 5));
        
        // 首页推荐商品
        map.addAttribute("index_recommend_goods_page", tdGoodsService
                .findByIsRecommendIndexTrueAndIsOnSaleTrueOrderByIdDesc(0, 4));
        
        // 触屏页中部广告
        adType = tdAdTypeService.findByTitle("触屏页中部广告");
        
        if (null != adType) {
            map.addAttribute("touch_middle_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }
        
        // 触屏页秒杀栏旁边广告
        adType = tdAdTypeService.findByTitle("触屏页秒杀栏旁边广告");

        if (null != adType) {
            map.addAttribute("touch_miao_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }
        
        // 触屏页团购栏旁边广告
        adType = tdAdTypeService.findByTitle("触屏页团购栏旁边广告");

        if (null != adType) {
            map.addAttribute("touch_tuan_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }
        
        // 自驾游
        TdProductCategory pCat = tdProductCategoryService.findByTitle("自驾游");

        if (null != pCat) {
            map.addAttribute(
                    "self_drive_product_category", pCat);
            map.addAttribute(
                    "self_drive_goods_page",
                    tdGoodsService
                            .findByCategoryIdTreeContainingAndIsOnSaleTrueOrderBySortIdAsc(
                                    pCat.getId(), 0, 5));
        }
        
    	//特价商品
        map.addAttribute("speciaPrice_list",tdGoodsService.findByIsSpecialPriceTrueAndIsOnSaleTrue());
        
        //触屏导航栏——by dengxiao
        List<TdNaviBarItem> naviBarList = tdNaviBarItemService.fingTouchNaviBarList();
        map.addAttribute("navi_touch_list", naviBarList);
        
        return "/touch/index";
    }
    
    @RequestMapping(value="/brand")
    public String brand(HttpServletRequest req, Device device, ModelMap map) {
        
        tdCommonService.setHeader(map, req);

        // 公告
        List<TdArticleCategory> catList = tdArticleCategoryService
                .findByMenuId(10L);

        if (null != catList && catList.size() > 0) {
            for (TdArticleCategory tdCat : catList)
            {
                if (null != tdCat.getTitle() && tdCat.getTitle().equals("公告"))
                {
                    map.addAttribute("news_page", tdArticleService
                            .findByMenuIdAndCategoryIdAndIsEnableOrderByIdDesc(10L,
                                    tdCat.getId(), 0, ClientConstant.pageSize));
                    break;
                }
                
            }
        }

        // 养车宝典
//        catList = tdArticleCategoryService.findByMenuId(11L);

        if (null != catList && catList.size() > 0) {
//            Long catId = catList.get(0).getId();

            map.addAttribute("curing_page", tdArticleService
                    .findByMenuIdAndIsEnableOrderByIdDesc(11L, 0, ClientConstant.pageSize));
//                    .findByMenuIdAndCategoryIdAndIsEnableOrderByIdDesc(11L, catId, 0, ClientConstant.pageSize));
        }

        // 一级分类
        List<TdProductCategory> topCatList = tdProductCategoryService
                .findByParentIdIsNullOrderBySortIdAsc();
        if (null != topCatList && topCatList.size() > 0) {
            map.addAttribute("top_category_list", topCatList);

            for (int i = 0; i < topCatList.size(); i++) {
                TdProductCategory topCat = topCatList.get(i);
				Page<TdGoods> theParam = tdGoodsService
                .findByCategoryIdAndIsRecommendIndexTrueAndIsOnSaleTrueOrderByIdDesc(
                        topCat.getId(), 0, 3);
				System.out.println(theParam);
                if (null != topCat) {
                    map.addAttribute(
                            "top_cat_goods_page" + i,
                            tdGoodsService
                                    .findByCategoryIdAndIsRecommendIndexTrueAndIsOnSaleTrueOrderByIdDesc(
                                            topCat.getId(), 0, 3));
                }
            }
        }
       
        
        //分类热卖品牌
        for (int i = 0; i < topCatList.size(); i++) {
        	//热卖手机
        	if(0 == i ){
        		map.addAttribute("first_brand_list", tdBrandService.findByProductCategoryIdDesc(topCatList.get(i).getId(), 1L));
        	} 
        	//热卖平板/笔记本
        	if(1 ==i ){
        		map.addAttribute("second_brand_list",tdBrandService.findByProductCategoryIdDesc(topCatList.get(i).getId(), 1L));
        	}
        	//热卖数码穿戴
        	if(2 == i ){
        		map.addAttribute("third_brand_list", tdBrandService.findByProductCategoryIdDesc(topCatList.get(i).getId(), 1L));
        	}
        	//热卖数码配件
        	if(3 == i ){
        		map.addAttribute("fourth_brand_list", tdBrandService.findByProductCategoryIdDesc(topCatList.get(i).getId(), 1L));
        	}
		}
        
        //特价商品
        map.addAttribute("speciaPrice_list",tdGoodsService.findByIsSpecialPriceTrueAndIsOnSaleTrue());
        
        // 首页大图轮播广告
        TdAdType adType = tdAdTypeService.findByTitle("首页轮播大图广告");

        if (null != adType) {
            map.addAttribute("big_scroll_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }
        
        // 首页顶部横幅广告
        adType = tdAdTypeService.findByTitle("首页顶部横幅广告");

        if (null != adType) {
            map.addAttribute("index_top_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 一楼商品中部广告
        adType = tdAdTypeService.findByTitle("一楼商品中部广告");

        if (null != adType) {
            map.addAttribute("cat_bottom_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 二楼商品中部广告
        adType = tdAdTypeService.findByTitle("二楼商品中部广告");

        if (null != adType) {
            map.addAttribute("mid_scroll_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 三楼商品中部广告
        adType = tdAdTypeService.findByTitle("三楼商品中部广告");

        if (null != adType) {
            map.addAttribute("mid_big_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 四楼商品中部广告
        adType = tdAdTypeService.findByTitle("四楼商品中部广告");

        if (null != adType) {
            map.addAttribute("type_scroll_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 竭诚服务广告
        adType = tdAdTypeService.findByTitle("竭诚服务广告");

        if (null != adType) {
            map.addAttribute("tour_km_big_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 团购标题图
        adType = tdAdTypeService.findByTitle("团购标题图");

        if (null != adType) {
            map.addAttribute("tuan_title_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 团购广告图片
        adType = tdAdTypeService.findByTitle("团购广告图片");

        if (null != adType) {
            map.addAttribute("tuan_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 昆明自驾游列表广告
        adType = tdAdTypeService.findByTitle("搜索框左侧小广告");

        if (null != adType) {
            map.addAttribute("tour_km_list_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 省内自驾游列表广告
        adType = tdAdTypeService.findByTitle("省内自驾游列表广告");

        if (null != adType) {
            map.addAttribute("tour_province_list_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 国内自驾游列表广告
        adType = tdAdTypeService.findByTitle("国内自驾游列表广告");

        if (null != adType) {
            map.addAttribute("tour_country_list_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 首页底部大图广告
        adType = tdAdTypeService.findByTitle("首页底部大图广告");

        if (null != adType) {
            map.addAttribute("bottom_big_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 首页底部小图广告
        adType = tdAdTypeService.findByTitle("首页底部小图广告");

        if (null != adType) {
            map.addAttribute("bottom_small_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 已经结束团购
        map.addAttribute("tuan_prev_page", tdGoodsService
                .findByGroupSaleEndedOrderByGroupSaleStartTimeAsc(0, 5));
        // 下期预告团购
        map.addAttribute("tuan_next_page", tdGoodsService
                .findByGroupSaleGoingToStartOrderByGroupSaleStartTimeAsc(0, 5));
        // 正在进行团购
        map.addAttribute("tuan_cur_page", tdGoodsService
                .findByGroupSalingOrderByGroupSaleStartTimeAsc(0, 5));

        // 已经结束秒杀
        map.addAttribute("miao_prev_page", tdGoodsService
                .findByFlashSaleEndedOrderByFlashSaleStartTimeAsc(0, 5));
        // 即将开始秒杀
        map.addAttribute("miao_next_page", tdGoodsService
                .findByFlashSaleGoingToStartOrderByFlashSaleStartTimeAsc(0, 5));
        // 正在秒杀
        map.addAttribute("miao_cur_page", tdGoodsService
                .findByFlashSalingOrderByFlashSaleStartTimeAsc(0, 5));
        
        /*
         * 秒杀相关产品
         */
        // 8点
        Calendar cal = Calendar.getInstance();
        
        cal.set(Calendar.HOUR_OF_DAY, 10);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        
        map.addAttribute("miao_cur_8_page", tdGoodsService
                .findByIsFlashSaleTrueAndFlashSaleStartTimeOrderByFlashSaleStartTimeAsc(cal.getTime(), 0, 5));
        
        cal.set(Calendar.HOUR_OF_DAY, 14);
        
        map.addAttribute("miao_cur_15_page", tdGoodsService
                .findByIsFlashSaleTrueAndFlashSaleStartTimeOrderByFlashSaleStartTimeAsc(cal.getTime(), 0, 5));
        
        cal.set(Calendar.HOUR_OF_DAY, 20);
        
        map.addAttribute("miao_cur_23_page", tdGoodsService
                .findByIsFlashSaleTrueAndFlashSaleStartTimeOrderByFlashSaleStartTimeAsc(cal.getTime(), 0, 5));
        
        cal.add(Calendar.DATE, 1);
        cal.set(Calendar.HOUR_OF_DAY, 10);
        
        map.addAttribute("miao_next_8_page", tdGoodsService
                .findByIsFlashSaleTrueAndFlashSaleStartTimeOrderByFlashSaleStartTimeAsc(cal.getTime(), 0, 5));
        
        cal.set(Calendar.HOUR_OF_DAY, 14);
        
        map.addAttribute("miao_next_15_page", tdGoodsService
                .findByIsFlashSaleTrueAndFlashSaleStartTimeOrderByFlashSaleStartTimeAsc(cal.getTime(), 0, 5));
        
        cal.set(Calendar.HOUR_OF_DAY, 20);
        
        map.addAttribute("miao_next_23_page", tdGoodsService
                .findByIsFlashSaleTrueAndFlashSaleStartTimeOrderByFlashSaleStartTimeAsc(cal.getTime(), 0, 5));
        
        cal.add(Calendar.DATE, -2);
        cal.set(Calendar.HOUR_OF_DAY, 10);
        
        map.addAttribute("miao_prev_8_page", tdGoodsService
                .findByIsFlashSaleTrueAndFlashSaleStartTimeOrderByFlashSaleStartTimeAsc(cal.getTime(), 0, 5));
        
        cal.set(Calendar.HOUR_OF_DAY, 14);
       
        map.addAttribute("miao_prev_15_page", tdGoodsService
                .findByIsFlashSaleTrueAndFlashSaleStartTimeOrderByFlashSaleStartTimeAsc(cal.getTime(), 0, 5));
        
        cal.set(Calendar.HOUR_OF_DAY, 20);
        
        map.addAttribute("miao_prev_23_page", tdGoodsService
                .findByIsFlashSaleTrueAndFlashSaleStartTimeOrderByFlashSaleStartTimeAsc(cal.getTime(), 0, 5));
        
        // 首页推荐商品
        map.addAttribute("index_recommend_goods_page", tdGoodsService
                .findByIsRecommendIndexTrueAndIsOnSaleTrueOrderByIdDesc(0, 4));

        // 触屏页中部广告
        adType = tdAdTypeService.findByTitle("触屏页中部广告");

        if (null != adType) {
            map.addAttribute("touch_middle_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 触屏页秒杀栏旁边广告
        adType = tdAdTypeService.findByTitle("触屏页秒杀栏旁边广告");

        if (null != adType) {
            map.addAttribute("touch_miao_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 触屏页团购栏旁边广告
        adType = tdAdTypeService.findByTitle("触屏页团购栏旁边广告");

        if (null != adType) {
            map.addAttribute("touch_tuan_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderByIdDesc(adType.getId()));
        }

        // 自驾游
        TdProductCategory pCat = tdProductCategoryService.findByTitle("自驾游");

        if (null != pCat) {
            map.addAttribute(
                    "self_drive_product_category", pCat);
            map.addAttribute(
                    "self_drive_goods_page",
                    tdGoodsService
                            .findByCategoryIdTreeContainingAndIsOnSaleTrueOrderBySortIdAsc(
                                    pCat.getId(), 0, 5));
        }

        return "/touch/brand_list";
    }
}
