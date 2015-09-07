package com.ynyes.zphk.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.zphk.entity.TdNaviBarItem;

/**
 * TdNaviBarItem 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface TdNaviBarItemRepo extends
		PagingAndSortingRepository<TdNaviBarItem, Long>,
		JpaSpecificationExecutor<TdNaviBarItem> 
{
	//修改：使其不能查找到支持触屏的
    List<TdNaviBarItem> findByIsEnableTrueAndIsTouchFalseOrderBySortIdAsc();
    
    //查找可用且支持触屏的naviBarItem——by dengxiao
    List<TdNaviBarItem> findByIsEnableTrueAndIsTouchTrueOrderBySortIdAsc();
}
