package com.ynyes.zphk.controller.front;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.config.AlipayConfig;
import com.alipay.util.AlipayNotify;
import com.alipay.util.AlipaySubmit;
import com.qq.connect.QQConnectException;
import com.qq.connect.api.OpenID;
import com.qq.connect.api.qzone.UserInfo;
import com.qq.connect.javabeans.AccessToken;
import com.qq.connect.javabeans.qzone.UserInfoBean;
import com.qq.connect.oauth.Oauth;
import com.ynyes.zphk.entity.TdUser;
import com.ynyes.zphk.service.TdCommonService;
import com.ynyes.zphk.service.TdSettingService;
import com.ynyes.zphk.service.TdUserService;
import com.ynyes.zphk.util.VerifServlet;

/**
 * 登录
 *
 */
@Controller
public class TdLoginController {
    @Autowired
    private TdUserService tdUserService;
    
    @Autowired
    private TdSettingService tdSettingService;
    
    @Autowired
    private TdCommonService tdCommonService;
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpServletRequest req, ModelMap map) {
        String username = (String) req.getSession().getAttribute("username");

        String referer = req.getHeader("referer");
        
        // 基本信息
        tdCommonService.setHeader(map, req);
        
        if (null == username) 
        {
            return "/client/login";
        }
        
        if (null == referer)
        {
            referer = "/";
        }
        
        return "redirect:" + referer;
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
//    @RequestMapping("/forget")
//    public String forget(){
//        return "/front/forget";
//    }
    
    @RequestMapping(value="/login",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> login(String username, 
                String password, 
                String code, 
                Boolean isSave,
                HttpServletRequest request) {
        Map<String, Object> res = new HashMap<String, Object>();
        
        res.put("code", 1);
        
        if (username.isEmpty() || password.isEmpty())
        {
            res.put("msg", "用户名及密码不能为空");
        }
        
        TdUser user = tdUserService.findByUsernameAndIsEnabled(username);
        
        if (null == user)
        {
            res.put("msg", "不存在该用户");
            return res;
        }
        
        if (!user.getPassword().equals(password))
        {
            res.put("msg", "密码错误");
            return res;
        }
        
        user.setLastLoginTime(new Date());
        
        tdUserService.save(user);
        
        request.getSession().setAttribute("username", username);
        
        res.put("code", 0);
        
        return res;
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
    
    @RequestMapping(value = "/login/alipay_login", method = RequestMethod.GET)
	public String alipay_login(HttpServletRequest req, ModelMap map) {
		// 目标服务地址
		String target_service = "user.auth.quick.login";
		// 必填

		// 防钓鱼时间戳
		String anti_phishing_key = "";
		// 若要使用请调用类文件submit中的query_timestamp函数

		// 客户端的IP地址
		String exter_invoke_ip = "";
		// 非局域网的外网IP地址，如：221.0.0.1
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", "alipay.auth.authorize");
		sParaTemp.put("partner", AlipayConfig.partner);
		sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("target_service", target_service);
		sParaTemp.put("return_url", AlipayConfig.return_url);
		sParaTemp.put("anti_phishing_key", anti_phishing_key);
		sParaTemp.put("exter_invoke_ip", exter_invoke_ip);
		String sHtmlText = AlipaySubmit.buildRequest(sParaTemp, "get", "确认");

		map.put("code", sHtmlText);

		return "/client/alipay_login";
	}
    
    @RequestMapping(value= "/login/alipay_return_url"  , method = RequestMethod.GET)
	public String returnurl(HttpServletRequest request, ModelMap map){
		Map<String,String> params = new HashMap<String,String>();
		Map<String, String[]>  requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {

			String name = iter.next();
			String[] values =  requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			try {
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
				params.put(name, valueStr);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			params.put(name, valueStr);
		}

		tdCommonService.setHeader(map, request);

		// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
		// 支付宝用户号
		String user_id = " ";
//		String token = " ";
		try {
			user_id = new String(request.getParameter("user_id").getBytes("ISO-8859-1"),"UTF-8");
			//授权令牌
//			token = new String(request.getParameter("token").getBytes("ISO-8859-1"),"UTF-8");

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//

		// 计算得出通知验证结果
		boolean verify_result = AlipayNotify.verify(params);
		
		verify_result = true;
		
		if (verify_result) {// 验证成功
			map.put("alipay_user_id", user_id);
			TdUser user = tdUserService.findByAlipayUserId(user_id);
			if (null != user) {
				user.setLastLoginTime(new Date());
				user = tdUserService.save(user);
				request.getSession().setAttribute("username", user.getUsername());
				return "redirect:/";
			} else {
				return "/client/accredit_login";
			}
			// request.getSession().setAttribute("alipay_user_id", user_id);
			// ——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

			//////////////////////////////////////////////////////////////////////////////////////////
		} else {
			// 该页面可做页面美工编辑
			// System.out.println("验证失败");

			return "/client/error_404";
			// 调试 假设验证成功
		}
	}
    
    @RequestMapping(value= "/login/qq_return_url")
	public String qqReturnUrl(String code, String state, HttpServletRequest request, ModelMap map){
		tdCommonService.setHeader(map, request);
		try {
			System.err.println("code-------"+code);
			System.err.println("state-------"+state);
			AccessToken accessTokenObj = (new Oauth()).getAccessTokenByRequest(request);
			System.err.println("accessTokenObj--------"+accessTokenObj);
			String accessToken = null, openID = null;
			long tokenExpireIn = 0L;

			if (accessTokenObj.getAccessToken().equals("")) {
				// 我们的网站被CSRF攻击了或者用户取消了授权
				// 做一些数据统计工作
				System.err.print("没有获取到响应参数");
			} else {
				accessToken = accessTokenObj.getAccessToken();
				System.err.println("accessToken-------"+accessToken);
				
				tokenExpireIn = accessTokenObj.getExpireIn();

				request.getSession().setAttribute("demo_access_token", accessToken);
				request.getSession().setAttribute("demo_token_expirein", String.valueOf(tokenExpireIn));

				// 利用获取到的accessToken 去获取当前用的openid -------- start
				OpenID openIDObj = new OpenID(accessToken);
				openID = openIDObj.getUserOpenID();
				System.err.println("openID-----------"+openID);

				//利用获取到的accessToken,openid 去获取用户在Qzone的昵称
				UserInfo qzoneUserInfo = new UserInfo(accessToken, openID);
                UserInfoBean userInfoBean = qzoneUserInfo.getUserInfo();
                if (userInfoBean.getRet() == 0) {
                   map.put("nickName",userInfoBean.getNickname());
                }
				
				//根据openID查找用户
				map.put("alipay_user_id", openID);
				map.put("qq", "qq");
				TdUser user = tdUserService.findByQqUserId(openID);
				if(null == user){
					//用户不存在，跳转绑定页面
					return "/client/accredit_login";
				}else{
					//用户存在，修改最后登录时间，跳转首页
					user.setLastLoginTime(new Date());
					tdUserService.save(user);
					request.getSession().setAttribute("username", user.getUsername());
					request.getSession().setAttribute("usermobile", user.getMobile());
					return "redirect:/";
				}
			}
		} catch (QQConnectException e) {
			
		}
		return "/client/error_404";
    }
    
    @RequestMapping(value = "/login/qq_login")
    public void QQLogin(HttpServletResponse resp,HttpServletRequest req){
    	resp.setContentType("text/html;charset=utf-8");
		try {
			resp.sendRedirect(new Oauth().getAuthorizeURL(req));
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
}
