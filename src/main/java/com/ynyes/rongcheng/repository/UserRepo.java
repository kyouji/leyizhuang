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
   /**
    * 
    * 通过用户名，密码，角色查询，用于登录<BR>
    * 方法名：findByUsernameAndPasswordAndRoleAndIsEnableTrue<BR>
    * 创建人：guozhengyang <BR>
    * 时间：2015年1月30日-下午9:53:50 <BR>
    * @param username
    * @param password
    * @param role
    * @return User<BR>
    * @param  [参数1]   [参数1说明]
    * @param  [参数2]   [参数2说明]
    * @exception <BR>
    * @since  1.0.0
    */
    User findByUsernameAndPasswordAndRoleAndIsEnableTrue(String username, String password,String role);
}
