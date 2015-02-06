package com.ynyes.rongcheng.controller.front;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ynyes.rongcheng.entity.Product;
import com.ynyes.rongcheng.entity.User;
import com.ynyes.rongcheng.service.ProductService;
import com.ynyes.rongcheng.service.UserService;
import com.ynyes.rongcheng.util.StringUtils;

/**
 * 商品详情页面
 * 
 * TypeListContentController<BR>
 * 创建人:guozhengyang <BR>
 * 时间：2015年1月29日-上午10:39:56 <BR>
 * @version 1.0.0
 *
 */
@Controller
public class Productontroller {
    @Autowired
    private  ProductService productservice;
    @Autowired
    private  UserService userService;
    private  String flag;
    /**
     * 
     * 商品详情页面<BR>
     * 方法名：index<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月5日-下午1:43:30 <BR>
     * @param typeId
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/product/{typeId}")
    public ModelAndView index(@PathVariable Long typeId){
        ModelAndView modelAndView=new ModelAndView();
        Product product=productservice.findByid(typeId);
        String list=product.getShowPictures();
        String[] sList = list.split(",");
        modelAndView.addObject("ShowPictures",sList);
        modelAndView.addObject("product",product);
        modelAndView.setViewName("/front/type_list_content");
        return modelAndView;
    }
    /**
     * 
     * 商品对比页面跳转<BR>
     * 方法名：productContrast<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-下午1:03:54 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/ProductContrast")
    public String productContrast(){
        return "/front/ProductContrast";
    }
    /**
     * 
     * 添加收藏<BR>
     * 方法名：collect<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月6日-下午1:36:24 <BR>
     * @param model
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/addcollect")
    @ResponseBody
    public String collect(HttpServletRequest request,Long productid){
      User user= (User) request.getSession().getAttribute("user");
    
      if(user==null){
          flag="logout";
          return flag;
      }else{
          String username=user.getUsername();
          if(StringUtils.isNotEmpty(username)){
              Map<String,Object> map=userService.addCollectedProductId(username, productid);
          if(map.get("code").equals(0)){
              flag="success";
              return flag;
          }else if(map.get("message").equals("已收藏过该商品")){
              flag="flok";
              return flag;
          }
          }
          flag="flase";
      }
      return flag;
    }
    //grt/set
    public String getFlag() {
        return flag;
    }
    public void setFlag(String flag) {
        this.flag = flag;
    }
    
}
