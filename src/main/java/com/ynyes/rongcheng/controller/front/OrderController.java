package com.ynyes.rongcheng.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.rongcheng.entity.ShoppingOrder;
import com.ynyes.rongcheng.entity.User;
import com.ynyes.rongcheng.service.ShoppingOrderService;

/**
 * 订单处理
 * 
 * OrderController<BR>
 * 创建人:guozhengyang <BR>
 *      +订单逻辑业务处理：小高
 * 时间：2015年1月29日-下午5:02:58 <BR>
 * 
 * @version 1.0.0
 *
 */
@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	ShoppingOrderService shoppingOrderService;

	/**
	 * 
	 * 跳转所有订单页面<BR>
	 * 方法名：orderlist<BR>
	 * 创建人：guozhengyang <BR>
	 *      +订单逻辑业务处理：小高
	 * 时间：2015年1月29日-下午5:04:57 <BR>
	 * 
	 * @return String<BR>
	 * @param [参数1] [参数1说明]
	 * @param [参数2] [参数2说明]
	 * @exception <BR>
	 * @since 1.0.0
	 */
	@RequestMapping("/list")
	public String orderlist(Long status, Model model, HttpServletRequest req) {
		// 根据当前状态获取数据并返回
		User user = (User) req.getSession().getAttribute("user");
		Page<ShoppingOrder> so = shoppingOrderService.findByUsername(
				user.getUsername(), 0, 15, "desc", "id");
		model.addAttribute("shopping_order_list", so.getContent()); // so.getContent()是将当前对象默认变为list
		return "/front/order/orderlist";
	}

	/**
	 * 
	 * 待付款页面<BR>
	 * 方法名：obligation<BR>
	 * 创建人：guozhengyang <BR>
	 *      +订单逻辑业务处理：小高
	 * 时间：2015年1月29日-下午5:17:35 <BR>
	 * 
	 * @return String<BR>
	 * @param [参数1] [参数1说明]
	 * @param [参数2] [参数2说明]
	 * @exception <BR>
	 * @since 1.0.0
	 */
	@RequestMapping("/obligation")
	public String obligation(Long status, Model model, HttpServletRequest req) {

		User user = (User) req.getSession().getAttribute("user");

		Page<ShoppingOrder> so = shoppingOrderService.findByUsernameAndStatusCode(user.getUsername(), status, 0, 15,"desc", "id");
		model.addAttribute("shopping_order_list", so.getContent());
		return "/front/order/obligation";
	}

	/**
	 * 
	 * 待收货页面<BR>
	 * 方法名：startorder<BR>
	 * 创建人：guozhengyang <BR>
	 *      +订单逻辑业务处理：小高
	 * 时间：2015年1月29日-下午5:17:52 <BR>
	 * 
	 * @return String<BR>
	 * @param [参数1] [参数1说明]
	 * @param [参数2] [参数2说明]
	 * @exception <BR>
	 * @since 1.0.0
	 */
	@RequestMapping("/startorder")
	public String startorder(Long status, Model model, HttpServletRequest req) {
		User user = (User) req.getSession().getAttribute("user");

		Page<ShoppingOrder> so = shoppingOrderService
				.findByUsernameAndStatusCode(user.getUsername(), status, 0, 15,
						"desc", "id");
		model.addAttribute("shopping_order_list", so.getContent());
		return "/front/order/startorder";
	}

	/**
	 * 已完成订单<BR>
	 * 方法名：orderok<BR>
	 * 创建人：guozhengyang <BR>
	 *      +订单逻辑业务处理：小高
	 * 时间：2015年1月29日-下午5:18:43 <BR>
	 * 
	 * @return String<BR>
	 * @param [参数1] [参数1说明]
	 * @param [参数2] [参数2说明]
	 * @exception <BR>
	 * @since 1.0.0
	 */
	@RequestMapping("/orderok")
	public String orderok(Long status, Model model, HttpServletRequest req) {
		User user = (User) req.getSession().getAttribute("user");
		Page<ShoppingOrder> so = shoppingOrderService
				.findByUsernameAndStatusCode(user.getUsername(), status, 0, 15,
						"desc", "id");
		model.addAttribute("shopping_order_list", so.getContent());
		return "/front/order/orderok";
	}

	/**
	 * 
	 * 已关闭订单<BR>
	 * 方法名：orderno<BR>
	 * 创建人：guozhengyang <BR>
	 *      
	 * 时间：2015年1月29日-下午5:18:59 <BR>
	 * 
	 * @return String<BR>
	 * @param [参数1] [参数1说明]
	 * @param [参数2] [参数2说明]
	 * @exception <BR>
	 * @since 1.0.0
	 */
	@RequestMapping("/orderno")
	public String orderno(Long status, Model model, HttpServletRequest req) {
		User user = (User) req.getSession().getAttribute("user");
		Page<ShoppingOrder> so = shoppingOrderService.findByUsernameAndStatusCode(user.getUsername(), status, 0, 15,"desc", "id");
		model.addAttribute("shopping_order_list", so.getContent());
		return "/front/order/orderno";
	}
}
