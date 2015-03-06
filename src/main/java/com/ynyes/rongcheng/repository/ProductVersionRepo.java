package com.ynyes.rongcheng.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.ProductVersion;

/**
 * ProductVersion 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface ProductVersionRepo extends
		PagingAndSortingRepository<ProductVersion, Long>,
		JpaSpecificationExecutor<ProductVersion> 
{
//    @Query(value = "select distinct product_id from product_version where product_id in ?1 order by sold_number desc", nativeQuery = true)
//    List<BigInteger> findProductIdOrderBySoldNumberDesc(List<Long> idList);
}