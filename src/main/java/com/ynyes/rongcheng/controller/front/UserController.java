package com.ynyes.rongcheng.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用户处理
 * 
 * UserController<BR>
 * 创建人:guozhengyang <BR>
 * 时间：2015年1月29日-下午4:13:31 <BR>
 * @version 1.0.0
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
    /**
     * 
     * 个人信息<BR>
     * 方法名：info<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-下午4:30:50 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/info")
    public String info(){
        return "/front/user/info";
    }
    /**
     * 
     * 密码修改<BR>
     * 方法名：updatePassword<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-下午4:31:06 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/updatePassword")
    public String updatePassword(){
        return "/front/user/updatePassword";
    }
    /**
     * 
     * 收货地址<BR>
     * 方法名：address<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-下午4:38:14 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/address")
    public String address(){
        return "/front/user/address";
    }
    /**
     * 
     * 跳转我的收藏<BR>
     * 方法名：collect<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-下午4:44:01 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/collect")
    public String collect(){
        return "/front/user/collect";
    }
    /**
     * 
     * 我的积分页面跳转<BR>
     * 方法名：integral<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-下午5:26:40 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/point")
    public String integral(){
        return "/front/user/integral";
    }
}
