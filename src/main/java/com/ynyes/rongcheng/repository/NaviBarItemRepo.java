package com.ynyes.rongcheng.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.NaviBarItem;

/**
 * NaviBarItem 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface NaviBarItemRepo extends
		PagingAndSortingRepository<NaviBarItem, Long>,
		JpaSpecificationExecutor<NaviBarItem> 
{
    // 查找前台显示的导航栏
    List<NaviBarItem> findByIsShowTrue();
    Page<NaviBarItem> findByIsShowTrue(Pageable page);
}
