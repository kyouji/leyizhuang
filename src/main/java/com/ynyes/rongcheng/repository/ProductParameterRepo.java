package com.ynyes.rongcheng.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.ProductParameter;

/**
 * ProductParameter 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface ProductParameterRepo extends
		PagingAndSortingRepository<ProductParameter, Long>,
		JpaSpecificationExecutor<ProductParameter> 
{
}
