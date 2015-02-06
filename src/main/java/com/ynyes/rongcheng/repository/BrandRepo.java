package com.ynyes.rongcheng.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.Brand;

/**
 * Brand 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface BrandRepo extends
		PagingAndSortingRepository<Brand, Long>,
		JpaSpecificationExecutor<Brand> 
{
    // 通过类型查找品牌
    Page<Brand> findByTypeContaining(String type, Pageable page);
    List<Brand> findByTypeContaining(String type);
    
    // 通过类型查找推荐的品牌
    Page<Brand> findByTypeContainingAndIsRecommendTrue(String type, Pageable page);
    List<Brand> findByTypeContainingAndIsRecommendTrue(String type);
    
    // 通过名称查找
    Brand findByName(String name);
}
