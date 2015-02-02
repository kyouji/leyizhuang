package com.ynyes.rongcheng.repository;

import java.util.Collection;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.Parameter;

/**
 * Parameter 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface ParameterRepo extends
		PagingAndSortingRepository<Parameter, Long>,
		JpaSpecificationExecutor<Parameter> 
{
    // 通过类型查找
    Page<Parameter> findByType(String type, Pageable page);
    List<Parameter> findByType(String type);
    
    // 查找参数类型列表
    @Query("select distinct p.type from Parameter p")
    List<String> findTypes();
    
    // 通过ID查找
    List<Parameter> findByIdIn(Collection<Long> ids);
    List<Parameter> findByIdIn(Collection<Long> ids, Sort sort);
    
    // 通过ID查找可检索的参数列表
    List<Parameter> findByIdInAndIsSearchableTrue(Collection<Long> ids);
}
