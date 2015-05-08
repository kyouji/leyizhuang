package com.ynyes.rongcheng.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.TdSetting;
import com.ynyes.rongcheng.entity.TdUser;
import com.ynyes.rongcheng.entity.TdUserLevel;
import com.ynyes.rongcheng.entity.TdUserPoint;
import com.ynyes.rongcheng.repository.TdUserRepo;

/**
 * TdUser 服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class TdUserService {
    @Autowired
    TdUserRepo repository;
    
    @Autowired
    TdUserPointService tdUserPointService;
    
    @Autowired
    TdUserCollectService tdUserCollectService;
    
    @Autowired
    TdUserRecentVisitService tdUserRecentVisitService;
    
    @Autowired
    TdUserCashRewardService tdUserCashRewardService;
    
    @Autowired
    TdUserConsultService tdUserConsultService;
    
    @Autowired
    TdUserCommentService tdUserCommentService;
    
    @Autowired
    TdUserReturnService tdUserReturnService;
    
    @Autowired
    TdUserLevelService tdUserLevelService;
    
    @Autowired
    TdSettingService tdSettingService;
    
    /**
     * 删除用户数据
     * @param username
     */
    private void userDataDelete(String username)
    {
        if (null == username)
        {
            return;
        }
        
        tdUserPointService.delete(tdUserPointService.findByUsername(username));
        
        tdUserCollectService.delete(tdUserCollectService.findByUsername(username));
        
        tdUserRecentVisitService.delete(tdUserRecentVisitService.findByUsername(username));
        
        tdUserCashRewardService.delete(tdUserCashRewardService.findByUsername(username));
        
        tdUserConsultService.delete(tdUserConsultService.findByUsername(username));
        
        tdUserCommentService.delete(tdUserCommentService.findByUsername(username));
        
        tdUserReturnService.delete(tdUserReturnService.findByUsername(username));
    }
    
    public TdUser addNewUser(String upperUsername, String username, String password, String mobile, String email)
    {
        if (null == username || null == password || username.isEmpty() || password.isEmpty())
        {
            return null;
        }
        
        if (null != repository.findByUsername(username))
        {
            return null;
        }
        
        TdUser user = new TdUser();
        
        user.setUsername(username);
        user.setPassword(password);
        user.setMobile(mobile);
        user.setEmail(email);
        user.setRegisterTime(new Date());
        user.setLastLoginTime(new Date());
        user.setStatusId(0L); // 待审核
        user.setRoleId(0L); // 普通用户
        
        user.setTotalCashRewards(0L);
        user.setTotalCollectedGoods(0L);
        user.setTotalComments(0L);
        user.setTotalConsults(0L);
        user.setTotalLowerUsers(0L);
        user.setTotalRecentVisited(0L);
        user.setTotalReturns(0L);
        user.setTotalSpendCash(0.0);
        
        TdSetting setting = tdSettingService.findTopBy();
        
        TdUserPoint userPoint = new TdUserPoint();
        
        if (null != setting)
        {
            userPoint.setPoint(setting.getRegisterSuccessPoints());
        }
        else
        {
            userPoint.setPoint(0L);
        }
        
        userPoint.setTotalPoint(userPoint.getPoint());
        userPoint.setUsername(username);
        userPoint.setDetail("用户注册成功奖励");
        
        userPoint = tdUserPointService.save(userPoint);
        
        user.setTotalPoints(userPoint.getTotalPoint()); // 积分
        
        user.setUpperUsername(upperUsername);
        
        TdUserLevel level = tdUserLevelService.findByLevelIdAndIsEnableTrue(1L);
        
        if (null != level)
        {
            user.setUserLevelId(level.getId());
            user.setUserLevelTitle(level.getTitle());
        }
        
        return user;
    }
    
    /**
     * 删除
     * 
     * @param id 菜单项ID
     */
    public void delete(Long id)
    {
        if (null != id)
        {
            TdUser user = repository.findOne(id);
            
            if (null != user)
            {
                userDataDelete(user.getUsername());
            }
            
            repository.delete(id);
        }
    }
    
    /**
     * 删除
     * 
     * @param e 菜单项
     */
    public void delete(TdUser e)
    {
        if (null != e)
        {
            userDataDelete(e.getUsername());
            repository.delete(e);
        }
    }
    
    /**
     * 查找
     * 
     * @param id ID
     * @return
     */
    public TdUser findOne(Long id)
    {
        if (null == id)
        {
            return null;
        }
        
        return repository.findOne(id);
    }
    
    public TdUser findByUsernameAndIsEnabled(String username)
    {
        if (null == username)
        {
            return null;
        }
        
        return repository.findByUsernameAndStatusIdOrUsernameAndStatusId(username, 0L, username, 1L);
    }
    
    public TdUser findByUsername(String username)
    {
        if (null == username)
        {
            return null;
        }
        
        return repository.findByUsername(username);
    }
    
    public TdUser findByUsernameAndIdNot(String username, Long id)
    {
        if (null == username || null == id)
        {
            return null;
        }
        
        return repository.findByUsernameAndIdNot(username, id);
    }
    
    public Page<TdUser> findByUpperUsernameAndIsEnabled(String username, int page, int size)
    {
        if (null == username)
        {
            return null;
        }
        
        PageRequest pageRequest = new PageRequest(page, size);
        
        return repository.findByUpperUsernameAndStatusIdOrderByIdDesc(username, 1L, pageRequest);
    }
    
    /**
     * 查找
     * 
     * @param ids
     * @return
     */
    public List<TdUser> findAll(Iterable<Long> ids)
    {
        return (List<TdUser>) repository.findAll(ids);
    }
    
    public Page<TdUser> findAllOrderBySortIdAsc(int page, int size)
    {
        PageRequest pageRequest = new PageRequest(page, size, new Sort(Direction.ASC, "sortId"));
        
        return repository.findAll(pageRequest);
    }
    
    public Page<TdUser> findByRoleIdOrderByIdDesc(Long roleId, int page, int size)
    {
        PageRequest pageRequest = new PageRequest(page, size);
        
        return repository.findByRoleIdOrderByIdDesc(roleId, pageRequest);
    }
    
    public Page<TdUser> searchAndFindByRoleIdOrderByIdDesc(String keywords, Long roleId, int page, int size)
    {
        PageRequest pageRequest = new PageRequest(page, size);
        
        return repository.findByUsernameContainingAndRoleIdOrMobileContainingAndRoleIdOrEmailContainingAndRoleIdOrderByIdDesc(keywords, roleId, keywords, roleId, keywords, roleId, pageRequest);
    }
    
    public Page<TdUser> searchAndOrderByIdDesc(String keywords, int page, int size)
    {
        PageRequest pageRequest = new PageRequest(page, size);
        
        return repository.findByUsernameContainingOrMobileContainingOrEmailContainingOrderByIdDesc(keywords, keywords, keywords, pageRequest);
    }
    
    /**
     * 保存
     * 
     * @param e
     * @return
     */
    public TdUser save(TdUser e)
    {
        
        if (null != e.getUserLevelId())
        {
            TdUserLevel level = tdUserLevelService.findByLevelIdAndIsEnableTrue(e.getUserLevelId());
            e.setUserLevelTitle(level.getTitle());
        }
        
        return repository.save(e);
    }
    
    public List<TdUser> save(List<TdUser> entities)
    {
        
        return (List<TdUser>) repository.save(entities);
    }
}
