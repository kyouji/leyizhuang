package com.ynyes.rongcheng.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.SiteInfo;
import com.ynyes.rongcheng.repository.SiteInfoRepo;

/**
 * 网站信息服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class SiteInfoService {
    @Autowired
    SiteInfoRepo repository;
    
    /**
     * 保存网站信息
     * 
     * @param siteInfo 网站信息
     * @return 保存的网站信息
     */
    public SiteInfo save(SiteInfo siteInfo)
    {
        if (null == siteInfo)
        {
            return null;
        }
        
        return repository.save(siteInfo);
    }
  
 
    /**
     * 获取网站信息
     * 
     * @param id 网站信息ID
     * @return 获取到的网站信息
     */
    public SiteInfo findOne(Long id)
    {
        SiteInfo siteInfo= null;
        
        if (null != id)
        {
            siteInfo = repository.findOne(id);
        }
        
        return siteInfo;
    }
    
    /**
     * 通过类型获取网站信息
     * 
     * @param name 网站信息名称
     * @return 获取到的网站信息
     */
    public SiteInfo findByType(String type)
    {
        SiteInfo siteInfo = null;
        
        if (null != type)
        {
            siteInfo = repository.findByTypeAndIsShowTrue(type);
        }
        
        return siteInfo;
    }
    
    /**
     * 删除网站信息
     * 
     * @param id 网站信息ID
     */
    public void delete(Long id)
    {
        if (null != id)
        {
            repository.delete(id);
        }
    }
    
    /**
     * 删除网站信息
     * 
     * @param siteInfo 网站信息
     */
    public void delete(SiteInfo siteInfo)
    {
        if (null != siteInfo)
        {
            repository.delete(siteInfo);
        }
    }
}
