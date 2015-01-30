package com.ynyes.rongcheng.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.SiteInfo;

/**
 * SiteInfo 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface SiteInfoRepo extends
		PagingAndSortingRepository<SiteInfo, Long>,
		JpaSpecificationExecutor<SiteInfo> 
{
    // 通过类型查找
    Page<SiteInfo> findByTypeAndIsShowTrue(String type, Pageable page);
    List<SiteInfo> findByTypeAndIsShowTrue(String type);
}
