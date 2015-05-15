package com.ynyes.rongcheng.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.TdPriceChangeLog;

/**
 * TdPriceChangeLog 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface TdPriceChangeLogRepo extends
		PagingAndSortingRepository<TdPriceChangeLog, Long>,
		JpaSpecificationExecutor<TdPriceChangeLog> 
{
    TdPriceChangeLog findTopByGoodsIdOrderByIdDesc(Long goodsId);
}
