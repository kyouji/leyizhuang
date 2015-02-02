package com.ynyes.rongcheng.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ynyes.rongcheng.entity.User;
import com.ynyes.rongcheng.repository.UserRepo;

/**
 * 
 * 用户
 * UserService<BR>
 * 创建人:guozhengyang <BR>
 * 时间：2015年1月30日-下午9:55:22 <BR>
 * @version 1.0.0
 *
 */
@Service
public class UserService {
    @Autowired
    private UserRepo userRepo;
    /**
     * 
     * 根据用户名，密码，角色查询，有数据返回true<BR>
     * 方法名：findByUsernameAndPasswordAndRoleAndIsEnableTrue<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月30日-下午9:59:08 <BR>
     * @param username
     * @param password
     * @param role
     * @return Boolean<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    public User findByUsernameAndPasswordAndRoleAndIsEnableTrue(String username,String password,String role){
       User user= userRepo.findByUsernameAndPasswordAndRoleAndIsEnableTrue(username, password, role);
    return user;
    
    }
    /**
     * 
     * 根据用户名，角色查询<BR>
     * 方法名：findByUsername<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月2日-下午2:16:43 <BR>
     * @param username
     * @param role
     * @return User<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    public User findByUsername(String username,String role){
       return  userRepo.findByUsernameAndRoleAndIsEnableTrue(username, role);
    }
    /**
     * 
     *   保存用户<BR>
     * 方法名：saveUser<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月2日-下午1:36:03 <BR>
     * @param user void<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    public void saveUser(User user){
        userRepo.save(user);
    }
}
