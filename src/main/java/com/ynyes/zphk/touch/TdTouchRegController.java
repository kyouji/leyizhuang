package com.ynyes.zphk.touch;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ynyes.zphk.entity.TdSetting;
import com.ynyes.zphk.entity.TdUser;
import com.ynyes.zphk.entity.TdUserPoint;
import com.ynyes.zphk.service.TdCommonService;
import com.ynyes.zphk.service.TdSettingService;
import com.ynyes.zphk.service.TdUserPointService;
import com.ynyes.zphk.service.TdUserService;

/**
 * 注册处理
 * 
 */
@Controller
public class TdTouchRegController {
    @Autowired
    private TdUserService tdUserService;
    
    @Autowired
    private TdUserPointService tdUserPointService;
    
    @Autowired
    private TdSettingService tdSettingService;
    
    @Autowired
    private TdCommonService tdCommonService;
    
    @RequestMapping("/touch/reg")
    public String reg(Integer errCode, Integer shareId, HttpServletRequest request, ModelMap map) {
        String username = (String) request.getSession().getAttribute("username");
        
        if (null != shareId)
        {
            map.addAttribute("share_id", shareId);
        }
        
        // 基本信息
        tdCommonService.setHeader(map, request);
        
        if (null == username) {
            if (null != errCode)
            {
                if (errCode.equals(1))
                {
                    map.addAttribute("error", "验证码错误");
                }
                else if (errCode.equals(2))
                {
                    map.addAttribute("error", "用户名已存在");
                }
                
                map.addAttribute("errCode", errCode);
            }
            return "/touch/reg";
        }
        return "redirect:/";
    }
    
    /**
     * 
     * 注册用户保存到数据库<BR>
     * 方法名：saveUser<BR>
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
    @RequestMapping(value="/touch/reg",method=RequestMethod.POST)
    public String reg(String username,
                    String mobile,
                    String password,
                    String email,
                    String smsCode,
                    String code,
                    String carCode,
                    Long shareId,
                    HttpServletRequest request){
        String codeBack = (String) request.getSession().getAttribute("RANDOMVALIDATECODEKEY");
        
        if (!codeBack.equalsIgnoreCase(code))
        {
            if (null == shareId)
            {
                return "redirect:/touch/reg?errCode=1";
            }
            else
            {
                return "redirect:/touch/reg?errCode=1&shareId=" + shareId;
            }
        }
        
        if(null != mobile){
        	username = mobile;
        }
        
        TdUser user = tdUserService.findByUsername(username);
        
        if (null != user)
        {
            if (null == shareId)
            {
                return "redirect:/touch/reg?errCode=2";
            }
            else
            {
                return "redirect:/touch/reg?errCode=2&shareId=" + shareId;
            }
        }
        
        user = tdUserService.addNewUser(null, username, password, mobile, email, carCode);
        
        if (null == user)
        {
            if (null == shareId)
            {
                return "redirect:/touch/reg?errCode=3";
            }
            else
            {
                return "redirect:/touch/reg?errCode=3&shareId=" + shareId;
            }
        }
        
        user = tdUserService.save(user);
        
        request.getSession().setAttribute("username", username);
        
        String referer = (String) request.getAttribute("referer");
        
        if (null != request.getAttribute("referer"))
        {
            return "redirect:" + referer;
        }
        
        if (null == shareId)
        {
            return "redirect:/touch/user";
        }
        
        return "redirect:/touch/user?shareId=" + shareId;
    }
    
    @RequestMapping(value = "/touch/reg/check/{type}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> validateForm(@PathVariable String type,String param,HttpServletRequest request) {
		Map<String, String> res = new HashMap<String, String>();
		
		res.put("status", "n");
		if("username".equalsIgnoreCase(type)){
			TdUser user = tdUserService.findByUsername(param);
			if(null != user){
				res.put("info",	"该用户已经存在！");
				return res;
			}
		}
		if("yzm".equalsIgnoreCase(type)){
			String codeBack = (String) request.getSession().getAttribute("RANDOMVALIDATECODEKEY");
			if(!param.equalsIgnoreCase(codeBack)){
				res.put("info", "验证码错误！");
				return res;
			}
		}
		res.put("status", "y");
		return res;
	}
}