package com.ynyes.zphk.controller.front;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ynyes.zphk.entity.TdGoods;
import com.ynyes.zphk.entity.TdProduct;
import com.ynyes.zphk.entity.TdProductCategory;
import com.ynyes.zphk.entity.TdSetting;
import com.ynyes.zphk.entity.TdUser;
import com.ynyes.zphk.entity.TdUserComment;
import com.ynyes.zphk.entity.TdUserConsult;
import com.ynyes.zphk.entity.TdUserLowPriceRemind;
import com.ynyes.zphk.entity.TdUserPoint;
import com.ynyes.zphk.service.TdBrandService;
import com.ynyes.zphk.service.TdCommonService;
import com.ynyes.zphk.service.TdDiySiteService;
import com.ynyes.zphk.service.TdGoodsCombinationService;
import com.ynyes.zphk.service.TdGoodsService;
import com.ynyes.zphk.service.TdProductCategoryService;
import com.ynyes.zphk.service.TdProductService;
import com.ynyes.zphk.service.TdSettingService;
import com.ynyes.zphk.service.TdUserCollectService;
import com.ynyes.zphk.service.TdUserCommentService;
import com.ynyes.zphk.service.TdUserConsultService;
import com.ynyes.zphk.service.TdUserLowPriceRemindService;
import com.ynyes.zphk.service.TdUserPointService;
import com.ynyes.zphk.service.TdUserRecentVisitService;
import com.ynyes.zphk.service.TdUserService;
import com.ynyes.zphk.util.ClientConstant;

/**
 * 商品详情页
 * 
 * @author Sharon
 *
 */
@Controller
public class TdGoodsController {
	@Autowired
	private TdGoodsService tdGoodsService;
	
	@Autowired
	private TdBrandService tdBrandService;

	@Autowired
	private TdUserConsultService tdUserConsultService;

	@Autowired
	private TdUserCommentService tdUserCommentService;

	@Autowired
	private TdUserCollectService tdUserCollectService;

	@Autowired
	private TdProductCategoryService tdProductCategoryService;

	@Autowired
	private TdCommonService tdCommonService;

	@Autowired
	private TdGoodsCombinationService tdGoodsCombinationService;

	@Autowired
	private TdUserRecentVisitService tdUserRecentVisitService;

	@Autowired
	private TdSettingService tdSettingService;

	@Autowired
	private TdUserService tdUserService;

	@Autowired
	private TdProductService tdProductService;

	@Autowired
	private TdUserPointService tdUserPointService;

	@Autowired
	private TdDiySiteService tdDiySiteService;
	
	@Autowired
	private TdUserLowPriceRemindService tdRemindService;

	@RequestMapping("/goods/{goodsId}")
	public String product(@PathVariable Long goodsId, Long shareId, Integer qiang, ModelMap map,
			HttpServletRequest req) {

		tdCommonService.setHeader(map, req);

		String username = (String) req.getSession().getAttribute("username");

		// 添加浏览记录
		if (null != username) {
			tdUserRecentVisitService.addNew(username, goodsId);
			map.addAttribute("user", tdUserService.findByUsernameAndIsEnabled(username));
		} else {
			tdUserRecentVisitService.addNew(req.getSession().getId(), goodsId);
		}

		// 促销标志位
		map.addAttribute("qiang", qiang);

		// 读取浏览记录
		if (null == username) {
			map.addAttribute("recent_page", tdUserRecentVisitService
					.findByUsernameOrderByVisitTimeDesc(req.getSession().getId(), 0, ClientConstant.pageSize));
		} else {
			map.addAttribute("recent_page",
					tdUserRecentVisitService.findByUsernameOrderByVisitTimeDesc(username, 0, ClientConstant.pageSize));
		}

		if (null == goodsId) {
			return "error_404";
		}

		TdGoods goods = tdGoodsService.findOne(goodsId);

		if (null == goods) {
			return "error_404";
		}

//		Page<TdUserConsult> consultPage = tdUserConsultService.findByGoodsIdAndIsShowable(goodsId, 0,
//				ClientConstant.pageSize);

		// 商品
		map.addAttribute("goods", goods);

		// 商品参数
		if (goods.getParamList().size() > 0) {
			map.addAttribute("param_list", goods.getParamList());
		}

		/**
		 * 修改以下所有有关评价的方法，将传入的商品ID改成产品ID
		 * 
		 * @author dengxiao
		 */

		// 商品组合
		map.addAttribute("comb_list", tdGoodsCombinationService.findByGoodsId(goods.getProductId()));

		Page<TdUserComment> comment_page = tdUserCommentService.findByGoodsIdAndIsShowable(goods.getProductId(), 0, ClientConstant.pageSize);
		Page<TdUserConsult> consult_page = tdUserConsultService.findByGoodsIdAndIsShowable(goods.getProductId(), 0, ClientConstant.pageSize);
		
		// 全部评论
		map.addAttribute("comment_page",
				comment_page);

		map.addAttribute("consult_page",
				consult_page);

		// 全部评论数
		map.addAttribute("comment_count", tdUserCommentService.countByGoodsIdAndIsShowable(goods.getProductId()));

		// 好评数
		map.addAttribute("three_star_comment_count",
				tdUserCommentService.countByGoodsIdAndStarsAndIsShowable(goods.getProductId(), 3L));

		// 中评数
		map.addAttribute("two_star_comment_count",
				tdUserCommentService.countByGoodsIdAndStarsAndIsShowable(goods.getProductId(), 2L));

		// 差评数
		map.addAttribute("one_star_comment_count",
				tdUserCommentService.countByGoodsIdAndStarsAndIsShowable(goods.getProductId(), 1L));

		// 热卖 edit by Sharon 2015-8-18
		map.addAttribute("hot_sale_page", tdGoodsService.findByCategoryIdAndIsOnSaleTrueOrderBySoldNumberDesc(goods.getCategoryId(), 0, 5));

		// 同盟店
		map.addAttribute("diy_site_list", tdDiySiteService.findByIsEnableTrue());

		// 收藏总数
		map.addAttribute("total_collects", tdUserCollectService.countByGoodsId(goods.getId()));

		// 查找类型
		TdProductCategory tdProductCategory = tdProductCategoryService.findOne(goods.getCategoryId());
		
		// 查询同类型下面品牌 edit by Sharon 2015-8-18
		map.addAttribute("brand_page", tdBrandService.findByStatusIdAndProductCategoryTreeContaining(1L, goods.getCategoryId(), 0, 10));

		// 获取该类型所有父类型
		if (null != tdProductCategory) {
			if (null != tdProductCategory.getParentTree() && !"".equals(tdProductCategory.getParentTree())) {
				List<TdProductCategory> catList = new ArrayList<TdProductCategory>();

				for (String cid : tdProductCategory.getParentTree().split(",")) {
					if (!"".equals(cid)) {
						// 去除方括号
						cid = cid.replace("[", "");
						cid = cid.replace("]", "");

						TdProductCategory tpc = tdProductCategoryService.findOne(Long.parseLong(cid));

						if (null != tpc) {
							catList.add(tpc);
						}
					}
				}

				map.addAttribute("category_tree_list", catList);
			}
		}

		// 获取商品的其他版本
		if (null != goods.getProductId()) {
			TdProduct product = tdProductService.findOne(goods.getProductId());

			if (null != product) {
				List<TdGoods> productGoodsList = tdGoodsService.findByProductIdAndIsOnSaleTrue(goods.getProductId());

				int totalSelects = product.getTotalSelects();

				List<String> selectOneList = new ArrayList<String>();
				List<String> selectTwoList = new ArrayList<String>();
				List<String> selectThreeList = new ArrayList<String>();

				List<TdGoods> selectOneGoodsList = new ArrayList<TdGoods>();
				List<TdGoods> selectTwoGoodsList = new ArrayList<TdGoods>();
				List<TdGoods> selectThreeGoodsList = new ArrayList<TdGoods>();
				// List<TdGoods> selectGoodsList = new ArrayList<TdGoods>();

				String sOne = null;
				String sTwo = null;
				String sThree = null;

				map.addAttribute("total_select", totalSelects);

				switch (totalSelects) {
				case 1:
					sOne = goods.getSelectOneValue().trim();

					for (TdGoods pdtGoods : productGoodsList) {
						String s1 = pdtGoods.getSelectOneValue().trim();
						if (!selectOneList.contains(s1)) {
							selectOneList.add(s1);
							selectOneGoodsList.add(pdtGoods);
						}
					}

					map.addAttribute("select_one_name", product.getSelectOneName());
					map.addAttribute("one_selected", sOne);
					map.addAttribute("select_one_goods_list", selectOneGoodsList);

					break;
				case 2:
					sOne = goods.getSelectOneValue().trim();
					sTwo = goods.getSelectTwoValue().trim();

					for (TdGoods pdtGoods : productGoodsList) {
						String s1 = pdtGoods.getSelectOneValue().trim();
						String s2 = pdtGoods.getSelectTwoValue().trim();

						if (!selectOneList.contains(s1)) {
							selectOneList.add(s1);
							selectOneGoodsList.add(pdtGoods);
						}

						if (!selectTwoList.contains(s2)) {
							selectTwoList.add(s2);
							selectTwoGoodsList.add(pdtGoods);
						}
					}

					map.addAttribute("select_one_name", product.getSelectOneName());
					map.addAttribute("select_two_name", product.getSelectTwoName());
					map.addAttribute("one_selected", sOne);
					map.addAttribute("two_selected", sTwo);
					map.addAttribute("select_one_goods_list", selectOneGoodsList);
					map.addAttribute("select_two_goods_list", selectTwoGoodsList);
					break;

				case 3:
					sOne = goods.getSelectOneValue().trim();
					sTwo = goods.getSelectTwoValue().trim();
					sThree = goods.getSelectThreeValue().trim();

					for (TdGoods pdtGoods : productGoodsList) {
						String s1 = pdtGoods.getSelectOneValue().trim();
						String s2 = pdtGoods.getSelectTwoValue().trim();
						String s3 = pdtGoods.getSelectThreeValue().trim();

						if (!selectOneList.contains(s1)) {
							selectOneList.add(s1);
							selectOneGoodsList.add(pdtGoods);
						}

						if (!selectTwoList.contains(s2)) {
							selectTwoList.add(s2);
							selectTwoGoodsList.add(pdtGoods);
						}

						if (!selectThreeList.contains(s3)) {
							selectThreeList.add(s3);
							selectThreeGoodsList.add(pdtGoods);
						}
					}

					map.addAttribute("select_one_name", product.getSelectOneName());
					map.addAttribute("select_two_name", product.getSelectTwoName());
					map.addAttribute("select_three_name", product.getSelectThreeName());
					map.addAttribute("one_selected", sOne);
					map.addAttribute("two_selected", sTwo);
					map.addAttribute("three_selected", sThree);
					map.addAttribute("select_one_goods_list", selectOneGoodsList);
					map.addAttribute("select_two_goods_list", selectTwoGoodsList);
					map.addAttribute("select_three_goods_list", selectThreeGoodsList);
					break;
				}
			}
		}

		// 分享时添加积分
		if (null != shareId) {
			TdUser sharedUser = tdUserService.findOne(shareId);
			TdSetting setting = tdSettingService.findTopBy();

			String clientIp = req.getRemoteHost();
			String oldIp = (String) req.getSession().getAttribute("remote_ip");

			// 不是来自同一个ip的访问，普通用户
			if (!clientIp.equalsIgnoreCase(oldIp) && sharedUser.getRoleId().equals(0L)) {
				req.getSession().setAttribute("remote_ip", clientIp);

				if (null != sharedUser && null != setting) {
					if (null == sharedUser.getPointGetByShareGoods()) {
						sharedUser.setPointGetByShareGoods(0L);
					}

					if (null == setting.getGoodsShareLimits()) {
						setting.setGoodsShareLimits(50L); // 设定一个默认值
					}

					// 小于积分限额，进行积分
					if (sharedUser.getPointGetByShareGoods().compareTo(setting.getGoodsShareLimits()) < 0) {
						TdUserPoint point = new TdUserPoint();
						point.setDetail("分享商品获得积分");
						point.setPoint(setting.getGoodsSharePoints());
						point.setPointTime(new Date());
						point.setUsername(sharedUser.getUsername());

						if (null != sharedUser.getTotalPoints()) {
							point.setTotalPoint(sharedUser.getTotalPoints() + point.getPoint());
						} else {
							point.setTotalPoint(point.getPoint());
						}

						point = tdUserPointService.save(point);

						sharedUser.setTotalPoints(point.getTotalPoint()); // 积分
						tdUserService.save(sharedUser);
					}
				}
			}
		}

		map.addAttribute("server_ip", req.getLocalName());
		map.addAttribute("server_port", req.getLocalPort());

		return "/client/content";
	}

	@RequestMapping("/goods/comment/{goodsId}")
	public String comments(@PathVariable Long goodsId, Integer page, Long stars, ModelMap map, HttpServletRequest req) {

		if (null == goodsId) {
			return "error_404";
		}

		if (null == page) {
			page = 0;
		}

		if (null == stars) {
			stars = 0L;
		}

		// 获取指定商品的信息
		TdGoods goods = tdGoodsService.findOne(goodsId);

		// 全部评论数
		map.addAttribute("comment_count", tdUserCommentService.countByGoodsIdAndIsShowable(goods.getProductId()));

		// 好评数
		map.addAttribute("three_star_comment_count",
				tdUserCommentService.countByGoodsIdAndStarsAndIsShowable(goods.getProductId(), 3L));

		// 中评数
		map.addAttribute("two_star_comment_count",
				tdUserCommentService.countByGoodsIdAndStarsAndIsShowable(goods.getProductId(), 2L));

		// 差评数
		map.addAttribute("one_star_comment_count",
				tdUserCommentService.countByGoodsIdAndStarsAndIsShowable(goods.getProductId(), 1L));

		if (stars.equals(0L)) {
			map.addAttribute("comment_page", tdUserCommentService.findByGoodsIdAndIsShowable(goods.getProductId(), page,
					ClientConstant.pageSize));
		} else {
			map.addAttribute("comment_page", tdUserCommentService
					.findByGoodsIdAndStarsAndIsShowable(goods.getProductId(), stars, page, ClientConstant.pageSize));
		}

		// 评论
		map.addAttribute("page", page);
		map.addAttribute("stars", stars);
		map.addAttribute("goodsId", goodsId);

		return "/client/goods_comment";
	}

	@RequestMapping("/goods/consult/{goodsId}")
	public String consults(@PathVariable Long goodsId, Integer page, ModelMap map, HttpServletRequest req) {

		if (null == goodsId) {
			return "error_404";
		}

		if (null == page) {
			page = 0;
		}

		//获取指定商品的信息
		TdGoods goods = tdGoodsService.findOne(goodsId);
		
		Page<TdUserConsult> consultPage = tdUserConsultService.findByGoodsIdAndIsShowable(goods.getProductId(), page,
				ClientConstant.pageSize);

		// 咨询
		map.addAttribute("consult_page", consultPage);
		map.addAttribute("page", page);
		map.addAttribute("goodsId", goodsId);

		return "/client/goods_content_consult";
	}
	
	/**
	 * 添加低价提醒的功能
	 * @author dengxiao
	 */
	@RequestMapping("/goods/remind")
	@ResponseBody
	public Map<String, Object> saveRemind(Long goodsId,HttpServletRequest req){
		Map<String, Object> res = new HashMap<String, Object>();
		//code的值为1的时候代表低价提醒功能失败
		res.put("code", 2);
		String username = (String) req.getSession().getAttribute("username");
		TdUserLowPriceRemind theUserRemind = tdRemindService.findByGoodsIdAndUsername(goodsId, username);
		if(null != theUserRemind){
			res.put("message", "您已经开启了此件商品的低价提醒功能！");
			return res;
		}
		if(null == username){
			res.put("code", 1);
			res.put("message", "请先登陆！");
			return res;
		}
		TdGoods goods = tdGoodsService.findOne(goodsId);
		if(null == goods){
			res.put("message", "未能找到指定的商品！");
			return res;
		}
		
		TdUserLowPriceRemind remind = new TdUserLowPriceRemind();
		remind.setUsername(username);
		remind.setGoodsId(goods.getId());
		remind.setGoodsTitle(goods.getTitle());
		remind.setGoodsCoverImageUri(goods.getCoverImageUri());
		remind.setAddTime(new Date());
		tdRemindService.save(remind);
		
		res.put("message", "低价提醒功能启动！");
		res.put("code", 0);
		return res;
	}
}
