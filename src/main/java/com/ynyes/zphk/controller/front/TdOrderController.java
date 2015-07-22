package com.ynyes.zphk.controller.front;

import static org.apache.commons.lang3.StringUtils.leftPad;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.csii.payment.client.core.CebMerchantSignVerify;
import com.cytm.payment.alipay.AlipayConfig;
import com.cytm.payment.alipay.Constants;
import com.cytm.payment.alipay.PaymentChannelAlipay;
import com.cytm.payment.alipay.core.AlipayNotify;
import com.cytm.payment.ceb.CEBPayConfig;
import com.cytm.payment.ceb.PaymentChannelCEB;
import com.ynyes.zphk.entity.TdCartGoods;
import com.ynyes.zphk.entity.TdCoupon;
import com.ynyes.zphk.entity.TdCouponType;
import com.ynyes.zphk.entity.TdDeliveryType;
import com.ynyes.zphk.entity.TdDiySite;
import com.ynyes.zphk.entity.TdGoods;
import com.ynyes.zphk.entity.TdOrder;
import com.ynyes.zphk.entity.TdOrderGoods;
import com.ynyes.zphk.entity.TdPayRecord;
import com.ynyes.zphk.entity.TdPayType;
import com.ynyes.zphk.entity.TdShippingAddress;
import com.ynyes.zphk.entity.TdUser;
import com.ynyes.zphk.entity.TdUserPoint;
import com.ynyes.zphk.service.TdCartGoodsService;
import com.ynyes.zphk.service.TdCommonService;
import com.ynyes.zphk.service.TdCouponService;
import com.ynyes.zphk.service.TdCouponTypeService;
import com.ynyes.zphk.service.TdDeliveryTypeService;
import com.ynyes.zphk.service.TdDiySiteService;
import com.ynyes.zphk.service.TdGoodsService;
import com.ynyes.zphk.service.TdOrderGoodsService;
import com.ynyes.zphk.service.TdOrderService;
import com.ynyes.zphk.service.TdPayRecordService;
import com.ynyes.zphk.service.TdUserPointService;
import com.ynyes.zphk.service.TdUserService;

/**
 * 订单
 *
 */
@Controller
@RequestMapping("/order")
public class TdOrderController extends AbstractPaytypeService {
    
    private static final String PAYMENT_ALI = "ALI";

    @Autowired
    private TdCartGoodsService tdCartGoodsService;

    @Autowired
    private TdUserService tdUserService;

    @Autowired
    private TdGoodsService tdGoodsService;

    @Autowired
    private TdOrderGoodsService tdOrderGoodsService;

    @Autowired
    private TdOrderService tdOrderService;

    @Autowired
    private TdDeliveryTypeService tdDeliveryTypeService;

    @Autowired
    private TdCommonService tdCommonService;

    @Autowired
    private TdUserPointService tdUserPointService;
    
    @Autowired
    private TdCouponService tdCouponService;
    
    @Autowired
    private TdCouponTypeService tdCouponTypeService;
    
    @Autowired
    private TdDiySiteService tdDiySiteService;
    
    @Autowired
    private TdPayRecordService payRecordService;

    @RequestMapping(value = "/info")
    public String orderInfo(HttpServletRequest req, HttpServletResponse resp,
            ModelMap map) {
        String username = (String) req.getSession().getAttribute("username");

        if (null == username) {
            return "redirect:/login";
        }

        // 把所有的购物车项转到该登陆用户下
        String sessionId = req.getSession().getId();

        List<TdCartGoods> cartGoodsList = tdCartGoodsService
                .findByUsername(sessionId);

        if (null != cartGoodsList && cartGoodsList.size() > 0) {
            for (TdCartGoods cartGoods : cartGoodsList) {
                cartGoods.setUsername(username);
                cartGoods.setIsLoggedIn(true);
            }
            tdCartGoodsService.save(cartGoodsList);
        }

        TdUser user = tdUserService.findByUsernameAndIsEnabled(username);

        if (null != user) {
            map.addAttribute("user", user);
        }

        List<TdCartGoods> selectedGoodsList = tdCartGoodsService
                .findByUsernameAndIsSelectedTrue(username);

        Long totalPointLimited = 0L;

        // 积分限制总和
        if (null != selectedGoodsList) {
            for (TdCartGoods cg : selectedGoodsList) {
                TdGoods goods = tdGoodsService.findOne(cg.getGoodsId());

                if (null != goods && null != goods.getPointLimited()) {
                    totalPointLimited += goods.getPointLimited()
                            * cg.getQuantity();
                }
            }
        }
        
        // 优惠券
        map.addAttribute("coupon_list", tdCouponService.findByUsernameAndIsUseable(username));

        // 积分限额
        map.addAttribute("total_point_limit", totalPointLimited);
        
        // 线下同盟店
        map.addAttribute("shop_list", tdDiySiteService.findByIsEnableTrue());
        
        // 支付方式列表
        setPayTypes(map);
        
        // 配送方式
        map.addAttribute("delivery_type_list",
                tdDeliveryTypeService.findByIsEnableTrue());
        
        // 选中商品
        map.addAttribute("selected_goods_list", selectedGoodsList);

        tdCommonService.setHeader(map, req);

        return "/client/order_info";
    }

    @RequestMapping(value = "/goods/{type}")
    public String orderEdit(HttpServletRequest req, HttpServletResponse resp,
            @PathVariable String type, Long gid, ModelMap map) {
        String username = (String) req.getSession().getAttribute("username");

        if (null == username) {
            return "redirect:/login";
        }

        // 把所有的购物车项转到该登陆用户下
        List<TdCartGoods> cgList = tdCartGoodsService
                .findByUsernameAndIsSelectedTrue(username);

        if (null != cgList && null != type && null != gid) {
            for (TdCartGoods cg : cgList) {
                if (gid.equals(cg.getGoodsId())) {
                    TdGoods goods = tdGoodsService.findOne(cg.getGoodsId());

                    if (null != goods) {
                        if (type.equalsIgnoreCase("plus")) 
                        {
                            // 闪购
                            if (goods.getIsFlashSale()
                                    && goods.getFlashSaleStartTime().before(new Date())
                                    && goods.getFlashSaleStopTime().after(new Date())
                                    && cg.getPrice().equals(goods.getFlashSalePrice())) 
                            {
                                if (cg.getQuantity().compareTo(goods.getFlashSaleLeftNumber()) < 0) {
                                    cg.setQuantity(cg.getQuantity() + 1L);
                                }
                            }
                            else
                            {
                                if (cg.getQuantity().compareTo(goods.getLeftNumber()) < 0) {
                                    cg.setQuantity(cg.getQuantity() + 1L);
                                }
                            }
                        } else {
                            if (cg.getQuantity().compareTo(1L) > 0) {
                                cg.setQuantity(cg.getQuantity() - 1L);
                            }
                        }

                        tdCartGoodsService.save(cg);
                        break;
                    }
                }
            }
        }
//        
//        List<TdCartGoods> selectedGoodsList = tdCartGoodsService.findByUsernameAndIsSelectedTrue(username);
//        map.addAttribute("selected_goods_list", selectedGoodsList);

        return "redirect:/order/info";
    }

    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    public String submit(Long addressId,    // 送货地址
                    Long shopId,
                    Long payTypeId,         // 支付方式ID
                    Long deliveryTypeId,    // 配送方式ID
                    Long pointUse,          // 使用积分
                    Boolean isNeedInvoice,  // 是否需要发票
                    String invoiceTitle,    // 发票抬头
                    String userMessage,     // 用户留言
                    Long couponId,          // 优惠券ID
                    String appointmentTime,
                    HttpServletRequest req, 
                    ModelMap map) {
        String username = (String) req.getSession().getAttribute("username");

        if (null == username) {
            return "redirect:/login";
        }

        TdUser user = tdUserService.findByUsernameAndIsEnabled(username);
        
        double payTypeFee = 0.0;
        double deliveryTypeFee = 0.0;
        double pointFee = 0.0;
        double couponFee = 0.0;
        
        TdShippingAddress address = null;
        
        if (null != addressId)
        {
            if (null == pointUse) {
                pointUse = 0L;
            }
            
            if (null != user.getTotalPoints())
            {
                if (pointUse.compareTo(user.getTotalPoints()) >= 0) {
                    pointUse = user.getTotalPoints();
                }
            }
    
            List<TdShippingAddress> addressList = user.getShippingAddressList();
    
            for (TdShippingAddress add : addressList) {
                if (add.getId().equals(addressId)) {
                    address = add;
                    break;
                }
            }
        }

        List<TdCartGoods> cartGoodsList = tdCartGoodsService
                .findByUsernameAndIsSelectedTrue(username);
        List<TdOrderGoods> orderGoodsList = new ArrayList<TdOrderGoods>();

        Double totalPrice = 0.0;

        if (null != cartGoodsList) {
            for (TdCartGoods cartGoods : cartGoodsList) {
                if (cartGoods.getIsSelected()) {
                    TdGoods goods = tdGoodsService.findOne(cartGoods
                            .getGoodsId());

                    if (null == goods) {
                        continue;
                    }

                    TdOrderGoods orderGoods = new TdOrderGoods();
                    orderGoods.setGoodsId(goods.getId());
                    orderGoods.setGoodsTitle(goods.getTitle());
                    orderGoods.setGoodsSubTitle(goods.getSubTitle());
                    orderGoods.setGoodsCoverImageUri(goods.getCoverImageUri());
                    orderGoods.setPrice(cartGoods.getPrice());
                    orderGoods.setIsReturnApplied(false);

                    long quantity = 0;
                    
                    // 闪购
                    if (null != goods.getIsFlashSale()
                            && goods.getIsFlashSale()
                            && null != goods.getFlashSaleStartTime()
                            && goods.getFlashSaleStartTime().before(new Date())
                            && null != goods.getFlashSaleStopTime()
                            && goods.getFlashSaleStopTime().after(new Date())
                            && cartGoods.getPrice().equals(goods.getFlashSalePrice())) 
                    {
                        if (null != goods.getFlashSaleLeftNumber())
                        {
                            quantity = Math.min(cartGoods.getQuantity(), goods.getFlashSaleLeftNumber());
                        }
                    } 
                    // 团购
                    else if (null != goods.getIsGroupSale()
                            && goods.getIsGroupSale()
                            && null != goods.getGroupSaleStartTime()
                            && goods.getGroupSaleStartTime().before(new Date())
                            && null != goods.getGroupSaleStopTime()
                            && goods.getGroupSaleStopTime().after(new Date())
                            && cartGoods.getPrice().equals(goods.getGroupSalePrice())) 
                    {
                        if (null != goods.getGroupSaleLeftNumber())
                        {
                            quantity = Math.min(cartGoods.getQuantity(), goods.getGroupSaleLeftNumber());
                        }
                    } 
                    else 
                    {
                        quantity = Math.min(cartGoods.getQuantity(), goods.getLeftNumber());
                    }

                    orderGoods.setQuantity(quantity);
                    orderGoods.setPoints(goods.getReturnPoints());

                    totalPrice += cartGoods.getPrice()
                            * cartGoods.getQuantity();

                    orderGoodsList.add(orderGoods);
                    tdGoodsService.save(goods, username);
                }
            }
        }

        TdOrder tdOrder = new TdOrder();

        Date current = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String curStr = sdf.format(current);
        Random random = new Random();
        
        // 预约时间
        if (null != appointmentTime)
        {
            sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 小写的mm表示的是分钟
            
            try {
                Date appTime = sdf.parse(appointmentTime);
                
                tdOrder.setAppointmentTime(appTime);
                
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        
        // 基本信息
        tdOrder.setUsername(username);
        tdOrder.setOrderTime(current);
        
        // 订单号
        tdOrder.setOrderNumber("P" + curStr + 
                leftPad(Integer.toString(random.nextInt(999)), 3, "0"));

        // 收货地址
        if (null != address)
        {
            tdOrder.setPostalCode(address.getPostcode());
            tdOrder.setShippingName(address.getReceiverName());
            tdOrder.setShippingPhone(address.getReceiverMobile());
            tdOrder.setShippingAddress(address.getProvince() + address.getCity()
                    + address.getDisctrict() + address.getDetailAddress());
        }
        if (null != payTypeId)
        {
            TdPayType payType = tdPayTypeService.findOne(payTypeId);
            
            if (payType.getIsOnlinePay()) {
                tdOrder.setStatusId(2L); // 待付款
            } else {
                tdOrder.setStatusId(1L); // 待确认
            }
            
            // 支付类型
            tdOrder.setPayTypeId(payType.getId());
            tdOrder.setPayTypeTitle(payType.getTitle());
            tdOrder.setPayTypeFee(payType.getFee());
            tdOrder.setIsOnlinePay(payType.getIsOnlinePay());
            
            payTypeFee = payType.getFee();
        }
        
        // 配送方式
        if (null != deliveryTypeId)
        {
            TdDeliveryType deliveryType = tdDeliveryTypeService.findOne(deliveryTypeId);
            tdOrder.setDeliverTypeId(deliveryType.getId());
            tdOrder.setDeliverTypeTitle(deliveryType.getTitle());
            tdOrder.setDeliverTypeFee(deliveryType.getFee());
            deliveryTypeFee = deliveryType.getFee();
        }
        
        // 线下同盟店
        if (null != shopId)
        {
            TdDiySite shop = tdDiySiteService.findOne(shopId);
            
            if (null != shop)
            {
                tdOrder.setShopId(shop.getId());
                tdOrder.setShopTitle(shop.getTitle());
            }
        }
        
        // 使用积分
        tdOrder.setPointUse(pointUse);
        
        // 用户留言
        tdOrder.setUserRemarkInfo(userMessage);
        
        // 优惠券
        if (null != couponId)
        {
            TdCoupon coupon = tdCouponService.findOne(couponId);
            
            if (null != coupon)
            {
                TdCouponType couponType = tdCouponTypeService.findOne(coupon.getId());
                
                couponFee = couponType.getPrice();
            }
        }
        
        pointFee = pointUse * 1;
        
        tdOrder.setTotalPrice(totalPrice + payTypeFee + deliveryTypeFee - pointFee - couponFee);
        
        // 发票
        if (null != isNeedInvoice)
        {
            tdOrder.setIsNeedInvoice(isNeedInvoice);
            tdOrder.setInvoiceTitle(invoiceTitle);
        }
        else
        {
            tdOrder.setIsNeedInvoice(false);
        }

        // 订单商品
        tdOrder.setOrderGoodsList(orderGoodsList);
        tdOrder.setTotalGoodsPrice(totalPrice);

        // 积分奖励
        tdOrder.setPoints(0L);

        // 保存订单
        tdOrderGoodsService.save(orderGoodsList);
        tdOrder = tdOrderService.save(tdOrder);
        
        // 优惠券
        if (null != couponId)
        {
            TdCoupon coupon = tdCouponService.findOne(couponId);
            
            if (null != coupon)
            {
                coupon.setIsUsed(true);
                tdCouponService.save(coupon);
            }
        }

        if (null != user) {
            if (pointUse.compareTo(0L) >= 0
                    && null != user.getTotalPoints()
                    && user.getTotalPoints().compareTo(pointUse) >= 0) {
                TdUserPoint userPoint = new TdUserPoint();
                userPoint.setDetail("购买商品使用积分抵扣");
                userPoint.setOrderNumber(tdOrder.getOrderNumber());
                userPoint.setPoint(0 - pointUse);
                userPoint.setPointTime(new Date());
                userPoint.setUsername(username);
                userPoint.setTotalPoint(user.getTotalPoints() - pointUse);
                tdUserPointService.save(userPoint);

                user.setTotalPoints(user.getTotalPoints() - pointUse);
                tdUserService.save(user);
            }
        }

        // 删除已生成订单的购物车项
        tdCartGoodsService.delete(cartGoodsList);

        if (tdOrder.getIsOnlinePay()) {
            return "redirect:/order/pay?orderId=" + tdOrder.getId();
        }

        return "redirect:/order/success?orderId=" + tdOrder.getId();
    }

    @RequestMapping(value = "/success")
    public String success(Long orderId, ModelMap map, HttpServletRequest req) {
        String username = (String) req.getSession().getAttribute("username");

        if (null == username) {
            return "redirect:/login";
        }
        
        tdCommonService.setHeader(map, req);

        if (null == orderId) {
            return "/client/error_404";
        }

        map.addAttribute("order", tdOrderService.findOne(orderId));

        return "/client/order_success";
    }
    
    @RequestMapping(value = "/pay")
    public String pay(Long orderId, ModelMap map, HttpServletRequest req) {
        String username = (String) req.getSession().getAttribute("username");

        if (null == username) {
            return "redirect:/login";
        }
        
        tdCommonService.setHeader(map, req);

        if (null == orderId) {
            return "/client/error_404";
        }

        map.addAttribute("order", tdOrderService.findOne(orderId));

        return "/client/order_pay";
    }
    
    /**
     * 支付
     * @param orderId
     * @param map
     * @param req
     * @return
     */
    @RequestMapping(value = "/dopay/{orderId}")
    public String payOrder(@PathVariable Long orderId, ModelMap map, HttpServletRequest req) {
        String username = (String) req.getSession().getAttribute("username");

        if (null == username) {
            return "redirect:/login";
        }
        
        tdCommonService.setHeader(map, req);

        if (null == orderId) 
        {
            return "/client/error_404";
        }
        
        TdOrder order = tdOrderService.findOne(orderId);
        
        if (null == order)
        {
            return "/client/error_404";
        }
        
        if (!order.getStatusId().equals(2L))
        {
            return "/client/error_404";
        }
        
        String amount = order.getTotalPrice().toString();
        req.setAttribute("totalPrice", amount);
        
        String payForm = "";
        
        Long payId = order.getPayTypeId();
        TdPayType payType = tdPayTypeService.findOne(payId);
        if (payType != null) {
            TdPayRecord record = new TdPayRecord();
            record.setCreateTime(new Date());
            record.setOrderId(order.getId());
            record.setPayTypeId(payType.getId());
            record.setStatusCode(1);
            record.setCreateTime(new Date());
            record = payRecordService.save(record);
            
            String payRecordId = record.getId().toString();
            int recordLength = payRecordId.length();
            if(recordLength > 6) {
                payRecordId = payRecordId.substring(recordLength - 6);
            } else {
                payRecordId = leftPad(payRecordId, 6, "0");
            }
            req.setAttribute("payRecordId", payRecordId);
            
            req.setAttribute("orderNumber", order.getOrderNumber());

            String payCode = payType.getCode();
            if(PAYMENT_ALI.equals(payCode)) {
                PaymentChannelAlipay channelAlipay = new PaymentChannelAlipay();
                payForm = channelAlipay.getPayFormData(req);
                map.addAttribute("charset", AlipayConfig.CHARSET);
            } else if(CEBPayConfig.INTER_B2C_BANK_CONFIG.keySet().contains(payCode)) {
                req.setAttribute("payMethod", payCode);
                PaymentChannelCEB channelCEB = new PaymentChannelCEB();
                payForm = channelCEB.getPayFormData(req);
                map.addAttribute("charset", "GBK");
            } else {
                //
            }
        }

        map.addAttribute("payForm", payForm);

        return "/client/order_pay_form";
    }

    @RequestMapping(value = "/pay/success")
    public String paySuccess(ModelMap map, HttpServletRequest req) {
//        String username = (String) req.getSession().getAttribute("username");
//
//        if (null == username) {
//            return "redirect:/login";
//        }
        
        tdCommonService.setHeader(map, req);

        return "/client/order_pay_success";
    }

    @RequestMapping(value = "/pay/notify")
    public String payNotify(ModelMap map, HttpServletRequest req) {
//        String username = (String) req.getSession().getAttribute("username");
//
//        if (null == username) {
//            return "redirect:/login";
//        }
        
        tdCommonService.setHeader(map, req);

        return "/client/order_pay";
    }
    
    /*
     * 
     */
    @RequestMapping(value = "/pay/notify_alipay")
    public void payNotifyAlipay(ModelMap map, HttpServletRequest req, HttpServletResponse resp) {
        new PaymentChannelAlipay().doResponse(req, resp);
    }
    
    /*
     * 
     */
    @RequestMapping(value = "/pay/notify_cebpay")
    public void payNotifyCEBPay(ModelMap map, HttpServletRequest req, HttpServletResponse resp) {
        new PaymentChannelCEB().doResponse(req, resp);
    }
    
    /*
     * 
     */
    @RequestMapping(value = "/pay/result_alipay")
    public String payResultAlipay(ModelMap map, HttpServletRequest req, HttpServletResponse resp) {       
        Map<String, String> params = new HashMap<String, String>();
        Map<String,String[]> requestParams = req.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = iter.next();
            String[] values = requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
            try {
                valueStr = new String(valueStr.getBytes("ISO-8859-1"), AlipayConfig.CHARSET);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            params.put(name, valueStr);
        }

        //获取支付宝的返回参数
        String orderNo = "";
        String trade_status = "";
        try {
            //商户订单号
            orderNo = new String(req.getParameter(Constants.KEY_OUT_TRADE_NO).getBytes("ISO-8859-1"), 
                    AlipayConfig.CHARSET);
            //交易状态
            trade_status = new String(req.getParameter("trade_status").getBytes("ISO-8859-1"), 
                    AlipayConfig.CHARSET);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        //计算得出通知验证结果
        boolean verify_result = AlipayNotify.verify(params);
        
        tdCommonService.setHeader(map, req);
        map.put("orderNo", orderNo.substring(0, orderNo.length() - 6));
        map.put("methodName", "支付宝");
        if(verify_result){//验证成功
            if("WAIT_SELLER_SEND_GOODS".equals(trade_status)){
                //订单支付成功
                return "/client/order_pay_success";
            }
        }
        
        //验证失败或者支付失败
        return "/client/order_pay_failed";
    }
    
    /*
     * 
     */
    @RequestMapping(value = "/pay/result_cebpay")
    public String payResultCEBPay(ModelMap map, HttpServletRequest req, HttpServletResponse resp) {        
        tdCommonService.setHeader(map, req);
        
        String plainData = req.getParameter("Plain");
        String signature = req.getParameter("Signature");

        //计算得出通知验证结果
        boolean verify_result = CebMerchantSignVerify.merchantVerifyPayGate_ABA(signature, plainData);
        String plainObjectStr = "";

        if(plainData.endsWith("~|~")) {
            plainObjectStr = plainData.substring(0, plainData.length() - 3);
        }

        plainObjectStr = plainObjectStr.replaceAll("=", "\":\"").replaceAll("~\\|~", "\",\"");
        plainObjectStr = "{\"" + plainObjectStr + "\"}";

        JSONObject paymentResult = JSONObject.fromObject(plainObjectStr);        
        String payment_channel_name = "光大银行";

        String [] msgExt = paymentResult.getString("msgExt").split("\\|", 2);
        String paybank_no = msgExt[1];
        
        String orderNo = msgExt[0];
        orderNo = (null == orderNo) ? "" : orderNo.trim();
        for(Iterator<String[]> bankConfigs = CEBPayConfig.INTER_B2C_BANK_CONFIG.values().iterator(); bankConfigs.hasNext();) {
            String [] bankNoAndName = bankConfigs.next();
            if(bankNoAndName[0].equals(paybank_no)) {
                payment_channel_name = bankNoAndName[1];
                break;
            }
        }
        
        map.put("orderNo", orderNo);
        map.put("methodName", payment_channel_name);
        if(verify_result){//验证成功
            String trade_status = paymentResult.getString("respCode");
            if("".equals(trade_status) || "AAAAAAA".equals(trade_status)){
                //订单支付成功
                return "/client/order_pay_success";
            }

        }
        //验证失败或者支付失败
        return "/client/order_pay_failed";
    }
}
