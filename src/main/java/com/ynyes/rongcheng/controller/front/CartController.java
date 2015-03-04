package com.ynyes.rongcheng.controller.front;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ynyes.rongcheng.entity.Product;
import com.ynyes.rongcheng.entity.User;
import com.ynyes.rongcheng.service.ProductService;
import com.ynyes.rongcheng.service.ProductVersionService;
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
    @Autowired
    ProductService productService;
    @Autowired
    ProductVersionService productVers;
    
    private String flag;
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
    public ModelAndView cart(String sum,HttpServletRequest request,String pid){
       ModelAndView modelAndView=new ModelAndView();
        User user =(User) request.getSession().getAttribute("user");
        if(user!=null){
            
                String username=user.getUsername();
                if(StringUtils.isNotEmpty(username)){
                    /*modelAndView.addObject("cartId",shoppingCartService.findOne(username, Long.parseLong(sum)));*/
                    
                    modelAndView.addObject("carts",shoppingCartService.findByUsername(username));
                    modelAndView.setViewName("/front/cart/cart");
                    return modelAndView;
                }else {
                  //  modelAndView.addObject("carts",shoppingCartService.findByUsername(username));
                    modelAndView.setViewName("/front/login");
                    return modelAndView; 
                }
       
        }else {
            //  modelAndView.addObject("carts",shoppingCartService.findByUsername(username));
            modelAndView.setViewName("/front/login");
            return modelAndView; 
        }
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
    @RequestMapping(value="/add",method=RequestMethod.POST)
    @ResponseBody
    public String add(String pid,String vid,String quantity,HttpServletRequest request){
       
        User user =(User)request.getSession().getAttribute("user");
       if(user!=null){
           String username=user.getUsername();
           if(StringUtils.isNotEmpty(username)){
             Product product=  productService.findOne(Long.parseLong(pid));
               Map<String, Object> map= shoppingCartService.add(username, Long.parseLong(pid), Long.parseLong(vid), Long.parseLong(quantity), product.getFlashSalePrice());
               if(map.get("code").equals(0)){
                   flag="success";
                   return flag;
               }
//               else if(map.get("message").equals("参数错误")){
//                   flag="messaee";
//                 
//               }
               else{
                   flag="false";
                   return flag;
               }
           }else{
               flag="false";
               return flag;
           }
       }else{
         flag="nulluser";
           return flag;
       }
    }
    public String getFlag() {
        return flag;
    }
    public void setFlag(String flag) {
        this.flag = flag;
    }
    
    
}
