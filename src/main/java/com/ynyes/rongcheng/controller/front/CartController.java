package com.ynyes.rongcheng.controller.front;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ynyes.rongcheng.entity.Brand;
import com.ynyes.rongcheng.entity.OrderItem;
import com.ynyes.rongcheng.entity.ProductType;
import com.ynyes.rongcheng.entity.ProductVersion;
import com.ynyes.rongcheng.entity.ShippingAddress;
import com.ynyes.rongcheng.entity.ShoppingCart;
import com.ynyes.rongcheng.entity.SiteInfo;
import com.ynyes.rongcheng.entity.User;
import com.ynyes.rongcheng.service.BrandService;
import com.ynyes.rongcheng.service.OrderItemService;
import com.ynyes.rongcheng.service.ProductService;
import com.ynyes.rongcheng.service.ProductTypeService;
import com.ynyes.rongcheng.service.ProductVersionService;
import com.ynyes.rongcheng.service.ShoppingCartService;
import com.ynyes.rongcheng.service.SiteInfoService;
import com.ynyes.rongcheng.service.UserService;
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
    private ProductService productService;
    
    @Autowired
    private ProductTypeService productTypeService;
    
    @Autowired
    private ProductVersionService productVers;
    
    @Autowired
    private OrderItemService orderItemService;
    
    @Autowired
    private SiteInfoService siteInfoService;
    
    @Autowired
    private BrandService brandService;
    
    @Autowired
    private UserService userService;/*用户相关*/
    
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
    public String cart(String sum,HttpServletRequest request,String pid, ModelMap map){
     // 导航栏
        List<ProductType> rptList = productTypeService.findByParent("");
        
        map.addAttribute("root_type_list", rptList);
        
        for (ProductType pType : rptList)
        {
            if (pType.getName().equals("手机"))
            {
                List<Brand> brandList = brandService.findByType(pType.getName());
                
                if (null != brandList)
                {
                    for (int i=0; i < brandList.size(); i++)
                    {
                        if (brandList.get(i).getName().contains("苹果"))
                        {
                            map.addAttribute("apple_index", i + 1);
                        }
                        
                        if (brandList.get(i).getName().contains("小米"))
                        {
                            map.addAttribute("mi_index", i + 1);
                        }
                        
                        if (brandList.get(i).getName().contains("华为"))
                        {
                            map.addAttribute("huawei_index", i + 1);
                        }
                        
                        if (brandList.get(i).getName().contains("联想"))
                        {
                            map.addAttribute("lenovo_index", i + 1);
                        }
                    }
                }
                map.addAttribute("phone_type", pType);
            }
            else if (pType.getName().equals("手机配件"))
            {
                List<ProductType> ptList = productTypeService.findByParent("手机配件");
                
                map.addAttribute("accessory_sub_type_list", ptList);
                map.addAttribute("phone_accessory_type", pType);
            }
            else if (pType.getName().equals("靓号中心"))
            {
                map.addAttribute("phone_number_type", pType);
            }
        }
        
        map.addAttribute("second_hand_phone_type", productTypeService.findByName("二手手机"));
        
        // 导航栏结束
        
        // 页脚数据
        List<SiteInfo> infoList = siteInfoService.findByType("帮助中心");
        
        map.addAttribute("help_info_list", infoList);
        
        infoList = siteInfoService.findByType("支付配送");
        
        map.addAttribute("delivery_info_list", infoList);
        
        infoList = siteInfoService.findByType("售后服务");
        
        map.addAttribute("service_info_list", infoList);
        
        infoList = siteInfoService.findByType("关于荣诚");
        
        map.addAttribute("about_info_list", infoList);
        
        infoList = siteInfoService.findByType("免费热线电话");
        
        map.addAttribute("phone_info_list", infoList);
        // 页脚数据结束
        
        User user =(User) request.getSession().getAttribute("user");
        if(user!=null){
            
                String username=user.getUsername();
                if(StringUtils.isNotEmpty(username)){
                    /*modelAndView.addObject("cartId",shoppingCartService.findOne(username, Long.parseLong(sum)));*/
                    List<ShoppingCart> carts =shoppingCartService.findByUsername(username);
                   
                    map.addAttribute("carts",carts);
                    map.addAttribute("count",carts.size());/*数量*/
                    
                    return "/front/cart/cart";
                }else {
                    return "/front/login"; 
                }
       
        }else {
            return "/front/login"; 
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
     *  productId (必选)商品ID
     */
    
    @RequestMapping("/cartStep")
    public ModelAndView cartStep(HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView();
        User user=(User) request.getSession().getAttribute("user");
        if(user!=null){
            /*收货地址*/
           List<ShippingAddress> shippingAddresses= userService.findShippingAddressList(user.getUsername());
           /*选中商品*/
           List<ShoppingCart> carts =shoppingCartService.findByUsernameAndIsSelectTrue(user.getUsername());
           
           modelAndView.addObject("carts",carts);
           modelAndView.addObject("count",carts.size());
           modelAndView.addObject("shippingAddresses", shippingAddresses);
           modelAndView.setViewName("/front/cart/cartStep");

        }else{
            modelAndView.setViewName("redirect:/login");
        }
        return modelAndView;
    }
    @RequestMapping("/stepCart")
    @ResponseBody
    public Map<String, Object> stepcart(
           Long pid,
           Long vid,
           Long deliveryQuantity,
           Double price,HttpServletRequest request){
            User user =(User) request.getSession().getAttribute("user");
            Map<String, Object> map = new HashMap<String, Object>();
            if(user!=null){
                  
                map=   shoppingCartService.updateSelect(user.getUsername(), pid, vid, true);
                if(map.get("code").equals(0)){
                        /*if(map.get("code").equals(0)){
                            map=shoppingCartService.updateQuantity(user.getUsername(), pid, vid,(long) 0);
                           
                        }else{
                            return map;
                        }*/
                   }else{
                       return map;
                   }
                
            }else{
                map.put("code", 2);
            }
          return map;
    }
    /**
     * 
     * 添加订单<BR>
     * 方法名：cartStep<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年3月9日-下午5:09:58 <BR>
     * @param productId
     * @param productName
     * @param productVerId
     * @param productVerColor
     * @param productVerCap
     * @param productVerName
     * @param deliveryQuantity
     * @param price
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/addcartStep")
    @ResponseBody
    public String cartStep(Long pid,
            String productName,
            Long vid,
            String productVerColor,
            String productVerCap,
            String productVerName,
            String deliveryQuantity,
            String price,HttpServletRequest request){
        /*空判断*/
        OrderItem item=null;
        User user=(User) request.getSession().getAttribute("user");
        if(user!=null){
            if(StringUtils.isNotEmpty(productName) &&
                    StringUtils.isNotEmpty(deliveryQuantity) &&
                    StringUtils.isNotEmpty(price)){
                item=new OrderItem();
                /*新增订单*/
                item.setProductName(productName);
                item.setDeliveryQuantity(Long.parseLong(deliveryQuantity));
                item.setPrice(Double.parseDouble(price));
                orderItemService.save(item);
              
//                List<ShoppingCart> carts=shoppingCartService.findByUsername(user.getUsername());
//                for (ShoppingCart shoppingCart : carts) {
//                   shoppingCartService.delete(user.getUsername(), shoppingCart.getId());
//                    
//                }
                shoppingCartService.updateQuantity(user.getUsername(), pid, vid,(long) 0);
               flag="success";
               
               return flag;
            }else{
                flag="false";
                return flag;
            }
        }else{
            flag="nullUser";
            return flag;
        }
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
    /**
     * 
     * 支付完成<BR>
     * 方法名：paysuccess<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年3月10日-下午4:47:21 <BR>
     * @param request
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/paysuccess")
    public String paysuccess(HttpServletRequest request){
        User user=(User) request.getSession().getAttribute("user");
        if(user!=null){
            return "/front/cart/paysuccess";
        }else{
            return "redirect:/login";
        }
     }
    /**
     * 
     * 添加购物车<BR>
     * 方法名：add<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年3月9日-上午10:37:25 <BR>
     * @param pid
     * @param vid
     * @param quantity
     * @param request
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping(value="/add",method=RequestMethod.POST)
    @ResponseBody
    public String add(Long[] pid,Long[] vid,Long[] quantity,HttpServletRequest request){
       
        User user =(User)request.getSession().getAttribute("user");
        if (user != null) {
            String username = user.getUsername();
            if (StringUtils.isNotEmpty(username)) {
                if (pid != null && pid.length > 0 && vid != null
                        && vid.length > 0 && quantity != null
                        && quantity.length > 0) {
                    for (int i = 0; i < pid.length; i++) {
                        if (pid.length > i && vid.length > i
                                && quantity.length > i) {
                            ProductVersion version = productService
                                    .findVersion(pid[i], vid[i]);
                            Map<String, Object> map = shoppingCartService.add(
                                    username, pid[i], vid[i], quantity[i],
                                    version.getSalePrice());

                            if (map.get("code").equals(0)) {
                                flag = "success";
                                return flag;
                            } else {
                                flag = "false";
                                return flag;
                            }
                        }
                    }

                } else {
                    flag = "nullfalse";
                    return flag;
                }
            } else {
                flag = "false";
                return flag;
            }
        } else {
            flag = "nulluser";
            return flag;
        }
        return flag;
    }
    
    @RequestMapping("delete")
    @ResponseBody
    public String delete(String id,HttpServletRequest request){
        User user=(User) request.getSession().getAttribute("user");
        if(user!=null){
            shoppingCartService.delete(user.getUsername(), Long.parseLong(id));
            flag="success";
            return flag;
        }else{
            flag="flase";
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
