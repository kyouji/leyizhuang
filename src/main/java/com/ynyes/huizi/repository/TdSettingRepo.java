package com.ynyes.huizi.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.huizi.entity.TdSetting;

/**
 * TdSetting 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface TdSettingRepo extends
		PagingAndSortingRepository<TdSetting, Long>,
		JpaSpecificationExecutor<TdSetting> 
{
    TdSetting findTopBy();
}
