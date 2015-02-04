package com.ynyes.rongcheng.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    
    /**
     * 根据用户名及状态查找订单，并分页
     * 
     * @param username 用户名
     * @param statusCode 状态码 0:待付款 1:待收货 2:待评价 3:已完成 4:已关闭 5: 已取消
     * @param page 页号
     * @param size 每页大小
     * @param direction 排序方向 asc:升序 desc:降序
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
 
}
