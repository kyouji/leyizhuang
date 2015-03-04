package com.ynyes.rongcheng.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
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
    @Query(value = "select distinct product_id from product_version where product_id in ?1 order by sold_number desc", nativeQuery = true)
    List<BigInteger> findProductIdOrderBySoldNumberDesc(List<Long> idList);
    
//    @Query("select distinct t.productId from ProductVersion t where t.productId in ?1 order by t.soldNumber desc")
//    Page<Long> findProductIdOrderBySoldNumberDesc(List<Long> idList, Pageable page);
}