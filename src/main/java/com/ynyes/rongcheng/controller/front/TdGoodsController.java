package com.ynyes.rongcheng.controller.front;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.rongcheng.entity.TdGoods;
import com.ynyes.rongcheng.entity.TdProductCategory;
import com.ynyes.rongcheng.entity.TdUserComment;
import com.ynyes.rongcheng.entity.TdUserConsult;
import com.ynyes.rongcheng.service.TdGoodsService;
import com.ynyes.rongcheng.service.TdProductCategoryService;
import com.ynyes.rongcheng.service.TdUserCommentService;
import com.ynyes.rongcheng.service.TdUserConsultService;
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

    @RequestMapping("/goods/{goodsId}")
    public String product(@PathVariable Long goodsId, ModelMap map) {
        
        if (null == goodsId)
        {
            return "error_404";
        }
        
        TdGoods goods = tdGoodsService.findOne(goodsId);
        
        Page<TdUserComment> commentPage = tdUserCommentService.findByGoodsIdAndIsShowable(goodsId, 0, ClientConstant.pageSize);
        
        Page<TdUserConsult> consultPage = tdUserConsultService.findByGoodsIdAndIsShowable(goodsId, 0, ClientConstant.pageSize);
        
        map.addAttribute("goods", goods);
        map.addAttribute("comment_page", commentPage);
        map.addAttribute("consult_page", consultPage);
        
        // 查找类型
        TdProductCategory tdProductCategory = tdProductCategoryService.findOne(goods.getCategoryId());
        
        // 获取该类型所有父类型
        if (null != tdProductCategory)
        {
            if (null != tdProductCategory.getParentTree() && !"".equals(tdProductCategory.getParentTree()))
            {
                List<TdProductCategory> catList = new ArrayList<TdProductCategory>();
                
                for (String cid : tdProductCategory.getParentTree().split(","))
                {
                    if (!"".equals(cid))
                    {
                        // 去除方括号
                        cid = cid.replace("[", "");
                        cid = cid.replace("]", "");
                        
                        TdProductCategory tpc = tdProductCategoryService.findOne(Long.parseLong(cid));
                        
                        if (null != tpc)
                        {
                            catList.add(tpc);
                        }
                    }
                }
                
                map.addAttribute("category_tree_list", catList);
            }
        }
        
        

        return "/client/goods";
    }

}
