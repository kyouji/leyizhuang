package com.ynyes.rongcheng.repository;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.Product;

/**
 * Product 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface ProductRepo extends
		PagingAndSortingRepository<Product, Long>,
		JpaSpecificationExecutor<Product> 
{
    /*
     * 查找所有商品
     */
    
    // 通过ID查找
    Page<Product> findByIdIn(Collection<Long> ids, Pageable page);
    List<Product> findByIdIn(Collection<Long> ids);
    
    // 通过ID查找上架商品
    Page<Product> findByIsOnSaleTrueAndIdIn(Collection<Long> ids, Pageable page);
    List<Product> findByIsOnSaleTrueAndIdIn(Collection<Long> ids);
    
    /*
     * 查找上线的商品
     */
    
    // 通过ID查找
    Page<Product> findByIdInAndIsOnSaleTrue(Collection<Long> ids, Pageable page);
    List<Product> findByIdInAndIsOnSaleTrue(Collection<Long> ids);
    
    // 通过类型查找
    Page<Product> findByTypeAllLikeAndIsOnSaleTrue(String type, Pageable page);
    List<Product> findByTypeAllLikeAndIsOnSaleTrue(String type);

    // 查找限时抢购商品
    Page<Product> findByIsOnSaleTrueAndIsFlashSaleTrueAndFlashSaleStopTimeAfterOrderByFlashSaleStartTimeDesc(Date now, Pageable page);
    List<Product> findByIsOnSaleTrueAndIsFlashSaleTrueAndFlashSaleStopTimeAfterOrderByFlashSaleStartTimeDesc(Date now);
    Page<Product> findByIsOnSaleTrueAndIsFlashSaleTrueAndFlashSaleStopTimeAfter(Date now, Pageable page);
    List<Product> findByIsOnSaleTrueAndIsFlashSaleTrueAndFlashSaleStopTimeAfter(Date now);
    
    // 查找明星产品
    Page<Product> findByIsOnSaleTrueAndIsStarProductTrue(Pageable page);
    List<Product> findByIsOnSaleTrueAndIsStarProductTrue();

}
