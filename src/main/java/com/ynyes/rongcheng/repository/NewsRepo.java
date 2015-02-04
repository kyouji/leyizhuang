package com.ynyes.rongcheng.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.News;

/**
 * News 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface NewsRepo extends
		PagingAndSortingRepository<News, Long>,
		JpaSpecificationExecutor<News> 
{
    // 按类型查找
    Page<News> findByTypeAndIsShowTrue(String type, Pageable page);
}
