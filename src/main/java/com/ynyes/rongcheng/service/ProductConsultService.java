package com.ynyes.rongcheng.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.ProductConsult;
import com.ynyes.rongcheng.repository.ProductConsultRepo;

/**
 * 商品咨询服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class ProductConsultService {
    @Autowired
    ProductConsultRepo repository;
    
    /**
     * 新增商品咨询
     * 
     * @param username 用户名
     * @param type 咨询分类，可以为NULL
     * @param content 评论内容
     * @param productId 评论的商品ID
     * @param productVersionId 评论的商品的版本ID
     * 
     * @return map.code 0:成功 1:失败
     *         map.message 失败时的错误信息
     *         map.data 成功时将返回保存后的订单
     */
    public Map<String, Object> add(String username,
                                   String type,
                                   String content,
                                   Long productId,
                                   Long productVersionId)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        
        if (null == username || "".equals(username))
        {
            map.put("message", "用户名不能为空");
            return map;
        }
        
        ProductConsult consult = new ProductConsult();
        
        consult.setUsername(username);
        consult.setType(type);
        consult.setContent(content);
        consult.setPid(productId);
        consult.setVid(productVersionId);
        consult.setConsultTime(new Date());
        
        map.put("code", 0);
        map.put("data", repository.save(consult));

        return map;
    }
    
    /**
     * 获取指定商品版本的所有咨询
     * 
     * @param pid 商品ID
     * @param vid 商品版本ID
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向 asc:升序 desc:降序，为NULL时按默认规则排序
     * @param property 排序的字段名，为NULL时按默认规则排序
     * 
     * @return 商品咨询列表分页
     */
    public Page<ProductConsult> findByPidAndVid(Long pid,
                                                Long vid,
                                                int page,
                                                int size,
                                                String direction,
                                                String property)
    {
        Page<ProductConsult> consultPage = null;
        PageRequest pageRequest = null;
        
        if (null == pid || null == vid)
        {
            return null;
        }
        
        if (page < 0 || size < 0)
        {
            return null;
        }
        
        if (null == direction || null == property)
        {
            Sort sort = new Sort(Direction.DESC, "id");
            pageRequest = new PageRequest(page, size, sort);
        }
        else
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, property);
            pageRequest = new PageRequest(page, size, sort);
        }
        
        consultPage = repository.findByPidAndVid(pid, vid, pageRequest);
        
        return consultPage;
    }
    
    /**
     * 删除咨询
     * 
     * @param id 咨询ID
     */
    public void delete(Long id)
    {
        if (null != id)
        {
            repository.delete(id);
        }
    }
    
    /**
     * 删除咨询
     * 
     * @param consult 咨询
     */
    public void delete(ProductConsult consult)
    {
        if (null != consult)
        {
            repository.delete(consult);
        }
    }
    
    /**
     * 查找咨询
     * 
     * @param id 咨询ID
     * @return
     */
    public ProductConsult findOne(Long id)
    {
        if (null == id)
        {
            return null;
        }
        
        return repository.findOne(id);
    }
    
    /**
     * 保存咨询
     * 
     * @param consult 评论
     * @return 保存的评论，错误时返回NULL
     */
    public ProductConsult save(ProductConsult consult)
    {
        if (null == consult)
        {
            return null;
        }
        
        return repository.save(consult);
    }
}
