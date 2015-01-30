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
    // 通过资讯的商品ID查找
    Page<ProductConsult> findByPidOrderByConsultTimeDesc(Long pid, Pageable page);
    List<ProductConsult> findByPidOrderByConsultTimeDesc(Long pid);
}
