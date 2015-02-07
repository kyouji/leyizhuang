package com.ynyes.rongcheng.controller.front;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ynyes.rongcheng.entity.OrderItem;
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
		model.addAttribute("goods_order_total", so.getContent().size());
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
		int total;
		User user = (User) req.getSession().getAttribute("user");

		Page<ShoppingOrder> so = shoppingOrderService.findByUsernameAndStatusCode(user.getUsername(), status, 0, 5,"desc", "id");
		model.addAttribute("shopping_order_list", so.getContent());
		model.addAttribute("goods_order_total", so.getContent().size());
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
		int total;
		User user = (User) req.getSession().getAttribute("user");

		Page<ShoppingOrder> so = shoppingOrderService
				.findByUsernameAndStatusCode(user.getUsername(), status, 0, 5,
						"desc", "id");
		model.addAttribute("shopping_order_list", so.getContent());
		model.addAttribute("goods_order_total", so.getContent().size());
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
		int total;
		User user = (User) req.getSession().getAttribute("user");
		Page<ShoppingOrder> so = shoppingOrderService
				.findByUsernameAndStatusCode(user.getUsername(), status, 0, 5,
						"desc", "id");
		model.addAttribute("shopping_order_list", so.getContent());
		model.addAttribute("goods_order_total", so.getContent().size());
		return "/front/order/orderok";
	}

	/**
	 * 
	 * 已关闭订单<BR>
	 * 方法名：orderno<BR>
	 * 创建人：guozhengyang <BR>
	 *      +订单逻辑业务处理：小高
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
		int total;
		User user = (User) req.getSession().getAttribute("user");
		Page<ShoppingOrder> so = shoppingOrderService.findByUsernameAndStatusCode(user.getUsername(), status, 0, 5,"desc", "id");
		model.addAttribute("shopping_order_list", so.getContent());
		model.addAttribute("goods_order_total", so.getContent().size());
		return "/front/order/orderno";
	}
	
	
	/**
	 * 删除订单
	 * <BR>
	 * 方法名：deleteorder<BR>
	 * 创建人：小高 <BR>
	 *      
	 * 时间：2015年2月5日10:52:36 <BR>
	 * 
	 * @return String<BR>
	 * @param [参数1] [参数1说明]
	 * @param [参数2] [参数2说明]
	 * @exception <BR>
	 * @since 1.0.0
	 */
	@RequestMapping("/delorder")
	public String deleteorder(Long id,HttpServletRequest req,Model model) {
		int total;
		shoppingOrderService.delete(id);
		User user = (User) req.getSession().getAttribute("user");
		Page<ShoppingOrder> so = shoppingOrderService.findByUsername(
				user.getUsername(), 0, 5, "desc", "id");
		model.addAttribute("shopping_order_list", so.getContent());
		model.addAttribute("goods_order_total", so.getContent().size());
		return "/front/order/orderlist"; 
	}
	
	
	

	/**
	 * 跳转到订单详情页面
	 * <BR>
	 * 方法名：orderdetail<BR>
	 * 创建人：小高 <BR>
	 *      
	 * 时间：2015年2月5日10:52:36 <BR>
	 * 
	 * @return String<BR>
	 * @param [参数1] [参数1说明]
	 * @param [参数2] [参数2说明]
	 * @exception <BR>
	 * @since 1.0.0
	 */
	@RequestMapping("/order_detail")
	public String orderdetail(Long id,HttpServletRequest req,Model model) {
		User user = (User) req.getSession().getAttribute("user");
		ShoppingOrder so = shoppingOrderService.findOne(id);
		model.addAttribute("shopping_order_list", so);
		List<OrderItem> item = so.getOrderItemList();
	    int order_size=item.size();
		model.addAttribute("goods_order_total", order_size);
		return "/front/order/order_detail"; 
	}
	
	/**
	 * 跳转立即支付，将需要支付的信息传递过去（支付页面没有完成，订单详情链接暂且未做）
	 * <BR>
	 * 方法名：orderdetail<BR>
	 * 创建人：小高 <BR>
	 *      
	 * 时间：2015年2月6日14:16:10<BR>
	 * 
	 * @return String<BR>
	 * @param [参数1] [参数1说明]
	 * @param [参数2] [参数2说明]
	 * @exception <BR>
	 * @since 1.0.0
	 */
	@RequestMapping("/cartstep")
	public String cartstep(Long id,HttpServletRequest req,Model model) {
		User user = (User) req.getSession().getAttribute("user");
		ShoppingOrder so = shoppingOrderService.findOne(id);
		model.addAttribute("order", so);
	    List<OrderItem> item = so.getOrderItemList();
	    int order_size=item.size();
		model.addAttribute("goods_order_total", order_size);
		return "/front/cart/cartStep"; 
	}
	
	
	/**
	 * 对分页进行处理
	 * <BR>
	 * 方法名：orderdetail<BR>
	 * 创建人：小高 <BR>
	 *      
	 * 时间：2015年2月7日14:03:49<BR>
	 * 
	 * @return String<BR>
	 * @param [参数1] [参数1说明]
	 * @param [参数2] [参数2说明]
	 * @exception <BR>
	 * @since 1.0.0
	 */
	@RequestMapping("/page")
	public String listpage(Long status, Model model, HttpServletRequest req,int pageSize) {
		User user = (User) req.getSession().getAttribute("user");
		Page<ShoppingOrder> so = shoppingOrderService.findByUsernameAndStatusCode(user.getUsername(), status, 0, pageSize,"desc", "id");
		
        model.addAttribute("sub_type_list", so.getContent());
        model.addAttribute("goods_order_total", so.getTotalElements());
		return "/order/orderchild/page"; 
	}
}
