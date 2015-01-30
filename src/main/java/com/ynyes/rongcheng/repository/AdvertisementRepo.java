package com.ynyes.rongcheng.repository;

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
}
