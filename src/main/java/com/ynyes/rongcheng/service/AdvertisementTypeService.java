package com.ynyes.rongcheng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.AdvertisementType;
import com.ynyes.rongcheng.repository.AdvertisementTypeRepo;

/**
 * 广告类型服务类
 * @author Sharon
 *
 */

@Service
@Transactional
public class AdvertisementTypeService {
    
    @Autowired
    AdvertisementTypeRepo repository;
    
    /**
     * 删除广告类型
     * 
     * @param type 广告类型
     */
    public void delete(AdvertisementType type){
        repository.delete(type); 
    }
    
    /**
     * 删除广告类型
     * 
     * @param id 广告类型ID
     */
    public void delete(Long id){
        repository.delete(id);
    }

    /**
     * 查找广告类型
     * 
     * @param id 广告类型ID
     * @return
     */
    public AdvertisementType findOne(Long id){
        return repository.findOne(id);
    }
    
    /**
     * 按名称查找广告类型
     * 
     * @param name 广告类型名称
     * @return
     */
    public AdvertisementType findByName(String name){
        return repository.findByName(name);
    }

    /**
     * 查找所有广告类型
     * 
     * @return 广告类型列表
     */
    public List<AdvertisementType> findAll(){
        return (List<AdvertisementType>) repository.findAll();
    }
    
    /**
     * 查找所有广告类型
     * 
     * @param page 页号
     * @param size 页大小
     * @param direction 排序方向 ASC升序 DESC降序
     * @param property 排序字段
     * @return 广告类型分页
     */
    public Page<AdvertisementType> findAll(int page, int size, String direction, String property)
    {
        PageRequest pageRequest = null;
        
        if (null != direction && null != property)
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, property);
            pageRequest = new PageRequest(page, size, sort);
        }
        else
        {
            pageRequest = new PageRequest(page, size);
        }
        
        return repository.findAll(pageRequest);
    }
 
    /**
     * 保存广告类型
     * 
     * @param type 广告类型
     */
    public void save(AdvertisementType type){
        repository.save(type);
    }
}
