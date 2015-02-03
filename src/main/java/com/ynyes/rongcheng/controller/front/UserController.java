package com.ynyes.rongcheng.controller.front;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ynyes.rongcheng.entity.User;
import com.ynyes.rongcheng.service.UserService;
import com.ynyes.rongcheng.util.StringUtils;

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
    @Autowired
    private UserService UserService;
    
    private String flag;
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
    public String info(HttpServletRequest request){
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
    /**
     * 
     * 修改用户信息<BR>
     * 方法名：updainfo<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月3日-上午9:07:29 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0"nickname":nickname,"realName":name,"sex":sex,"detailAddress":address,"email":email,"mobile":mobile,"qq":qq,"id":id};
     */
    @RequestMapping(value="update",method=RequestMethod.POST)
    @ResponseBody
    public String updainfo(String nickname,String id,String realName,String sex,String detailAddress,String email,String mobile,String qq,HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        if(StringUtils.isNotEmpty(id)){
          
            user.setNickname(nickname);
            user.setRealName(realName);
            user.setSex(sex);
            user.setDetailAddress(detailAddress);
            user.setEmail(email);
            user.setMobile(mobile);
            user.setQq(qq);
            user.setIsMobileValidated(true);
            user.setIsEmailValidated(true);
            user.setLastLoginTime(new Date());
            user= UserService.updateUser(user);
            if (user!=null) {
                flag="success";
            }else {
                flag="false";
            }
        }    
        return flag;
    }
    
    //get/set
    public String getFlag() {
        return flag;
    }
    public void setFlag(String flag) {
        this.flag = flag;
    }
    
}
