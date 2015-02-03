package com.ynyes.rongcheng.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.rongcheng.entity.User;

/**
 * User 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface UserRepo extends
		PagingAndSortingRepository<User, Long>,
		JpaSpecificationExecutor<User> 
{
    // 通过用户名查找
    User findByUsername(String username);
    User findByUsernameAndRoleAndIsEnableTrue(String username, String role);
}
