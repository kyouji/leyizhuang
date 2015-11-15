package com.ynyes.zphk.repository;

import java.util.Date;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.zphk.entity.TdOrder;

/**
 * TdOrder 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface TdOrderRepo extends
		PagingAndSortingRepository<TdOrder, Long>,
		JpaSpecificationExecutor<TdOrder> 
{
    Page<TdOrder> findByStatusIdOrderByIdDesc(Long statusId, Pageable page);
    
    Page<TdOrder> findByUsernameOrderByIdDesc(String username, Pageable page);
    
    Page<TdOrder> findByUsernameAndOrderTimeAfterOrderByIdDesc(String username, Date time, Pageable page);
    
    Page<TdOrder> findByUsernameAndOrderTimeAfterAndOrderNumberContainingOrderByIdDesc(String username, Date time, String keywords, Pageable page);
    
    Page<TdOrder> findByUsernameAndOrderNumberContainingOrderByIdDesc(String username, String keywords, Pageable page);
    
    Page<TdOrder> findByUsernameAndStatusIdOrderByIdDesc(String username, Long statusId, Pageable page);
    
    Page<TdOrder> findByUsernameAndStatusIdAndOrderNumberContainingOrderByIdDesc(String username, Long statusId, String keywords, Pageable page);
    
    Page<TdOrder> findByUsernameAndStatusIdAndOrderTimeAfterOrderByIdDesc(String username, Long statusId, Date time, Pageable page);
    
    Page<TdOrder> findByUsernameAndStatusIdAndOrderTimeAfterAndOrderNumberContainingOrderByIdDesc(String username, Long statusId, Date time, String keywords, Pageable page);
    
    Long countByUsernameAndStatusId(String username, Long statusId);
    
    TdOrder findByOrderNumber(String orderNumber);
    
    Page<TdOrder> findByUsernameAndStatusIdAndOrderTimeBetweenOrderByOrderTimeDesc(String username,Long statusId,Date begin,Date finish,Pageable page);
    
    Page<TdOrder> findByUsernameAndOrderTimeBetweenOrderByOrderTimeDesc(String username,Date begin,Date finish,Pageable page);
    
    Page<TdOrder> findByUsernameAndStatusIdAndOrderTimeBetweenAndOrderNumberContainingOrderByOrderTimeDesc(String username,Long statusId,Date begin,Date finish,String keywords,Pageable page);
    
    Page<TdOrder> findByUsernameAndOrderTimeBetweenAndOrderNumberContainingOrderByOrderTimeDesc(String username,Date begin,Date finish,String keywords,Pageable page);
}
