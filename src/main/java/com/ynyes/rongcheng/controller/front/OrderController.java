package com.ynyes.rongcheng.controller.front;



import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ynyes.rongcheng.entity.OrderItem;
import com.ynyes.rongcheng.entity.ShoppingOrder;
import com.ynyes.rongcheng.entity.User;
import com.ynyes.rongcheng.service.OrderItemService;
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
	
	@Autowired
	OrderItemService orderItemService;
	/**
	 * 
	 * 跳转所有订单页面<BR>（全部订单栏专用）
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
	@RequestMapping(value="/list")
	public String orderlist(Model model, HttpServletRequest req) {
		
		// 根据当前状态获取数据并返回
		User user = (User) req.getSession().getAttribute("user");
		Page<ShoppingOrder> so = shoppingOrderService.findByUsername(
				user.getUsername(), 0, 5, "desc", "id");
		int length=so.getContent().size();
		List<String> list=new ArrayList<String>(length);
		
		
		model.addAttribute("shopping_order_list", so.getContent()); // so.getContent()是将当前对象默认变为list
		model.addAttribute("goods_order_total", so.getTotalElements());
		return "/front/order/orderlist";
	}
	
	
	
	/**
	 * 
	 *控制按照时间进行控制的页面（全部订单栏专用，这里的分页只是显示了分页首页而已）<BR>
	 * 方法名：orderlist_time<BR>
	 * 创建人：guozhengyang <BR>
	 *      +订单逻辑业务处理：小高
	 * 时间：2015年2月10日11:13:56 <BR>
	 * 
	 * @return String<BR>
	 * @param [参数1] [参数1说明]
	 * @param [参数2] [参数2说明]
	 * @exception <BR>
	 * @since 1.0.0
	 */
	@RequestMapping(value="/list_time")
	public String orderlist_time(Model model, HttpServletRequest req,
			    String order,
	            String prop,
	            Integer page,
	            Integer size,
	            Long timeId
			) {
		// 根据当前状态获取数据并返回
		User user = (User) req.getSession().getAttribute("user");
		Page<ShoppingOrder> p = null;
        if (null == order || null == prop)
        {
            order = "desc";
            prop = "orderTime";
        }
        
        if (null == page || null == size)
        {
            page = 0;
            size = 5;
        }
        
        if (null != timeId)                          //对点击的时间进行判断
        {
            Date current = new Date();
            Calendar  g = Calendar.getInstance();  
            g.setTime(current);  
            Date time = null;
            
            if (1 == timeId) // 最近一月
            {
                g.add(Calendar.MONTH, -1);              
                time = g.getTime(); 
                p=shoppingOrderService.findByUsernameInMonth(user.getUsername(), 1, page, 5, "desc", "id");
            }
            else if (3 == timeId) // 最近三月
            {
            	
                g.add(Calendar.MONTH, -3);              
                time = g.getTime(); 

                p=shoppingOrderService.findByUsernameInMonth(user.getUsername(), 3, page, 5, "desc", "id");
            }
            else if (6 == timeId) // 最近半年
            {
                g.add(Calendar.MONTH, -6);              
                time = g.getTime(); 
                p=shoppingOrderService.findByUsernameInMonth(user.getUsername(), 6, page, 5, "desc", "id");
            }
            else if (12 == timeId) // 最近一年
            {
                g.add(Calendar.YEAR, -1);              
                time = g.getTime(); 
                p=shoppingOrderService.findByUsernameInMonth(user.getUsername(),12, page, 5, "desc", "id");
            }
        }
        else
        {
        	p=shoppingOrderService.findByUsername(user.getUsername(), page, 5, "desc", "id");
        }
	
		System.out.println("点击月份刷新");
		model.addAttribute("shopping_order_list", p.getContent()); // so.getContent()是将当前对象默认变为list
		model.addAttribute("goods_order_total1", p.getTotalElements());
		return "/front/order/orderchild/page"; 
	}
	
	

	/**
	 * 
	 *控制按照时间进行控制的页面（除了全部订单以外其他栏目共享，这里的分页只是显示了分页首页而已）<BR>
	 * 方法名：orderlist_time<BR>
	 * 创建人：guozhengyang <BR>
	 *      +订单逻辑业务处理：小高
	 * 时间：2015年2月11日17:35:31 <BR>
	 * 
	 * @return String<BR>
	 * @param [参数1] [参数1说明]
	 * @param [参数2] [参数2说明]
	 * @exception <BR>
	 * @since 1.0.0
	 */
	@RequestMapping(value="/otherorder_time")
	public String ortherOrderTime(Model model, HttpServletRequest req,
			    String order,
	            String prop,
	            Integer page,
	            Integer size,
	            Long timeId,
	            Long status
			) {
		// 根据当前状态获取数据并返回
		User user = (User) req.getSession().getAttribute("user");
		Page<ShoppingOrder> p = null;
        if (null == order || null == prop)
        {
            order = "desc";
            prop = "orderTime";
        }
        
        if (null == page || null == size)
        {
            page = 0;
            size = 5;
        }
        
        if (null != timeId)                          //对点击的时间进行判断
        {
            Date current = new Date();
            Calendar  g = Calendar.getInstance();  
            g.setTime(current);  
            Date time = null;
            
            if (1 == timeId) // 最近一月
            {
                g.add(Calendar.MONTH, -1);              
                time = g.getTime(); 
               p=shoppingOrderService.findByUsernameAndStatusAndInMonth(user.getUsername(), status, 1, page, 5, "desc", "id");
              //  p=shoppingOrderService.findByUsernameInMonth(user.getUsername(), 1, page, size, "desc", "id");
            }
            else if (3 == timeId) // 最近三月
            {
            	
                g.add(Calendar.MONTH, -3);              
                time = g.getTime(); 
                p=shoppingOrderService.findByUsernameAndStatusAndInMonth(user.getUsername(), status, 3, page, 5, "desc", "id");
               // p=shoppingOrderService.findByUsernameInMonth(user.getUsername(), 3, page, size, "desc", "id");
            }
            else if (6 == timeId) // 最近半年
            {
                g.add(Calendar.MONTH, -6);              
                time = g.getTime(); 
                p=shoppingOrderService.findByUsernameAndStatusAndInMonth(user.getUsername(), status, 6, page, 5, "desc", "id");
                // p=shoppingOrderService.findByUsernameInMonth(user.getUsername(), 6, page, size, "desc", "id");
            }
            else if (12 == timeId) // 最近一年
            {
                g.add(Calendar.YEAR, -1);              
                time = g.getTime(); 
                p=shoppingOrderService.findByUsernameAndStatusAndInMonth(user.getUsername(), status, 12, page, 5, "desc", "id");
                // p=shoppingOrderService.findByUsernameInMonth(user.getUsername(),12, page, size, "desc", "id");
            }
        }
        else
        {
        	p=shoppingOrderService.findByUsername(user.getUsername(), page, 5, "desc", "id");
        }
		
		model.addAttribute("shopping_order_list", p.getContent()); // so.getContent()是将当前对象默认变为list
		model.addAttribute("goods_order_total1", p.getTotalElements());
		return "/front/order/orderchild/page"; 
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

		Page<ShoppingOrder> so = shoppingOrderService.findByUsernameAndStatusCode(user.getUsername(), status, 0, 5,"desc", "id");
		
		model.addAttribute("shopping_order_list", so.getContent());
		model.addAttribute("goods_order_total", so.getTotalElements());
		model.addAttribute("status", status);     //将访问某个状态栏的状态保存下来，在发送异步请求的时候再写回去
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
				.findByUsernameAndStatusCode(user.getUsername(), status, 0, 5,
						"desc", "id");
		
		model.addAttribute("shopping_order_list", so.getContent());
		model.addAttribute("goods_order_total", so.getTotalElements());
		model.addAttribute("status", status);
		
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
	@RequestMapping(value="/orderok")
	public String orderok(Long status, Model model, HttpServletRequest req) {
		int total;
		User user = (User) req.getSession().getAttribute("user");
		Page<ShoppingOrder> so = shoppingOrderService
				.findByUsernameAndStatusCode(user.getUsername(), status, 0, 5,
						"desc", "id");
		
		model.addAttribute("shopping_order_list", so.getContent());
		model.addAttribute("goods_order_total", so.getTotalElements());
		model.addAttribute("status", status);
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
		model.addAttribute("goods_order_total", so.getTotalElements());
		model.addAttribute("status", status);
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
	public String deleteorder(Long id,HttpServletRequest req,Model model,Long status) {
		int total;
		shoppingOrderService.delete(id);
		User user = (User) req.getSession().getAttribute("user");
		Page<ShoppingOrder> so = shoppingOrderService.findByUsername(
				user.getUsername(), 0, 5, "desc", "id");
	
		model.addAttribute("shopping_order_list", so.getContent());
		model.addAttribute("goods_order_total", so.getTotalElements());
		model.addAttribute("status", status);
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
	public String orderdetail(Long id,HttpServletRequest req,Model model,Long status) {
		User user = (User) req.getSession().getAttribute("user");
		ShoppingOrder so = shoppingOrderService.findOne(id);
		model.addAttribute("shopping_order_list", so);
		List<OrderItem> item = so.getOrderItemList();
	    int order_size=item.size();
	    model.addAttribute("order", so);
		model.addAttribute("goods_order_total", order_size);
		model.addAttribute("status", status);
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
	public String cartstep(Long id,HttpServletRequest req,Model model,Long status) {
		User user = (User) req.getSession().getAttribute("user");
		ShoppingOrder so = shoppingOrderService.findOne(id);
	
		model.addAttribute("order", so);
	    List<OrderItem> item = so.getOrderItemList();
	    int order_size=item.size();
		model.addAttribute("goods_order_total", order_size);
		model.addAttribute("status", status);
		return "/front/cart/cartStep"; 
	}
	
	
	/**
	 * 对分页进行处理,这是需要status进行分页
	 * )
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
	@RequestMapping(value="/page_list",method=RequestMethod.POST )
	public String listpage(Long status, Model model, HttpServletRequest req,Integer page) {
	
		User user = (User) req.getSession().getAttribute("user");
		Page<ShoppingOrder> so = shoppingOrderService.findByUsernameAndStatusCode(user.getUsername(), status, page, 5,"desc", "id");
	
		model.addAttribute("shopping_order_list", so.getContent());
        model.addAttribute("goods_order_total", so.getTotalElements());
        model.addAttribute("status", status);
		return "/front/order/orderchild/page"; 
	}
	
	/**
	 * 对分页进行处理,这是全部订单，不需要status（这个分页控制是分页重定义的时候使用）
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
	@RequestMapping(value="/page_list_time",method=RequestMethod.POST )
	public String listpageall( Model model, HttpServletRequest req,Integer page,Integer timeId ) {
		User user = (User) req.getSession().getAttribute("user");
		Page<ShoppingOrder> so=shoppingOrderService.findByUsernameInMonth(user.getUsername(), timeId, page,5, "desc", "id");
		//Page<ShoppingOrder> so = shoppingOrderService.findByUsername(user.getUsername(), page, 5, "desc", "id");
		
		System.out.println("刷新完毕");
		model.addAttribute("shopping_order_list", so.getContent());
        model.addAttribute("goods_order_total1", so.getTotalElements());
		return "/front/order/orderchild/page"; 
	}
	
	/**
	 * 对分页进行处理,这是全部订单，不需要status（这个控制是直接控制全部分页的，没有按钮）
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
	@RequestMapping(value="/page_list_all",method=RequestMethod.POST )
	public String pageListTime( Model model, HttpServletRequest req,Integer page,Integer timeId ) {
		User user = (User) req.getSession().getAttribute("user");
		
		Page<ShoppingOrder> so = shoppingOrderService.findByUsername(user.getUsername(), page, 5, "desc", "id");
		
		System.out.println("刷新完毕");
		model.addAttribute("shopping_order_list", so.getContent());
        model.addAttribute("goods_order_total", so.getTotalElements());
		return "/front/order/orderchild/page"; 
	}
	/**
	 * 对分页进行处理,这是在点击时间按钮的前提下，对查询到的数据进行分页
	 * 这里是针对除了全部订单以外的其他栏目，需要status
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
	@RequestMapping(value="/page_list_all_time",method=RequestMethod.POST )
	public String pageAndTime( Model model, HttpServletRequest req,Integer page,Long status, Integer timeId) {
		User user = (User) req.getSession().getAttribute("user");
		//这里差一个按照订单时间和状态同时满足的方法
		Page<ShoppingOrder> so = shoppingOrderService.findByUsernameAndStatusAndInMonth(user.getUsername(), status, timeId, page, 5, "desc", "id");
		
	
		model.addAttribute("shopping_order_list", so.getContent());
        model.addAttribute("goods_order_total1", so.getTotalElements());
		return "/front/order/orderchild/page"; 
	}
	
	
	/**
	 * 
	 * 待付款页面<BR>
	 * 方法名：obligation<BR>
	 * 创建人：guozhengyang <BR>
	 *      +订单逻辑业务处理：小高
	 * 时间：2015年2月9日19:38:05 <BR>
	 * 
	 * @return String<BR>
	 * @param [参数1] [参数1说明]
	 * @param [参数2] [参数2说明]
	 * @exception <BR>
	 * @since 1.0.0
	 */
	@RequestMapping("/add_order")
	public String addorder(ShoppingOrder shoppingorder, Model model, HttpServletRequest req) {
		User user = (User) req.getSession().getAttribute("user");
		//orderItemService.newOne(productId, productName, productBrief, productCoverImageUri, productCode, productVerId, productVerColor, productVerCap, productVerName, productNumber, price, quantity)
		shoppingOrderService.save(user.getUsername(),
				                  shoppingorder.getOrderItemList(),
				                  shoppingorder.getShippingAddress(), 
				                  shoppingorder.getShippingName(), 
				                  shoppingorder.getShippingPhone(), 
				                  shoppingorder.getShippingType(), 
				                  shoppingorder.getInvoiceTitle());
		 
		
		
//		
//			sta=s.getStatusCode();
//			if(sta==0){
//				model.addAttribute("status_all", "待付款");
//			}
//			if(sta==1){
//				model.addAttribute("status_all", "待收货");
//			}
//			if(sta==3){
//				model.addAttribute("status_all", "已完成");
//			}
//			if(sta==4){
//				model.addAttribute("status_all", "已关闭");
//			}
//		}
//		model.addAttribute("shopping_order_list", so.getContent());
//		model.addAttribute("goods_order_total", so.getTotalElements());
//		model.addAttribute("status", status);     //将访问某个状态栏的状态保存下来，在发送异步请求的时候再写回去
		return "redirect:/order/list";
	}
	
	
	
}
