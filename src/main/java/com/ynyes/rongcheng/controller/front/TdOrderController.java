package com.ynyes.rongcheng.controller.front;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ynyes.rongcheng.entity.TdCartGoods;
import com.ynyes.rongcheng.entity.TdDeliveryType;
import com.ynyes.rongcheng.entity.TdGoods;
import com.ynyes.rongcheng.entity.TdOrder;
import com.ynyes.rongcheng.entity.TdOrderGoods;
import com.ynyes.rongcheng.entity.TdPayType;
import com.ynyes.rongcheng.entity.TdShippingAddress;
import com.ynyes.rongcheng.entity.TdUser;
import com.ynyes.rongcheng.service.TdCartGoodsService;
import com.ynyes.rongcheng.service.TdCommonService;
import com.ynyes.rongcheng.service.TdDeliveryTypeService;
import com.ynyes.rongcheng.service.TdGoodsService;
import com.ynyes.rongcheng.service.TdOrderGoodsService;
import com.ynyes.rongcheng.service.TdOrderService;
import com.ynyes.rongcheng.service.TdPayTypeService;
import com.ynyes.rongcheng.service.TdUserService;

/**
 * 订单
 *
 */
@Controller
@RequestMapping("/order")
public class TdOrderController {
    
    @Autowired
    private TdCartGoodsService tdCartGoodsService;
    
    @Autowired
    private TdUserService tdUserService;
    
    @Autowired
    private TdGoodsService tdGoodsService;
    
    @Autowired
    private TdPayTypeService tdPayTypeService;
    
    @Autowired
    private TdOrderGoodsService tdOrderGoodsService;
    
    @Autowired
    private TdOrderService tdOrderService;
    
    @Autowired
    private TdDeliveryTypeService tdDeliveryTypeService;
    
    @Autowired
    private TdCommonService tdCommonService;

    @RequestMapping(value = "/info")
    public String orderInfo(HttpServletRequest req, HttpServletResponse resp, ModelMap map) {
        String username = (String) req.getSession().getAttribute("username");
        
        if (null == username)
        {
            return "redirect:/login";
        }
        
        // 把所有的购物车项转到该登陆用户下
        String sessionId = req.getSession().getId();
        
        List<TdCartGoods> cartGoodsList = tdCartGoodsService.findByUsername(sessionId);
        
        if (null != cartGoodsList && cartGoodsList.size() > 0)
        {
            for (TdCartGoods cartGoods : cartGoodsList)
            {
                cartGoods.setUsername(username);
                cartGoods.setIsLoggedIn(true);
            }
            tdCartGoodsService.save(cartGoodsList);
        }
        
        TdUser user = tdUserService.findByUsernameAndIsEnabled(username);
        
        if (null != user)
        {
            map.addAttribute("user", user);
        }
        
        map.addAttribute("pay_type_list", tdPayTypeService.findByIsEnableTrue());
        map.addAttribute("delivery_type_list", tdDeliveryTypeService.findByIsEnableTrue());
        map.addAttribute("selected_goods_list", tdCartGoodsService.findByUsernameAndIsSelectedTrue(username));
        
        tdCommonService.setHeader(map, req);
        
        return "/client/order_info";
    }
    
    @RequestMapping(value = "/submit", method=RequestMethod.POST)
    public String submit(Long addressId,
                        Long payTypeId,
                        Long deliveryTypeId,
                        Boolean isNeedInvoice,
                        String invoiceTitle,
                        HttpServletRequest req, ModelMap map) {
        String username = (String) req.getSession().getAttribute("username");
        
        if (null == username)
        {
            return "redirect:/login";
        }
        
        if (null == addressId || null == payTypeId  ||
                null == deliveryTypeId || null == isNeedInvoice)
        {
            return "redirect:/order/info";
        }
        
        TdUser user = tdUserService.findByUsernameAndIsEnabled(username);
        TdPayType payType = tdPayTypeService.findOne(payTypeId);
        TdDeliveryType deliveryType = tdDeliveryTypeService.findOne(deliveryTypeId);
        TdShippingAddress address = null;
        
        if (null != user)
        {
            List<TdShippingAddress> addressList = user.getShippingAddressList();
            
            for (TdShippingAddress add : addressList)
            {
                if (add.getId().equals(addressId))
                {
                    address = add;
                    break;
                }
            }
        }
        
        List<TdCartGoods> cartGoodsList = tdCartGoodsService.findByUsernameAndIsSelectedTrue(username);
        List<TdOrderGoods> orderGoodsList = new ArrayList<TdOrderGoods>();
        
        Double totalPrice = 0.0;
        
        if (null != cartGoodsList)
        {
            for (TdCartGoods cartGoods : cartGoodsList)
            {
                if (cartGoods.getIsSelected())
                {
                    TdGoods goods = tdGoodsService.findOne(cartGoods.getGoodsId());
                    
                    if (null == goods)
                    {
                        continue;
                    }
                    
                    TdOrderGoods orderGoods = new TdOrderGoods();
                    orderGoods.setGoodsId(goods.getId());
                    orderGoods.setGoodsTitle(goods.getTitle());
                    orderGoods.setGoodsSubTitle(goods.getSubTitle());
                    orderGoods.setGoodsCoverImageUri(goods.getCoverImageUri());
                    orderGoods.setPrice(cartGoods.getPrice());
                    orderGoods.setGoodsVersion(goods.getVersion());
                    orderGoods.setGoodsCapacity(goods.getCapacity());
                    orderGoods.setGoodsColor(goods.getColor());
                    orderGoods.setIsReturnApplied(false);
                    orderGoods.setQuantity(cartGoods.getQuantity());
                    orderGoods.setPoints(goods.getReturnPoints());
                    
                    totalPrice += cartGoods.getPrice() * cartGoods.getQuantity();
                    
                    orderGoodsList.add(orderGoods);
                }
            }
        }
        
        TdOrder tdOrder = new TdOrder();
        
        Date current = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String curStr = sdf.format(current);
        Random random = new Random();
        
        // 基本信息
        tdOrder.setUsername(username);
        tdOrder.setOrderTime(current);
        
        if (payType.getIsOnlinePay())
        {
            tdOrder.setStatusId(1L); // 待付款
        }
        else
        {
            tdOrder.setStatusId(1L); // 待确认
        }
        tdOrder.setOrderNumber("P" + curStr + random.nextInt(999));
        
        // 收货地址
        tdOrder.setPostalCode(address.getPostcode());
        tdOrder.setShippingName(address.getReceiverName());
        tdOrder.setShippingPhone(address.getReceiverMobile());
        tdOrder.setShippingAddress(address.getProvince()+address.getCity()+address.getDisctrict()+address.getDetailAddress());
        
        // 支付类型
        tdOrder.setPayTypeId(payType.getId());
        tdOrder.setPayTypeTitle(payType.getTitle());
        tdOrder.setPayTypeFee(payType.getFee());
        tdOrder.setIsOnlinePay(payType.getIsOnlinePay());
        
        // 配送方式
        tdOrder.setDeliverTypeId(deliveryType.getId());
        tdOrder.setDeliverTypeTitle(deliveryType.getTitle());
        tdOrder.setDeliverTypeFee(deliveryType.getFee());
        
        // 发票
        tdOrder.setIsNeedInvoice(isNeedInvoice);
        tdOrder.setInvoiceTitle(invoiceTitle);

        // 订单商品
        tdOrder.setOrderGoodsList(orderGoodsList);
        tdOrder.setTotalGoodsPrice(totalPrice);
        tdOrder.setTotalPrice(totalPrice + deliveryType.getFee());
        
        // 积分奖励
        tdOrder.setPoints(0L);
        
        // 保存订单
        tdOrderGoodsService.save(orderGoodsList);
        tdOrder = tdOrderService.save(tdOrder);
        
        // 删除已生成订单的购物车项
        tdCartGoodsService.delete(cartGoodsList);
        
        if (tdOrder.getIsOnlinePay())
        {
            return "redirect:/order/pay?orderId=" + tdOrder.getId();
        }
        
        return "redirect:/order/success?orderId=" + tdOrder.getId();
    }
    
    @RequestMapping(value = "/pay")
    public String pay(Long orderId, ModelMap map, HttpServletRequest req) {
        
        tdCommonService.setHeader(map, req);
        
        if (null == orderId)
        {
            return "/client/error_404";
        }
        
        map.addAttribute("order", tdOrderService.findOne(orderId));
        
        return "/client/order_pay";
    }
    
    @RequestMapping(value = "/success")
    public String success(Long orderId, ModelMap map, HttpServletRequest req) {
        
        tdCommonService.setHeader(map, req);
        
        if (null == orderId)
        {
            return "/client/error_404";
        }
        
        map.addAttribute("order", tdOrderService.findOne(orderId));
        
        return "/client/order_success";
    }
    
    @RequestMapping(value = "/pay/success")
    public String paySuccess(ModelMap map, HttpServletRequest req) {
        
        tdCommonService.setHeader(map, req);
        
        return "/client/order_pay_success";
    }
}
