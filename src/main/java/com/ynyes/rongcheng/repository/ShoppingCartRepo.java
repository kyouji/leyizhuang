package com.ynyes.rongcheng.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.ShoppingCart;

/**
 * ShoppingCart 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface ShoppingCartRepo extends
		PagingAndSortingRepository<ShoppingCart, Long>,
		JpaSpecificationExecutor<ShoppingCart> 
{
    // 通过用户名查找
    List<ShoppingCart> findByUsername(String username);
    
    // 通过用户名和ID查找
    ShoppingCart findByUsernameAndId(String username, Long id);
}
