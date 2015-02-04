package com.ynyes.rongcheng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.SiteInfoType;
import com.ynyes.rongcheng.repository.SiteInfoTypeRepo;

/**
 * 网站信息类型服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class SiteInfoTypeService {
    @Autowired
    SiteInfoTypeRepo repository;
    
    
    /**
     * 保存网站信息类型
     * 
     * @param siteInfoType 网站信息类型
     * @return 保存的网站信息类型
     */
    public SiteInfoType save(SiteInfoType siteInfoType)
    {
        if (null == siteInfoType)
        {
            return null;
        }
        
        return repository.save(siteInfoType);
    }
  
 
    /**
     * 获取网站信息类型
     * 
     * @param id 类型ID
     * @return 获取到的网站信息类型
     */
    public SiteInfoType findOne(Long id)
    {
        SiteInfoType siteInfoType = null;
        
        if (null != id)
        {
            siteInfoType = repository.findOne(id);
        }
        
        return siteInfoType;
    }
    
    /**
     * 通过名称获取网站信息类型
     * 
     * @param name 类型名称
     * @return 获取到的网站信息类型
     */
    public SiteInfoType findByName(String name)
    {
        SiteInfoType siteInfoType = null;
        
        if (null != name)
        {
            siteInfoType = repository.findByName(name);
        }
        
        return siteInfoType;
    }
    
    /**
     * 删除网站信息类型
     * 
     * @param id 类型ID
     */
    public void delete(Long id)
    {
        if (null != id)
        {
            repository.delete(id);
        }
    }
    
    /**
     * 删除网站信息类型
     * 
     * @param siteInfoType 网站信息类型
     */
    public void delete(SiteInfoType siteInfoType)
    {
        if (null != siteInfoType)
        {
            repository.delete(siteInfoType);
        }
    }
    
    /**
     * 查找所有网站信息类型
     * 
     * @param parent 父类型名称，为NULL时代表查找根类型
     * @return 网站信息类型列表
     */
    public List<SiteInfoType> findAll(String parent)
    {
        List<SiteInfoType> siTypeList = null;
        
        if (null == parent)
        {
            siTypeList = repository.findByParentIsNullAndIsShowTrue();
        }
        else
        {
            siTypeList = repository.findByParentAndIsShowTrue(parent);
        }
        
        return siTypeList;
    }
    
    /**
     * 查找所有网站信息类型
     * 
     * @param parent 父类型名称，为NULL时代表查找根类型
     * @return 网站信息类型列表
     */
    public List<SiteInfoType> findAll()
    {
        List<SiteInfoType> siTypeList = null;
        
        siTypeList = repository.findByIsShowTrue();
        
        return siTypeList;
    }
}
