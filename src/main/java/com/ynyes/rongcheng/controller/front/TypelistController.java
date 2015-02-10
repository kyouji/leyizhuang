package com.ynyes.rongcheng.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.rongcheng.entity.Product;
import com.ynyes.rongcheng.service.ProductService;
import com.ynyes.rongcheng.util.StringUtils;

/**
 * 商品类型集合
 * 
 * TypelistController<BR>
 * 创建人:guozhengyang <BR>
 * 时间：2015年1月29日-上午10:10:58 <BR>
 * @version 1.0.0
 *
 */
@Controller
public class TypelistController {
    @Autowired
    private  ProductService productservice;
    /**
     * 
     * 跳转到商品类型列表页面<BR>
     * 方法名：index<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-上午10:19:44 <BR>
     * @return String<BR>
     * @param typeid=1(代表进入明星产品,2代表进入手机产品，3代表搜集配件，4代表靓号选择)accessories
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/list/{typeId}")
    public String index(@PathVariable String typeId,Integer page,Integer size,String direction,String property,Model model){
        page=0;
        size=12;
        direction="desc";//排序
        property="sortNumber";//字段
        if(property.equals("价格↑")){
            property="flashSalePrice";
            }else if(property.equals("上架时间↑") || property=="上架时间↑"){
                property="onSaleTime";
            }
        if(StringUtils.isNotEmpty(typeId) && StringUtils.isNumber(typeId)){
            if(typeId.equals("1")){
                return "/front/type_list_star";//明星产品
            }
            if(typeId.equals("2")){
                //根据类型获取所有子类
                Page<Product> pages=productservice.findByType("2", page, size, direction, property);
                model.addAttribute("product", pages.getContent());
                model.addAttribute("count",pages.getTotalElements());
                return "/front/type_list_mobile";//手机产品
            }
            if(typeId.equals("3")){
                Page<Product> pages=productservice.findByType("3", page, size, direction, property);
                model.addAttribute("armature", pages.getContent());
                model.addAttribute("count", pages.getTotalElements());
                return "/front/type_list_accessories";//手机配件
            }
            if(typeId.equals("4")){
                return "/front/type_list_number";//靓号选择
            }
            if(typeId.equals("5")){
                return "/front/news";//新闻资讯
            }
        }else{
            return "error404";//错误
        }
        return "error404";//错误
    }
    /**
     * 
     * 手机产品跳转模版<BR>
     * 方法名：mobile<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月5日-下午3:30:43 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/list/{typeId}_")
    public String mobile(@PathVariable String typeId,Integer page,Integer size,String direction,String property,Model model){
            direction="desc";//排序
          if(StringUtils.isNotEmpty(property)){
              if(property.equals("价格↑")||property=="价格↑"){
                  property="priceMinimum";
              }else if(property.equals("上架时间↑") || property=="上架时间↑"){
                  property="onSaleTime";
              }
          }else{
              property="sortNumber"; 
          }
            
                //根据类型获取所有子类
                Page<Product> pages=productservice.findByType("2", page, size, direction, property);
                model.addAttribute("product", pages.getContent());
                model.addAttribute("count", pages.getTotalElements());
           
        return "/front/listtemp/pageProduct";//手机产品
    }
    /**
     * 
     * 手机配件模版<BR>
     * 方法名：accessories<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月7日-下午4:35:57 <BR>
     * @param typeId
     * @param page
     * @param size
     * @param direction
     * @param model
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/list/{typeId}_3")
    public String accessories(@PathVariable String typeId,Integer page,Integer size,String direction,Model model){
        direction="desc";//排序
        String property="sortNumber";//字段
        
        //根据类型获取所有子类
        Page<Product> pages=productservice.findByType("3", page, size, direction, property);
        model.addAttribute("product", pages.getContent());
        model.addAttribute("count", pages.getTotalElements());
        
        return "/front/listtemp/pageProduct";//手机产品
    }
}
