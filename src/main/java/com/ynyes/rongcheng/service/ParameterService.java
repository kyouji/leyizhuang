package com.ynyes.rongcheng.service;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.Parameter;
import com.ynyes.rongcheng.repository.ParameterRepo;

/**
 * 商品参数服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class ParameterService {
    @Autowired
    ParameterRepo repository;
    
    /**
     * 获取参数类型
     * 
     * @return 类型列表
     */
    public List<String> findTypes()
    {
        List<String> typeList = null;
        
        typeList = repository.findTypes();
        
        return typeList;
    }
    
    /**
     * 通过类型获取参数列表
     * 
     * @param type 类型
     * @return 参数列表
     */
    public List<Parameter> findByType(String type)
    {
        if (null == type)
        {
            return null;
        }
        
        return repository.findByType(type);
    }
    
    /**
     * 通过ID查找
     * 
     * @param ids 参数ID列表
     * @return 参数列表
     */
    public List<Parameter> findByIdIn(Collection<Long> ids)
    {
        if (null == ids)
        {
            return null;
        }
        
        return repository.findByIdIn(ids);
    }
    
    /**
     * 查找参数列表并分页
     * 
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向，不区分大小写，asc表示升序，desc表示降序，为NULL时不进行排序
     * @param property 排序的字段名，为NULL时不进行排序
     * @return 参数分页
     */
    public Page<Parameter> findAll(int page, int size, 
                            String direction, String property)
    {
        Page<Parameter> paramPage = null;
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
        
        paramPage = repository.findAll(pageRequest);
        
        return paramPage;
    }
    
    /**
     * 保存参数
     * 
     * @param param 要保存的参数
     * @return 返回保存后的参数
     */
    public Parameter save(Parameter param)
    {
        return repository.save(param);
    }
    
    /**
     * 按ID删除
     * 
     * @param id 要删除的参数ID
     * @return 无
     */
    public void delete(Long id)
    {
        repository.delete(id);
    }
 
    /**
     * 按实体删除
     * 
     * @param param 要删除的参数
     * @return 无
     */
    public void delete(Parameter param)
    {
        repository.delete(param);
    }
    
    /**
     * 通过ID获取参数
     * 
     * @param id 参数ID
     * @return 找到的参数
     */
    public Parameter findOne(Long id)
    {
        if (null == id)
        {
            return null;
        }
        
        return repository.findOne(id);
    }
    
}
