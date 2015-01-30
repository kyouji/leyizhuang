package com.ynyes.rongcheng.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.rongcheng.entity.User;

/**
 * 订单处理
 * 
 * OrderController<BR>
 * 创建人:guozhengyang <BR>
 * 时间：2015年1月29日-下午5:02:58 <BR>
 * @version 1.0.0
 *
 */
@Controller
@RequestMapping("/order")
public class OrderController {
    /**
     * 
     * 跳转所有订单页面<BR>
     * 方法名：orderlist<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-下午5:04:57 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/list")
    public String orderlist(){
        return "/front/order/orderlist";
    }
    /**
     * 
     * 待付款页面<BR>
     * 方法名：obligation<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-下午5:17:35 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/obligation")
    public String obligation(){
        return "/front/order/obligation";
    }
    /**
     * 
     * 待收货页面<BR>
     * 方法名：startorder<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-下午5:17:52 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/startorder")
    public String startorder(){
        return "/front/order/startorder";
    }
    /**
     * 
     * 已完成订单<BR>
     * 方法名：orderok<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-下午5:18:43 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/orderok")
    public String orderok(){
        return "/front/order/orderok";
    }
    /**
     * 
     * 已关闭订单<BR>
     * 方法名：orderno<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-下午5:18:59 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/orderno")
    public String orderno(){
        return "/front/order/orderno";
    }
}
