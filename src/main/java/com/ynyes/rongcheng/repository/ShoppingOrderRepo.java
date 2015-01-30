package com.ynyes.rongcheng.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.ShoppingOrder;

/**
 * ShoppingOrder 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface ShoppingOrderRepo extends
		PagingAndSortingRepository<ShoppingOrder, Long>,
		JpaSpecificationExecutor<ShoppingOrder> 
{
    // 通过用户名查找
    Page<ShoppingOrder> findByUsername(String username, Pageable page);
    List<ShoppingOrder> findByUsername(String username);
    
    // 通过用户名和订单状态查找
    Page<ShoppingOrder> findByUsernameAndStatusCode(String username, Long statusCode, Pageable page);
    List<ShoppingOrder> findByUsernameAndStatusCode(String username, Long statusCode);
    
    // 通过订单号查找
    ShoppingOrder findByOrderNumber(String orderNumber);
}
