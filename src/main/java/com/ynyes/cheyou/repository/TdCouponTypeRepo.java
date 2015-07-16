package com.ynyes.cheyou.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.cheyou.entity.TdCouponType;

/**
 * TdCouponType 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface TdCouponTypeRepo extends
		PagingAndSortingRepository<TdCouponType, Long>,
		JpaSpecificationExecutor<TdCouponType> 
{
    Page<TdCouponType> findByTitleContainingOrderBySortIdAsc(String keywords, Pageable page);
}
