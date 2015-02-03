package com.ynyes.rongcheng.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    UserPointRepo userPointRepo;
    
    
    
}
