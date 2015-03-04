package com.ynyes.rongcheng.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.Advertisement;

/**
 * Advertisement 实体数据库操作接口
 * 
 * @author Sharon
 *
 */
public interface AdvertisementRepo extends
		PagingAndSortingRepository<Advertisement, Long>,
		JpaSpecificationExecutor<Advertisement> 
{
    // 通过类型查找
    Page<Advertisement> findByTypeContainingAndIsShowTrue(String type, Pageable page);
    List<Advertisement> findByTypeContainingAndIsShowTrue(String type);
}
