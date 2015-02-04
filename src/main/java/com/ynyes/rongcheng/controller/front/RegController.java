package com.ynyes.rongcheng.controller.front;

import java.util.Map;

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
 * 注册处理
 * 
 * RegController<BR>
 * 创建人:guozhengyang <BR>
 * 时间：2015年1月29日-下午1:10:51 <BR>
 * 
 * @version 1.0.0
 *
 */
@Controller
public class RegController {
    @Autowired
    private UserService UserService;
    private String flag;
    @RequestMapping("/reg")
    public String reg(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {

            return "/front/reg";
        }
        return "redirect:/";
    }
    @RequestMapping(value="/logutil")
    public String LogUtils(){
        return "/logutil";
    }
    /**
     * 
     * 注册用户保存到数据库<BR>
     * 方法名：saveUser<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月2日-下午1:44:45 <BR>
     * @param user
     * @param name
     * @param mobile
     * @param password
     * @param newpassword
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping(value="/regsuccess",method=RequestMethod.POST)
    @ResponseBody
    public String saveUser(String name,String mobile,String password,String newpassword,String verify,HttpServletRequest request){
        User user=null;
        String msg = (String) request.getSession().getAttribute("RANDOMVALIDATECODEKEY");
        user= UserService.findByUsername(name);
        if(user!=null){
            flag="Already";//已经存在
            return flag;
        }
            if(StringUtils.isNotEmpty(name) && StringUtils.isNotEmpty(mobile) && StringUtils.isNotEmpty(password) && StringUtils.isNotEmpty(newpassword)){
                if(password==newpassword || password.equals(newpassword)){
                      if(verify.equalsIgnoreCase(msg)){
                        Map<String, Object> map=  UserService.add(name, password, mobile,request);
                       if(map.get("code").equals(0)){
                           flag="success";
                       }
                    }else{
                        flag="vfalse";//验证码失败
                    }
                }else{
                    flag="erroe";//两次输入的密码不一致
                }
            }else{
                flag="false";//失败
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