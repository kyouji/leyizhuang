package com.ynyes.cheyou.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.cheyou.entity.TdCoupon;
import com.ynyes.cheyou.service.TdCommonService;
import com.ynyes.cheyou.service.TdCouponService;
import com.ynyes.cheyou.service.TdDiySiteService;
import com.ynyes.cheyou.service.TdUserRecentVisitService;

/**
 * 
 * 优惠券
 *
 */
@Controller
@RequestMapping("/coupon")
public class TdCouponController {
	@Autowired 
	private TdDiySiteService tdDiySiteService;
	
	@Autowired 
    private TdCouponService tdCouponService;
	
	@Autowired
    private TdCommonService tdCommonService;
	
	@Autowired
    private TdUserRecentVisitService tdUserRecentVisitService;
    
	@RequestMapping("/list")
    public String infoList(Integer page, 
                            ModelMap map,
                            HttpServletRequest req){
	    
	    tdCommonService.setHeader(map, req);
        
        // 同盟店列表
        map.addAttribute("shop_list", tdDiySiteService.findByIsEnableTrue());
        
        List<TdCoupon> couponList = tdCouponService.findDistinctTypeIdByIsDistributtedFalse();
        
        // 所有优惠券
        map.addAttribute("coupon_list", couponList);
        
        return "/client/coupon_list";
    }
}
