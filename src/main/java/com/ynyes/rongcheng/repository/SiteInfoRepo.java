package com.ynyes.rongcheng.repository;

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
    SiteInfo findByTypeAndIsShowTrue(String type);
}
