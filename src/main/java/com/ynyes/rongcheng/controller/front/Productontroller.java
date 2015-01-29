package com.ynyes.rongcheng.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
    @RequestMapping("/product/{typeId}")
    public String index(@PathVariable Long typeId){
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
