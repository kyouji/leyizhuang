package com.ynyes.rongcheng.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
@RequestMapping("/type")
public class TypelistController {
    /**
     * 
     * 跳转到商品类型列表页面<BR>
     * 方法名：index<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-上午10:19:44 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/list")
    public String index(){
        return "/front/type_list";
    }
}
