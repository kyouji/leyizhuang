package com.ynyes.rongcheng.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.AdvertisementType;

/**
 * AdvertisementType 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface AdvertisementTypeRepo extends
		PagingAndSortingRepository<AdvertisementType, Long>,
		JpaSpecificationExecutor<AdvertisementType> 
{
    AdvertisementType findByName(String name);
}
