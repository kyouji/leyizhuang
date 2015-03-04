package com.ynyes.rongcheng.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ynyes.rongcheng.entity.User;
import com.ynyes.rongcheng.service.ShoppingCartService;
import com.ynyes.rongcheng.util.StringUtils;

/**
 * 购物车
 * 
 * CartController<BR>
 * 创建人:guozhengyang <BR>
 * 时间：2015年1月30日-上午9:24:04 <BR>
 * @version 1.0.0
 *
 */
@Controller

public class CartController {
    @Autowired
    private ShoppingCartService shoppingCartService;
    /**
     * 
     * 跳转购物车<BR>
     * 方法名：cart<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月30日-上午9:35:24 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/cart")
    public ModelAndView cart(String sum,HttpServletRequest request){
       ModelAndView modelAndView=new ModelAndView();
        User user =(User) request.getSession().getAttribute("user");
        if(user!=null){
            if(StringUtils.isNotEmpty(sum)){
                String username=user.getUsername();
                if(StringUtils.isNotEmpty(username)){
                    modelAndView.addObject("cartId",shoppingCartService.findOne(username, Long.parseLong(sum)));
                    modelAndView.setViewName("/front/cart/cart");
                    return modelAndView;
                }else {
                  //  modelAndView.addObject("carts",shoppingCartService.findByUsername(username));
                    modelAndView.setViewName("/front/cart/cart");
                    return modelAndView; 
                }
            }else{
                
                modelAndView.setViewName("/front/cart/cart");
                return modelAndView;
            }
        }
        return modelAndView;
    }
    /**
     * 
     * 跳转订单信息填写<BR>
     * 方法名：cartStep<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月30日-上午9:36:01 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/cartStep")
    public String cartStep(){
        
        return "/front/cart/cartStep";
    }
    /**
     * 
     * 跳转支付页面<BR>
     * 方法名：cartFinish<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月30日-上午9:44:55 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/cartFinish")
    public String cartFinish(){
        return "/front/cart/cartFinish";
    }
    @RequestMapping("/paysuccess")
    public String paysuccess(){
        return "/front/cart/paysuccess";
    }
}
