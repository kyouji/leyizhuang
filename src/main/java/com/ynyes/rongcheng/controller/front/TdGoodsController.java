package com.ynyes.rongcheng.controller.front;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.rongcheng.entity.TdGoods;
import com.ynyes.rongcheng.entity.TdProductCategory;
import com.ynyes.rongcheng.entity.TdSetting;
import com.ynyes.rongcheng.entity.TdUser;
import com.ynyes.rongcheng.entity.TdUserComment;
import com.ynyes.rongcheng.entity.TdUserConsult;
import com.ynyes.rongcheng.entity.TdUserPoint;
import com.ynyes.rongcheng.service.TdCommonService;
import com.ynyes.rongcheng.service.TdGoodsCombinationService;
import com.ynyes.rongcheng.service.TdGoodsService;
import com.ynyes.rongcheng.service.TdProductCategoryService;
import com.ynyes.rongcheng.service.TdSettingService;
import com.ynyes.rongcheng.service.TdUserCommentService;
import com.ynyes.rongcheng.service.TdUserConsultService;
import com.ynyes.rongcheng.service.TdUserPointService;
import com.ynyes.rongcheng.service.TdUserRecentVisitService;
import com.ynyes.rongcheng.service.TdUserService;
import com.ynyes.rongcheng.util.ClientConstant;

/**
 * 商品详情页
 * 
 * @author Sharon
 *
 */
@Controller
public class TdGoodsController {
    @Autowired
    private TdGoodsService tdGoodsService;

    @Autowired
    private TdUserConsultService tdUserConsultService;

    @Autowired
    private TdUserCommentService tdUserCommentService;

    @Autowired
    private TdProductCategoryService tdProductCategoryService;

    @Autowired
    private TdCommonService tdCommonService;

    @Autowired
    private TdGoodsCombinationService tdGoodsCombinationService;

    @Autowired
    private TdUserRecentVisitService tdUserRecentVisitService;

    @Autowired
    private TdSettingService tdSettingService;

    @Autowired
    private TdUserService tdUserService;

    @Autowired
    private TdUserPointService tdUserPointService;

    @RequestMapping("/goods/{goodsId}")
    public String product(@PathVariable Long goodsId, Long shareId,
            ModelMap map, HttpServletRequest req) {

        tdCommonService.setHeader(map, req);

        String username = (String) req.getSession().getAttribute("username");

        if (null != username) {
            tdUserRecentVisitService.addNew(username, goodsId);
            map.addAttribute("user",
                    tdUserService.findByUsernameAndIsEnabled(username));
        }

        // 添加浏览记录

        if (null == goodsId) {
            return "error_404";
        }

        TdGoods goods = tdGoodsService.findOne(goodsId);

        Page<TdUserComment> commentPage = tdUserCommentService
                .findByGoodsIdAndIsShowable(goodsId, 0, ClientConstant.pageSize);

        Page<TdUserConsult> consultPage = tdUserConsultService
                .findByGoodsIdAndIsShowable(goodsId, 0, ClientConstant.pageSize);

        map.addAttribute("goods", goods);
        map.addAttribute("comb_list",
                tdGoodsCombinationService.findByGoodsId(goodsId));
        map.addAttribute("comment_page", commentPage);
        map.addAttribute("consult_page", consultPage);

        map.addAttribute("hot_list",
                tdGoodsService.findTop10ByIsOnSaleTrueOrderBySoldNumberDesc());

        // 查找类型
        TdProductCategory tdProductCategory = tdProductCategoryService
                .findOne(goods.getCategoryId());

        // 获取该类型所有父类型
        if (null != tdProductCategory) {
            if (null != tdProductCategory.getParentTree()
                    && !"".equals(tdProductCategory.getParentTree())) {
                List<TdProductCategory> catList = new ArrayList<TdProductCategory>();

                for (String cid : tdProductCategory.getParentTree().split(",")) {
                    if (!"".equals(cid)) {
                        // 去除方括号
                        cid = cid.replace("[", "");
                        cid = cid.replace("]", "");

                        TdProductCategory tpc = tdProductCategoryService
                                .findOne(Long.parseLong(cid));

                        if (null != tpc) {
                            catList.add(tpc);
                        }
                    }
                }

                map.addAttribute("category_tree_list", catList);
            }
        }

        if (null != shareId) {
            TdUser sharedUser = tdUserService.findOne(shareId);
            TdSetting setting = tdSettingService.findTopBy();

            String clientIp = req.getRemoteHost();
            String oldIp = (String) req.getSession().getAttribute("remote_ip");

            // 不是来自同一个ip的访问，普通用户
            if (!clientIp.equalsIgnoreCase(oldIp) && sharedUser.getRoleId().equals(0L)) {
                req.getSession().setAttribute("remote_ip", oldIp);

                if (null != sharedUser && null != setting) {
                    if (null == sharedUser.getPointGetByShareGoods()) {
                        sharedUser.setPointGetByShareGoods(0L);
                    }

                    if (null == setting.getGoodsShareLimits()) {
                        setting.setGoodsShareLimits(50L); // 设定一个默认值
                    }

                    // 小于积分限额，进行积分
                    if (sharedUser.getPointGetByShareGoods().compareTo(
                            setting.getGoodsShareLimits()) < 0) {
                        TdUserPoint point = new TdUserPoint();
                        point.setDetail("分享商品获得积分");
                        point.setPoint(setting.getGoodsSharePoints());
                        point.setPointTime(new Date());
                        point.setUsername(sharedUser.getUsername());

                        if (null != sharedUser.getTotalPoints()) {
                            point.setTotalPoint(sharedUser.getTotalPoints()
                                    + point.getPoint());
                        } else {
                            point.setTotalPoint(point.getPoint());
                        }

                        point = tdUserPointService.save(point);

                        sharedUser.setTotalPoints(point.getTotalPoint()); // 积分
                        tdUserService.save(sharedUser);
                    }
                }
            }
        }

        map.addAttribute("server_ip", req.getLocalName());
        map.addAttribute("server_port", req.getLocalPort());

        return "/client/goods";
    }

}
