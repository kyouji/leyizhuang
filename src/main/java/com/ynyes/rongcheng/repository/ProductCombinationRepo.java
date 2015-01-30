package com.ynyes.rongcheng.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.ProductCombination;

/**
 * ProductCombination 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface ProductCombinationRepo extends
		PagingAndSortingRepository<ProductCombination, Long>,
		JpaSpecificationExecutor<ProductCombination> 
{
}
