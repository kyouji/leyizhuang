package com.ynyes.rongcheng.controller.front;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前端首页控制
 * 
 * IndexController<BR>
 * 创建人:guozhengyang <BR>
 * 时间：2015年1月29日-上午9:45:13 <BR>
 * @version 1.0.0
 *
 */
@Controller
@RequestMapping("/")
public class IndexController {
    /**
     * 
     * 前台首页跳转<BR>
     * 方法名：index<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-上午9:50:50 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping
    public String index(HttpServletRequest request){
      
        return "/front/index";
    }
}
