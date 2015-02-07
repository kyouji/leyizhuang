package com.ynyes.rongcheng.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.ProductConsult;

/**
 * ProductConsult 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface ProductConsultRepo extends
		PagingAndSortingRepository<ProductConsult, Long>,
		JpaSpecificationExecutor<ProductConsult> 
{
    // 通过咨询的商品ID及版本ID查找
    Page<ProductConsult> findByPidAndVid(Long pid, Long vid, Pageable page);
    List<ProductConsult> findByPidAndVid(Long pid, Long vid);
}