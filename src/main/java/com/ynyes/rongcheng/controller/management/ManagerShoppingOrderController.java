package com.ynyes.rongcheng.controller.management;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ynyes.rongcheng.entity.ShoppingOrder;
import com.ynyes.rongcheng.service.ShoppingOrderService;
import com.ynyes.rongcheng.util.ManagementConstant;

/**
 * 品牌管理控制器
 * 
 * @author Sharon
 * 
 */
@Controller
@RequestMapping(value="/admin/order")
public class ManagerShoppingOrderController {
    
    @Autowired
    ShoppingOrderService shoppingOrderService;
    
    @RequestMapping
    public String order(ModelMap map){
        
        Page<ShoppingOrder> orderPage = shoppingOrderService.findAll(0, ManagementConstant.pageSize, "desc", "id");
        
        
        if (null != orderPage)
        {
            map.addAttribute("shopping_order_list", orderPage.getContent());
        }
        
        return "/management/order";
    }
    
    /**
     * 获取指定页号的用户
     * 
     * @param map
     * @param pageIndex 页号
     * @return
     */
    @RequestMapping(value="/page/{pageIndex}")
    public String page(ModelMap map, @PathVariable Integer pageIndex) {
        
        if (null != pageIndex && pageIndex.intValue() >= 0)
        {
            Page<ShoppingOrder> orderPage = shoppingOrderService.findAll(pageIndex, ManagementConstant.pageSize, "desc", "id");
            
            if (null != orderPage)
            {
                map.addAttribute("shopping_order_list", orderPage.getContent());
            }
        }
        
        return "/management/order/order_tbody";
    }
    
    @RequestMapping(value="/modify/{id}",method = RequestMethod.POST)
    public String modify(ModelMap map, @PathVariable Long id){
        if (null != id)
        {
            map.addAttribute("shopping_order", shoppingOrderService.findOne(id));
        }
        
        return "/management/order/order_modify";
    }
    
    /**
     * 保存订单
     * 
     * @param map
     * @param order 订单
     * @return
     */
//    @RequestMapping(value="/save",method = RequestMethod.POST)
//    @ResponseBody
//    public Map<String, Object> save(ModelMap map,  ShoppingOrder order){
//        Map<String, Object> res = new HashMap<String, Object>();
//        res.put("code", 1);
//        
//        if (null == order)
//        {
//            res.put("message", "参数有误");
//            return res;
//        }
//        
//        if (null == shoppingOrderService.save(order))
//        {
//            res.put("message", "保存订单出错");
//            return res;
//        }
//        
//        res.put("code", 0);
//        
//        return res;
//    }
    
    /**
     * 删除
     * 
     * @param map
     * @param id ID
     * @return
     */
    @RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
    @ResponseBody
    public void delete(ModelMap map, @PathVariable Long id) {
        
        if (null != id)
        {
            shoppingOrderService.delete(id);
        }
    }
    
    /**
     * 存在id字段时先查找出对应的实体
     * 
     * @param id
     * @param model
     */
    @ModelAttribute
    public void getModel(@RequestParam(value = "id", required = false) Long id, ModelMap map) {
        if (id != null) {
            map.addAttribute("order", shoppingOrderService.findOne(id));
        }
    }
    
}
