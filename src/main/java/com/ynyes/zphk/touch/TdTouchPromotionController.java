package com.ynyes.zphk.touch;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.zphk.service.TdCommonService;
import com.ynyes.zphk.service.TdGoodsService;
import com.ynyes.zphk.util.ClientConstant;

@Controller
public class TdTouchPromotionController {

    @Autowired
    TdGoodsService tdGoodsService;

    @Autowired
    TdCommonService tdCommonService;

    @RequestMapping("/touch/promotion/{promotionType}")
    public String list(@PathVariable String promotionType, String type,
            Integer page, ModelMap map, HttpServletRequest req) {

        tdCommonService.setHeader(map, req);

        if (null == promotionType) {
            return "/touch/error_404";
        }

        if (null == page) {
            page = 0;
        }

        map.addAttribute("type", type);
        
        if (promotionType.equalsIgnoreCase("tuan")) // 团购
        {
            if (null == type)
            {
                type = "";
            }
            
            switch (type)
            {
            case "all":
                // 所有团购
                map.addAttribute("tuan_goods_page", tdGoodsService
                        .findByGroupSaleAllOrderByGroupSaleStartTimeAsc(page,
                                ClientConstant.pageSize));
                break;
            case "passed":
                // 已经结束团购
                map.addAttribute("tuan_goods_page", tdGoodsService
                        .findByGroupSaleEndedOrderByGroupSaleStartTimeAsc(page,
                                ClientConstant.pageSize));
                break;
            case "ongoing":
                // 即将开始团购
                map.addAttribute(
                        "tuan_goods_page",
                        tdGoodsService
                                .findByGroupSaleGoingToStartOrderByGroupSaleStartTimeAsc(
                                        page, ClientConstant.pageSize));
                break;
            default:
                // 正在团购
                map.addAttribute("tuan_goods_list", tdGoodsService
                        .findByGroupSalingOrderByGroupSaleStartTimeAsc());
                    break;
            }

            //无论何种情况下都显示即将开团
            map.addAttribute("going_goods_list",
					tdGoodsService.findByGroupSaleGoingToStartOrderByGroupSaleStartTimeAsc());
            
            return "/touch/tuan_list";
        }
        else if (promotionType.equalsIgnoreCase("miao")) // 秒杀
        {
            if (null == type)
            {
                type = "";
            }
            
            switch (type)
            {
            case "all":
                // 所有秒杀
                map.addAttribute("miao_goods_page", tdGoodsService
                        .findByFlashSaleAllOrderByFlashSaleStartTimeAsc(page,
                                ClientConstant.pageSize));
                break;
            case "passed":
                // 已经结束秒杀
                map.addAttribute("miao_goods_page", tdGoodsService
                        .findByFlashSaleEndedOrderByFlashSaleStartTimeAsc(page,
                                ClientConstant.pageSize));
                break;
            case "ongoing":
                // 即将开始秒杀
                map.addAttribute(
                        "miao_goods_page",
                        tdGoodsService
                                .findByFlashSaleGoingToStartOrderByFlashSaleStartTimeAsc(
                                        page, ClientConstant.pageSize));
                break;
            default:
            	
                // 正在秒杀（不分页）
                map.addAttribute("miao_goods_list", tdGoodsService
                        .findByFlashSalingOrderByFlashSaleStartTimeAsc());
                    break;
            }
            
            return "/touch/miao_list";
        }
        else 
        {
            return "/touch/error_404";
        }
    }
}
