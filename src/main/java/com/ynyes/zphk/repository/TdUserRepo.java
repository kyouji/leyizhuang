package com.ynyes.zphk.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.zphk.entity.TdUser;

/**
 * TdUser 实体数据库操作接口
 * 
 * @author Sharon
 *
 */

public interface TdUserRepo extends
		PagingAndSortingRepository<TdUser, Long>,
		JpaSpecificationExecutor<TdUser> 
{
    // 根据角色查找
    Page<TdUser> findByRoleIdOrderByIdDesc(Long roleId, Pageable page);
    
    Page<TdUser> findByUsernameContainingOrMobileContainingOrEmailContainingOrderByIdDesc(String keywords1, String keywords2, String keywords3, Pageable page);
    
    Page<TdUser> findByUsernameContainingAndRoleIdOrMobileContainingAndRoleIdOrEmailContainingAndRoleIdOrderByIdDesc(String keywords1, 
                                                                Long roleId1,
                                                                String keywords2,
                                                                Long roleId2,
                                                                String keyword3,
                                                                Long roleId3,
                                                                Pageable page);
    
    TdUser findByUsernameAndStatusIdOrUsernameAndStatusId(String username, Long statusId, String username1, Long statusId1);
    
    TdUser findByUsername(String username);
    
    TdUser findByUsernameAndIdNot(String username, Long id);
    
    Page<TdUser> findByUpperUsernameAndStatusIdOrderByIdDesc(String upperUsername, Long statusId, Pageable page);
    
    /**
     * 通过手机号码查找到用户的方法
     * @author dengxiao
     */
    TdUser findByMobile(String mobile);
    
    /**
     * 通过邮箱查找用户的方法
     * @author dengxiao
     */
    TdUser findByEmail(String email);
    
    /**
     * 通过支付宝用户号查找用户的方法
     * @author dengxiao
     */
    TdUser findByAlipayUserId(String alipayUserId);
    
    /**
     * 通过QQ用户号查找用户
     * @author dengxiao
     */
    TdUser findByQqUserId(String qqUserId);
}
