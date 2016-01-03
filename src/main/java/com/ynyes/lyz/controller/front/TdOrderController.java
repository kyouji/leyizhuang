package com.ynyes.lyz.controller.front;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ynyes.lyz.entity.TdActivityGiftList;
import com.ynyes.lyz.entity.TdCartGoods;
import com.ynyes.lyz.entity.TdCity;
import com.ynyes.lyz.entity.TdCoupon;
import com.ynyes.lyz.entity.TdDeliveryType;
import com.ynyes.lyz.entity.TdDiySite;
import com.ynyes.lyz.entity.TdPayType;
import com.ynyes.lyz.entity.TdShippingAddress;
import com.ynyes.lyz.entity.TdSubdistrict;
import com.ynyes.lyz.entity.TdUser;
import com.ynyes.lyz.service.TdCartGoodsService;
import com.ynyes.lyz.service.TdCityService;
import com.ynyes.lyz.service.TdCommonService;
import com.ynyes.lyz.service.TdCouponService;
import com.ynyes.lyz.service.TdDeliveryTypeService;
import com.ynyes.lyz.service.TdDiySiteService;
import com.ynyes.lyz.service.TdPayTypeService;
import com.ynyes.lyz.service.TdShippingAddressService;
import com.ynyes.lyz.service.TdSubdistrictService;
import com.ynyes.lyz.service.TdUserService;

@Controller
@RequestMapping(value = "/order")
public class TdOrderController {

	@Autowired
	private TdUserService tdUserService;

	@Autowired
	private TdShippingAddressService tdShippingAddressService;

	@Autowired
	private TdCommonService tdCommonService;

	@Autowired
	private TdDeliveryTypeService tdDeliveryTypeService;

	@Autowired
	private TdPayTypeService tdPayTypeService;

	@Autowired
	private TdDiySiteService tdDiySiteService;

	@Autowired
	private TdCouponService tdCouponService;

	@Autowired
	private TdSubdistrictService tdSubdistrictService;

	@Autowired
	private TdCityService tdCityService;

	@Autowired
	private TdCartGoodsService tdCartGoodsService;

	/**
	 * 跳转到填写订单的页面
	 * 
	 * @author dengxiao
	 */
	@RequestMapping
	public String writeOrderInfo(HttpServletRequest req, ModelMap map) {
		String username = (String) req.getSession().getAttribute("username");
		TdUser user = tdUserService.findByUsernameAndIsEnableTrue(username);
		if (null == user) {
			return "redirect:/login";
		}

		// 从session中获取一系列的信息
		Long addressId = (Long) req.getSession().getAttribute("order_addressId");
		Long payTypeId = (Long) req.getSession().getAttribute("order_payTypeId");
		String remark = (String) req.getSession().getAttribute("order_remark");
		Long diySiteId = (Long) req.getSession().getAttribute("order_diySiteId");
		Long deliveryId = (Long) req.getSession().getAttribute("order_deliveryId");
		String deliveryDate = (String) req.getSession().getAttribute("order_deliveryDate");
		String deliveryDetail = (String) req.getSession().getAttribute("order_deliveryDetail");
		Long deliveryDetailId = (Long) req.getSession().getAttribute("order_deliveryDetailId");

		// 获取确定使用的现金券
		@SuppressWarnings("unchecked")
		List<TdCoupon> no_product_used = (List<TdCoupon>) req.getSession().getAttribute("order_noProductCouponUsed");
		// 获取确定使用的产品券
		@SuppressWarnings("unchecked")
		List<TdCoupon> product_used = (List<TdCoupon>) req.getSession().getAttribute("order_productCouponUsed");

		// 创建一个变量用于存储物流配送费用
		Double deliveryFee = 0.00;

		if (null == addressId) {
			// 获取用户默认收货地址
			List<TdShippingAddress> addressList = user.getShippingAddressList();
			if (null != addressList) {
				for (TdShippingAddress address : addressList) {
					if (null != address && null != address.getIsDefaultAddress() && address.getIsDefaultAddress()) {
						map.addAttribute("address", address);
						req.getSession().setAttribute("order_addressId", address.getId());
						// 获取配送费用
						Long subdistrictId = address.getSubdistrictId();
						TdSubdistrict subdistrict = tdSubdistrictService.findOne(subdistrictId);
						if (null != subdistrict) {
							deliveryFee = subdistrict.getDeliveryFee();
							if (null == deliveryFee) {
								deliveryFee = 0.00;
							}
						}
					}
				}
			}
		} else {
			TdShippingAddress address = tdShippingAddressService.findOne(addressId);
			if (null != address) {
				req.getSession().setAttribute("order_addressId", address.getId());
			}
			map.addAttribute("address", address);
			// 获取配送费用
			Long subdistrictId = address.getSubdistrictId();
			TdSubdistrict subdistrict = tdSubdistrictService.findOne(subdistrictId);
			if (null != subdistrict) {
				deliveryFee = subdistrict.getDeliveryFee();
				if (null == deliveryFee) {
					deliveryFee = 0.00;
				}
			}
		}

		// 获取已选商品（整合后的）
		List<TdCartGoods> selected_list = tdCommonService.getAllContainsColorPackage(req);
		// 将整合后的已选商品存储到数据库中
		for (TdCartGoods cartGoods : selected_list) {
			cartGoods.setUsername(username);
			tdCartGoodsService.save(cartGoods);
		}
		map.addAttribute("selected_list", selected_list);

		// 获取默认的配送方式
		if (null == deliveryId) {
			List<TdDeliveryType> delivery_list = tdDeliveryTypeService.findAll();
			if (null != delivery_list && delivery_list.size() > 0) {
				if (null != delivery_list.get(0)) {
					req.getSession().setAttribute("order_deliveryId", delivery_list.get(0).getId());
				}
				map.addAttribute("delivery", delivery_list.get(0));
			}
		} else {
			TdDeliveryType deliveryType = tdDeliveryTypeService.findOne(deliveryId);
			if (null != deliveryType) {
				req.getSession().setAttribute("order_deliveryId", deliveryType.getId());
			}
			map.addAttribute("delivery", deliveryType);
		}

		// 获取默认的门店（用户归属门店）
		if (null == diySiteId) {
			TdDiySite diySite = tdCommonService.getDiySite(req);
			if (null != diySite) {
				req.getSession().setAttribute("order_diySiteId", diySite.getId());
			}
		}
		// 获取默认所有的支付方式
		if (null == payTypeId) {
			List<TdPayType> pay_type_list = tdPayTypeService.findAllOrderBySortIdAsc();
			if (null != pay_type_list && pay_type_list.size() > 0) {
				if (null != pay_type_list.get(0)) {
					req.getSession().setAttribute("order_payTypeId", pay_type_list.get(0).getId());
				}
				map.addAttribute("pay_type", pay_type_list.get(0));
			}
		} else {
			TdPayType payType = tdPayTypeService.findOne(payTypeId);
			if (null != payType) {
				req.getSession().setAttribute("order_payTypeId", payType.getId());
			}
			map.addAttribute("pay_type", payType);
		}

		// 获取默认时间，默认为第二天的11:30-12:30
		if (null == deliveryDate) {
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, 1);
			Date date = cal.getTime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String order_deliveryDate = sdf.format(date);
			req.getSession().setAttribute("order_deliveryDate", order_deliveryDate);
			req.getSession().setAttribute("order_deliveryDetail", "11:30-12:30");
			req.getSession().setAttribute("order_deliveryDetailId", 11L);
			map.addAttribute("order_deliveryDate", order_deliveryDate);
			map.addAttribute("order_deliveryDetail", "11:30-12:30");
			map.addAttribute("order_deliveryDetailId", 11L);
		} else {
			map.addAttribute("order_deliveryDate", deliveryDate);
			map.addAttribute("order_deliveryDetail", deliveryDetail);
			map.addAttribute("deliveryDetailId", deliveryDetailId);
		}

		// 创建一个变量用于存储此单的总金额
		Double totalPrice = 0.00;

		// 创建一个变量用于存储此单能够使用的现金券的最大额（除去使用了产品券的部分）
		Double maxPrivilege = 0.00;

		// 检查用户所有的优惠券是否存在过期的
		tdCommonService.checkUserCoupon(req);

		// 获取用户所有未使用的现金券（同时，这个集合也可以存储此单能够使用的指定产品现金券）
		List<TdCoupon> no_product_coupon_list = tdCouponService
				.findByUsernameAndIsUsedFalseAndTypeCategoryIdAndIsOutDateFalseOrderByGetTimeDesc(username, 1L);
		if (null == no_product_coupon_list) {
			no_product_coupon_list = new ArrayList<>();
		}
		// 创建一个集合用于存储当前用户能够在此单使用的产品券
		List<TdCoupon> product_coupon_list = new ArrayList<>();
		// 遍历已选，一个一个的查找用户能够使用的产品券或指定产品现金券，同时计算此单的总金额
		for (TdCartGoods cartGoods : selected_list) {
			if (null != cartGoods) {
				// 创建一个变量用于判断指定的商品使用产品券的数量
				Long usedNumber = 0L;
				if (null != product_used) {
					for (TdCoupon coupon : product_used) {
						if (null != coupon && null != coupon.getGoodsId()
								&& coupon.getGoodsId() == cartGoods.getGoodsId()) {
							usedNumber += 1L;
						}
					}
				}

				if (null != cartGoods.getPrice()) {
					// 创建一个变量用于存储指定商品未使用产品券的数量
					Long unUsed = 0L;
					if (null == cartGoods.getPrice()) {
						cartGoods.setPrice(0.00);
					}
					if (null == cartGoods.getQuantity()) {
						cartGoods.setQuantity(0L);
					}
					if ((cartGoods.getQuantity() - usedNumber) > 0) {
						unUsed = (cartGoods.getQuantity() - usedNumber);
					}
					if (null == cartGoods.getRealPrice()) {
						cartGoods.setRealPrice(0.00);
					}
					// 总金额变化
					totalPrice += (cartGoods.getPrice() * unUsed);
					// 计算未使用产品券的部分能够使用的现金券的额度
					maxPrivilege = ((cartGoods.getPrice() - cartGoods.getRealPrice()) * unUsed);
				}
			}

			List<TdCoupon> product_coupon_by_goodsId = tdCouponService
					.findByUsernameAndIsUsedFalseAndTypeCategoryId3LAndIsOutDateFalseAndGoodsIdOrderByGetTimeDesc(
							username, cartGoods.getGoodsId());
			if (null != product_coupon_by_goodsId && product_coupon_by_goodsId.size() > 0) {
				product_coupon_list.addAll(product_coupon_by_goodsId);
			}

			List<TdCoupon> no_product_coupon_by_goodsId = tdCouponService
					.findByUsernameAndIsUsedFalseAndTypeCategoryId2LAndIsOutDateFalseAndGoodsIdOrderByGetTimeDesc(
							username, cartGoods.getGoodsId());
			if (null != no_product_coupon_by_goodsId && no_product_coupon_by_goodsId.size() > 0) {
				no_product_coupon_list.addAll(no_product_coupon_by_goodsId);
			}
		}

		// 创建一个变量用于存储现金券所减少的金额
		Double privilegePrice = 0.00;
		// 遍历所有已选的现金券，计算现金券减少金额的总量
		if (null != no_product_used) {
			for (TdCoupon coupon : no_product_used) {
				if (null != coupon && null != coupon.getPrice()) {
					privilegePrice += coupon.getPrice();
				}
			}
		}

		// 判断实际减少额是否大于最大减少额
		if (privilegePrice > maxPrivilege) {
			privilegePrice = maxPrivilege;
		}

		// 总金额变化
		totalPrice -= privilegePrice;

		map.addAttribute("no_product_used", no_product_used);
		map.addAttribute("product_used", product_used);

		map.addAttribute("no_product_coupon_list", no_product_coupon_list);
		map.addAttribute("product_coupon_list", product_coupon_list);

		map.addAttribute("remark", remark);
		map.addAttribute("user", user);

		map.addAttribute("totalPrice", totalPrice);
		map.addAttribute("deliveryFee", deliveryFee);
		return "/client/order_pay";

	}

	/**
	 * 跳转到查看已选商品的方法
	 * 
	 * @author dengxiao
	 */
	@RequestMapping(value = "/selected")
	public String orderSelected(HttpServletRequest req, ModelMap map) {
		String username = (String) req.getSession().getAttribute("username");
		TdUser user = tdUserService.findByUsernameAndIsEnableTrue(username);
		if (null == user) {
			return "redirect:/login";
		}

		// 从数据库中获取所有的已选商品
		List<TdCartGoods> all_selected = tdCartGoodsService.findByUsername(username);
		// 创建一个集合用于存储所有的赠品
		List<TdCartGoods> presented = new ArrayList<>();
		// 获取当前所有的赠品
		presented = tdCommonService.getPresent(req, all_selected, presented);

		// 以下操作是为了避免脏数据刷新影响到了数据库中的数据
		for (TdCartGoods tdCartGoods : all_selected) {
			tdCartGoodsService.delete(tdCartGoods.getId());
		}

		all_selected = tdCommonService.getAllContainsColorPackage(req);
		tdCartGoodsService.save(all_selected);

		all_selected = tdCartGoodsService.findByUsername(username);
		// 创建一个集合用于存储所有的小辅料
		List<TdActivityGiftList> gift_list = new ArrayList<>();
		// 获取已选【id：数量】对
		Map<Long, Long> group = tdCommonService.getGroup(req);
		gift_list = tdCommonService.getGift(req, group, gift_list);

		// 以下操作是为了避免脏数据刷新影响到了数据库中的数据
		for (TdCartGoods tdCartGoods : all_selected) {
			tdCartGoodsService.delete(tdCartGoods.getId());
		}

		all_selected = tdCommonService.getAllContainsColorPackage(req);
		tdCartGoodsService.save(all_selected);

		// 获取所有商品的总量和总价
		Long totalNumber = 0L;
		Double totalPrice = 0.00;
		if (null != all_selected) {
			for (TdCartGoods cartGoods : all_selected) {
				if (null != cartGoods) {
					Double unit_price = cartGoods.getPrice();
					Long quantity = cartGoods.getQuantity();
					if (null != quantity) {
						totalNumber += quantity;
						if (null != unit_price) {
							totalPrice += (unit_price * quantity);
						}
					}
				}
			}
		}

		// 还需遍历赠品已得到正确的商品总量
		if (null != presented) {
			for (TdCartGoods cartGoods : presented) {
				if (null != cartGoods) {
					Long quantity = cartGoods.getQuantity();
					if (null != quantity) {
						totalNumber += quantity;
					}
				}
			}
		}

		map.addAttribute("totalNumber", totalNumber);
		map.addAttribute("totalPrice", totalPrice);

		map.addAttribute("all_selected", all_selected);
		map.addAttribute("presented", presented);
		return "/client/order_list";
	}

	/**
	 * 对用户填写的留言信息进行存储的方法
	 * 
	 * @author dengxiao
	 */
	@RequestMapping(value = "/remark/save")
	@ResponseBody
	public Map<String, Object> remarkSave(HttpServletRequest req, String remark) {
		Map<String, Object> res = new HashMap<>();
		res.put("status", -1);
		req.getSession().setAttribute("order_remark", remark);
		res.put("remark", remark);
		res.put("status", 0);
		return res;
	}

	/**
	 * 跳转到选择配送方式的页面的方法
	 * 
	 * @author dengxiao
	 * 
	 */
	@RequestMapping(value = "/delivery")
	public String selectDelivery(HttpServletRequest req, ModelMap map) {
		String username = (String) req.getSession().getAttribute("username");
		TdUser user = tdUserService.findByUsername(username);
		if (null == user) {
			return "redirect:/login";
		}

		// 获取用户的城市
		TdCity city = tdCityService.findOne(user.getCityId());

		SimpleDateFormat hh = new SimpleDateFormat("HH");
		SimpleDateFormat mm = new SimpleDateFormat("mm");
		SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyy-MM-dd");

		// 获取当前选择的门店
		Long diySiteId = (Long) req.getSession().getAttribute("order_diySiteId");
		// 获取当前选择的配送方式（0. 送货上门；1. 门店自提）
		Long deliveryId = (Long) req.getSession().getAttribute("order_deliveryId");
		// 获取当前选择的配送时间
		String deliveryDate = (String) req.getSession().getAttribute("order_deliveryDate");
		// 获取当前选择的配送时间段
		String deliveryDetail = (String) req.getSession().getAttribute("order_deliveryDetail");
		// 获取当前选择的配送时间段的id
		Long deliveryDetailId = (Long) req.getSession().getAttribute("order_deliveryDetailId");

		// 获取所有的配送方式
		List<TdDeliveryType> delivery_list = tdDeliveryTypeService.findAllOrderBySortIdAsc();
		map.addAttribute("delivery_list", delivery_list);

		// 获取配送时间的限制（时间选择机制：如果是上午下单，最早的配送时间是当前下午，如果是下午下单，最早配送时间是第二天的上午）
		Date now = new Date();
		String h = hh.format(now);
		String m = mm.format(now);
		Long hour = Long.parseLong(h);
		Long minute = Long.parseLong(m);

		Date limitDate = now;

		Long delay = city.getDelayHour();
		if (null == delay) {
			delay = 0L;
		}

		Long tempHour = hour + delay;
		if (24 <= tempHour) {
			tempHour -= 24;
		}

		// 判断能否当天配送
		if (tempHour > city.getFinishHour() || (tempHour == city.getFinishHour() && minute > city.getFinishMinute())) {
			limitDate = new Date(now.getTime() + (1000 * 60 * 60 * 24));
			tempHour = 9L;
		}

		// 获取限制时间
		map.addAttribute("limitHour", tempHour);

		map.addAttribute("limitDay", yyyyMMdd.format(limitDate));

		String earlyDate = yyyyMMdd.format(limitDate) + " " + tempHour + ":30-" + (tempHour + 1) + ":30";

		// 获取指定城市下所有的门店
		List<TdDiySite> diy_list = tdDiySiteService.findByRegionIdAndIsEnableOrderBySortIdAsc(city.getId());
		// 获取默认门店
		TdDiySite diySite = tdDiySiteService.findOne(diySiteId);

		map.addAttribute("diySite", diySite);
		map.addAttribute("diy_list", diy_list);
		map.addAttribute("earlyDate", earlyDate);
		map.addAttribute("diySiteId", diySiteId);
		map.addAttribute("deliveryId", deliveryId);
		map.addAttribute("deliveryDate", deliveryDate);
		map.addAttribute("deliveryDetail", deliveryDetail);
		map.addAttribute("deliveryDetailId", deliveryDetailId);

		return "/client/order_delivery";
	}

	/**
	 * 存储新的配送方式的信息的方法
	 * 
	 * @author dengxiao
	 */
	@RequestMapping(value = "/delivery/save")
	public String saveDelivery(HttpServletRequest req, Long type, String date, Long detailTime, Long diySite) {
		String username = (String) req.getSession().getAttribute("username");
		TdUser user = tdUserService.findByUsernameAndIsEnableTrue(username);
		if (null == user) {
			return "redirect:/login";
		}

		req.getSession().setAttribute("order_deliveryId", type);
		req.getSession().setAttribute("order_deliveryDate", date);
		req.getSession().setAttribute("order_deliveryDetail", detailTime + ":30-" + (detailTime + 1) + ":30");
		req.getSession().setAttribute("order_diySiteId", diySite);

		return "redirect:/order";
	}

	/**
	 * 跳转到选择支付方式的页面的方法
	 * 
	 * @author dengxiao
	 */
	@RequestMapping(value = "/paytype")
	public String selectPayType(HttpServletRequest req, ModelMap map) {
		String username = (String) req.getSession().getAttribute("username");
		TdUser user = tdUserService.findByUsernameAndIsEnableTrue(username);
		if (null == user) {
			return "redirect:/login";
		}

		// 获取当前选择的支付方式
		Long payTypeId = (Long) req.getSession().getAttribute("order_payTypeId");

		map.addAttribute("payTypeId", payTypeId);

		// 获取所有的支付方式
		List<TdPayType> pay_type_list = tdPayTypeService.findByIsOnlinePayTrueAndIsEnableTrueOrderBySortIdAsc();
		map.addAttribute("pay_type_list", pay_type_list);

		// 查询是否存在货到付款的支付方式
		TdPayType cashOnDelivery = tdPayTypeService.findByTitleAndIsEnableTrue("货到付款");
		if (null != cashOnDelivery) {
			map.addAttribute("cashOndelivery", cashOnDelivery);
		}
		return "/client/order_pay_type";
	}

	/**
	 * 跳转到选择优惠券的页面
	 * 
	 * @author dengxiao
	 */
	@RequestMapping(value = "/coupon/{type}")
	public String selectCoupon(HttpServletRequest req, ModelMap map, @PathVariable Long type) {
		// 根据type的值不同跳转到不同的页面：0. 现金券；1. 产品券
		String username = (String) req.getSession().getAttribute("username");
		TdUser user = tdUserService.findByUsernameAndIsEnableTrue(username);
		if (null == user) {
			return "redirect:/login";
		}

		// 获取所有已选的商品
		List<TdCartGoods> selected_list = tdCommonService.getAllContainsColorPackage(req);

		// 获取用户所有未使用的现金券（同时，这个集合也可以存储此单能够使用的指定产品现金券）
		List<TdCoupon> no_product_coupon_list = tdCouponService
				.findByUsernameAndIsUsedFalseAndTypeCategoryIdAndIsOutDateFalseOrderByGetTimeDesc(username, 1L);
		if (null == no_product_coupon_list) {
			no_product_coupon_list = new ArrayList<>();
		}

		// 创建一个集合用于存储当前用户能够在此单使用的产品券
		List<TdCoupon> product_coupon_list = new ArrayList<>();
		// 遍历已选，一个一个的查找用户能够使用的产品券或指定产品现金券
		for (TdCartGoods cartGoods : selected_list) {
			if (null != cartGoods) {
				List<TdCoupon> product_coupon_by_goodsId = tdCouponService
						.findByUsernameAndIsUsedFalseAndTypeCategoryId3LAndIsOutDateFalseAndGoodsIdOrderByGetTimeDesc(
								username, cartGoods.getGoodsId());
				if (null != product_coupon_by_goodsId && product_coupon_by_goodsId.size() > 0) {
					product_coupon_list.addAll(product_coupon_by_goodsId);
				}

				List<TdCoupon> no_product_coupon_by_goodsId = tdCouponService
						.findByUsernameAndIsUsedFalseAndTypeCategoryId2LAndIsOutDateFalseAndGoodsIdOrderByGetTimeDesc(
								username, cartGoods.getGoodsId());
				if (null != no_product_coupon_by_goodsId && no_product_coupon_by_goodsId.size() > 0) {
					no_product_coupon_list.addAll(no_product_coupon_by_goodsId);
				}
			}
		}

		// 获取确定使用的现金券
		@SuppressWarnings("unchecked")
		List<TdCoupon> no_product_used = (List<TdCoupon>) req.getSession().getAttribute("order_noProductCouponUsed");
		// 获取确定使用的产品券
		@SuppressWarnings("unchecked")
		List<TdCoupon> product_used = (List<TdCoupon>) req.getSession().getAttribute("order_productCouponUsed");

		// 跳转到选择现金券的页面
		if (0L == type) {
			map.addAttribute("no_product_coupon_list", no_product_coupon_list);
			map.addAttribute("no_product_used", no_product_used);
			return "/client/order_cash_coupon";
		} else {
			map.addAttribute("product_coupon_list", product_coupon_list);
			map.addAttribute("product_used", product_used);
			return "/client/order_product_coupon";
		}
	}

	/**
	 * 选择/取消选择优惠券的方法
	 * 
	 * @author dengxiao
	 */
	@RequestMapping(value = "/operate/coupon")
	@ResponseBody
	public Map<String, Object> operateCoupon(HttpServletRequest req, Long id, Long type, Long status) {
		Map<String, Object> res = new HashMap<>();
		res.put("status", -1);

		// 获取确定使用的现金券
		@SuppressWarnings("unchecked")
		List<TdCoupon> no_product_used = (List<TdCoupon>) req.getSession().getAttribute("order_noProductCouponUsed");
		// 获取确定使用的产品券
		@SuppressWarnings("unchecked")
		List<TdCoupon> product_used = (List<TdCoupon>) req.getSession().getAttribute("order_productCouponUsed");

		if (null == no_product_used) {
			no_product_used = new ArrayList<>();
		}
		if (null == product_used) {
			product_used = new ArrayList<>();
		}

		// 获取指定id的优惠券
		TdCoupon coupon = tdCouponService.findOne(id);
		if (0L == type) {
			if (0L == status) {
				no_product_used.add(coupon);
			}
			if (1L == status) {
				for (int i = 0; i < no_product_used.size(); i++) {
					TdCoupon tdCoupon = no_product_used.get(i);
					if (null != tdCoupon && null != tdCoupon.getId() && tdCoupon.getId() == id) {
						no_product_used.remove(i);
					}
				}
			}
		}

		if (1L == type) {
			if (0L == status) {
				product_used.add(coupon);
			}
			if (1L == status) {
				for (int i = 0; i < product_used.size(); i++) {
					TdCoupon tdCoupon = product_used.get(i);
					if (null != tdCoupon && null != tdCoupon.getId() && tdCoupon.getId() == id) {
						product_used.remove(i);
					}
				}
			}
		}

		req.getSession().setAttribute("order_productCouponUsed", product_used);
		req.getSession().setAttribute("order_noProductCouponUsed", no_product_used);
		res.put("status", 0);
		return res;
	}

	/**
	 * 确认选择的支付方式的方法（最后跳转回到填写订单的页面）
	 * 
	 * @author dengxiao
	 */
	@RequestMapping(value = "/confirm/paytype")
	public String confirmPayType(HttpServletRequest req, Long id) {
		String username = (String) req.getSession().getAttribute("username");
		TdUser user = tdUserService.findByUsernameAndIsEnableTrue(username);
		if (null == user) {
			return "redirect:/login";
		}
		if (null != id) {
			req.getSession().setAttribute("order_payTypeId", id);
		}
		return "redirect:/order";
	}
}
