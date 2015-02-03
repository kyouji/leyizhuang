package com.ynyes.rongcheng.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.UserPoint;
import com.ynyes.rongcheng.repository.UserPointRepo;

/**
 * 用户积分服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class UserPointService {
    @Autowired
    UserPointRepo repository;
    
    /**
     * 保存用户积分
     * 
     * @param up 用户积分
     * @return 保存的用户积分
     */
    public UserPoint save(UserPoint up)
    {
        if (null == up)
        {
            return null;
        }
        
        return repository.save(up);
    }
  
 
    /**
     * 获取用户积分
     * 
     * @param id 用户积分ID
     * @return 获取到的用户积分
     */
    public UserPoint findOne(Long id)
    {
        UserPoint up = null;
        
        if (null != id)
        {
            up = repository.findOne(id);
        }
        
        return up;
    }
    
    /**
     * 删除用户积分
     * 
     * @param id 用户积分ID
     */
    public void delete(Long id)
    {
        if (null != id)
        {
            repository.delete(id);
        }
    }
    
    /**
     * 删除用户积分
     * 
     * @param up 用户积分实体
     */
    public void delete(UserPoint up)
    {
        if (null != up)
        {
            repository.delete(up);
        }
    }
    
}
