package com.ynyes.rongcheng.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.ProductType;

/**
 * ProductType 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface ProductTypeRepo extends
		PagingAndSortingRepository<ProductType, Long>,
		JpaSpecificationExecutor<ProductType> 
{
    // 查找根类型
    Page<ProductType> findByParentIsNull(Pageable page);
    List<ProductType> findByParentIsNull();
    
    // 查找推荐类型
    Page<ProductType> findByIsRecommendTrue(Pageable page);
    List<ProductType> findByIsRecommendTrue();
    
    // 通过父类型查找子类型
    Page<ProductType> findByParent(String parent, Pageable page);
    List<ProductType> findByParent(String parent);
    
    // 通过名称查找
    ProductType findByName(String name);
}
