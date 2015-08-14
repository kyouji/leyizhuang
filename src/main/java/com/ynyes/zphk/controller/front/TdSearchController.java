package com.ynyes.zphk.controller.front;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
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
 * 
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

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String list(String keywords, Integer page, HttpServletRequest req, ModelMap map) {
		System.err.println(keywords);
		tdCommonService.setHeader(map, req);

		if (null == page || page < 0) {
			page = 0;
		}

		if (null != keywords) {
			TdKeywords key = tdKeywordsService.findByTitle(keywords);

			if (null != key) {
				if (null == key.getTotalSearch()) {
					key.setTotalSearch(1L);
				} else {
					key.setTotalSearch(key.getTotalSearch() + 1L);
				}

				key.setLastSearchTime(new Date());

				tdKeywordsService.save(key);
			}
			// 将关键字信息再次传到页面，已便于显示----@author dengxiao
			map.addAttribute("keywords", keywords);
			map.addAttribute("goods_page", tdGoodsService.searchGoods(keywords.trim(), page, ClientConstant.pageSize));
		}
		map.addAttribute("pageId", page);
		map.addAttribute("keywords", keywords);

		// 热卖推荐
		map.addAttribute("hot_sale_list",
				tdGoodsService.findByIsRecommendTypeTrueAndIsOnSaleTrueOrderByIdDesc(0, 10).getContent());

		// 销量排行
		map.addAttribute("most_sold_list", tdGoodsService.findByIsOnSaleTrueOrderBySoldNumberDesc(0, 10).getContent());

		return "/client/search_list";
	}

}

//	@RequestMapping(value = "/search/sort")
//	public String searchSort(String type, String keywords, Integer priceCheck, Integer pageCheck, String lowPrice,
//			String highPrice, String lastType, Integer page, Integer sort, HttpServletRequest req, ModelMap map) {
//		tdCommonService.setHeader(map, req);
//		// 将keywords添加到map中以便于跳转页面后重新显示
//		map.addAttribute("keywords", keywords);
//		// 将价格上限和价格下限添加到map中以便于跳转页面后重新显示
//		map.addAttribute("lowPrice", lowPrice);
//		map.addAttribute("highPrice", highPrice);
//
//		// 变量sort用于控制排序是升序还是降序（其中0代表降序，1代表升序）
//
//		if (null == page || page < 0) {
//			page = 0;
//		}
//		
//		if(lowPrice!=null&&"".equals(lowPrice.trim())){
//			lowPrice = null;
//		}
//
//		if(highPrice!=null&&"".equals(highPrice.trim())){
//			highPrice = null;
//		}
//		/*
//		 * 有两种情况下排序规则是不发生改变的： 1. 点击了上一页或下一页（即pageCheck==1） 2.
//		 * 点击了确定价格区间的确定按钮(即priceCheck==1)
//		 */
//		if (pageCheck == 0 && priceCheck == 0) {
//			// 上一次的排序关键字和本次的排序关键字不一致，则页码回归至0，排序规则为降序
//			if (!lastType.trim().equals(type)) {
//				page = 0;
//				sort = 0;
//			} else {
//				// 如果上次和本次的排序关键字一致，则改变排序规则的现有状态
//				page = 0;
//				if (sort == 0) {
//					sort = 1;
//				} else {
//					sort = 0;
//				}
//			}
//		}
//		return "/client/search_list";
//	}
