package com.ynyes.rongcheng.service;



import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.User;
import com.ynyes.rongcheng.repository.UserRepo;
import com.ynyes.rongcheng.util.MD5;

/**
 * 品牌服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class UserService {
    @Autowired
    UserRepo repository;
    
    /**
     * 添加用户
     * 
     * @param username 用户名
     * @param password 密码
     * @param mobile 移动电话
     * @return 成功后返回新用户，否则返回NULL
     */
    public User add(String username, String password, String mobile)
    {
        if (null == username || "".equals(username)
            || null == password || "".equals(password))
        {
            return null;
        }
        
        if (null != repository.findByUsername(username))
        {
            return null;
        }

        User user = new User();
 
        user.setUsername(username);
        
        user.setPassword(MD5.md5(password, 32));
        
        user.setMobile(mobile);
        
        user.setRole("USER");
        
        user.setRegisterTime(new Date());
        
        user.setIsEnable(true);
        
        return repository.save(user);
    }
    
    /**
     * 通过用户名查找用户
     * 
     * @param username 用户名
     * @return 找到的用户，未找到时返回NULL
     */
    public User findByUsername(String username)
    {
        return repository.findByUsername(username);
    }
    
    /**
     * 登录判断
     * 
     * @param username 用户名
     * @param md5Password 密码的MD5值
     * @return res.code 0：成功   1：失败
     *         res.message 失败时的具体信息
     */
    public Map<String, Object> loginCheck(String username, String md5Password)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        
        User user = repository.findByUsername(username);
        
        if (null == user)
        {
            map.put("message", "该用户不存在");
            return map;
        }
        
        if (null == user.getIsEnable() || false == user.getIsEnable())
        {
            map.put("message", "已禁用该用户");
            return map;
        }
        
        if ("USER".equalsIgnoreCase(user.getRole()))
        {
            map.put("message", "用户无访问权限");
            return map;
        }
        
        if (!user.getPassword().equals(md5Password))
        {
            map.put("message", "密码错误");
            return map;
        }
        
        map.put("code", 0);
        
        return map;

    }
    
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
//    public User findByUsernameAndPasswordAndRoleAndIsEnableTrue(String username,String password,String role){
//       User user= repository.findByUsernameAndPasswordAndRoleAndIsEnableTrue(username, password, role);
//    return user;
//    
//    }
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
       return  repository.findByUsernameAndRoleAndIsEnableTrue(username, role);
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
        repository.save(user);
    }
    /**
     * 
     * 修改<BR>
     * 方法名：updateUser<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月3日-上午9:16:35 <BR>
     * @param user
     * @param id void<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    public User updateUser(User user){
       return repository.save(user);
    }
    
}
