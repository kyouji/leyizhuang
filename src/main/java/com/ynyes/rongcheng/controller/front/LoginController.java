package com.ynyes.rongcheng.controller.front;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ynyes.rongcheng.entity.User;
import com.ynyes.rongcheng.service.UserService;
import com.ynyes.rongcheng.util.StringUtils;
import com.ynyes.rongcheng.util.VerifServlet;

/**
 * 登录处理
 * 
 * LoginController<BR>
 * 创建人:guozhengyang <BR>
 * 时间：2015年1月29日-下午1:07:55 <BR>
 * 
 * @version 1.0.0
 *
 */
@Controller
public class LoginController {
    @Autowired
    private UserService UserService;
    private String flag;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {

            return "/front/login";
        }
        return "redirect:/";
    }
    /**
     * 
     * 密码找回<BR>
     * 方法名：forget<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月2日-下午4:37:35 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/forget")
    public String forget(){
        return "/front/forget";
    }
    /**
     * 
     * 通过用户名，密码判断是否正确<BR>
     * 方法名：logsuccess<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月30日-下午10:19:38 <BR>
     * 
     * @param username
     * @param password
     * @return String<BR>
     * @param [参数1] [参数1说明]
     * @param [参数2] [参数2说明]
     * @exception <BR>
     * @since 1.0.0
     */
    @RequestMapping(value="/logsuccess",method = RequestMethod.POST)
    @ResponseBody
    public String logsuccess(String username, String password, String VERIF,
            HttpServletRequest request) {
        if (StringUtils.isEmpty(username) && StringUtils.isEmpty(password)) {
            flag = "false";
        } else {
            String msg = (String) request.getSession().getAttribute(
                    "RANDOMVALIDATECODEKEY");
            if (StringUtils.isNotEmpty(VERIF)) {
                if (VERIF.equalsIgnoreCase(msg)) {
                    Map<String, Object> res = UserService.loginCheck(username, password);
                    
                    if (res.get("code").equals(0)) {
                        request.getSession().setAttribute("username", username);
                        flag = "success";
                    } else {
                        flag = "false";
                    }
                }else{
                    flag = "vfalse";
                }
                
            }else{
                flag = "fnull";
            }
        }
        return flag;
    }

    @RequestMapping("/logout")
    public String logOut(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/";
    }

    @RequestMapping(value = "/verify",method = RequestMethod.GET)
    public void verify(HttpServletResponse response, HttpServletRequest request) {
        response.setContentType("image/jpeg");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        VerifServlet randomValidateCode = new VerifServlet();
        randomValidateCode.getRandcode(request, response);

    }

    // get/set
    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

}
