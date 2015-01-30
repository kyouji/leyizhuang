package com.ynyes.rongcheng.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.SiteInfoType;

/**
 * SiteInfoType 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface SiteInfoTypeRepo extends
		PagingAndSortingRepository<SiteInfoType, Long>,
		JpaSpecificationExecutor<SiteInfoType> 
{
    // 查找根类型
    Page<SiteInfoType> findByParentIsNullAndIsShowTrue(Pageable page);
    List<SiteInfoType> findByParentIsNullAndIsShowTrue();
    
    // 通过父类型
    Page<SiteInfoType> findByParentAndIsShowTrue(String parent, Pageable page);
    List<SiteInfoType> findByParentAndIsShowTrue(String parent);
}
