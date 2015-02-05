package com.ynyes.rongcheng.controller.front;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ynyes.rongcheng.entity.ShippingAddress;
import com.ynyes.rongcheng.entity.User;
import com.ynyes.rongcheng.service.ShippingAddressService;
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
    @Autowired
    private ShippingAddressService shippingAddressService;
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
    public String address(HttpServletRequest request,ModelMap map){
        User user=(User) request.getSession().getAttribute("user");
       map.addAttribute("address",UserService.findShippingAddressList(user.getUsername()));
        return "/front/user/address";
    }
    /**
     * 
     * 跳转我的收藏,获取收藏列表<BR>
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
    public String collect(HttpServletRequest request,ModelMap modelMap){
       User user= (User) request.getSession().getAttribute("user");
       String content=user.getCollectedProductIds();
       if(StringUtils.isEmpty(content)){
           return "/front/user/collect";
       }
       modelMap.addAttribute("collectedProductIds", UserService.findCollectedProducts(user.getUsername()));
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
    public String integral(HttpServletRequest request,Model model){
        User user =(User) request.getSession().getAttribute("user");
       model.addAttribute("Points", UserService.findPointsList(user.getUsername()));
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
            user= UserService.save(user); // 取消updateUser()函数, edit by Sharon
            if (user!=null) {
                flag="success";
            }else {
                flag="false";
            }
        }    
        return flag;
    }
    /**
     * 
     * 密码修改<BR>
     * 方法名：updaPs<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月3日-下午2:20:47 <BR>
     * @param name
     * @param password
     * @param newpassword
     * @param oncepassword
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping(value="updatePas")
    @ResponseBody
    public String updaPs(String name,String password,String newpassword,String oncepassword){
        User user= UserService.findByUsername(name);
        String msgpassword=user.getPassword();
        if(!msgpassword.equals(StringUtils.encryption(password))){
            flag="inputerrors";//密码输入错误
            return flag;
        }
            if((StringUtils.isNotEmpty(name)  && StringUtils.isNotEmpty(password) && StringUtils.isNotEmpty(newpassword) && StringUtils.isNotEmpty(oncepassword))){
                user.setPassword(StringUtils.encryption(oncepassword));
                UserService.save(user); // 取消updateUser()函数, edit by Sharon
                flag="success";
                return flag;
              
            }else if(!newpassword.equals(oncepassword)){
                   flag="coflase";
                   return flag;
           }else {
               flag="flase";   
           }
        
        return flag;
    }
    /**
     * 
     * 保存收货地址<BR>
     * 方法名：saveAddress<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月4日-下午2:38:42 <BR>
     * @param address
     * @param request
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping(value="/saveaddress",method=RequestMethod.POST)
    @ResponseBody
    public String saveAddress(ShippingAddress address,HttpServletRequest request){
        User user=(User) request.getSession().getAttribute("user");
        user=UserService.findById(user.getId());
       ShippingAddress shippingAddress =shippingAddressService.save(address);
       user.getShippingAddressList().add(address);
       UserService.save(user);
       if(shippingAddress!=null){
           flag="success";
       }else{
           flag="flase";
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
    /**
     * 
     * 删除地址<BR>
     * 方法名：deleteaddres<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月4日-下午2:40:42 <BR>
     * @param id
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/addressdelete")
    @ResponseBody
    public String deleteaddres(Long id){
        shippingAddressService.delete(id);
        return flag="success";
    }
    /**
     * 
     * 删除收藏<BR>
     * 方法名：deleteContent<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月4日-下午4:31:54 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/delcontent")
    @ResponseBody
    public String deleteContent(HttpServletRequest request){
        User user =(User) request.getSession().getAttribute("user");
        if(user!=null){
            UserService.deleteCollectedProductId(user.getUsername(), Long.parseLong(user.getCollectedProductIds()));
            flag="success";
        }
        return flag;
        }
}
