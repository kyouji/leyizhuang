package com.ynyes.huizi.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.huizi.entity.TdGoodsParameter;

/**
 * TdArticle 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface TdGoodsParameterRepo extends
		PagingAndSortingRepository<TdGoodsParameter, Long>,
		JpaSpecificationExecutor<TdGoodsParameter> 
{
    
}
