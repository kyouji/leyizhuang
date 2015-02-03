package com.ynyes.rongcheng.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.UserPoint;

/**
 * UserPoint 用户积分实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface UserPointRepo extends
		PagingAndSortingRepository<UserPoint, Long>,
		JpaSpecificationExecutor<UserPoint> 
{
 
}
