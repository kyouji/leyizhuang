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

import com.ynyes.rongcheng.entity.TdKeywords;
import com.ynyes.rongcheng.repository.TdKeywordsRepo;

/**
 * TdKeywords 服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class TdKeywordsService {
    
    @Autowired
    TdKeywordsRepo repository;
    
    /**
     * 删除
     * 
     * @param id 菜单项ID
     */
    public void delete(Long id)
    {
        if (null != id)
        {
            repository.delete(id);
        }
    }
    
    /**
     * 删除
     * 
     * @param e 菜单项
     */
    public void delete(TdKeywords e)
    {
        if (null != e)
        {
            repository.delete(e);
        }
    }
    
    public void delete(List<TdKeywords> entities)
    {
        if (null != entities)
        {
            repository.delete(entities);
        }
    }
    
    /**
     * 查找
     * 
     * @param id ID
     * @return
     */
    public TdKeywords findOne(Long id)
    {
        if (null == id)
        {
            return null;
        }
        
        return repository.findOne(id);
    }
    
    public TdKeywords findByTitle(String title)
    {
        if (null == title)
        {
            return null;
        }
        
        return repository.findTopByTitleIgnoreCase(title.trim());
    }
    
    /**
     * 查找
     * 
     * @param ids
     * @return
     */
    public List<TdKeywords> findAll(Iterable<Long> ids)
    {
        return (List<TdKeywords>) repository.findAll(ids);
    }
    
    public List<TdKeywords> findAll()
    {
        return (List<TdKeywords>) repository.findAll();
    }
    
    public Page<TdKeywords> findAllOrderBySortIdAsc(int page, int size)
    {
        PageRequest pageRequest = new PageRequest(page, size, new Sort(Direction.ASC, "sortId"));
        
        return repository.findAll(pageRequest);
    }
    
    public List<TdKeywords> findAllOrderBySortIdAsc()
    {
        return (List<TdKeywords>) repository.findAll(new Sort(Direction.ASC, "sortId"));
    }
    
    public List<TdKeywords> findByIsEnableTrueOrderBySortIdAsc()
    {
        return repository.findByIsEnableTrueOrderBySortIdAsc();
    }
    
    /**
     * 保存
     * 
     * @param e
     * @return
     */
    public TdKeywords save(TdKeywords e)
    {
        if (null == e.getCreateTime())
        {
            e.setCreateTime(new Date());
        }
        
        return repository.save(e);
    }
    
    public List<TdKeywords> save(List<TdKeywords> entities)
    {
        
        return (List<TdKeywords>) repository.save(entities);
    }
}
