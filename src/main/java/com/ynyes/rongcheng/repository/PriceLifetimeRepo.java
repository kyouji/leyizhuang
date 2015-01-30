package com.ynyes.rongcheng.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.PriceLifetime;

/**
 * PriceLifetime 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface PriceLifetimeRepo extends
		PagingAndSortingRepository<PriceLifetime, Long>,
		JpaSpecificationExecutor<PriceLifetime> 
{
    // 通过pid, vid查找
    Page<PriceLifetime> findByPidAndVidOrderByStartTimeDesc(Long pid, Long vid, Pageable page);
    List<PriceLifetime> findByPidAndVidOrderByStartTimeDesc(Long pid, Long vid);
}
