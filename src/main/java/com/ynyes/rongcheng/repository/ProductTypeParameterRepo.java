package com.ynyes.rongcheng.repository;

import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.ProductTypeParameter;

/**
 * ProductTypeParameter 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface ProductTypeParameterRepo extends
		PagingAndSortingRepository<ProductTypeParameter, Long>,
		JpaSpecificationExecutor<ProductTypeParameter> 
{
    List<ProductTypeParameter> findByIdIn(Collection<Long> ids);
}
