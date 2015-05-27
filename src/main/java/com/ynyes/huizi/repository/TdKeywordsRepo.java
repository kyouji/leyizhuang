package com.ynyes.huizi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.huizi.entity.TdKeywords;

/**
 * TdKeywords 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface TdKeywordsRepo extends
		PagingAndSortingRepository<TdKeywords, Long>,
		JpaSpecificationExecutor<TdKeywords> 
{
    List<TdKeywords> findByIsEnableTrueOrderBySortIdAsc();
    
    TdKeywords findTopByTitleIgnoreCase(String title);
}
