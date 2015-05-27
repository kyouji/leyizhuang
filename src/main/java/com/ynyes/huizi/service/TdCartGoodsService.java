package com.ynyes.huizi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.huizi.entity.TdCartGoods;
import com.ynyes.huizi.repository.TdCartGoodsRepo;

/**
 * TdCartGoods 服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class TdCartGoodsService {
    
    @Autowired
    TdCartGoodsRepo repository;
    
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
    public void delete(TdCartGoods e)
    {
        if (null != e)
        {
            repository.delete(e);
        }
    }
    
    public void delete(List<TdCartGoods> entities)
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
    public TdCartGoods findOne(Long id)
    {
        if (null == id)
        {
            return null;
        }
        
        return repository.findOne(id);
    }
    
    /**
     * 查找
     * 
     * @param ids
     * @return
     */
    public List<TdCartGoods> findAll(Iterable<Long> ids)
    {
        return (List<TdCartGoods>) repository.findAll(ids);
    }
    
    public List<TdCartGoods> findAll()
    {
        return (List<TdCartGoods>) repository.findAll();
    }
    
    public Page<TdCartGoods> findAllOrderByIdDesc(int page, int size)
    {
        PageRequest pageRequest = new PageRequest(page, size, new Sort(Direction.DESC, "id"));
        
        return repository.findAll(pageRequest);
    }
    
    public TdCartGoods findTopByGoodsIdAndPriceAndUsername(long goodsId, double price, String username)
    {
        return repository.findTopByGoodsIdAndPriceAndUsername(goodsId, price, username);
    }
    
    public List<TdCartGoods> findByGoodsIdAndPriceAndUsername(long goodsId, double price, String username)
    {
        return repository.findByGoodsIdAndPriceAndUsername(goodsId, price, username);
    }
    
    public List<TdCartGoods> findByUsername(String username)
    {
        return repository.findByUsername(username);
    }
    
    public List<TdCartGoods> findByUsernameAndIsSelectedTrue(String username)
    {
        return repository.findByUsernameAndIsSelectedTrue(username);
    }
    
    public void delete(Iterable<TdCartGoods> entities)
    {
        repository.delete(entities);
    }
    
    
    /**
     * 保存
     * 
     * @param e
     * @return
     */
    public TdCartGoods save(TdCartGoods e)
    {
        
        return repository.save(e);
    }
    
    public List<TdCartGoods> save(List<TdCartGoods> entities)
    {
        
        return (List<TdCartGoods>) repository.save(entities);
    }
}
