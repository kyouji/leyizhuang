package com.ynyes.rongcheng.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.ShippingAddress;

/**
 * ShippingAddress 收货地址 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface ShippingAddressRepo extends
		PagingAndSortingRepository<ShippingAddress, Long>,
		JpaSpecificationExecutor<ShippingAddress> 
{
    
}
