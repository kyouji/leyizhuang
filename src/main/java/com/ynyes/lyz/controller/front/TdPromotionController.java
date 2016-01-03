package com.ynyes.lyz.controller.front;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.lyz.entity.TdActivity;
import com.ynyes.lyz.entity.TdAd;
import com.ynyes.lyz.entity.TdAdType;
import com.ynyes.lyz.entity.TdDiySite;
import com.ynyes.lyz.entity.TdGoods;
import com.ynyes.lyz.entity.TdUser;
import com.ynyes.lyz.service.TdActivityService;
import com.ynyes.lyz.service.TdAdService;
import com.ynyes.lyz.service.TdAdTypeService;
import com.ynyes.lyz.service.TdCommonService;
import com.ynyes.lyz.service.TdUserService;

@Controller
@RequestMapping(value = "/promotion")
public class TdPromotionController {

	@Autowired
	private TdUserService tdUserService;

	@Autowired
	private TdCommonService tdCommonService;

	@Autowired
	private TdActivityService tdActivityService;

	@Autowired
	private TdAdTypeService tdAdTypeService;

	@Autowired
	private TdAdService tdAdService;

	/**
	 * 跳转到活动促销页面的方法
	 * 
	 * @author dengxiao
	 */
	@RequestMapping(value = "/list")
	public String promotionList(HttpServletRequest req, ModelMap map) {
		String username = (String) req.getSession().getAttribute("username");
		TdUser user = tdUserService.findByUsernameAndIsEnableTrue(username);
		if (null == user) {
			return "redirect:/login";
		}
		// 获取用户所在门店
		TdDiySite diySite = tdCommonService.getDiySite(req);

		// 获取该门店参与的所有未过期的活动
		List<TdActivity> activities = tdActivityService
				.findByDiySiteIdsContainingAndBeginDateBeforeAndFinishDateAfterOrderBySortIdAsc(diySite.getId() + "",
						new Date());
		// 获取活动的商品及其价格
		List<Map<TdGoods, Double>> promotion_list = tdCommonService.getPromotionGoodsAndPrice(req, activities);
		map.addAttribute("promotion_list", promotion_list);

		// 获取促销页面广告
		TdAdType adType = tdAdTypeService.findByTitle("促销页顶部广告");
		if (null != adType) {
			List<TdAd> ad_list = tdAdService.findByTypeId(adType.getId());
			map.addAttribute("ad_list", ad_list);
		}
		return "/client/promotion_list";
	}
}
