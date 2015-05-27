package com.ynyes.huizi.controller.front;

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

import com.ynyes.huizi.entity.TdGoods;
import com.ynyes.huizi.entity.TdProduct;
import com.ynyes.huizi.entity.TdProductCategory;
import com.ynyes.huizi.entity.TdSetting;
import com.ynyes.huizi.entity.TdUser;
import com.ynyes.huizi.entity.TdUserComment;
import com.ynyes.huizi.entity.TdUserConsult;
import com.ynyes.huizi.entity.TdUserPoint;
import com.ynyes.huizi.service.TdCommonService;
import com.ynyes.huizi.service.TdGoodsCombinationService;
import com.ynyes.huizi.service.TdGoodsService;
import com.ynyes.huizi.service.TdProductCategoryService;
import com.ynyes.huizi.service.TdProductService;
import com.ynyes.huizi.service.TdSettingService;
import com.ynyes.huizi.service.TdUserCommentService;
import com.ynyes.huizi.service.TdUserConsultService;
import com.ynyes.huizi.service.TdUserPointService;
import com.ynyes.huizi.service.TdUserRecentVisitService;
import com.ynyes.huizi.service.TdUserService;
import com.ynyes.huizi.util.ClientConstant;

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
    private TdProductService tdProductService;
    
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
        
        // 获取商品的其他版本
        if (null != goods.getProductId())
        {
            TdProduct product = tdProductService.findOne(goods.getProductId());
            
            if (null != product)
            {
                List<TdGoods> productGoodsList = tdGoodsService.findByProductIdAndIsOnSaleTrue(goods.getProductId());
                
                int totalSelects = product.getTotalSelects();
                
                List<String> selectOneList = new ArrayList<String>();
                List<String> selectTwoList = new ArrayList<String>();
                List<String> selectThreeList = new ArrayList<String>();
                
                List<TdGoods> selectOneGoodsList = new ArrayList<TdGoods>();
                List<TdGoods> selectTwoGoodsList = new ArrayList<TdGoods>();
                List<TdGoods> selectThreeGoodsList = new ArrayList<TdGoods>();
                
                String sOne = null;
                String sTwo = null;
                String sThree = null;
                
                map.addAttribute("total_select", totalSelects);
                
                switch (totalSelects)
                {
                case 1:
                    sOne = goods.getSelectOneValue().trim();
                    
                    for (TdGoods pdtGoods : productGoodsList)
                    {
                        String s1 = pdtGoods.getSelectOneValue().trim();
                        if (!selectOneList.contains(s1))
                        {
                            selectOneList.add(s1);
                            selectOneGoodsList.add(pdtGoods);
                        }
                    }
                    
                    map.addAttribute("select_one_name", product.getSelectOneName());
                    map.addAttribute("one_selected", sOne);
                    map.addAttribute("select_one_goods_list", selectOneGoodsList);
                    
                    break;
                case 2:
                    sOne = goods.getSelectOneValue().trim();
                    sTwo = goods.getSelectTwoValue().trim();
                    
                    for (TdGoods pdtGoods : productGoodsList)
                    {
                        String s1 = pdtGoods.getSelectOneValue().trim();
                        String s2 = pdtGoods.getSelectTwoValue().trim();
                        
                        if (!selectOneList.contains(s1))
                        {
                            selectOneList.add(s1);
                            selectOneGoodsList.add(pdtGoods);
                        }
                        
                        if (!selectTwoList.contains(s2))
                        {
                            selectTwoList.add(s2);
                            selectTwoGoodsList.add(pdtGoods);
                        }
                    }
                    
                    map.addAttribute("select_one_name", product.getSelectOneName());
                    map.addAttribute("select_two_name", product.getSelectTwoName());
                    map.addAttribute("one_selected", sOne);
                    map.addAttribute("two_selected", sTwo);
                    map.addAttribute("select_one_goods_list", selectOneGoodsList);
                    map.addAttribute("select_two_goods_list", selectTwoGoodsList);
                    break;
                    
                case 3:
                    sOne = goods.getSelectOneValue().trim();
                    sTwo = goods.getSelectTwoValue().trim();
                    sThree = goods.getSelectThreeValue().trim();
                    
                    for (TdGoods pdtGoods : productGoodsList)
                    {
                        String s1 = pdtGoods.getSelectOneValue().trim();
                        String s2 = pdtGoods.getSelectTwoValue().trim();
                        String s3 = pdtGoods.getSelectThreeValue().trim();
                        
                        if (!selectOneList.contains(s1))
                        {
                            selectOneList.add(s1);
                            selectOneGoodsList.add(pdtGoods);
                        }
                        
                        if (!selectTwoList.contains(s2))
                        {
                            selectTwoList.add(s2);
                            selectTwoGoodsList.add(pdtGoods);
                        }
                        
                        if (!selectThreeList.contains(s3))
                        {
                            selectThreeList.add(s3);
                            selectThreeGoodsList.add(pdtGoods);
                        }
                    }
                    
                    map.addAttribute("select_one_name", product.getSelectOneName());
                    map.addAttribute("select_two_name", product.getSelectTwoName());
                    map.addAttribute("select_three_name", product.getSelectThreeName());
                    map.addAttribute("one_selected", sOne);
                    map.addAttribute("two_selected", sTwo);
                    map.addAttribute("three_selected", sThree);
                    map.addAttribute("select_one_goods_list", selectOneGoodsList);
                    map.addAttribute("select_two_goods_list", selectTwoGoodsList);
                    map.addAttribute("select_three_goods_list", selectThreeGoodsList);
                    break;
                }
            }
        }

        // 分享时添加积分
        if (null != shareId) {
            TdUser sharedUser = tdUserService.findOne(shareId);
            TdSetting setting = tdSettingService.findTopBy();

            String clientIp = req.getRemoteHost();
            String oldIp = (String) req.getSession().getAttribute("remote_ip");

            // 不是来自同一个ip的访问，普通用户
            if (!clientIp.equalsIgnoreCase(oldIp) && sharedUser.getRoleId().equals(0L)) {
                req.getSession().setAttribute("remote_ip", clientIp);

                if (null != sharedUser && null != setting) {
                    if (null == sharedUser.getPointGetByShareGoods()) {
                        sharedUser.setPointGetByShareGoods(0L);
                    }

                    if (null == setting.getGoodsShareLimits()) {
                        setting.setGoodsShareLimits(50L); // 设定一个默认值
                    }

                    // 小于积分限额，进行积分
                    if (sharedUser.getPointGetByShareGoods().compareTo(setting.getGoodsShareLimits()) < 0) {
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
