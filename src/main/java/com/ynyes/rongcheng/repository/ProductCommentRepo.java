package com.ynyes.rongcheng.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.ProductComment;

/**
 * ProductComment 实体数据库操作接口
 * 
 * @author Sharon
 */

public interface ProductCommentRepo extends
		PagingAndSortingRepository<ProductComment, Long>,
		JpaSpecificationExecutor<ProductComment> 
{
    // 通过评论的商品ID和版本ID查找
    Page<ProductComment> findByPidAndVid(Long pid, Long vid, Pageable page);
    List<ProductComment> findByPidAndVid(Long pid, Long vid);
}
