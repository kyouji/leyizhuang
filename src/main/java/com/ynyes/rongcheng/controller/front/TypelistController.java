package com.ynyes.rongcheng.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String index(@PathVariable String typeId){
        
        if(StringUtils.isNotEmpty(typeId) && StringUtils.isNumber(typeId)){
            if(typeId.equals("1")){
                return "/front/type_list_star";//明星产品
            }
            if(typeId.equals("2")){
                return "/front/type_list_mobile";//手机产品
            }
            if(typeId.equals("3")){
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
}
