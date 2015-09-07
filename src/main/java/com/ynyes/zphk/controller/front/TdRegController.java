package com.ynyes.zphk.controller.front;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.ynyes.zphk.util.SMSUtil;
import com.ynyes.zphk.util.VerifServlet;

/**
 * 注册处理
 * 
 */
@Controller
public class TdRegController {
	@Autowired
	private TdUserService tdUserService;

	@Autowired
	private TdUserPointService tdUserPointService;

	@Autowired
	private TdSettingService tdSettingService;

	@Autowired
	private TdCommonService tdCommonService;

	/**
	 * 新增加了一个字段type用于表示用户选择的是手机注册还是邮箱注册
	 * 
	 * @author dengxiao
	 */
	@RequestMapping("/reg")
	public String reg(Integer errCode, Integer shareId, String type, HttpServletRequest request, ModelMap map) {
		String username = (String) request.getSession().getAttribute("username");

		// 从主页跳转到注册页时，type的值是null，所以处于默认的状态（默认状态未手机注册），所以type的值为"phone"
		if (null == type) {
			type = "phone";
		}

		map.addAttribute("type", type);

		if (null != shareId) {
			map.addAttribute("share_id", shareId);
		}

		// 基本信息
		tdCommonService.setHeader(map, request);

		if (null == username) {
			if (null != errCode) {
				if (errCode.equals(1)) {
					map.addAttribute("error", "验证码错误");
				} else if (errCode.equals(2)) {
					map.addAttribute("error", "用户名已存在");
				}

				map.addAttribute("errCode", errCode);
			}
			return "/client/reg";
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/logutil")
	public String LogUtils() {
		return "/logutil";
	}

	/**
	 * 
	 * 注册用户保存到数据库<BR>
	 * 方法名：saveUser<BR>
	 * 时间：2015年2月2日-下午1:44:45 <BR>
	 * 
	 * @param user
	 * @param name
	 * @param mobile
	 * @param password
	 * @param newpassword
	 * @return String<BR>
	 * @param [参数1]
	 *            [参数1说明]
	 * @param [参数2]
	 *            [参数2说明]
	 * @exception <BR>
	 * @since 1.0.0
	 */
	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public String reg(String username, String mobile, String password, String email, String code, String carCode,
			Long shareId, HttpServletRequest request) {
		String codeBack = (String) request.getSession().getAttribute("RANDOMVALIDATECODEKEY");
		String smsCodeSave = (String) request.getSession().getAttribute("SMSCODE");
		if (!codeBack.equalsIgnoreCase(code)) {
			if (null == shareId) {
				return "redirect:/reg?errCode=1&name= " + username + "&carCode=" + carCode;
			} else {
				return "redirect:/reg?errCode=1&shareId=" + shareId + "&name= " + username + "&carCode=" + carCode;
			}
		}

		if (null != email) {
			username = email;
		}

		if (null != mobile) {
			username = mobile;
		}
		TdUser user = tdUserService.addNewUser(null, username, password, mobile, email, carCode);

		if (null == user) {
			if (null == shareId) {
				return "redirect:/reg?errCode=3";
			} else {
				return "redirect:/reg?errCode=3&shareId=" + shareId;
			}
		}

		user = tdUserService.save(user);

		request.getSession().setAttribute("username", username);

		String referer = (String) request.getAttribute("referer");

		if (null != request.getAttribute("referer")) {
			return "redirect:" + referer;
		}

		if (null == shareId) {
			return "redirect:/user";
		}

		return "redirect:/user?shareId=" + shareId;
	}

	@RequestMapping(value = "/code", method = RequestMethod.GET)
	public void verify(HttpServletResponse response, HttpServletRequest request) {
		response.setContentType("image/jpeg");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expire", 0);
		VerifServlet randomValidateCode = new VerifServlet();
		randomValidateCode.getRandcode(request, response);
	}

	@RequestMapping(value = "/reg/smscode", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> smsCode(String mobile, HttpServletResponse response, HttpServletRequest request) {
		Random random = new Random();

		String smscode = String.format("%04d", random.nextInt(9999));

		HttpSession session = request.getSession();

		session.setAttribute("SMSCODE", smscode);

		return SMSUtil.send(mobile, "15612", new String[] { smscode });
	}

	@RequestMapping(value = "/reg/check/{type}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> validateForm(@PathVariable String type, String param) {
		Map<String, String> res = new HashMap<String, String>();

		res.put("status", "n");

		if (null == type) {
			res.put("info", "参数错误");
			return res;
		}

		if (type.equalsIgnoreCase("username")) {
			if (null == param || param.isEmpty()) {
				res.put("info", "用户名不能为空");
				return res;
			}

			TdUser user = tdUserService.findByUsername(param);

			if (null != user) {
				res.put("info", "该用户已经存在");
				return res;
			}
		}

		/**
		 * ajax实时验证 手机号查找用户 判断手机号是已否注册
		 * 
		 * @author libiao
		 */
		if (type.equalsIgnoreCase("mobile")) {
			if (null == param || param.isEmpty()) {
				res.put("info", "用户名不能为空");
				return res;
			}

			TdUser user = tdUserService.findByMobile(param);

			if (null != user) {
				res.put("info", "该手机已经注册");
				return res;
			}
		}

		/**
		 * 增加判断用户通过邮箱注册时，邮箱是否与已有用户注册的邮箱重复的逻辑判断
		 * 
		 * @author dengxiao
		 */
		if (type.equalsIgnoreCase("email")) {
			if (null == param || param.isEmpty()) {
				res.put("info", "用户名不能为空");
				return res;
			}

			TdUser user = tdUserService.findByEmail(param);

			if (null != user) {
				res.put("info", "该邮箱已经注册");
				return res;
			}
		}

		res.put("status", "y");

		return res;
	}

}