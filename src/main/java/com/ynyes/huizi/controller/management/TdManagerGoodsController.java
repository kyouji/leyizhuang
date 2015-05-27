package com.ynyes.huizi.controller.management;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ynyes.huizi.entity.TdGoods;
import com.ynyes.huizi.entity.TdPriceChangeLog;
import com.ynyes.huizi.entity.TdProductCategory;
import com.ynyes.huizi.service.TdArticleService;
import com.ynyes.huizi.service.TdBrandService;
import com.ynyes.huizi.service.TdGoodsService;
import com.ynyes.huizi.service.TdManagerLogService;
import com.ynyes.huizi.service.TdParameterService;
import com.ynyes.huizi.service.TdPriceChangeLogService;
import com.ynyes.huizi.service.TdProductCategoryService;
import com.ynyes.huizi.service.TdProductService;
import com.ynyes.huizi.service.TdWarehouseService;
import com.ynyes.huizi.util.SiteMagConstant;

/**
 * 后台首页控制器
 * 
 * @author Sharon
 */

@Controller
@RequestMapping(value="/Verwalter/goods")
public class TdManagerGoodsController {
    
    @Autowired
    TdProductCategoryService tdProductCategoryService;
    
    @Autowired
    TdArticleService tdArticleService;
    
    @Autowired
    TdGoodsService tdGoodsService;
    
    @Autowired
    TdWarehouseService tdWarehouseService;
    
    @Autowired
    TdManagerLogService tdManagerLogService;
    
    @Autowired
    TdBrandService tdBrandService;
    
    @Autowired
    TdParameterService tdParameterService;
    
    @Autowired
    TdProductService tdProductService;
    
    @Autowired
    TdPriceChangeLogService tdPriceChangeLogService;
    
    @RequestMapping(value="/edit/parameter/{categoryId}", method = RequestMethod.POST)
    public String parameter(@PathVariable Long categoryId, ModelMap map,
            HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username) {
            return "redirect:/Verwalter/login";
        }
        
        TdProductCategory tpc = tdProductCategoryService.findOne(categoryId);
        
        if (null != tpc)
        {
            Long pcId = tpc.getParamCategoryId();
            
            if (null != pcId)
            {
                map.addAttribute("param_list", tdParameterService.findByCategoryTreeContaining(pcId));
                
                // 查找产品列表
                map.addAttribute("product_list", tdProductService.findByProductCategoryTreeContaining(categoryId));
            
                // 查找品牌
                map.addAttribute("brand_list", tdBrandService.findByProductCategoryTreeContaining(categoryId));
            }
           
        }
        
        return "/site_mag/goods_category_param_list";
    }
    
    @RequestMapping(value="/price", method = RequestMethod.GET)
    public String chgPrice(Long goodsId, ModelMap map, HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username) {
            return "redirect:/Verwalter/login";
        }
        
        if (null != goodsId)
        {
            TdGoods goods = tdGoodsService.findOne(goodsId);
            
            map.addAttribute("goods", goods);
        }
        
        return "/site_mag/dialog_goods_change_price";
    }
    
    @RequestMapping(value="/price/log", method = RequestMethod.GET)
    public String chgPriceLog(Long goodsId, 
                        Integer page, 
                        Integer size, 
                        String __EVENTTARGET,
                        String __EVENTARGUMENT,
                        String __VIEWSTATE,
                        ModelMap map, 
                        HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        
        if (null == username) {
            return "redirect:/Verwalter/login";
        }
        
        if (null != __EVENTTARGET)
        {
            switch (__EVENTTARGET)
            {
            case "btnPage":
                if (null != __EVENTARGUMENT)
                {
                    page = Integer.parseInt(__EVENTARGUMENT);
                } 
                break;
            }
        }
        
        if (null == page || page < 0)
        {
            page = 0;
        }
        
        if (null == size || size < 0)
        {
            size = SiteMagConstant.pageSize;
        }
        
        if (null != goodsId)
        {
            Page<TdPriceChangeLog> logPage = tdPriceChangeLogService.findByGoodsIdOrderByIdDesc(goodsId, page, size);
            
            map.addAttribute("price_log_page", logPage);
            map.addAttribute("goodsId", goodsId);
        }

        map.addAttribute("page", page);
        map.addAttribute("size", size);
        
        return "/site_mag/dialog_goods_price_log";
    }
    
    @RequestMapping(value="/price/set", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> setPrice(Long goodsId, Double outPrice, ModelMap map, HttpServletRequest req){
        Map<String, Object> res = new HashMap<String, Object>();
        res.put("code", 1);
        
        String username = (String) req.getSession().getAttribute("manager");
        
        if (null == username) {
            res.put("message", "请重新登录");
            return res;
        }
        
        if (null == goodsId)
        {
            res.put("message", "商品ID不存在");
            return res;
        }
        
        if (null == outPrice)
        {
            res.put("message", "价格不存在");
            return res;
        }
        
        TdGoods goods = tdGoodsService.findOne(goodsId);
        
        goods.setOutFactoryPrice(outPrice);
        
        goods = tdGoodsService.save(goods, username);
        
        tdManagerLogService.addLog("edit", "用户修改商品价格：" + goods.getTitle(), req);
        
        res.put("code", 0);
        
        return res;
    }
    
    @RequestMapping(value="/list")
    public String goodsList(Integer page, 
                              Integer size,
                              Long categoryId,
                              String property,
                              String __EVENTTARGET,
                              String __EVENTARGUMENT,
                              String __VIEWSTATE,
                              String keywords,
                              Long[] listId,
                              Integer[] listChkId,
                              Long[] listSortId,
                              ModelMap map,
                              HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username) {
            return "redirect:/Verwalter/login";
        }
        
        if (null == page || page < 0)
        {
            page = 0;
        }
        
        if (null == size || size <= 0)
        {
            size = SiteMagConstant.pageSize;;
        }
        
        if (null != keywords)
        {
            keywords = keywords.trim();
        }
        
        if (null != __EVENTTARGET)
        {
            switch (__EVENTTARGET)
            {
            case "lbtnViewTxt":
            case "lbtnViewImg":
                __VIEWSTATE = __EVENTTARGET;
                break;
            
            case "btnSave":
                btnSave(listId, listSortId, username);
                tdManagerLogService.addLog("edit", "用户修改商品", req);
                break;
                
            case "btnDelete":
                btnDelete(listId, listChkId);
                tdManagerLogService.addLog("delete", "用户删除商品", req);
                break;
                
            case "btnPage":
                if (null != __EVENTARGUMENT)
                {
                    page = Integer.parseInt(__EVENTARGUMENT);
                } 
                break;
            
            case "btnOnSale":
                if (null != __EVENTARGUMENT)
                {
                    Long goodsId = Long.parseLong(__EVENTARGUMENT);
                    
                    if (null != goodsId)
                    {
                        TdGoods goods = tdGoodsService.findOne(goodsId);
                        
                        if (null != goods)
                        {
                            if (null == goods.getIsOnSale() || !goods.getIsOnSale())
                            {
                                goods.setIsOnSale(true);
                                tdManagerLogService.addLog("delete", "用户上架商品:" + goods.getTitle(), req);
                            }
                            else
                            {
                                goods.setIsOnSale(false);
                                tdManagerLogService.addLog("delete", "用户下架商品:" + goods.getTitle(), req);
                            }
                            tdGoodsService.save(goods, username);
                        }
                    }
                } 
                break;
            }
        }
        
        if (null != __EVENTTARGET && __EVENTTARGET.equalsIgnoreCase("lbtnViewTxt")
                || null != __EVENTTARGET && __EVENTTARGET.equalsIgnoreCase("lbtnViewImg"))
        {
            __VIEWSTATE = __EVENTTARGET;
        }
        
        map.addAttribute("category_list", tdProductCategoryService.findAll());
            
        Page<TdGoods> goodsPage = null;
        
        if (null == categoryId)
        {
            if (null == keywords || "".equalsIgnoreCase(keywords))
            {
                goodsPage = tdGoodsService.findAllOrderBySortIdAsc(page, size);
            }
            else
            {
                goodsPage = tdGoodsService.searchAndOrderBySortIdAsc(keywords, page, size);
            }
        }
        else
        {
            if (null == keywords || "".equalsIgnoreCase(keywords))
            {
                goodsPage = tdGoodsService.findByCategoryIdTreeContainingOrderBySortIdAsc(categoryId, page, size);
            }
            else
            {
                goodsPage = tdGoodsService.searchAndFindByCategoryIdOrderBySortIdAsc(keywords, categoryId, page, size);
            }
        }
        
        map.addAttribute("content_page", goodsPage);
        
        // 参数注回
        map.addAttribute("page", page);
        map.addAttribute("size", size);
        map.addAttribute("keywords", keywords);
        map.addAttribute("__EVENTTARGET", __EVENTTARGET);
        map.addAttribute("__EVENTARGUMENT", __EVENTARGUMENT);
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        map.addAttribute("categoryId", categoryId);
        map.addAttribute("property", property);
        
        // 文字列表模式
        if (null != __VIEWSTATE && __VIEWSTATE.equals("lbtnViewTxt"))
        {
            return "/site_mag/goods_txt_list";
        }
        
        // 图片列表模式
        return "/site_mag/goods_pic_list";
    }
    
    @RequestMapping(value="/list", method=RequestMethod.POST)
    public String goodsListPost(Integer page, 
                              Integer size,
                              Long categoryId,
                              String property,
                              String __EVENTTARGET,
                              String __EVENTARGUMENT,
                              String __VIEWSTATE,
                              String keywords,
                              Long[] listId,
                              Integer[] listChkId,
                              Long[] listSortId,
                              ModelMap map,
                              HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username) {
            return "redirect:/Verwalter/login";
        }
        
        if (null == page || page < 0)
        {
            page = 0;
        }
        
        if (null == size || size <= 0)
        {
            size = SiteMagConstant.pageSize;;
        }
        
        if (null != keywords)
        {
            keywords = keywords.trim();
        }
        
        if (null != __EVENTTARGET)
        {
            switch (__EVENTTARGET)
            {
            case "lbtnViewTxt":
            case "lbtnViewImg":
                __VIEWSTATE = __EVENTTARGET;
                break;
            
            case "btnSave":
                btnSave(listId, listSortId, username);
                tdManagerLogService.addLog("edit", "用户修改商品", req);
                break;
                
            case "btnDelete":
                btnDelete(listId, listChkId);
                tdManagerLogService.addLog("delete", "用户删除商品", req);
                break;
                
            case "btnPage":
                if (null != __EVENTARGUMENT)
                {
                    page = Integer.parseInt(__EVENTARGUMENT);
                } 
                break;
                
            case "btnOnSale":
                if (null != __EVENTARGUMENT)
                {
                    Long goodsId = Long.parseLong(__EVENTARGUMENT);
                    
                    if (null != goodsId)
                    {
                        TdGoods goods = tdGoodsService.findOne(goodsId);
                        
                        if (null != goods)
                        {
                            if (null == goods.getIsOnSale() || !goods.getIsOnSale())
                            {
                                goods.setIsOnSale(true);
                                goods.setOnSaleTime(new Date());
                                tdManagerLogService.addLog("delete", "用户上架商品:" + goods.getTitle(), req);
                            }
                            else
                            {
                                goods.setIsOnSale(false);
                                tdManagerLogService.addLog("delete", "用户下架商品:" + goods.getTitle(), req);
                            }
                            tdGoodsService.save(goods, username);
                        }
                    }
                } 
                break;
            }
        }
        
        if (null != __EVENTTARGET && __EVENTTARGET.equalsIgnoreCase("lbtnViewTxt")
                || null != __EVENTTARGET && __EVENTTARGET.equalsIgnoreCase("lbtnViewImg"))
        {
            __VIEWSTATE = __EVENTTARGET;
        }
        
        map.addAttribute("category_list", tdProductCategoryService.findAll());
        
        Page<TdGoods> goodsPage = null;
        
        if (null == categoryId)
        {
            if (null == property || property.isEmpty())
            {
                if (null == keywords || "".equalsIgnoreCase(keywords))
                {
                    goodsPage = tdGoodsService.findAllOrderBySortIdAsc(page, size);
                }
                else
                {
                    goodsPage = tdGoodsService.searchAndOrderBySortIdAsc(keywords, page, size);
                }
            }
            else
            {
                if (property.equalsIgnoreCase("isOnSale"))
                {
                    if (null == keywords || "".equalsIgnoreCase(keywords))
                    {
                        goodsPage = tdGoodsService.findByIsOnSaleTrueOrderBySortIdAsc(page, size);
                    }
                    else
                    {
                        goodsPage = tdGoodsService.searchAndIsOnSaleTrueOrderBySortIdAsc(keywords, page, size);
                    }
                }
            }
        }
        else
        {
            if (null == property || property.isEmpty())
            {
                if (null == keywords || "".equalsIgnoreCase(keywords))
                {
                    goodsPage = tdGoodsService.findByCategoryIdTreeContainingOrderBySortIdAsc(categoryId, page, size);
                }
                else
                {
                    goodsPage = tdGoodsService.searchAndFindByCategoryIdOrderBySortIdAsc(keywords, categoryId, page, size);
                }
            }
            else
            {
                if (property.equalsIgnoreCase("isOnSale"))
                {
                    if (null == keywords || "".equalsIgnoreCase(keywords))
                    {
                        goodsPage = tdGoodsService.findByCategoryIdTreeContainingAndIsOnSaleTrueOrderBySortIdAsc(categoryId, page, size);
                    }
                    else
                    {
                        goodsPage = tdGoodsService.searchAndFindByCategoryIdAndIsOnSaleTrueOrderBySortIdAsc(keywords, categoryId, page, size);
                    }
                }
            }
        }
        
        map.addAttribute("content_page", goodsPage);

        // 参数注回
        map.addAttribute("page", page);
        map.addAttribute("size", size);
        map.addAttribute("keywords", keywords);
        map.addAttribute("__EVENTTARGET", __EVENTTARGET);
        map.addAttribute("__EVENTARGUMENT", __EVENTARGUMENT);
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        map.addAttribute("categoryId", categoryId);
        map.addAttribute("property", property);
        
        // 文字列表模式
        if (null != __VIEWSTATE && __VIEWSTATE.equals("lbtnViewTxt"))
        {
            return "/site_mag/goods_txt_list";
        }
        
        // 图片列表模式
        return "/site_mag/goods_pic_list";
    }
    
    @RequestMapping(value="/list/dialog/{type}")
    public String goodsListDialog(@PathVariable String type,
                                String keywords,
                                Long categoryId,
                                Integer page, 
                                Integer size,
                                Integer total,
                                String __EVENTTARGET,
                                String __EVENTARGUMENT,
                                String __VIEWSTATE,
                                ModelMap map,
                                HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username) {
            return "redirect:/Verwalter/login";
        }
        if (null != __EVENTTARGET)
        {
            if (__EVENTTARGET.equalsIgnoreCase("btnPage"))
            {
                if (null != __EVENTARGUMENT)
                {
                    page = Integer.parseInt(__EVENTARGUMENT);
                } 
            }
            else if (__EVENTTARGET.equalsIgnoreCase("btnSearch"))
            {
                
            }
            else if (__EVENTTARGET.equalsIgnoreCase("categoryId"))
            {
                
            }
        }
        
        if (null == page || page < 0)
        {
            page = 0;
        }
        
        if (null == size || size <= 0)
        {
            size = SiteMagConstant.pageSize;;
        }
        
        if (null != keywords)
        {
            keywords = keywords.trim();
        }
        
        Page<TdGoods> goodsPage = null;
        
        if (null == categoryId)
        {
            if (null == keywords || "".equalsIgnoreCase(keywords))
            {
                goodsPage = tdGoodsService.findAllOrderBySortIdAsc(page, size);
            }
            else
            {
                goodsPage = tdGoodsService.searchAndOrderBySortIdAsc(keywords, page, size);
            }
        }
        else
        {
            if (null == keywords || "".equalsIgnoreCase(keywords))
            {
                goodsPage = tdGoodsService.findByCategoryIdTreeContainingOrderBySortIdAsc(categoryId, page, size);
            }
            else
            {
                goodsPage = tdGoodsService.searchAndFindByCategoryIdOrderBySortIdAsc(keywords, categoryId, page, size);
            }
        }
        
        map.addAttribute("goods_page", goodsPage);
        
        // 参数注回
        map.addAttribute("category_list", tdProductCategoryService.findAll());
        map.addAttribute("page", page);
        map.addAttribute("size", size);
        map.addAttribute("total", total);
        map.addAttribute("keywords", keywords);
        map.addAttribute("categoryId", categoryId);
        map.addAttribute("__EVENTTARGET", __EVENTTARGET);
        map.addAttribute("__EVENTARGUMENT", __EVENTARGUMENT);
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        
        if (null != type && type.equalsIgnoreCase("gift"))
        {
            return "/site_mag/dialog_goods_gift_list";
        }
        
        return "/site_mag/dialog_goods_combination_list";
    }
    
    @RequestMapping(value="/edit")
    public String goodsEdit(Long pid, Long id, 
            String __EVENTTARGET,
            String __EVENTARGUMENT,
            String __VIEWSTATE,
            ModelMap map,
            HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username) {
            return "redirect:/Verwalter/login";
        }
        
        map.addAttribute("__EVENTTARGET", __EVENTTARGET);
        map.addAttribute("__EVENTARGUMENT", __EVENTARGUMENT);
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        
        
        map.addAttribute("category_list", tdProductCategoryService.findAll());
                
        if (null != id)
        {
            TdGoods tdGoods = tdGoodsService.findOne(id);
            
            if (null != tdGoods)
            {
                // 参数列表
                TdProductCategory tpc = tdProductCategoryService.findOne(tdGoods.getCategoryId());
                
                if (null != tpc && null != tpc.getParamCategoryId())
                {
                    map.addAttribute("param_list", tdParameterService.findByCategoryTreeContaining(tpc.getParamCategoryId()));
                }
                
                // 查找产品列表
                map.addAttribute("product_list", tdProductService.findByProductCategoryTreeContaining(tdGoods.getCategoryId()));
            
                // 查找品牌
                map.addAttribute("brand_list", tdBrandService.findByProductCategoryTreeContaining(tdGoods.getCategoryId()));
                
                map.addAttribute("warehouse_list", tdWarehouseService.findAll());
                
                if (null != tdGoods.getProductId())
                {
                    map.addAttribute("product", tdProductService.findOne(tdGoods.getProductId()));
                }
                
                map.addAttribute("goods", tdGoods);
            }
        }
        
        return "/site_mag/goods_edit";
    }
    
    @RequestMapping(value="/save", method = RequestMethod.POST)
    public String save(TdGoods tdGoods, 
                        String[] hid_photo_name_show360,
                        String __EVENTTARGET,
                        String __EVENTARGUMENT,
                        String __VIEWSTATE,
                        String menuId,
                        String channelId,
                        ModelMap map,
                        HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username)
        {
            return "redirect:/Verwalter/login";
        }
        
        String uris = parsePicUris(hid_photo_name_show360);
        
        tdGoods.setShowPictures(uris);
        
        String type = null;
        
        if (null == tdGoods.getId())
        {
            type = "add";
        }
        else
        {
            type = "edit";
        }
        
        tdGoodsService.save(tdGoods, username);
        
        tdManagerLogService.addLog(type, "用户修改商品", req);
        
        return "redirect:/Verwalter/goods/list?__EVENTTARGET=" + __EVENTTARGET
                + "&__EVENTARGUMENT=" + __EVENTARGUMENT
                + "&__VIEWSTATE=" + __VIEWSTATE;
    }
    
    @ModelAttribute
    public void getModel(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            TdGoods goods = tdGoodsService.findOne(id);
            model.addAttribute("tdGoods", goods);
        }
    }
    
    /**
     * 图片地址字符串整理，多张图片用,隔开
     * 
     * @param params
     * @return
     */
    private String parsePicUris(String[] uris)
    {
        if (null == uris || 0 == uris.length)
        {
            return null;
        }
        
        String res = "";
        
        for (String item : uris)
        {
            String uri = item.substring(item.indexOf("|")+1, item.indexOf("|", 2));
            
            if (null != uri)
            {
                res += uri;
                res += ",";
            }
        }
        
        return res;
    }
    
    /**
     * 修改商品
     * @param cid
     * @param ids
     * @param sortIds
     * @param username
     */
    private void btnSave(Long[] ids, Long[] sortIds, String username)
    {
        if (null == ids || null == sortIds
                || ids.length < 1 || sortIds.length < 1)
        {
            return;
        }
        
        for (int i = 0; i < ids.length; i++)
        {
            Long id = ids[i];
            
            TdGoods goods = tdGoodsService.findOne(id);
                
            if (sortIds.length > i)
            {
                goods.setSortId(sortIds[i]);
                tdGoodsService.save(goods, username);
            }
        }
    }
    
    /**
     * 删除商品
     * 
     * @param ids
     * @param chkIds
     */
    private void btnDelete(Long[] ids, Integer[] chkIds)
    {
        if (null == ids || null == chkIds
                || ids.length < 1 || chkIds.length < 1)
        {
            return;
        }
        
        for (int chkId : chkIds)
        {
            if (chkId >=0 && ids.length > chkId)
            {
                Long id = ids[chkId];
                
                tdGoodsService.delete(id);
            }
        }
    }
    
}