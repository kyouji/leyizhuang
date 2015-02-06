package com.ynyes.rongcheng.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.rongcheng.service.ProductService;

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
    public String index(@PathVariable Long typeId,Model model){
       model.addAttribute("product",productservice.findOne(typeId));
        return "/front/type_list_content";
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
}
