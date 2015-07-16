package com.ynyes.cheyou.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.cheyou.entity.TdShippingAddress;

/**
 * TdShippingAddress 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface TdShippingAddressRepo extends
		PagingAndSortingRepository<TdShippingAddress, Long>,
		JpaSpecificationExecutor<TdShippingAddress> 
{
}
