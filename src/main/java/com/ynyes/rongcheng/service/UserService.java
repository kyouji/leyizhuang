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
     * @return 成功后返回新用户，否则返回NULL
     */
    public User add(String username, String password)
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
}
