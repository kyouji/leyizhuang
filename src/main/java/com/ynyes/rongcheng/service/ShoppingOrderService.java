package com.ynyes.rongcheng.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.OrderItem;
import com.ynyes.rongcheng.entity.ShoppingOrder;
import com.ynyes.rongcheng.repository.ShoppingOrderRepo;

/**
 * 订单服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class ShoppingOrderService {
    @Autowired
    ShoppingOrderRepo repository;
    
    @Autowired
    OrderItemService orderItemService;
    
    /**
     * 根据用户名及状态查找订单，并分页
     * 
     * @param username 用户名
     * @param statusCode 状态码 0:待付款 1:待收货 2:待评价 3:已完成 4:已关闭 5: 已取消
     * @param page 页号
     * @param size 每页大小
     * @param direction 排序方向 asc:升序 desc:降序
     * @param property 排序的字段名
     * @return 订单分页，参数错误时返回NULL
     */
    public Page<ShoppingOrder> findByUsernameAndStatusCode(String username, 
                                    Long statusCode,
                                    int page,
                                    int size,
                                    String direction,
                                    String property)
    {
        Page<ShoppingOrder> orderPage = null;
        PageRequest pageRequest = null;
        
        if (null == username || null == statusCode)
        {
            return null;
        }
        
        if (page < 0 || size < 0)
        {
            return null;
        }
        
        if (null == direction || null == property)
        {
            pageRequest = new PageRequest(page, size);
        }
        else
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, 
                                 property);
            pageRequest = new PageRequest(page, size, sort);
        }
        
        // 按状态获取订单
        orderPage = repository.findByUsernameAndStatusCode(username, statusCode, pageRequest);
        
        return orderPage;
    }
    
    /**
     * 根据用户名查找订单，并分页
     * 
     * @param username 用户名
     * @param page 页号
     * @param size 每页大小
     * @param direction 排序方向 asc:升序 desc:降序
     * @param property 排序的字段名
     * @return 订单分页，参数错误时返回NULL
     */
    public Page<ShoppingOrder> findByUsername(String username, 
                                    int page,
                                    int size,
                                    String direction,
                                    String property)
    {
        Page<ShoppingOrder> orderPage = null;
        PageRequest pageRequest = null;
        
        if (null == username)
        {
            return null;
        }
        
        if (page < 0 || size < 0)
        {
            return null;
        }
        
        if (null == direction || null == property)
        {
            pageRequest = new PageRequest(page, size);
        }
        else
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, 
                                 property);
            pageRequest = new PageRequest(page, size, sort);
        }
        
        // 全部订单
        orderPage = repository.findByUsername(username, pageRequest);
        
        return orderPage;
    }
 
    /**
     * 获取订单
     * 
     * @param id 订单ID
     * @return 获取到的订单
     */
    public ShoppingOrder findOne(Long id)
    {
        ShoppingOrder so = null;
        
        if (null != id)
        {
            so = repository.findOne(id);
        }
        
        return so;
    }
    
    /**
     * 删除订单
     * 
     * @param id 订单ID
     */
    public void delete(Long id)
    {
        if (null != id)
        {
            repository.delete(id);
        }
    }
    
    /**
     * 删除订单
     * 
     * @param so 订单实体
     */
    public void delete(ShoppingOrder so)
    {
        if (null != so)
        {
            repository.delete(so);
        }
    }
    
    /**
     * 查找下单时间在date之后的指定用户的订单
     * 
     * @param username 用户名
     * @param date 下单时间
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向 asc:升序 desc:降序
     * @param property 排序的字段名
     * @return 相应的订单页面
     */
    public Page<ShoppingOrder> findByUsernameAndOrderTimeAfter(String username, 
                                                               Date date,
                                                               int page,
                                                               int size,
                                                               String direction,
                                                               String property)
    {
        Page<ShoppingOrder> orderPage = null;
        PageRequest pageRequest = null;
        
        if (null == username)
        {
            return null;
        }
        
        if (page < 0 || size < 0)
        {
            return null;
        }
        
        if (null == direction || null == property)
        {
            pageRequest = new PageRequest(page, size);
        }
        else
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, 
                                 property);
            pageRequest = new PageRequest(page, size, sort);
        }
        
        orderPage = repository.findByUsernameAndOrderTimeAfter(username, date, pageRequest);
        
        return orderPage;
    }
    
    /**
     * 查找下单时间在date之后的相应状态的用户订单
     * 
     * @param username 用户名
     * @param statusCode 订单状态编码，为NULL时查找所有订单
     * @param date 下单时间
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向 asc:升序 desc:降序
     * @param property 排序的字段名
     * @return 相应的订单页面
     */
    public Page<ShoppingOrder> findByUsernameAndStatusAndOrderTimeAfter(String username,
                                                               Long statusCode,
                                                               Date date,
                                                               int page,
                                                               int size,
                                                               String direction,
                                                               String property)
    {
        Page<ShoppingOrder> orderPage = null;
        PageRequest pageRequest = null;
        
        if (null == username)
        {
            return null;
        }
        
        if (page < 0 || size < 0)
        {
            return null;
        }
        
        if (null == direction || null == property)
        {
            pageRequest = new PageRequest(page, size);
        }
        else
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, 
                                 property);
            pageRequest = new PageRequest(page, size, sort);
        }
        
        if (null == statusCode)
        {
            orderPage = repository.findByUsernameAndOrderTimeAfter(username, date, pageRequest);
        }
        else
        {
            orderPage = repository.findByUsernameAndStatusCodeAndOrderTimeAfter(username, statusCode, date, pageRequest);
        }
        
        return orderPage;
    }
    
    /**
     * 查找指定个月之内的订单
     * 
     * @param username 用户名
     * @param month 指定几个月内的订单，取值为[1~12]，例如：该值为1时，表示获取距今一个月以内的订单
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向 asc:升序 desc:降序
     * @param property 排序的字段名
     * @return 相应的订单页面
     */
    public Page<ShoppingOrder> findByUsernameInMonth(String username, 
                                                    int month,
                                                    int page,
                                                    int size,
                                                    String direction,
                                                    String property)
    {
        Page<ShoppingOrder> orderPage = null;
        PageRequest pageRequest = null;

        if (null == username) {
            return null;
        }
        
        if (month < 1 || month > 12)
        {
            return null;
        }

        if (page < 0 || size < 0) {
            return null;
        }

        if (null == direction || null == property) {
            pageRequest = new PageRequest(page, size);
        } else {
            Sort sort = new Sort(
                    direction.equalsIgnoreCase("asc") ? Direction.ASC
                            : Direction.DESC, property);
            pageRequest = new PageRequest(page, size, sort);
        }
        
        Date current = new Date();

        Calendar calendar = Calendar.getInstance();//日历对象
        calendar.setTime(current);              //设置当前日期
        calendar.add(Calendar.MONTH, 0 - month); //月份减

        orderPage = repository.findByUsernameAndOrderTimeAfter(username, calendar.getTime(),
                pageRequest);

        return orderPage;
    }
    
    /**
     * 查找指定个月之内相应状态的订单
     * 
     * @param username 用户名
     * @param statusCode 订单状态编码，为NULL时查找所有订单
     * @param month 指定几个月内的订单，取值为[1~12]，例如：该值为1时，表示获取距今一个月以内的订单
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向 asc:升序 desc:降序
     * @param property 排序的字段名
     * @return 相应的订单页面
     */
    public Page<ShoppingOrder> findByUsernameAndStatusAndInMonth(String username, 
                                                    Long statusCode,
                                                    int month,
                                                    int page,
                                                    int size,
                                                    String direction,
                                                    String property)
    {
        Page<ShoppingOrder> orderPage = null;
        PageRequest pageRequest = null;

        if (null == username) {
            return null;
        }
        
        if (month < 1 || month > 12)
        {
            return null;
        }

        if (page < 0 || size < 0) {
            return null;
        }

        if (null == direction || null == property) {
            pageRequest = new PageRequest(page, size);
        } else {
            Sort sort = new Sort(
                    direction.equalsIgnoreCase("asc") ? Direction.ASC
                            : Direction.DESC, property);
            pageRequest = new PageRequest(page, size, sort);
        }
        
        Date current = new Date();

        Calendar calendar = Calendar.getInstance();//日历对象
        calendar.setTime(current);              //设置当前日期
        calendar.add(Calendar.MONTH, 0 - month); //月份减

        if (null == statusCode)
        {
            orderPage = repository.findByUsernameAndOrderTimeAfter(username, calendar.getTime(), pageRequest);
        }
        else
        {
            orderPage = repository.findByUsernameAndStatusCodeAndOrderTimeAfter(username, statusCode, calendar.getTime(), pageRequest);
        }

        return orderPage;
    }
    
    /**
     * 保存订单
     * 
     * @param username 用户名
     * @param productList 订单商品列表
     * @param shippingAddress 收货地址
     * @param receiverName 收货人
     * @param receiverPhone 收货电话
     * @param paymentType 支付方式
     * @param invoiceTitle 发票抬头
     * 
     * @return map.code 0:成功 1:失败
     *         map.message 失败时的错误信息
     *         map.data 成功时将返回保存后的订单
     */
    public Map<String, Object> save(String username,
                                    List<OrderItem> productList,
                                    String shippingAddress,
                                    String receiverName,
                                    String receiverPhone,
                                    String paymentType,
                                    String invoiceTitle)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        
        if (null == username || "".equals(username))
        {
            map.put("message", "用户名不能为空");
            return map;
        }
        
        if (null == productList || productList.size() < 1)
        {
            map.put("message", "订单商品列表不能为空");
            return map;
        }
        
        ShoppingOrder order = new ShoppingOrder();

        // 订单号
        DateFormat format = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        order.setOrderNumber(format.format(new Date()) + (int)(Math.random() * 100));
        
        // 收货地址
        order.setShippingAddress(shippingAddress);
        
        // 收货人
        order.setShippingName(receiverName);
        
        // 收货电话
        order.setShippingPhone(receiverPhone);
        
        // 支付方式
        order.setPaymentType(paymentType);
        
        // 发票抬头
        order.setInvoiceTitle(invoiceTitle);
        
        // 下单时间
        order.setOrderTime(new Date());
        
        // 订单状态
        order.setStatusCode(0L);
        
        // 用户名
        order.setUsername(username);
        
        // 保存订单商品列表
        order.setOrderItemList(productList);
        
        Double totalPrice = 0.0;
        
        if (null != productList)
        {
            for (OrderItem item : productList)
            {
                totalPrice += item.getQuantity() * item.getPrice();
                
                // 保存订单商品项
                orderItemService.save(item);
            }
        }
        
        // 订单总额
        order.setTotalPrice(totalPrice);
        
        // 保存订单
        order = repository.save(order);
        
        map.put("code", 0);
        map.put("data", order);
        
        return map;
    }
}
