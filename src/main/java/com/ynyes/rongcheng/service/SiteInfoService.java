package com.ynyes.rongcheng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
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
    public List<SiteInfo> findByType(String type)
    {
        List<SiteInfo> infoList = null;
        
        if (null != type)
        {
            infoList = repository.findByTypeAndIsShowTrue(type);
        }
        
        return infoList;
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
    
    /**
     * 查找所有网站资料
     * 
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向，不区分大小写，asc表示升序，desc表示降序，为NULL时不进行排序
     * @param property 排序的字段名，为NULL时不进行排序
     * @return 获取到的网站资料分页
     */
    public Page<SiteInfo> findAll(int page, int size, 
                            String direction, String property)
    {
        Page<SiteInfo> siteInfoPage = null;
        PageRequest pageRequest = null;
        
        if (page < 0 || size < 0)
        {
            return null;
        }
        
        if (null == direction || null == property)
        {
            pageRequest = new PageRequest(page, size);
        }
        else
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, 
                                 property);
            pageRequest = new PageRequest(page, size, sort);
        }
        
        siteInfoPage = repository.findAll(pageRequest);
        
        return siteInfoPage;
    }
}
